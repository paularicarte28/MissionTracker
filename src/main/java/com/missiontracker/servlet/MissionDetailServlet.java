package com.missiontracker.servlet;

import com.missiontracker.dao.MissionDAO;
import com.missiontracker.model.Mission;
import com.missiontracker.database.DBConnection;

import javax.servlet.annotation.WebServlet;
import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.Connection;

@WebServlet("/misiones/detalle")
public class MissionDetailServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int id = Integer.parseInt(request.getParameter("id"));

        try {
            DBConnection db = new DBConnection();
            db.connect();
            Connection connection = db.getConnection();

            MissionDAO dao = new MissionDAO(connection);
            Mission mission = dao.getMissionById(id);

            request.setAttribute("mission", mission);
            RequestDispatcher dispatcher = request.getRequestDispatcher("/misiones/detalle.jsp");
            dispatcher.forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();
            response.setContentType("text/html;charset=UTF-8");
            response.getWriter().println("<h2 style='color:red'>❌ Error al cargar el detalle de la misión</h2>");
        }
    }
}