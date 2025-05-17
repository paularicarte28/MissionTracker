<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Mission Tracker</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Estilos personalizados -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/styles.css">
</head>
<body class ="bg-dark text-white">
    <!-- Barra de navegación -->
<style>
    .navbar-custom-btn {
        font-size: 1.2rem;
        padding: 0.75rem 1.5rem;
        transition: transform 0.2s ease;
    }

    .navbar-custom-btn:hover {
        transform: translateY(-3px);
    }
</style>

<nav class="navbar navbar-expand-lg navbar-dark bg-dark px-4 py-2">
    <div class="container-fluid d-flex justify-content-between align-items-center">

        <!-- Botón Astronauts a la izquierda -->
        <a href="${pageContext.request.contextPath}/astronautas/lista" 
           class="btn bg-secondary text-white border-info shadow-lg navbar-custom-btn">
            Astronauts
        </a>

        <!-- Logo centrado -->
        <a class="navbar-brand d-flex align-items-center mx-auto" href="${pageContext.request.contextPath}/index.jsp">
            <img src="${pageContext.request.contextPath}/images/MTsinfondo.png" alt="Mission Tracker Logo" width="350" height="350" class="me-3">
        </a>

        <!-- Botón Missions a la derecha -->
        <a href="${pageContext.request.contextPath}/misiones/lista" 
           class="btn bg-secondary text-white border-warning shadow-lg navbar-custom-btn">
            Missions
        </a>

    </div>
</nav>


