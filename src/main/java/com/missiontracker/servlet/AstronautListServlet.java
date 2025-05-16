package com.missiontracker.servlet;

import com.missiontracker.dao.AstronautDAO;
import com.missiontracker.model.Astronaut;
import com.missiontracker.database.DBConnection;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.Connection;
import java.util.List;

public class AstronautListServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        Connection conn = DBConnection.getConnection();
        AstronautDAO dao = new AstronautDAO(conn);

        int page = 1;
        int pageSize = 3;

        String pageParam = request.getParameter("page");
        if (pageParam != null) {
            try {
                page = Integer.parseInt(pageParam);
            } catch (NumberFormatException ignored) {
            }
        }

        int offset = (page - 1) * pageSize;

        List<Astronaut> astronauts = dao.getAstronautsByPage(pageSize, offset);
        int totalAstronauts = dao.getTotalAstronauts();
        int totalPages = (int) Math.ceil((double) totalAstronauts / pageSize);

        request.setAttribute("astronauts", astronauts);
        request.setAttribute("currentPage", page);
        request.setAttribute("totalPages", totalPages);

        RequestDispatcher dispatcher = request.getRequestDispatcher("/astronautas/lista.jsp");
        dispatcher.forward(request, response);
    }
}