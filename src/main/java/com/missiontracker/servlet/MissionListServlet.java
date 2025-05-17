package com.missiontracker.servlet;

import com.missiontracker.dao.MissionDAO;
import com.missiontracker.model.Mission;
import com.missiontracker.database.DBConnection;

import javax.servlet.annotation.WebServlet;
import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.Connection;
import java.util.List;

@WebServlet("/misiones/lista")
public class MissionListServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
            DBConnection db = new DBConnection();
            db.connect();
            Connection connection = db.getConnection();

            MissionDAO dao = new MissionDAO(connection);
            List<Mission> missions = dao.getAllMissions();

            request.setAttribute("missions", missions);
            RequestDispatcher dispatcher = request.getRequestDispatcher("/misiones/lista.jsp");
            dispatcher.forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();
            response.setContentType("text/html;charset=UTF-8");
            response.getWriter().println("<h2 style='color:red'>❌ Error al cargar las misiones</h2>");
        }
    }
}