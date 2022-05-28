package org.example.controller;


import org.example.entity.User;
import org.example.service.UserService;
import org.flywaydb.core.Flyway;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@Controller
public class SectorController {

    @Autowired
    UserService userService;

    @RequestMapping(value = "/", method = RequestMethod.GET)
    public ModelAndView getStartPage(){

        Flyway flyway = Flyway.configure().dataSource("jdbc:postgresql://localhost:5432/user_sector", "postgres", "Everlast").load();
        flyway.migrate();

        return new ModelAndView("startPage");
    }

    @RequestMapping(value = "/submitData", method = RequestMethod.POST)
    public ModelAndView submitData(HttpServletRequest request, HttpServletResponse response) throws IOException {
        if(!validateSubmit(request)) response.sendError(HttpServletResponse.SC_BAD_REQUEST, "All fields are mandatory");
        String name = request.getParameter("name");
        String[] terms = request.getParameterValues("terms");
        String[] sectors = request.getParameterValues("sectors");
        System.out.println(name + " " + terms[0] + " " + sectors[0]);
        User savedUser = userService.addUser(new User(name, true));
        return new ModelAndView("submitted");
    }

    private boolean validateSubmit(HttpServletRequest request){
        return (request.getParameter("name") != null
                && request.getParameterValues("terms").length != 0
                && request.getParameterValues("sectors").length != 0);
    }
}
