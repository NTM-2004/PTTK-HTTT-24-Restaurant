<%-- 
    Document   : AddDishView
    Created on : Oct 10, 2025, 10:49:05 AM
    Author     : ADMIN
--%>

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
            height: 100vh;
            margin: 0;
        }

        .form-container {
            background-color: #fff;
            padding: 30px;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            width: 100%;
            max-width: 450px;
        }

        .form-container h1 {
            text-align: center;
            margin-bottom: 25px;
            color: #333;
        }

        .input-group {
            margin-bottom: 15px;
        }

        .input-group label {
            display: block;
            margin-bottom: 5px;
            font-weight: bold;
            color: #555;
        }

        .input-group input[type="text"],
        .input-group input[type="number"],
        .input-group textarea {
            width: 100%;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box; 
            resize: vertical;
        }

        .submit-button {
            width: 100%;
            padding: 12px;
            background-color: #28a745;
            color: white;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-size: 16px;
            margin-top: 15px;
            font-weight: bold;
        }

        .submit-button:hover {
            background-color: #1e7e34;
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

        .error-message {
            color: red;
            text-align: center;
            margin-bottom: 10px;
        }
    </style>
    <body>
        <div class="form-container">
        <h1>Add Dish</h1>
        
        <%
            String errorMessage = (String) request.getAttribute("errorMessage");
            if (errorMessage != null) {
        %>
                <p class="error-message"><%= errorMessage %></p>
        <%
            }
        %>
        
        <form action="${pageContext.request.contextPath}/dish/add" method="POST">
            
            <div class="input-group">
                <label for="name">Name:</label>
                <input type="text" id="name" name="name" required 
                       value="${requestScope.dishName}"> 
                       </div>
            
            <div class="input-group">
                <label for="price">Price (VND):</label>
                <input type="number" step="0.01" min="0" id="price" name="price" required 
                       value="${requestScope.dishPrice}">
            </div>
            
            <div class="input-group">
                <label for="description">Description:</label>
                <textarea id="description" name="description" rows="4">${requestScope.dishDescription}</textarea>
            </div>
            
            <button type="submit" class="submit-button">Add</button>
        </form>
        
        <a href="${pageContext.request.contextPath}/dish" class="back-button">
            Return
        </a>
        </div>
    </body>
</html>
