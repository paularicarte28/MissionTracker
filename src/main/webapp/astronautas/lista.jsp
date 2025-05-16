<%@ page import="com.missiontracker.model.Astronaut" %>
    <%@ page import="java.util.List" %>

        <html>

        <head>
            <title>Astronaut List</title>
            <link rel="stylesheet" href="../css/styles.css">
        </head>

        <body>

            <h2>Astronauts</h2>
            <table border="1">
                <tr>
                    <th>ID</th>
                    <th>Name</th>
                    <th>Nationality</th>
                    <th>Role</th>
                    <th>Mission</th>
                </tr>
                <% List<Astronaut> astronauts = (List<Astronaut>) request.getAttribute("astronauts");
                        for (Astronaut a : astronauts) {
                        %>
                        <tr>
                            <td>
                                <%= a.getId() %>
                            </td>
                            <td><a href="detalle?id=<%= a.getId() %>">
                                    <%= a.getName() %>
                                </a></td>
                            <td>
                                <%= a.getNationality() %>
                            </td>
                            <td>
                                <%= a.getRole() %>
                            </td>
                            <td>
                                <%= a.getMissionName() !=null ? a.getMissionName() : "Unassigned" %>
                            </td>

                            <td>
                                <form action="/MissionTracker/astronautas/eliminar" method="post"
                                    onsubmit="return confirm('Are you sure you want to delete this astronaut?');">
                                    <input type="hidden" name="id" value="<%= a.getId() %>" />
                                    <button type="submit">Delete</button>
                                </form>
                            </td>
                        </tr>
                        <% } %>
            </table>

            <a href="astronautas/formulario.jsp">Add new astronaut</a>
            <% int currentPage=(int) request.getAttribute("currentPage"); int totalPages=(int)
                request.getAttribute("totalPages"); %>

                <div style="margin-top: 20px;">
                    <% if (currentPage> 1) { %>
                        <a href="/MissionTracker/astronautas?page=<%= currentPage - 1 %>">Previous</a>
                        <% } %>

                            <% for (int i=1; i <=totalPages; i++) { %>
                                <% if (i==currentPage) { %>
                                    <strong>
                                        <%= i %>
                                    </strong>
                                    <% } else { %>
                                        <a href="/MissionTracker/astronautas?page=<%= i %>">
                                            <%= i %>
                                        </a>
                                        <% } %>
                                            <% } %>

                                                <% if (currentPage < totalPages) { %>
                                                    <a
                                                        href="/MissionTracker/astronautas?page=<%= currentPage + 1 %>">Next</a>
                                                    <% } %>
                </div>

        </body>

        </html>