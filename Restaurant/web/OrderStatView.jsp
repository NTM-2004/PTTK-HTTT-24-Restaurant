<%-- 
    Document   : OrderStatView
    Created on : Oct 10, 2025, 5:14:59 PM
    Author     : ADMIN
--%>

<%@page import="model.ComboOrder"%>
<%@page import="model.DishOrder"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.Order"%>
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
            color: #333;
        }
        
        .navbar {
            width: 100%;
            background-color: #343a40;
            color: white;
            padding: 14px 20px;
            position: fixed;
            top: 0;
            left: 0;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .navbar .brand {
            font-size: 20px;
            font-weight: bold;
        }
        
        .content-wrap {
            max-width: 1000px;
            width: 95%;
            margin: 100px auto 40px; /* đẩy xuống tránh navbar */
            background-color: #fff;
            padding: 24px;
            border-radius: 8px;
            box-shadow: 0 4px 10px rgba(0,0,0,0.08);
            box-sizing: border-box;
        }
        
        .page-head {
            display: flex;
            justify-content: space-between;
            align-items: center;
            gap: 12px;
            flex-wrap: wrap;
            margin-bottom: 12px;
        }
        
        .page-head h1 {
            font-size: 20px;
            margin: 0;
        }
        
        .order-summary {
            border: 1px solid #e6e6e6;
            padding: 14px;
            margin-bottom: 18px;
            background-color: #fafafa;
            border-radius: 6px;
        }

        .order-summary p { margin: 6px 0; }

        .stat-grid {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 12px;
        }
        
         @media (max-width: 720px) {
            .stat-grid { grid-template-columns: 1fr; }
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 8px;
            font-size: 14px;
        }

        th, td {
            border: 1px solid #ddd;
            padding: 10px;
            text-align: left;
            vertical-align: middle;
        }

        th {
            background-color: #f2f2f2;
            font-weight: 600;
        }

        .no-data {
            color: #777;
            padding: 10px 0;
        }

        .btn {
            display: inline-block;
            padding: 10px 14px;
            border-radius: 4px;
            border: none;
            cursor: pointer;
            font-size: 15px;
            text-decoration: none;
            color: #fff;
            background-color: #007bff;
        }

        .btn:hover { background-color: #0056b3; }

        .btn-secondary {
            background-color: #6c757d;
        }

        .btn-secondary:hover { background-color: #565e64; }

        .error-message { color: red; font-weight: bold; margin-bottom: 12px; }

    </style>
    <body>
        <div class="navbar">
            <div class="brand">Restaurant System - Customer Statistic modul</div>
        </div>
        <div class="content-wrap">
            <div class="page-head">
                <h1>Order Statistics</h1>
                <div>
                    <%-- Return / Back button giống style Login --%>
                    <form action="${pageContext.request.contextPath}/order/id/clear" method="POST" style="display:inline;">
                        <button type="submit" class="btn btn-secondary">Return</button>
                    </form>
                </div>
            </div>

            <% 
                Order order = (Order) request.getAttribute("order");
                String errorMessage = (String) request.getAttribute("errorMessage");
            %>

            <% if (errorMessage != null) { %>
                <p class="error-message">Error: <%= errorMessage %></p>
            <% } %>

            <% if (order != null) { %>
                <div class="order-summary">
                    <h2 style="margin:0 0 8px 0;">Order Id #<%= order.getId() %></h2>
                    <div class="muted">Type: <strong><%= order.getType() %></strong> &nbsp; | &nbsp; Note: <%= order.getNote() %></div>
                    <p style="margin-top:8px;"><strong>Price:</strong> <%= String.format("%,.0f VND", order.getPrice()) %></p>
                </div>

                <div class="stat-grid">
                    <div>
                        <h3 style="margin:0 0 8px 0;">Dish list</h3>
                        <% 
                            ArrayList<DishOrder> dishList = order.getListDish();
                            if (dishList != null && !dishList.isEmpty()) { 
                        %>
                            <table>
                                <thead>
                                    <tr>
                                        <th style="width:50%;">Name</th>
                                        <th style="width:10%;">Amount</th>
                                        <th style="width:20%;">Price</th>
                                        <th style="width:20%;">Total</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <% for (DishOrder dishOrder : dishList) { %>
                                        <tr>
                                            <td><%= dishOrder.getDish().getName() %></td>
                                            <td><%= dishOrder.getAmount() %></td>
                                            <td><%= String.format("%,.0f VND", dishOrder.getPrice()) %></td>                                
                                            <td><%= String.format("%,.0f VND", dishOrder.getAmount() * dishOrder.getPrice()) %></td>
                                        </tr>
                                    <% } %>
                                </tbody>
                            </table>
                        <% } else { %>
                            <p class="no-data">No dish found.</p>
                        <% } %>
                    </div>

                    <div>
                        <h3 style="margin:0 0 8px 0;">Combo list</h3>
                        <% 
                            ArrayList<ComboOrder> comboList = order.getListCombo();
                            if (comboList != null && !comboList.isEmpty()) { 
                        %>
                            <table>
                                <thead>
                                    <tr>
                                        <th style="width:50%;">Name</th>
                                        <th style="width:10%;">Amount</th>
                                        <th style="width:20%;">Price</th>
                                        <th style="width:20%;">Total</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <% for (ComboOrder comboOrder : comboList) { %>
                                        <tr>
                                            <td><%= comboOrder.getCombo().getName() %></td>
                                            <td><%= comboOrder.getAmount() %></td>
                                            <td><%= String.format("%,.0f VND", comboOrder.getPrice()) %></td>                                
                                            <td><%= String.format("%,.0f VND", comboOrder.getAmount() * comboOrder.getPrice()) %></td>
                                        </tr>
                                    <% } %>
                                </tbody>
                            </table>
                        <% } else { %>
                            <p class="no-data">No Combo found.</p>
                        <% } %>
                    </div>
                </div>

            <% } else { %>
                <p class="no-data">No order selected. Please select an order to view details.</p>
            <% } %>

        </div>
        
        <form action="${pageContext.request.contextPath}/order/id/clear" method="POST" style="display:inline;">
            <button type="submit" class="back-button">Return</button>
        </form>
        
    </body>
</html>
