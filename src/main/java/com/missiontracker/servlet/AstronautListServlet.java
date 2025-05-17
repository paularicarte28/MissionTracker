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

            List<Astronaut> astronauts;

            // Si hay filtros, busca
            if ((q != null && !q.trim().isEmpty()) || (nationality != null && !nationality.trim().isEmpty())) {
                astronauts = dao.searchAstronauts(q, nationality);
            } else {
                // Sin filtros → mostrar todos
                astronauts = dao.getAllAstronauts();
            }

            request.setAttribute("astronauts", astronauts);

            RequestDispatcher dispatcher = request.getRequestDispatcher("/astronautas/lista.jsp");
            dispatcher.forward(request, response);

            connection.close(); // ✅ IMPORTANTE cerrar conexión
        } catch (Exception e) {
            e.printStackTrace();
            response.setContentType("text/html;charset=UTF-8");
            response.getWriter().println("<h2 style='color:red'>❌ Error al cargar astronautas</h2>");
        }
    }
}
