<%-- 
    Document   : SelectStatisticView
    Created on : Oct 10, 2025, 1:06:15 PM
    Author     : ADMIN
--%>

<%@page import="model.Staff"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Restaurant</title>
    </head>
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
        .back-button {
            display: block;
            width: 100%;
            padding: 10px;
            background-color: #6c757d;
            color: white;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-size: 14px;
            text-align: center;
            text-decoration: none;
            margin-top: 10px;
        }
        
        .back-button:hover {
            background-color: #5a6268;
        }
    </style>
    <body>
        <div class="management-container">
            <h1>Restaurant system</h1>
            <h2>Select Statistic</h2>

            <div class="menu-grid">
                <a href="${pageContext.request.contextPath}/customerStat" class="menu-button">Customer Statistic</a>
                <a href="${pageContext.request.contextPath}/ViewStatisticView.jsp" class="menu-button">Dish Statistic</a>
                <a href="${pageContext.request.contextPath}/ViewStatisticView.jsp" class="menu-button">Supplier Statistic</a>
                <a href="ManagementHomeView.jsp" class="back-button">
                    Return
                </a>
            </div>
        </div>
    </body>
</html>
