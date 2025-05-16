// package com.missiontracker.servlet;

// import com.missiontracker.dao.AstronautDAO;
// import com.missiontracker.database.DBConnection;
// import com.missiontracker.model.Astronaut;

// import javax.servlet.*;
// import javax.servlet.annotation.WebServlet;
// import javax.servlet.http.*;
// import java.io.IOException;
// import java.sql.Connection;

// @WebServlet("/astronautas/lista")

// public class AstronautDeleteServlet extends HttpServlet {
// @Override

//        protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//         response.setCharacterEncoding("UTF-8");

//         try {
//             int id = Integer.parseInt(request.getParameter("id"));

            
//             DBConnection db = new DBConnection();
//             db.connect();
//             Connection connection = db.getConnection();

//             AstronautDAO dao = new AstronautDAO(connection);
//             Astronaut astronaut = dao.deleteAstronautById(id);

//             response.sendRedirect("/MissionTracker/astronautas");

//         } catch (Exception e) {
//             e.printStackTrace(); // SteamWeb-style: imprime y sigue sin interrupción
//         }

//     }
// }