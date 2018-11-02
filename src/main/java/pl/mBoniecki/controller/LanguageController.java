package pl.mBoniecki.controller;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/language")
public class LanguageController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException {

        String locale = req.getParameter("lang");
        if (locale != null && !locale.isEmpty()) {
            Cookie localeCookie = new Cookie("lang", locale);
            resp.addCookie(localeCookie);
        }
        resp.sendRedirect("task");
    }
}

