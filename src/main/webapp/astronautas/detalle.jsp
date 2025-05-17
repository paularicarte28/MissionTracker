<%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <%@ page import="com.missiontracker.model.Astronaut" %>
        <% Astronaut astronaut=(Astronaut) request.getAttribute("astronaut"); %>
            <!DOCTYPE html>
            <html lang="en">

            <head>
                <meta charset="UTF-8">
                <title>Astronaut Detail</title>
                <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
            </head>

            <body class="bg-dark text-white">
                <div class="container py-5">
                    <a href="<%= request.getContextPath() %>/astronautas/lista" class="btn btn-outline-light mb-4">⬅
                        Back to Astronaut List</a>
                    <div class="card bg-secondary text-white border-info shadow-lg">
                        <div class="card-body">
                            <h2 class="card-title text-info">🧑‍🚀 <%= astronaut.getName() %>
                            </h2>
                            <p class="card-text">
                                <strong>ID:</strong>
                                <%= astronaut.getId() %><br>
                                    <strong>Nationality:</strong>
                                    <%= astronaut.getNationality() %><br>
                                        <strong>Role:</strong>
                                        <%= astronaut.getRole() %><br>
                                            <strong>Mission:</strong>
                                            <% if (astronaut.getMissionid()> 0) { %>
                                                <%= astronaut.getMissionName() %> (<%= astronaut.getMissionid() %>)<br>
                                                        <% } else { %>
                                                            None<br>
                                                            <% } %>
                            </p>
                            <% if (astronaut.getMissionid()> 0) { %>
                                <a href="<%= request.getContextPath() %>/misiones/detalle?id=<%= astronaut.getMissionid() %>"
                                    class="btn btn-warning mt-3">🔭 View Assigned Mission</a>
                                <% } else { %>
                                    <p class="text-muted mt-3">No mission assigned.</p>
                                    <% } %>
                        </div>
                    </div>
                </div>
                <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
            </body>

            </html>