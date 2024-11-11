<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Hotel Management System</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: Arial, sans-serif;
            min-height: 100vh;
            display: flex;
            flex-direction: column;
            background: linear-gradient(135deg, #2980b9, #6dd5fa);
        }

        
        header {
            background: rgba(52, 73, 94, 0.95);
            padding: 2rem 0;
            position: relative;
            overflow: hidden;
            box-shadow: 0 4px 30px rgba(0, 0, 0, 0.2);
            z-index: 3;
        }

        .header-container {
            position: relative;
            max-width: 1200px;
            margin: 0 auto;
            padding: 0 20px;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .header-content {
            text-align: center;
            position: relative;
            z-index: 2;
        }

        .header-title {
            font-size: 3.5em;
            font-weight: 800;
            background: linear-gradient(45deg, #f1c40f, #e74c3c, #3498db);
            -webkit-background-clip: text;
            background-clip: text;
            color: transparent;
            text-transform: uppercase;
            letter-spacing: 4px;
            margin-bottom: 0.5rem;
            position: relative;
            animation: titleFloat 3s ease-in-out infinite;
        }

        .header-subtitle {
            font-size: 1.2em;
            color: #ecf0f1;
            letter-spacing: 2px;
            opacity: 0;
            animation: fadeIn 1s ease-out 0.5s forwards;
        }

        /* Decorative Elements */
        .header-decoration {
            position: absolute;
            width: 100%;
            height: 100%;
            top: 0;
            left: 0;
            pointer-events: none;
        }

        .header-decoration::before,
        .header-decoration::after {
            content: '';
            position: absolute;
            width: 200px;
            height: 200px;
            border-radius: 50%;
            background: rgba(241, 196, 15, 0.1);
            animation: pulse 4s infinite;
        }

        .header-decoration::before {
            top: -100px;
            left: -100px;
        }

        .header-decoration::after {
            bottom: -100px;
            right: -100px;
            animation-delay: 2s;
        }

        
        @keyframes titleFloat {
            0%, 100% {
                transform: translateY(0);
            }
            50% {
                transform: translateY(-10px);
            }
        }

        @keyframes fadeIn {
            from {
                opacity: 0;
                transform: translateY(20px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        @keyframes pulse {
            0%, 100% {
                transform: scale(1);
                opacity: 0.1;
            }
            50% {
                transform: scale(1.5);
                opacity: 0.3;
            }
        }

        
        .main-content {
            flex: 1;
            display: flex;
            justify-content: center;
            align-items: center;
            padding: 40px 0;
        }

        .grid-container {
            display: flex;
            flex-wrap: wrap;
            gap: 30px;
            padding: 20px;
            margin: 20px;
            max-width: 1200px;
            width: 100%;
            justify-content: center;
            perspective: 1000px;
        }

        .grid-item {
            background-color: #34495e;
            border: none;
            border-radius: 15px;
            padding: 30px;
            text-align: center;
            transition: all 0.4s cubic-bezier(0.165, 0.84, 0.44, 1);
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            position: relative;
            color: white;
            transform-style: preserve-3d;
            z-index: 1;
            width: calc(33.333% - 40px);
            min-width: 280px;
            flex-grow: 0;
            flex-shrink: 0;
        }

        .grid-item:hover {
            transform: translateZ(50px) scale(1.05);
            background-color: #2c3e50;
            box-shadow: 0 20px 40px rgba(0, 0, 0, 0.3);
            z-index: 2;
        }

        .grid-item i {
            font-size: 2em;
            margin-bottom: 15px;
            color: #f1c40f;
            transition: transform 0.3s ease;
        }

        .grid-item:hover i {
            transform: scale(1.2);
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

        .grid-item .btn {
            background-color: #e74c3c;
            color: white;
            padding: 12px 24px;
            border: none;
            border-radius: 25px;
            cursor: pointer;
            transition: all 0.3s ease;
            font-size: 1.1em;
            text-transform: uppercase;
            font-weight: bold;
            width: 80%;
            max-width: 200px;
        }

        .grid-item .btn:hover {
            background-color: #c0392b;
            transform: scale(1.08);
            box-shadow: 0 8px 16px rgba(0, 0, 0, 0.2);
        }

        /* Footer Styles */
        footer {
            background-color: rgba(52, 73, 94, 0.95);
            color: white;
            padding: 20px 0;
            position: relative;
            z-index: 3;
        }

        .footer-content {
            display: flex;
            justify-content: space-around;
            align-items: center;
            flex-wrap: wrap;
            max-width: 1200px;
            margin: 0 auto;
            padding: 0 20px;
        }

        .footer-section {
            margin: 10px 20px;
            text-align: center;
        }

        .footer-section h3 {
            color: #f1c40f;
            margin-bottom: 10px;
            font-size: 1.2em;
        }

        .footer-section p, .footer-section a {
            color: #ecf0f1;
            text-decoration: none;
            transition: color 0.3s ease;
        }

        .footer-section a:hover {
            color: #f1c40f;
        }

        .social-links {
            margin-top: 10px;
        }

        .social-links a {
            margin: 0 10px;
            font-size: 1.5em;
        }

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

        /* Responsive Design */
        @media (max-width: 1200px) {
            .grid-item {
                width: calc(50% - 40px);
            }
        }

        @media (max-width: 768px) {
            .header-title {
                font-size: 2.5em;
                letter-spacing: 2px;
            }
            
            .header-subtitle {
                font-size: 1em;
            }

            .grid-item {
                width: 100%;
                min-width: auto;
            }

            .footer-content {
                flex-direction: column;
            }

            .footer-section {
                margin: 10px 0;
            }
        }

        @media (max-width: 480px) {
            .header-title {
                font-size: 2em;
                letter-spacing: 1px;
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

    <header>
        <div class="header-decoration"></div>
        <div class="header-container">
            <div class="header-content">
                <h1 class="header-title"> Hotel Management System</h1>
                <p class="header-subtitle">Experience Excellence in Hotel</p>
            </div>
        </div>
    </header>

    <div class="main-content">
        <div class="grid-container">
            <div class="grid-item">
                <i class="fas fa-user"></i>
                <h2>Check-in</h2>
                <p>Customer Check In</p>
                <a href="checkin.jsp"><button class="btn">CheckIn</button></a>
            </div>
            <div class="grid-item">
                <i class="fas fa-user-edit"></i>
                <h2>Check-Out</h2>
                <p>Customer CheckOut</p>
                <a href="checkout.jsp"><button class="btn">Check-out</button></a>
            </div>
            <div class="grid-item">
                <i class="fas fa-eye"></i>
                <h2>Payment Status</h2>
                <p>View Payment Status</p>
                <a href="PaymentForm.jsp"><button class="btn">View Payment Status</button></a>
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
    </div>

    <footer>
        <div class="footer-content">
            <div class="footer-section">
                <h3>About Us</h3>
                <p>Providing excellent hotel services and management solutions since 2024.</p>
            </div>
            <div class="footer-section">
                <h3>Contact Us</h3>
                <p>Email: info@hotelmanagement.com</p>
                <p>Phone: 7978025801</p>
                <div class="social-links">
                    <a href="#"><i class="fab fa-facebook"></i></a>
                    <a href="#"><i class="fab fa-twitter"></i></a>
                    <a href="#"><i class="fab fa-instagram"></i></a>
                    <a href="#"><i class="fab fa-linkedin"></i></a>
                </div>
            </div>
            <div class="footer-section">
                <h3>Designed & Developed By</h3>
                <p>Hotel Management Team</p>
                
            </div>
        </div>
    </footer>
</body>
</html>