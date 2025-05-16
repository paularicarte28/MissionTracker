<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.missiontracker.model.Astronaut" %>
<%@ page import="java.util.List" %>

<html>
<head>
    <title>Lista de Astronautas</title>
    <link rel="stylesheet" href="../css/styles.css">
</head>
<body>

    <h1>✅ lista.jsp cargado correctamente</h1>

    <%
        List<Astronaut> astronauts = (List<Astronaut>) request.getAttribute("astronauts");

        if (astronauts == null) {
    %>
        <p style="color:red;">❌ La lista de astronautas es <strong>null</strong>. Verifica el servlet.</p>

    <%
        } else if (astronauts.isEmpty()) {
    %>
        <p style="color:orange;">⚠️ La lista de astronautas está vacía. No hay registros en la base de datos.</p>

    <%
        } else {
    %>

    <p>✅ Astronautas encontrados: <%= astronauts.size() %></p>

    <table border="1">
        <tr>
            <th>ID</th>
            <th>Nombre</th>
            <th>País</th>
            <th>Rol</th>
            <th>Misión</th>
        </tr>

        <% for (Astronaut a : astronauts) { %>
        <tr>
            <td><%= a.getId() %></td>
            <td><a href="<%= request.getContextPath() %>/detalle?id=<%= a.getId() %>"><%= a.getName() %></a></td>
          
        </tr>
        <% } %>
    </table>

    <%
        }
    %>

</body>
</html>
