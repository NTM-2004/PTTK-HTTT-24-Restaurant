<%-- 
    Document   : ListOrderView
    Created on : Oct 10, 2025, 2:12:05 PM
    Author     : ADMIN
--%>

<%@page import="java.sql.Date"%>
<%@page import="model.CustomerStat"%>
<%@page import="model.Order"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Restaurant</title>
        <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 40px 20px;
        }

        .main-container {
            background-color: #fff;
            padding: 30px;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            max-width: 900px;
            margin: 0 auto;
        }

        .header-section {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 25px;
        }

        .header-section h1 {
            color: #333;
            margin: 0;
        }
        
        .add-button {
            padding: 10px 15px;
            background-color: #28a745;
            color: white;
            text-decoration: none;
            border-radius: 4px;
            cursor: pointer;
            font-weight: bold;
            transition: background-color 0.3s ease;
        }

        .add-button:hover {
            background-color: #1e7e34;
        }

        .dish-table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }

        .dish-table th, .dish-table td {
            border: 1px solid #ddd;
            padding: 12px 15px;
            text-align: left;
        }

        .dish-table th {
            background-color: #007bff; 
            color: white;
            text-transform: uppercase;
        }

        .dish-table tr:nth-child(even) {
            background-color: #f9f9f9;
        }
        
        .dish-table .action-link {
            color: #007bff;
            text-decoration: none;
            margin-right: 10px;
        }
        .dish-table .action-link:hover {
            text-decoration: underline;
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
    </head>
    <script>
        function showOrderDetail(orderId) {
            window.location.href = '${pageContext.request.contextPath}/listOrder?action=detail&id=' + orderId;
        }
    </script>
    <body>
        <div class="main-container">
            <h1>List of Orders</h1>
            
            <% String errorMessage = (String) request.getAttribute("errorMessage"); %>
            <% if (errorMessage != null) { %>
                <p style="color: red; text-align: center;"><%= errorMessage %></p>
            <% } %>

            <table class="dish-table">
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Type</th>
                        <th>Price (VND)</th>
                        <th>Note</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        ArrayList<Order> orders = (ArrayList<Order>) request.getAttribute("listOrders");

                        if (orders != null && !orders.isEmpty()) {
                            for (Order o : orders) {
                    %>
                            <tr onclick="showOrderDetail(<%= o.getId() %>)">
                                <td><%= o.getId() %></td>
                                <td><%= o.getType() %></td>
                                <td><%= String.format("%,.0f", o.getPrice()) %></td>
                                <td><%= o.getNote() %></td>
                            </tr>
                    <%
                            }
                        } else {
                    %>
                            <tr>
                                <td colspan="5" style="text-align: center;">I'm Dead</td>
                            </tr>
                    <%
                        }
                    %>
                </tbody>
            </table>
            <a href="<%= request.getContextPath() %>/customerStat?action=cleanup" class="back-button">
                Return
            </a>
        </div>
    </body>
</html>
