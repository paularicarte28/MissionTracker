<%@ page import="com.missiontracker.model.Astronaut" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    Astronaut astronaut = (Astronaut) request.getAttribute("astronaut");
%>

<html>
<head>
    <title>Astronaut Details</title>
    <meta charset="UTF-8">
</head>
<body>
    <h2>Astronaut Details</h2>

    <p><strong>ID:</strong> <%= astronaut.getId() %></p>
    <p><strong>Name:</strong> <%= astronaut.getName() %></p>
    <p><strong>Nationality:</strong> <%= astronaut.getNationality() %></p>
    <p><strong>Role:</strong> <%= astronaut.getRole() %></p>
    <p><strong>Mission:</strong> <%= astronaut.getMissionName() != null ? astronaut.getMissionName() : "Unassigned" %></p>

    <p>
        <a href="/MissionTracker/astronautas/editar.jsp?id=<%= astronaut.getId() %>">Edit this astronaut</a>
    </p>
    <p><a href="/MissionTracker/astronautas">Back to list</a></p>
</body>
</html>