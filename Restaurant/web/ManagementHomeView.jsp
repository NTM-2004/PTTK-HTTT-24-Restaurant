<%-- 
    Document   : ManagementHomeView
    Created on : Oct 10, 2025, 9:22:31 AM
    Author     : ADMIN
--%>

<%@page import="model.Staff"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Restaurant System</title>
        <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh; 
            margin: 0;
            padding: 20px;
        }

        .management-container {
            background-color: #fff;
            padding: 40px;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            width: 100%;
            max-width: 600px; 
            text-align: center;
        }

        .management-container h1 {
            color: #333;
            margin-bottom: 30px;
        }

        .menu-grid {
            display: flex;
            flex-direction: column;
            gap: 15px; 
        }
        
        .menu-button {
            display: block; 
            padding: 12px 20px;
            background-color: #007bff;
            color: white;
            text-decoration: none;
            border-radius: 4px;
            cursor: pointer;
            font-size: 16px;
            font-weight: bold;
            transition: background-color 0.3s ease;
        }

        .menu-button:hover {
            background-color: #0056b3;
        }
    </style>
    </head>
    <body>
        <div class="management-container">
        <h1>Restaurant System</h1>
        <h2>Management Home</h2>

        <%
            Staff staff = (Staff) session.getAttribute("staff");
            if (staff != null) {
        %>
                <p style="margin-bottom: 25px; color: #555;">
                    Welcome, <%= staff.getName() %>!
                </p>
        <%
            }
        %>
        
        <div class="menu-grid">
            <a href="${pageContext.request.contextPath}/dish" class="menu-button">Manage Dish</a>
            <a href="${pageContext.request.contextPath}/SelectStatisticView.jsp" class="menu-button">View Statistic</a>
            <form action="${pageContext.request.contextPath}/logout" method="GET">
                <button type="submit" class="menu-button">
                    Logout
                </button>
            </form>
        </div>
    </div>
    </body>
</html>
