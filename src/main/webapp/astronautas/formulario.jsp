<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Registrar Astronauta</title>
    <link rel="stylesheet" href="../css/styles.css">
</head>
<body>

    <h1>🚀 Registrar nuevo astronauta</h1>

    <%-- Mostrar mensaje de error si existe --%>
    <% if (request.getAttribute("error") != null) { %>
        <p style="color:red;"><strong><%= request.getAttribute("error") %></strong></p>
    <% } %>

    <form action="<%= request.getContextPath() %>/astronautas/registro" method="post">
        <label for="name">Nombre:</label><br>
        <input type="text" id="name" name="name" required><br><br>

        <label for="nationality">Nacionalidad:</label><br>
        <input type="text" id="nationality" name="nationality" required><br><br>

        <label for="role">Rol:</label><br>
        <input type="text" id="role" name="role" required><br><br>

        <label for="missionid">ID de Misión:</label><br>
        <input type="number" id="missionid" name="missionid" required><br><br>

        <input type="submit" value="Registrar">
    </form>

    <br>
    <a href="<%= request.getContextPath() %>/astronautas/lista">🔙 Volver a la lista</a>

</body>
</html>