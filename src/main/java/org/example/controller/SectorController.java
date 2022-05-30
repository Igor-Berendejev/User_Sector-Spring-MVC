package org.example.controller;


import org.example.entity.Position;
import org.example.entity.User;
import org.example.service.PositionService;
import org.example.service.SectorService;
import org.example.service.UserService;
import org.flywaydb.core.Flyway;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Arrays;


@Controller
public class SectorController {

    @Autowired
    UserService userService;

    @Autowired
    PositionService positionService;

    @Autowired
    SectorService sectorService;

    private String name;

    @RequestMapping(value = "/", method = RequestMethod.GET)
    public ModelAndView getStartPage() {

        Flyway flyway = Flyway.configure().dataSource("jdbc:postgresql://localhost:5432/user_sector", "postgres", "Everlast").load();
        flyway.migrate();

        return new ModelAndView("startPage");
    }

    @RequestMapping(value = "/submitData", method = RequestMethod.POST)
    public void submitData(HttpServletRequest request, HttpServletResponse response) throws IOException {
        if (!validateSubmit(request)) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "All fields are mandatory");
            return;
        }
        name = request.getParameter("name");
        String[] sectors = request.getParameterValues("sectors");
        User savedUser = userService.saveUser(new User(name, true));
        Arrays.stream(sectors).forEach(sec -> positionService.addPosition(new Position(savedUser.getId(), Integer.parseInt(sec))));

        Document refilledPage = getRefilledPage(savedUser);

        response.getWriter().println(refilledPage.html());
    }

    @RequestMapping(value = "/editData", method = RequestMethod.POST)
    public void editData(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String updatedName = request.getParameter("name");
        String[] updatedSectors = request.getParameterValues("sectors");

        User user = userService.getUserByName(name);
        user.setName(updatedName);
        userService.saveUser(user);

        positionService.deletePositionsByUserId(user.getId());
        Arrays.stream(updatedSectors).forEach(sec -> positionService.addPosition(new Position(user.getId(), Integer.parseInt(sec))));

        Document refilledPage = getRefilledPage(user);

        response.getWriter().println(refilledPage.html());
    }

    private boolean validateSubmit(HttpServletRequest request) {
        return (!request.getParameter("name").equals("")
                && request.getParameter("terms").equals("accepted")
                && request.getParameterValues("sectors").length != 0);
    }

    private Document getRefilledPage(User user) throws IOException {
        Document doc = Jsoup.connect("http://localhost:8080/HelmesTask_war_exploded/").get();
        Element userName = doc.getElementById("name");
        userName.val(user.getName());
        Elements options = doc.select("#sectors>option");
        for (Element option : options) {
            if (positionService.getPositionsByUserId(user.getId()).stream().anyMatch(position -> position.getSectorId() == Integer.parseInt(option.val()))) {
                option.attr("selected", "selected");
            }
        }
        Element form = doc.getElementById("submitForm");
        form.attr("action", "editData");

        Element submitButton = doc.getElementById("submitButton");
        submitButton.attr("value", "Edit");

        return doc;
    }

}
