// package com.missiontracker.servlet;

// import com.missiontracker.dao.AstronautDAO;
// import com.missiontracker.database.DBConnection;
// import com.missiontracker.model.Astronaut;

// import javax.servlet.*;
// import javax.servlet.http.*;
// import java.io.IOException;
// import java.sql.Connection;

// public class AstronautUpdateServlet extends HttpServlet {
//     protected void doPost(HttpServletRequest request, HttpServletResponse response)
//             throws ServletException, IOException {

//         int id = Integer.parseInt(request.getParameter("id"));
//         String name = request.getParameter("name");
//         String nationality = request.getParameter("nationality");
//         String role = request.getParameter("role");
//         String missionIdStr = request.getParameter("missionId");

//         int missionId = 0;
//         if (missionIdStr != null && !missionIdStr.isEmpty()) {
//             missionId = Integer.parseInt(missionIdStr);
//         }

//         Astronaut astronaut = new Astronaut(id, name, nationality, role, missionId);

//         Connection conn = DBConnection.getConnection();
//         AstronautDAO dao = new AstronautDAO(conn);
//         dao.updateAstronaut(astronaut);

//         response.sendRedirect("/MissionTracker/astronautas");
//     }
// }
