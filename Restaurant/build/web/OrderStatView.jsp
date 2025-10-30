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
        body { font-family: Arial, sans-serif; margin: 20px; }
        h1 { color: #333; }
        .order-summary { border: 1px solid #ccc; padding: 15px; margin-bottom: 20px; background-color: #f9f9f9; }
        .order-summary p { margin: 5px 0; }
        table { width: 100%; border-collapse: collapse; margin-top: 15px; }
        th, td { border: 1px solid #ddd; padding: 8px; text-align: left; }
        th { background-color: #f2f2f2; }
        .error-message { color: red; font-weight: bold; }
    </style>
    <body>
        <h1>Order Stat Page</h1>

        <%-- Khối Scriptlet để xử lý và định dạng --%>
        <% 
            Order order = (Order) request.getAttribute("order");
            String errorMessage = (String) request.getAttribute("errorMessage");
        %>

        <% if (errorMessage != null) { %>
            <p class="error-message">Error: <%= errorMessage %></p>
        <% } %>

        <% if (order != null) { %>
            <div class="order-summary">
                <h2>Order Id #<%= order.getId() %></h2>
                <p><strong>Type:</strong> <%= order.getType() %></p>
                <p><strong>Note:</strong> <%= order.getNote() %></p>
                <p><strong>Price:</strong> <%= String.format("%,.0f VND", order.getPrice()) %></p>
            </div>

            <hr>
            
            <h2>Dish list</h2>
            <% 
                ArrayList<DishOrder> dishList = order.getListDish();
                if (dishList != null && !dishList.isEmpty()) { 
            %>
                <table>
                    <thead>
                        <tr>
                            <th>Name</th>
                            <th>Amount</th>
                            <th>Price</th>
                            <th>Total</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%-- Lặp qua danh sách DishOrder (tương đương <c:forEach>) --%>
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
                <p>No dish found.</p>
            <% } %>

            <hr>

            <h2>Combo list</h2>
            <% 
                ArrayList<ComboOrder> comboList = order.getListCombo();
                if (comboList != null && !comboList.isEmpty()) { 
            %>
                <table>
                    <thead>
                        <tr>
                            <th>Name</th>
                            <th>Amount</th>
                            <th>Price</th>
                            <th>Total</th>
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
                <p>No Combo found.</p>
            <% } %>

        <% } %>
        
        <p><a href="<%= request.getContextPath() %>/listOrder?action=cleanup"> return </a></p>
        
    </body>
</html>
