<%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <%@ page import="com.missiontracker.model.Mission" %>
        <% Mission mission=(Mission) request.getAttribute("mission"); %>
            <!DOCTYPE html>
            <html lang="en">

            <head>
                <meta charset="UTF-8">
                <title>Mission Detail</title>
                <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
            </head>

            <body class="bg-dark text-white">
                <div class="container py-5">
                    <a href="<%= request.getContextPath() %>/misiones/lista" class="btn btn-outline-light mb-4">⬅ Back
                        to Mission List</a>
                    <div class="card bg-secondary text-white border-warning shadow-lg">
                        <div class="card-body">
                            <h2 class="card-title text-warning">🚀 <%= mission.getName() %>
                            </h2>
                            <p class="card-text">
                                <strong>Launch Date:</strong>
                                <%= mission.getLaunchDate() %><br>
                                    <strong>Objective:</strong>
                                    <%= mission.getObjective() %><br>
                                        <strong>Status:</strong>
                                        <%= mission.getStatus() %>
                            </p>
                            <a href="<%= request.getContextPath() %>/misiones/editar?id=<%= mission.getId() %>"
                                class="btn btn-outline-warning">✏️ Edit Mission</a>
                        </div>
                    </div>
                </div>
            </body>

            </html>