<%-- 
    Document   : index
    Created on : 25 Feb 2026, 19:34:48
    Author     : samro
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Employee Management System - NexGen Solutions</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            min-height: 100vh;
            display: flex;
            flex-direction: column;
        }

        .navbar {
            background: rgba(255, 255, 255, 0.95);
            padding: 1rem 5%;
            box-shadow: 0 2px 10px rgba(0,0,0,0.1);
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .logo-container {
            display: flex;
            align-items: center;
            gap: 15px;
        }

        .logo {
            width: 50px;
            height: 50px;
            background: linear-gradient(45deg, #667eea, #764ba2);
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            color: white;
            font-weight: bold;
            font-size: 24px;
        }

        .brand-text h1 {
            color: #2d3748;
            font-size: 1.5rem;
            margin-bottom: 2px;
        }

        .brand-text p {
            color: #718096;
            font-size: 0.9rem;
        }

        .nav-links {
            display: flex;
            gap: 20px;
        }

        .nav-links a {
            text-decoration: none;
            padding: 10px 25px;
            border-radius: 25px;
            transition: all 0.3s ease;
            font-weight: 600;
        }

        .btn-login {
            color: #667eea;
            border: 2px solid #667eea;
        }

        .btn-login:hover {
            background: #667eea;
            color: white;
            transform: translateY(-2px);
        }

        .btn-register {
            background: linear-gradient(45deg, #667eea, #764ba2);
            color: white;
            border: 2px solid transparent;
        }

        .btn-register:hover {
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(102, 126, 234, 0.4);
        }

        .hero {
            flex: 1;
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 2rem;
            text-align: center;
        }

        .hero-content {
            background: rgba(255, 255, 255, 0.95);
            padding: 3rem;
            border-radius: 20px;
            box-shadow: 0 20px 60px rgba(0,0,0,0.3);
            max-width: 600px;
            animation: slideUp 0.8s ease;
        }

        @keyframes slideUp {
            from {
                opacity: 0;
                transform: translateY(30px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        .hero h2 {
            color: #2d3748;
            font-size: 2.5rem;
            margin-bottom: 1rem;
        }

        .hero p {
            color: #718096;
            font-size: 1.1rem;
            margin-bottom: 2rem;
            line-height: 1.6;
        }

        .cta-buttons {
            display: flex;
            gap: 20px;
            justify-content: center;
            flex-wrap: wrap;
        }

        .cta-btn {
            padding: 15px 40px;
            border-radius: 30px;
            text-decoration: none;
            font-weight: 600;
            transition: all 0.3s ease;
            display: inline-flex;
            align-items: center;
            gap: 10px;
        }

        .cta-primary {
            background: linear-gradient(45deg, #667eea, #764ba2);
            color: white;
            box-shadow: 0 4px 15px rgba(102, 126, 234, 0.4);
        }

        .cta-primary:hover {
            transform: translateY(-3px);
            box-shadow: 0 6px 20px rgba(102, 126, 234, 0.6);
        }

        .cta-secondary {
            background: white;
            color: #667eea;
            border: 2px solid #667eea;
        }

        .cta-secondary:hover {
            background: #667eea;
            color: white;
            transform: translateY(-3px);
        }

        .features {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
            gap: 20px;
            margin-top: 2rem;
        }

        .feature {
            padding: 1.5rem;
            background: #f7fafc;
            border-radius: 10px;
            transition: transform 0.3s ease;
        }

        .feature:hover {
            transform: translateY(-5px);
            background: #edf2f7;
        }

        .feature-icon {
            font-size: 2rem;
            margin-bottom: 10px;
        }

        .feature h3 {
            color: #2d3748;
            font-size: 1rem;
            margin-bottom: 5px;
        }

        .feature p {
            color: #718096;
            font-size: 0.9rem;
            margin: 0;
        }

        footer {
            background: rgba(255, 255, 255, 0.1);
            color: white;
            text-align: center;
            padding: 1rem;
            backdrop-filter: blur(10px);
        }

        @media (max-width: 768px) {
            .navbar {
                flex-direction: column;
                gap: 1rem;
            }
            
            .hero h2 {
                font-size: 1.8rem;
            }
        }
    </style>
</head>
<body>
    <!-- Navigation with register and login buttons -->
    <nav class="navbar">
        <div class="logo-container">
            <div class="logo">NxG</div>
            <div class="brand-text">
                <h1>NexGen Solutions</h1>
                <p>Your tech solutions start here</p>
            </div>
        </div>
        <div class="nav-links">
            <a href="login.jsp" class="btn-login">Login</a>
            <a href="register.jsp" class="btn-register">Register</a>
        </div>
    </nav>
    
    <!-- Container with welcome messages and directory to register -->
    <section class="hero">
        <div class="hero-content">
            <h2>Welcome to Employee Management System</h2>
            <p>Streamline your workforce management with our comprehensive solution. 
               Manage employees, departments, and payroll efficiently.</p>
            
            <div class="cta-buttons">
                <a href="register.jsp" class="cta-btn cta-primary">
                    <span>Get Started</span>
                    <span>→</span>
                </a>
                <a href="login.jsp" class="cta-btn cta-secondary">
                    <span>Sign In</span>
                </a>
            </div>

            <div class="features">
                <div class="feature">
                    <div class="feature-icon">👥</div>
                    <h3>Employee Management</h3>
                    <p>CRUD operations</p>
                </div>
                <div class="feature">
                    <div class="feature-icon">🏢</div>
                    <h3>Departments</h3>
                    <p>Organize teams</p>
                </div>
                <div class="feature">
                    <div class="feature-icon">💰</div>
                    <h3>Payroll</h3>
                    <p>Process salaries</p>
                </div>
            </div>
        </div>
    </section>

    <footer>
        <p>&copy; 2026 NexGen Solutions. All rights reserved. | PRG361 Project</p>
    </footer>
</body>
</html>
