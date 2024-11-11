<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Check Out</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            color: #333;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            background: #f5f5f5;
        }

        .container {
            background-color: white;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            width: 100%;
            max-width: 400px;
        }

        h1 {
            text-align: center;
            color: #333;
            margin-bottom: 30px;
        }

        .form-group {
            margin-bottom: 20px;
        }

        label {
            display: block;
            font-weight: 500;
            margin-bottom: 8px;
            color: #333;
        }

        input[type="text"],
        input[type="date"],
        input[type="time"] {
            width: 100%;
            padding: 12px;
            border: 1px solid #ddd;
            border-radius: 6px;
            font-size: 16px;
            background-color: #fff;
            box-sizing: border-box;
            transition: all 0.3s ease;
        }

        input[type="text"]:focus,
        input[type="date"]:focus,
        input[type="time"]:focus {
            border-color: #007bff;
            box-shadow: 0 0 0 2px rgba(0, 123, 255, 0.25);
            outline: none;
        }

        input[type="submit"] {
            width: 100%;
            padding: 14px;
            background-color: #007bff;
            color: white;
            border: none;
            border-radius: 6px;
            font-size: 16px;
            font-weight: 500;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        input[type="submit"]:hover {
            background-color: #0056b3;
        }

        .message {
            text-align: center;
            margin-top: 20px;
            padding: 10px;
            border-radius: 4px;
        }

        .success {
            color: #155724;
            background-color: #d4edda;
            border: 1px solid #c3e6cb;
        }

        .error {
            color: #721c24;
            background-color: #f8d7da;
            border: 1px solid #f5c6cb;
        }

        
        input[type="date"],
        input[type="time"] {
            appearance: none;
            -webkit-appearance: none;
            background-color: #fff;
        }

       
        input[type="date"]::-webkit-calendar-picker-indicator,
        input[type="time"]::-webkit-calendar-picker-indicator {
            background-color: transparent;
            padding: 5px;
            cursor: pointer;
            opacity: 0.6;
        }

        input[type="date"]::-webkit-calendar-picker-indicator:hover,
        input[type="time"]::-webkit-calendar-picker-indicator:hover {
            opacity: 1;
        }
    </style>
</head>
<body>
    <div class="container">
    <form action="checkout" method="post">  
            <h1>Check Out</h1>
            
            <div class="form-group">
                <label for="customerid">Customer ID</label>
                <input type="text" id="customerid" name="customerid" required>
            </div>

            <div class="form-group">
                <label for="checkoutdate">CheckOut Date</label>
                <input type="date" id="checkoutdate" name="checkoutdate" required>
            </div>

            <div class="form-group">
                <label for="checkOutTime">Check-out Time</label>
                <input type="time" id="checkOutTime" name="checkOutTime" required>
            </div>

            <input type="submit" value="Check Out">
        </form>

        <% if (request.getAttribute("MESSAGE") != null) { %>
            <div class="message <%= request.getAttribute("MESSAGE").toString().contains("successful") ? "success" : "error" %>">
                ${MESSAGE}
            </div>
        <% } %>
    </div>
</body>
</html>