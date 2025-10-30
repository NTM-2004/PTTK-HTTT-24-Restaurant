<%-- 
    Document   : CustomerStatView
    Created on : Oct 10, 2025, 1:12:42 PM
    Author     : ADMIN
--%>

<%@page import="model.CustomerStat"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.ArrayList"%>
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
            margin: 0;
            padding: 40px 20px;
        }

        .main-container {
            background-color: #fff;
            padding: 30px;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            max-width: 1000px;
            margin: 0 auto;
        }

        .main-container h1 {
            text-align: center;
            color: #333;
            margin-bottom: 30px;
        }

        .search-form {
            display: flex;
            gap: 20px;
            align-items: flex-end; 
            margin-bottom: 30px;
            padding: 20px;
            border: 1px solid #ccc;
            border-radius: 4px;
            background-color: #fafafa;
        }

        .input-group {
            display: flex;
            flex-direction: column;
        }

        .input-group label {
            margin-bottom: 5px;
            font-weight: bold;
            color: #555;
        }

        .input-group input[type="text"] {
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
            width: 150px; 
        }

        .search-button {
            padding: 10px 25px;
            background-color: #007bff;
            color: white;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-weight: bold;
            transition: background-color 0.3s ease;
        }

        .search-button:hover {
            background-color: #0056b3;
        }

        .stat-table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }

        .stat-table th, .stat-table td {
            border: 1px solid #ddd;
            padding: 12px 15px;
            text-align: left;
        }

        .stat-table th {
            background-color: #007bff;
            color: white;
            text-transform: uppercase;
        }

        .stat-table tr:nth-child(even) {
            background-color: #f9f9f9;
        }

        .error-message {
            color: red;
            text-align: center;
            margin-bottom: 20px;
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
        .stat-table tbody tr {
            cursor: pointer; 
            transition: background-color 0.2s;
        }

        .stat-table tbody tr:hover {
            background-color: #e9ecef;
        }
    </style>
    <script>
        function showCustomerDetail(customerId) {
            window.location.href = '${pageContext.request.contextPath}/customerStat?action=detail&id=' + customerId;
        }
    </script>
    <body>
        <%
            String startParam = request.getParameter("start") != null ? request.getParameter("start") : "";
            String endParam = request.getParameter("end") != null ? request.getParameter("end") : "";
            String errorMessage = (String) request.getAttribute("errorMessage");
            
            ArrayList<CustomerStat> listCS = (ArrayList<CustomerStat>) request.getAttribute("listCS");
        %>

        <div class="main-container">
            <h1>Customer Statistic</h1>
            
            <% if (errorMessage != null) { %>
                <p class="error-message">Error: <%= errorMessage %></p>
            <% } %>

            <form action="${pageContext.request.contextPath}/customerStat" method="GET" class="search-form">
                
                <div class="input-group">
                    <label for="start">Start date (dd/MM/yyyy):</label>
                    <input type="text" id="start" name="start" required 
                           placeholder="VD: 01/01/2025" value="<%= startParam %>">
                </div>
                
                <div class="input-group">
                    <label for="end">End date (dd/MM/yyyy):</label>
                    <input type="text" id="end" name="end" required 
                           placeholder="VD: 31/12/2025" value="<%= endParam %>">
                </div>
                
                <button type="submit" class="search-button">
                    <i class="fas fa-search"></i> Search
                </button>
            </form>

            <% if (listCS != null) { %>
                <h2>List of Customer</h2>
                
                <% if (listCS.isEmpty()) { %>
                    <p style="text-align: center; color: #555;">Can't find any record at that time.</p>
                <% } else { %>
                    <table class="stat-table">
                        <thead>
                            <tr>
                                <th>ID</th>
                                <th>Name</th>
                                <th>Phone</th>
                                <th>Email</th>
                                <th>Revenue</th>
                            </tr>
                        </thead>
                        <tbody>
                            <% for (CustomerStat cs : listCS) { %>
                                <tr onclick="showCustomerDetail(<%= cs.getId() %>)">
                                    <td><%= cs.getId() %></td>
                                    <td><%= cs.getName() %></td>
                                    <td><%= cs.getPhone() %></td>
                                    <td><%= cs.getEmail() %></td>
                                    <td><%= String.format("%,.0f VND", cs.getRevenue()) %></td>
                                </tr>
                            <% } %>
                        </tbody>
                    </table>
                <% } %>
            <% } else { %>
            <% } %>
            <a href="SelectStatisticView.jsp" class="back-button">
                Return
            </a>
        </div>
    </body>
</html>
