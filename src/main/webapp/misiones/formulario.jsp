<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <title>Register Mission</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #1a1a1a;
            color: #f8f9fa;
        }

        .form-container {
            background-color: #2c2f33;
            border: 1px solid #ffc107;
            border-radius: 10px;
            padding: 2rem;
            max-width: 600px;
            margin: auto;
        }

        .btn-warning {
            background-color: #ffc107;
            border: none;
        }

        .btn-warning:hover {
            background-color: #ffca2c;
        }
    </style>
</head>

<body>
    <div class="container mt-5">
        <h2 class="text-center mb-4">🛰️ Register New Mission</h2>
        <div class="form-container">
            <c:if test="${not empty error}">
                <div class="alert alert-danger" role="alert">${error}</div>
            </c:if>

            <form action="${pageContext.request.contextPath}/misiones/formulario" method="post">
                <div class="mb-3">
                    <label for="name" class="form-label">Mission Name</label>
                    <input type="text" id="name" name="name" class="form-control" required>
                </div>

                <div class="mb-3">
                    <label for="launchDate" class="form-label">Launch Date</label>
                    <input type="date" id="launchDate" name="launchDate" class="form-control" required>
                </div>

                <div class="mb-3">
                    <label for="objective" class="form-label">Objective</label>
                    <textarea id="objective" name="objective" class="form-control" required></textarea>
                </div>

                <div class="mb-3">
                    <label for="status" class="form-label">Status</label>
                    <select id="status" name="status" class="form-select" required>
                        <option value="">-- Select Status --</option>
                        <option value="PLANNED">PLANNED</option>
                        <option value="ACTIVE">ACTIVE</option>
                        <option value="COMPLETED">COMPLETED</option>
                        <option value="CANCELLED">CANCELLED</option>
                    </select>
                </div>

                <button type="submit" class="btn btn-warning w-100">Submit</button>
            </form>

            <div class="text-center mt-3">
                <a href="${pageContext.request.contextPath}/misiones/lista" class="text-warning">🔙 Back to list</a>
            </div>
        </div>
    </div>
</body>

</html>
