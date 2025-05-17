package com.missiontracker.servlet;

import com.missiontracker.dao.AstronautDAO;
import com.missiontracker.dao.MissionDAO;
import com.missiontracker.database.DBConnection;
import com.missiontracker.model.Astronaut;
import com.missiontracker.model.Mission;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import javax.servlet.RequestDispatcher;
import java.io.IOException;
import java.sql.Connection;
import java.util.List;

@WebServlet("/astronautas/editar")
public class AstronautEditServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String idParam = request.getParameter("id");

        if (idParam == null || !idParam.matches("\\d+")) {
            response.setContentType("text/html;charset=UTF-8");
            response.getWriter().println("<h2 style='color:red'>❌ Invalid astronaut ID.</h2>");
            return;
        }

        try {
            int id = Integer.parseInt(idParam);
            DBConnection db = new DBConnection();
            db.connect();
            Connection connection = db.getConnection();

            AstronautDAO astronautDAO = new AstronautDAO(connection);
            MissionDAO missionDAO = new MissionDAO(connection);

            Astronaut astronaut = astronautDAO.getAstronautById(id);
            List<Mission> missions = missionDAO.getAllMissions();

            db.disconnect();

            if (astronaut == null) {
                response.setContentType("text/html;charset=UTF-8");
                response.getWriter().println("<h2 style='color:red'>❌ Astronaut not found.</h2>");
                return;
            }

            request.setAttribute("astronaut", astronaut);
            request.setAttribute("missions", missions);

            RequestDispatcher dispatcher = request.getRequestDispatcher("/astronautas/editar.jsp");
            dispatcher.forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();
            response.setContentType("text/html;charset=UTF-8");
            response.getWriter().println("<h2 style='color:red'>❌ Error loading astronaut for edit.</h2>");
        }
    }
}
