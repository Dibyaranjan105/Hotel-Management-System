<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Customer Check-in</title>
    <style>
        body {
            font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, sans-serif;
            background-color: #f5f5f5;
            margin: 0;
            padding: 20px;
            min-height: 100vh;
        }

        .form-container {
            max-width: 600px;
            margin: 0 auto;
            background: white;
            padding: 32px;
            border-radius: 12px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
        }

        h1 {
            font-size: 32px;
            color: #333;
            margin-bottom: 32px;
            font-weight: 600;
        }

        .form-group {
            margin-bottom: 24px;
        }

        label {
            display: block;
            font-size: 16px;
            font-weight: 500;
            color: #333;
            margin-bottom: 8px;
        }

        input[type="text"],
        input[type="email"],
        input[type="tel"],
        input[type="date"],
        input[type="time"],
        select {
            width: 100%;
            padding: 12px;
            border: 1px solid #ddd;
            border-radius: 8px;
            font-size: 16px;
            color: #333;
            background: white;
            transition: border-color 0.3s ease;
        }

        input:focus,
        select:focus {
            outline: none;
            border-color: #007AFF;
            box-shadow: 0 0 0 2px rgba(0, 122, 255, 0.1);
        }

        .row {
            display: flex;
            gap: 20px;
            margin-bottom: 24px;
        }

        .col {
            flex: 1;
        }

        .submit-btn {
            background: #007AFF;
            color: white;
            width: 100%;
            padding: 14px;
            border: none;
            border-radius: 8px;
            font-size: 16px;
            font-weight: 600;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        .submit-btn:hover {
            background: #0056b3;
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

        /* Message styling */
        .message {
            text-align: center;
            margin-top: 20px;
            padding: 10px;
            border-radius: 8px;
        }

        .message h2 {
            color: #4CAF50;
            margin: 0;
        }

        @media (max-width: 768px) {
            .row {
                flex-direction: column;
                gap: 16px;
            }

            .form-container {
                padding: 20px;
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

    <div class="form-container">
        <h1>Customer Check-in</h1>
        <form action="CheckIn" method="post">
            <div class="form-group">
                <label for="customerid">Customer ID</label>
                <input type="text" id="customerid" name="customerid" required>
            </div>

            <div class="form-group">
                <label for="name">Customer Name</label>
                <input type="text" id="name" name="name" required>
            </div>

            <div class="form-group">
                <label for="email">Email Address</label>
                <input type="email" id="email" name="email" required>
            </div>

            <div class="form-group">
                <label for="mobile">Phone Number</label>
                <input type="tel" id="mobile" name="mobile" required>
            </div>

            <div class="row">
                <div class="col">
                    <label for="id-type">ID Proof Type</label>
                    <select id="id-type" name="idType" required>
                        <option value="">Select ID Type</option>
                        <option value="aadhaar">Aadhaar Card</option>
                        <option value="driving-license">Driving License</option>
                        <option value="voter-id">Voter ID</option>
                        <option value="passport">Passport</option>
                        <option value="other">Other</option>
                    </select>
                </div>
                <div class="col">
                    <label for="id-number">ID Number</label>
                    <input type="text" id="id-number" name="idNumber" required>
                </div>
            </div>

            <div class="row">
                <div class="col">
                    <label for="checkindate">Check-in Date</label>
                    <input type="date" id="checkindate" name="checkindate" required>
                </div>
                <div class="col">
                    <label for="check-in-time">Check-in Time</label>
                    <input type="time" id="check-in-time" name="checkInTime" required>
                </div>
            </div>

            <button type="submit" class="submit-btn">Submit</button>
        </form>

       
    </div>
</body>
</html>