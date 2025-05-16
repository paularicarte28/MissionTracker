package com.missiontracker.servlet;

import com.missiontracker.dao.MissionDAO;
import com.missiontracker.model.Mission;
import com.missiontracker.database.DBConnection;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.Connection;
import java.util.List;

public class MissionListServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

         DBConnection db = new DBConnection(); // ✅ instanciamos el objeto
    Connection connection = db.getConnection(); // ✅ llamada válida
        MissionDAO dao = new MissionDAO(connection);

        String query = request.getParameter("q");
        List<Mission> missions;

        if (query != null && !query.trim().isEmpty()) {
            missions = dao.searchMissions(query);
        } else {
            missions = dao.getAllMissions();
        }

        request.setAttribute("missions", missions);
        RequestDispatcher dispatcher = request.getRequestDispatcher("/misiones/lista.jsp");
        dispatcher.forward(request, response);
    }
}
