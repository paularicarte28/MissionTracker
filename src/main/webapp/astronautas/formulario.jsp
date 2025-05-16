<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="com.missiontracker.model.Mission" %>
<%@ page import="com.missiontracker.dao.MissionDAO" %>
<%@ page import="com.missiontracker.database.DBConnection" %>

<html>
<head>
    <title>Add Astronaut</title>
    <meta charset="UTF-8">
</head>
<body>

<h2>Add New Astronaut</h2>

<form action="/MissionTracker/astronautas/registrar" method="post">
    <label>Name:</label><br>
    <input type="text" name="name" required><br><br>

    <label>Nationality:</label><br>
    <input type="text" name="nationality" required><br><br>

    <label>Role:</label><br>
    <input type="text" name="role" required><br><br>

    <label>Mission:</label><br>
    <select name="missionId">
        <option value="">-- Select a mission --</option>
        <%
            // Obtener las misiones desde la base de datos
            MissionDAO missionDAO = new MissionDAO(DBConnection.getConnection());
            List<Mission> missions = missionDAO.getAllMissions();
            for (Mission m : missions) {
        %>
            <option value="<%= m.getId() %>"><%= m.getName() %></option>
        <%
            }
        %>
    </select><br><br>

    <button type="submit">Save</button>
</form>

<p><a href="/MissionTracker/astronautas">Back to list</a></p>

</body>
</html>
