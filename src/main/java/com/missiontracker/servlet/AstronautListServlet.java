package com.missiontracker.servlet;

import com.missiontracker.dao.AstronautDAO;
import com.missiontracker.database.DBConnection;
import com.missiontracker.model.Astronaut;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.Connection;
import java.util.List;

@WebServlet("/astronautas/lista")
public class AstronautListServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
            DBConnection db = new DBConnection();
            db.connect();
            Connection connection = db.getConnection();
            AstronautDAO dao = new AstronautDAO(connection);

            String q = request.getParameter("q");
            String nationality = request.getParameter("nationality");

            // Paginación
            int page = 1;
            int limit = 3; // todoo cambiar la cantidad cuando tengamos mas registros

            String pageParam = request.getParameter("page");
            if (pageParam != null && pageParam.matches("\\d+")) {
                page = Integer.parseInt(pageParam);
            }
            int offset = (page - 1) * limit;

            //contar los astronautas totales de mi lista 
            int totalAstronauts = dao.countAllAstronauts(q, nationality);
            int totalPages = (int) Math.ceil((double) totalAstronauts / limit);

            // getr astronautas paginados
            List<Astronaut> astronauts = dao.getAstronautsPaged(q, nationality, offset, limit);

            request.setAttribute("astronauts", astronauts);
            request.setAttribute("totalPages", totalPages);
            request.setAttribute("currentPage", page);

            //filtro
            request.setAttribute("q", q);
            request.setAttribute("nationality", nationality);

            RequestDispatcher dispatcher = request.getRequestDispatcher("/astronautas/lista.jsp");
            dispatcher.forward(request, response);

            connection.close();

        } catch (Exception e) {
            e.printStackTrace();
            response.setContentType("text/html;charset=UTF-8");
            response.getWriter().println("<h2 style='color:red'>❌ Error loading astronauts</h2>");
        }
    }
}
