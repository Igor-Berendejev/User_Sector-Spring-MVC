package org.example.controller;

import org.example.entity.Position;
import org.example.entity.SectorForm;
import org.example.entity.SectorFormValidator;
import org.example.entity.User;
import org.example.service.PositionService;
import org.example.service.SectorService;
import org.example.service.UserService;
import org.flywaydb.core.Flyway;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.Validator;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.context.ServletContextAware;

import javax.servlet.ServletContext;
import java.io.File;
import java.io.IOException;
import java.net.URISyntaxException;
import java.net.URL;
import java.nio.file.Paths;
import java.util.List;
import java.util.stream.Collectors;


@Controller
public class SectorController implements ServletContextAware {

    @Autowired
    UserService userService;

    @Autowired
    PositionService positionService;

    @Autowired
    SectorService sectorService;

    private Validator validator = new SectorFormValidator();

    private String name;

    private static ServletContext servletContext;

    @RequestMapping(value = "/", method = RequestMethod.GET)
    public String getStartPage(Model model) {

        Flyway flyway = Flyway.configure().dataSource("jdbc:postgresql://localhost:5432/user_sector", "postgres", "postgres").load();
        flyway.migrate();
        model.addAttribute("sectorForm", new SectorForm());

        return "index";
    }

    @RequestMapping(value = "/submitData", method = RequestMethod.POST)
    public String submitData(@ModelAttribute("sectorForm") @Validated SectorForm sectorForm, BindingResult bindingResult, Model model) {

        if (bindingResult.hasErrors()) {
            return "index";
        }

        if (userService.getUserByName(sectorForm.getName()) != null) {
            bindingResult.rejectValue("name", "duplicated.name", "User already exists");
            return "index";
        }

        name = sectorForm.getName();
        List<String> sectorList = sectorForm.getSectors();

        User savedUser = userService.saveUser(new User(name, true));
        sectorList.stream().forEach(sector -> positionService.addPosition(new Position(savedUser.getId(), Integer.parseInt(sector))));

        model.addAttribute("name", savedUser.getName());

        List<String> userSectors = positionService.getPositionsByUserId(savedUser.getId()).stream()
                .map(position -> String.valueOf(position.getSectorId()))
                .collect(Collectors.toList());

        userSectors.forEach(sector -> model.addAttribute("selectedCat" + sector, "selected"));
        model.addAttribute("sectorForm", new SectorForm());

        return "edit";
    }

    @RequestMapping(value = "/editData", method = RequestMethod.POST)
    public String editData(@ModelAttribute("sectorForm") @Validated SectorForm sectorForm, BindingResult bindingResult, Model model) {

        if (bindingResult.hasErrors()) {
            return "edit";
        }

        User user = userService.getUserByName(name);
        name = sectorForm.getName();
        user.setName(name);
        userService.saveUser(user);

        List<String> sectorList = sectorForm.getSectors();
        positionService.deletePositionsByUserId(user.getId());
        sectorList.stream().forEach(sector -> positionService.addPosition(new Position(user.getId(), Integer.parseInt(sector))));

        model.addAttribute("name", user.getName());

        List<String> userSectors = positionService.getPositionsByUserId(user.getId()).stream()
                .map(position -> String.valueOf(position.getSectorId()))
                .collect(Collectors.toList());

        userSectors.forEach(sector -> model.addAttribute("selectedCat" + sector, "selected"));

        model.addAttribute("sectorForm", new SectorForm());

        return "edit";
    }

    @Override
    public void setServletContext(ServletContext servletContext) {
        this.servletContext = servletContext;
    }

    public static Document getStartPageDocument() throws IOException, URISyntaxException {
        URL startPageStream = servletContext.getResource("/WEB-INF/views/index.jsp");
        File startPAge = Paths.get(startPageStream.toURI()).toFile();
        return Jsoup.parse(startPAge);
    }

    @InitBinder
    private void initBinder(WebDataBinder binder) {
        binder.setValidator(validator);
    }
}
