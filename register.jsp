<%-- 
    Document   : register
    Created on : 25 Feb 2026, 19:35:17
    Author     : samro
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>NexGen - Sign UP </title>
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
            align-items: center;
            justify-content: center;
            padding: 20px;
        }

        .register-container {
            background: white;
            border-radius: 20px;
            box-shadow: 0 20px 60px rgba(0,0,0,0.3);
            overflow: hidden;
            width: 100%;
            max-width: 550px;
            animation: slideUp 0.6s ease;
        }

        @keyframes slideUp {
            from { opacity: 0; transform: translateY(30px); }
            to { opacity: 1; transform: translateY(0); }
        }

        .register-header {
            background: linear-gradient(45deg, #667eea, #764ba2);
            color: white;
            padding: 2rem;
            text-align: center;
        }

        .register-header .logo {
            width: 80px;
            height: 80px;
            background: rgba(255,255,255,0.2);
            border-radius: 50%;
            margin: 0 auto 1rem;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 2rem;
            border: 3px solid rgba(255,255,255,0.3);
        }

        .register-header h2 {
            font-size: 1.8rem;
            margin-bottom: 0.5rem;
        }

        .register-header p {
            opacity: 0.9;
            font-size: 0.95rem;
        }

        .register-form {
            padding: 2.5rem;
        }

        .form-row {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 1rem;
        }

        .form-group {
            margin-bottom: 1.2rem;
            position: relative;
        }

        .form-group.full-width {
            grid-column: 1 / -1;
        }

        .form-group label {
            display: block;
            margin-bottom: 0.5rem;
            color: #4a5568;
            font-weight: 600;
            font-size: 0.85rem;
        }

        .required::after {
            content: ' *';
            color: #e53e3e;
        }

        .input-wrapper {
            position: relative;
        }

        .input-wrapper i {
            position: absolute;
            left: 12px;
            top: 50%;
            transform: translateY(-50%);
            color: #a0aec0;
            font-style: normal;
            font-size: 1rem;
        }

        .form-control {
            width: 100%;
            padding: 10px 12px 10px 40px;
            border: 2px solid #e2e8f0;
            border-radius: 8px;
            font-size: 0.95rem;
            transition: all 0.3s ease;
            background: #f7fafc;
        }

        .form-control:focus {
            outline: none;
            border-color: #667eea;
            background: white;
            box-shadow: 0 0 0 3px rgba(102, 126, 234, 0.1);
        }

        select.form-control {
            padding-left: 40px;
            appearance: none;
            background-image: url("data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='12' height='12' viewBox='0 0 12 12'%3E%3Cpath fill='%23a0aec0' d='M6 9L1 4h10z'/%3E%3C/svg%3E");
            background-repeat: no-repeat;
            background-position: right 12px center;
        }

        .btn-register {
            width: 100%;
            padding: 14px;
            background: linear-gradient(45deg, #667eea, #764ba2);
            color: white;
            border: none;
            border-radius: 10px;
            font-size: 1rem;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.3s ease;
            margin-top: 0.5rem;
            grid-column: 1 / -1;
        }

        .btn-register:hover {
            transform: translateY(-2px);
            box-shadow: 0 5px 20px rgba(102, 126, 234, 0.4);
        }

        .error-message {
            background: #fed7d7;
            color: #c53030;
            padding: 12px;
            border-radius: 8px;
            margin-bottom: 1.5rem;
            border-left: 4px solid #fc8181;
            display: none;
        }

        .error-message.show {
            display: block;
            animation: shake 0.5s ease;
        }

        .success-message {
            background: #c6f6d5;
            color: #22543d;
            padding: 12px;
            border-radius: 8px;
            margin-bottom: 1.5rem;
            border-left: 4px solid #9ae6b4;
        }

        @keyframes shake {
            0%, 100% { transform: translateX(0); }
            25% { transform: translateX(-10px); }
            75% { transform: translateX(10px); }
        }

        .register-footer {
            text-align: center;
            margin-top: 1.5rem;
            padding-top: 1.5rem;
            border-top: 1px solid #e2e8f0;
        }

        .register-footer p {
            color: #718096;
            font-size: 0.9rem;
        }

        .register-footer a {
            color: #667eea;
            text-decoration: none;
            font-weight: 600;
        }

        .register-footer a:hover {
            text-decoration: underline;
        }

        .back-link {
            display: inline-flex;
            align-items: center;
            gap: 5px;
            margin-bottom: 1rem;
            color: #667eea;
            text-decoration: none;
            font-weight: 500;
        }

        .progress-bar {
            display: flex;
            justify-content: space-between;
            margin-bottom: 2rem;
            position: relative;
        }

        .progress-bar::before {
            content: '';
            position: absolute;
            top: 50%;
            left: 0;
            right: 0;
            height: 2px;
            background: #e2e8f0;
            z-index: 0;
        }

        .progress-step {
            width: 30px;
            height: 30px;
            background: white;
            border: 2px solid #e2e8f0;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 0.8rem;
            font-weight: 600;
            color: #a0aec0;
            position: relative;
            z-index: 1;
            transition: all 0.3s ease;
        }

        .progress-step.active {
            background: #667eea;
            border-color: #667eea;
            color: white;
        }

        .progress-step.completed {
            background: #48bb78;
            border-color: #48bb78;
            color: white;
        }

        @media (max-width: 600px) {
            .form-row {
                grid-template-columns: 1fr;
            }
        }
    </style>
</head>
<body>
    <div class="register-container">
        <div class="register-header">
            <div class="logo">📝</div>
            <h2>Create Account</h2>
            <p>Join our Employee Management System</p>
        </div>
        
        <!-- Registration Form -->
        <div class="register-form">
            <a href="index.jsp" class="back-link">← Back to Home</a>
            
            <div class="progress-bar">
                <div class="progress-step active">1</div>
                <div class="progress-step">2</div>
                <div class="progress-step">3</div>
            </div>
            
            <!-- Error: Invalid register info -->
            <% if(request.getAttribute("error") != null) { %>
                <div class="error-message show">
                    <%= request.getAttribute("error") %>
                </div>
            <% } %>
            
            <!-- Message: When registration is successful -->
            <% if(request.getAttribute("success") != null) { %>
                <div class="success-message">
                    <%= request.getAttribute("success") %>
                </div>
            <% } %>
            
            <form action="RegisterServlet" method="POST" id="registerForm" onsubmit="return validateForm()">
                <div class="form-row">
                    <div class="form-group">
                        <label for="employeeId" class="required">Employee ID</label>
                        <div class="input-wrapper">
                            <i>🆔</i>
                            <input type="text" class="form-control" id="employeeId" name="employeeId" 
                                   placeholder="e.g., EMP001" required>
                        </div>
                    </div>
                    
                    <!-- FullName fields -->
                    <div class="form-group">
                        <label for="fullName" class="required">Full Name</label>
                        <div class="input-wrapper">
                            <i>👤</i>
                            <input type="text" class="form-control" id="fullName" name="fullName" 
                                   placeholder="John Doe" required>
                        </div>
                    </div>
                </div>
                <!-- Drop down for department -->
                <div class="form-row">
                    <div class="form-group">
                        <label for="department" class="required">Department</label>
                        <div class="input-wrapper">
                            <i>🏢</i>
                            <select class="form-control" id="department" name="department" required>
                                <option value="">Select Department</option>
                                <option value="IT">IT</option>
                                <option value="HR">HR</option>
                                <option value="Finance">Finance</option>
                                <option value="Marketing">Marketing</option>
                                <option value="Operations">Operations</option>
                                <option value="PR">PR</option>
                                
                            </select>
                        </div>
                    </div>
                    <!-- Drop down for department role -->
                    <div class="form-group">
                        <label for="role" class="required">Role</label>
                        <div class="input-wrapper">
                            <i>💼</i>
                            <select class="form-control" id="role" name="role" required>
                                <option value="">Select Role</option>
                                <option value="Manager">Manager</option>
                                <option value="Clerk">Clerk</option>
                                <option value="Developer">Developer</option>
                                <option value="Analyst">Analyst</option>
                                <option value="Coordinator">Coordinator</option>
                                <option value="Intern">Intern</option>
                            </select>
                        </div>
                    </div>
                </div>
                
                <!-- Phone number field -->
                <div class="form-row">
                    <div class="form-group">
                        <label for="phone">Phone Number</label>
                        <div class="input-wrapper">
                            <i>📞</i>
                            <input type="tel" class="form-control" id="phone" name="phone" 
                                   placeholder="0712345678">
                        </div>
                    </div>
                    
                    <!-- Email  field -->
                    <div class="form-group">
                        <label for="email" class="required">Email</label>
                        <div class="input-wrapper">
                            <i>✉️</i>
                            <input type="email" class="form-control" id="email" name="email" 
                                   placeholder="johnDoe@company.com" required>
                        </div>
                    </div>
                </div>
                
                <!-- Password field -->
                <div class="form-row">
                    <div class="form-group">
                        <label for="password" class="required">Password</label>
                        <div class="input-wrapper">
                            <i>🔒</i>
                            <input type="password" class="form-control" id="password" name="password" 
                                   placeholder="Min 6 characters" required>
                        </div>
                    </div>
                    
                    <div class="form-group">
                        <label for="confirmPassword" class="required">Confirm Password</label>
                        <div class="input-wrapper">
                            <i>🔐</i>
                            <input type="password" class="form-control" id="confirmPassword" 
                                   name="confirmPassword" placeholder="Repeat password" required>
                        </div>
                    </div>
                </div>

                <button type="submit" class="btn-register">Create Account</button>
            </form>
            
            <div class="register-footer">
                <p>Already have an account? <a href="login.jsp">Sign in here</a></p>
            </div>
        </div>
    </div>

    <script>
        <!-- JavaScript for seeing if everything is filled in before submission -->
        function validateForm() {
            const password = document.getElementById('password').value;
            const confirmPassword = document.getElementById('confirmPassword').value;
            const email = document.getElementById('email').value;
            const phone = document.getElementById('phone').value;
            
            // Password match validation
            if(password !== confirmPassword) {
                alert('Passwords do not match!');
                return false;
            }
            
            // Password length validation
            if(password.length < 6) {
                alert('Password must be at least 6 characters long!');
                return false;
            }
            
            // Email validation
            const emailPattern = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
            if(!emailPattern.test(email)) {
                alert('Please enter a valid email address!');
                return false;
            }
            
            // Phone validation (South African format)
            if(phone && !/^(0|\+27)[6-8][0-9]{8}$/.test(phone)) {
                alert('Please enter a valid South African phone number!');
                return false;
            }
            
            return true;
        }

        // Real-time validation feedback
        document.getElementById('password').addEventListener('input', function() {
            const strength = this.value.length > 8 ? 'strong' : this.value.length > 5 ? 'medium' : 'weak';
            this.style.borderColor = strength === 'strong' ? '#48bb78' : strength === 'medium' ? '#ecc94b' : '#fc8181';
        });
    </script>
</body>
</html>
