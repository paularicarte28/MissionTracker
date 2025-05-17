<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.missiontracker.model.Astronaut" %>
<%@ page import="com.missiontracker.model.Mission" %>
<%@ page import="java.util.List" %>

<%
    Astronaut astronaut = (Astronaut) request.getAttribute("astronaut");
    List<Mission> missions = (List<Mission>) request.getAttribute("missions");
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Edit Astronaut</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #111;
            color: #f8f9fa;
            font-family: 'Orbitron', sans-serif;
        }
        .form-container {
            background-color: #2c2f33;
            border: 1px solid #0dcaf0;
            border-radius: 10px;
            padding: 2rem;
            max-width: 600px;
            margin: auto;
        }
    </style>
</head>
<body>
<div class="container mt-5">
    <h2 class="text-center mb-4 text-info">✏️ Edit Astronaut</h2>
    <div class="form-container">
        <form method="post" action="${pageContext.request.contextPath}/astronautas/actualizar">
            <input type="hidden" name="id" value="<%= astronaut.getId() %>">

            <div class="mb-3">
                <label for="name" class="form-label">Full Name</label>
                <input type="text" id="name" name="name" class="form-control" value="<%= astronaut.getName() %>" required>
            </div>

            <div class="mb-3">
                <label for="nationality" class="form-label">Nationality</label>
                <input type="text" id="nationality" name="nationality" class="form-control" value="<%= astronaut.getNationality() %>" required>
            </div>

            <div class="mb-3">
                <label for="role" class="form-label">Role</label>
                <input type="text" id="role" name="role" class="form-control" value="<%= astronaut.getRole() %>" required>
            </div>

            <div class="mb-3">
                <label for="missionName" class="form-label">Assigned Mission</label>
                <select id="missionName" name="missionName" class="form-select" required>
                    <option value="">-- Select a Mission --</option>
                    <% for (Mission m : missions) { %>
                        <option value="<%= m.getName() %>" <%= m.getName().equals(astronaut.getMissionName()) ? "selected" : "" %>>
                            <%= m.getName() %>
                        </option>
                    <% } %>
                </select>
            </div>

            <div class="d-flex justify-content-between">
                <button type="submit" class="btn btn-warning">💾 Save Changes</button>
                <a href="${pageContext.request.contextPath}/astronautas/detalle?id=<%= astronaut.getId() %>" class="btn btn-light">Cancel</a>
            </div>
        </form>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
