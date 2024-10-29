<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Reception Page</title>
    <!-- Link to Font Awesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background: linear-gradient(135deg, #2980b9, #6dd5fa);
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .grid-container {
            display: grid;
            grid-template-columns: repeat(3, 1fr);
            gap: 20px;
            padding: 20px;
            margin: 20px;
            max-width: 1200px;
            width: 100%;
        }

        .grid-item {
            background-color: #34495e;
            border: none;
            border-radius: 15px;
            padding: 30px;
            text-align: center;
            transition: transform 0.3s ease, box-shadow 0.3s ease, background-color 0.3s ease;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            position: relative;
            color: white;
        }

        .grid-item:hover {
            transform: scale(1.05);
            background-color: #2c3e50;
            box-shadow: 0 12px 24px rgba(0, 0, 0, 0.2);
        }

        .grid-item i {
            font-size: 2em;
            margin-bottom: 15px;
        }

        .grid-item h2 {
            font-size: 1.8em;
            margin-bottom: 10px;
            color: #f1c40f;
        }

        .grid-item p {
            font-size: 1.1em;
            margin-bottom: 20px;
            color: #ecf0f1;
        }

        .grid-item a {
            text-decoration: none;
        }

        .grid-item .btn {
            background-color: #e74c3c;
            color: white;
            padding: 12px 24px;
            border: none;
            border-radius: 25px;
            cursor: pointer;
            transition: background-color 0.3s ease, transform 0.2s ease;
            font-size: 1.1em;
            text-transform: uppercase;
            font-weight: bold;
        }

        .grid-item .btn:hover {
            background-color: #c0392b;
            transform: scale(1.08);
            box-shadow: 0 8px 16px rgba(0, 0, 0, 0.2);
        }

            /* Video background styling */
             .video-background {
             position: fixed;
             top: 0;
             left: 0;
             width: 100%;
             height: 100%;
             overflow: hidden;
             z-index: -1;
        }

            #bg-video {
            width: 100%;
            height: 100%;
            object-fit: cover;
            }  
        }
    </style>
</head>
<body>
    <div class="video-background">
        <video autoplay muted loop id="bg-video">
            <source src="hotelvideo.mp4" type="video/mp4">
        </video>
    </div>
    <div class="grid-container">
        <div class="grid-item">
            <i class="fas fa-user"></i>
            <h2>Check-in</h2>
            <p>Customer Check In</p>
            <a href="CheckIn.jsp"><button class="btn">CheckIn</button></a>
        </div>
        <div class="grid-item">
            <i class="fas fa-user-edit"></i>
            <h2>Check-Out</h2>
            <p>Customer CheckOut</p>
            <a href="CheckOut.jsp"><button class="btn">Check-out</button></a>
        </div>
        <div class="grid-item">
            <i class="fas fa-eye"></i>
            <h2>Payment Status</h2>
            <p>View Payment Status</p>
            <a href="Admin.jsp"><button class="btn">View Payment Status</button></a>
        </div>
        <div class="grid-item">
            <i class="fas fa-chair"></i>
            <h2>Room Info</h2>
            <p>View the current status of Room Info</p>
            <a href="#"><button class="btn">Room Info</button></a>
        </div>
        <div class="grid-item">
            <i class="fas fa-user"></i>
            <h2>Customer Info</h2>
            <p>Get Customer Info</p>
            <a href="#"><button class="btn">Customer Info</button></a>
        </div>
        <div class="grid-item">
            <i class="fas fa-tools"></i>
            <h2>LogOut</h2>
            <p>LogOut</p>
            <a href="HomePage.jsp"><button class="btn">LogOut</button></a>
        </div>
    </div>

</body>
</html>