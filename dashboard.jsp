<%-- 
    Document   : dashboard
    Created on : 25 Feb 2026, 19:35:32
    Author     : samro
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.employeems.model.Employee" %>
<%
    // Session validation - checks if an employee is logged in
    //if no, redirects to login.jsp
    Employee employee = (Employee) session.getAttribute("employee");
    if(employee == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>NexGen - Dashboard</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: #f7fafc;
            min-height: 100vh;
        }

        .sidebar {
            position: fixed;
            left: 0;
            top: 0;
            bottom: 0;
            width: 260px;
            background: linear-gradient(180deg, #2d3748 0%, #1a202c 100%);
            color: white;
            padding: 1.5rem;
            overflow-y: auto;
        }

        .sidebar-header {
            text-align: center;
            padding-bottom: 1.5rem;
            border-bottom: 1px solid rgba(255,255,255,0.1);
            margin-bottom: 1.5rem;
        }

        .sidebar-logo {
            width: 60px;
            height: 60px;
            background: linear-gradient(45deg, #667eea, #764ba2);
            border-radius: 50%;
            margin: 0 auto 1rem;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 1.5rem;
            font-weight: bold;
        }

        .sidebar-header h3 {
            font-size: 1.1rem;
            margin-bottom: 0.25rem;
        }

        .sidebar-header p {
            font-size: 0.8rem;
            opacity: 0.7;
        }

        .nav-menu {
            list-style: none;
        }

        .nav-item {
            margin-bottom: 0.5rem;
        }

        .nav-link {
            display: flex;
            align-items: center;
            gap: 12px;
            padding: 12px 16px;
            color: #a0aec0;
            text-decoration: none;
            border-radius: 8px;
            transition: all 0.3s ease;
        }

        .nav-link:hover, .nav-link.active {
            background: rgba(102, 126, 234, 0.2);
            color: white;
        }

        .nav-link i {
            font-style: normal;
            font-size: 1.2rem;
        }

        .main-content {
            margin-left: 260px;
            padding: 2rem;
        }

        .top-bar {
            background: white;
            padding: 1rem 2rem;
            border-radius: 12px;
            box-shadow: 0 2px 10px rgba(0,0,0,0.05);
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 2rem;
        }

        .welcome-text h1 {
            color: #2d3748;
            font-size: 1.5rem;
            margin-bottom: 0.25rem;
        }

        .welcome-text p {
            color: #718096;
            font-size: 0.9rem;
        }

        .user-menu {
            display: flex;
            align-items: center;
            gap: 1rem;
        }

        .notification-btn {
            background: none;
            border: none;
            font-size: 1.3rem;
            cursor: pointer;
            position: relative;
            padding: 0.5rem;
        }

        .notification-badge {
            position: absolute;
            top: 0;
            right: 0;
            background: #e53e3e;
            color: white;
            font-size: 0.7rem;
            padding: 2px 6px;
            border-radius: 10px;
        }

        .user-profile {
            display: flex;
            align-items: center;
            gap: 0.75rem;
            padding: 0.5rem 1rem;
            background: #f7fafc;
            border-radius: 25px;
            cursor: pointer;
            transition: background 0.3s ease;
        }

        .user-profile:hover {
            background: #edf2f7;
        }

        .user-avatar {
            width: 35px;
            height: 35px;
            background: linear-gradient(45deg, #667eea, #764ba2);
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            color: white;
            font-weight: 600;
        }

        .stats-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
            gap: 1.5rem;
            margin-bottom: 2rem;
        }

        .stat-card {
            background: white;
            padding: 1.5rem;
            border-radius: 12px;
            box-shadow: 0 2px 10px rgba(0,0,0,0.05);
            transition: transform 0.3s ease;
        }

        .stat-card:hover {
            transform: translateY(-5px);
        }

        .stat-header {
            display: flex;
            justify-content: space-between;
            align-items: flex-start;
            margin-bottom: 1rem;
        }

        .stat-icon {
            width: 50px;
            height: 50px;
            border-radius: 12px;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 1.5rem;
        }

        .stat-icon.purple { background: rgba(102, 126, 234, 0.1); }
        .stat-icon.green { background: rgba(72, 187, 120, 0.1); }
        .stat-icon.blue { background: rgba(66, 153, 225, 0.1); }
        .stat-icon.orange { background: rgba(237, 137, 54, 0.1); }

        .stat-change {
            font-size: 0.85rem;
            font-weight: 600;
        }

        .positive { color: #48bb78; }
        .negative { color: #e53e3e; }

        .stat-value {
            font-size: 2rem;
            font-weight: 700;
            color: #2d3748;
            margin-bottom: 0.25rem;
        }

        .stat-label {
            color: #718096;
            font-size: 0.9rem;
        }

        .content-grid {
            display: grid;
            grid-template-columns: 2fr 1fr;
            gap: 1.5rem;
        }

        .card {
            background: white;
            border-radius: 12px;
            box-shadow: 0 2px 10px rgba(0,0,0,0.05);
            overflow: hidden;
        }

        .card-header {
            padding: 1.5rem;
            border-bottom: 1px solid #e2e8f0;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .card-title {
            font-size: 1.1rem;
            color: #2d3748;
            font-weight: 600;
        }

        .btn-sm {
            padding: 0.5rem 1rem;
            background: linear-gradient(45deg, #667eea, #764ba2);
            color: white;
            border: none;
            border-radius: 6px;
            font-size: 0.85rem;
            cursor: pointer;
            transition: all 0.3s ease;
        }

        .btn-sm:hover {
            transform: translateY(-2px);
            box-shadow: 0 4px 12px rgba(102, 126, 234, 0.4);
        }

        .card-body {
            padding: 1.5rem;
        }

        .activity-list {
            list-style: none;
        }

        .activity-item {
            display: flex;
            gap: 1rem;
            padding: 1rem 0;
            border-bottom: 1px solid #e2e8f0;
        }

        .activity-item:last-child {
            border-bottom: none;
        }

        .activity-icon {
            width: 40px;
            height: 40px;
            background: #f7fafc;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 1.2rem;
        }

        .activity-content h4 {
            color: #2d3748;
            font-size: 0.95rem;
            margin-bottom: 0.25rem;
        }

        .activity-content p {
            color: #718096;
            font-size: 0.85rem;
        }

        .activity-time {
            margin-left: auto;
            color: #a0aec0;
            font-size: 0.8rem;
        }

        .logout-btn {
            margin-top: 2rem;
            width: 100%;
            padding: 12px;
            background: rgba(229, 62, 62, 0.1);
            color: #fc8181;
            border: 1px solid rgba(229, 62, 62, 0.2);
            border-radius: 8px;
            cursor: pointer;
            transition: all 0.3s ease;
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 8px;
            text-decoration: none;
        }

        .logout-btn:hover {
            background: rgba(229, 62, 62, 0.2);
        }

        @media (max-width: 1024px) {
            .sidebar {
                transform: translateX(-100%);
            }
            .main-content {
                margin-left: 0;
            }
            .content-grid {
                grid-template-columns: 1fr;
            }
        }

        .quick-actions {
            display: grid;
            grid-template-columns: repeat(2, 1fr);
            gap: 1rem;
            margin-top: 1rem;
        }

        .quick-action-btn {
            padding: 1rem;
            background: #f7fafc;
            border: 2px solid #e2e8f0;
            border-radius: 8px;
            text-align: center;
            cursor: pointer;
            transition: all 0.3s ease;
            text-decoration: none;
            color: #4a5568;
        }

        .quick-action-btn:hover {
            border-color: #667eea;
            background: rgba(102, 126, 234, 0.05);
            transform: translateY(-2px);
        }

        .quick-action-btn i {
            display: block;
            font-size: 1.5rem;
            margin-bottom: 0.5rem;
            font-style: normal;
        }
    </style>
</head>
<body>
   
    <aside class="sidebar">
        <div class="sidebar-header">
            <div class="sidebar-logo">NxG</div>
            <h3>NexGen </h3>
            <p>Employee Management</p>
        </div>
        
        <!-- The side bar navigation -->
        <ul class="nav-menu">
            <li class="nav-item">
                <a href="#" class="nav-link active">
                    <i>📊</i>
                    <span>Dashboard</span>
                </a>
            </li>
            <li class="nav-item">
                <a href="#" class="nav-link">
                    <i>👥</i>
                    <span>Employees</span>
                </a>
            </li>
            <li class="nav-item">
                <a href="#" class="nav-link">
                    <i>🏢</i>
                    <span>Departments</span>
                </a>
            </li>
            <li class="nav-item">
                <a href="#" class="nav-link">
                    <i>💰</i>
                    <span>Payroll</span>
                </a>
            </li>
            <li class="nav-item">
                <a href="#" class="nav-link">
                    <i>📈</i>
                    <span>Reports</span>
                </a>
            </li>
            <li class="nav-item">
                <a href="#" class="nav-link">
                    <i>⚙️</i>
                    <span>Settings</span>
                </a>
            </li>
        </ul>

        <!-- Logout  -->
        <a href="LogoutServlet" class="logout-btn">
            <span>🚪</span>
            <span>Logout</span>
        </a>
    </aside>

    <!-- Main nav with custom names -->
    <main class="main-content">
        <div class="top-bar">
            <div class="welcome-text">
                <h1>Welcome back, <%= employee.getFullName().split(" ")[0] %> 👋</h1>
                <p>Here's what's happening in your organization today</p>
            </div>
            <div class="user-menu">
                <button class="notification-btn">
                    🔔
                    <span class="notification-badge">3</span>
                </button>
                <div class="user-profile">
                    <div class="user-avatar">
                        <%= employee.getFullName().charAt(0) %>
                    </div>
                    <div>
                        <div style="font-weight: 600; color: #2d3748;"><%= employee.getFullName() %></div>
                        <div style="font-size: 0.8rem; color: #718096;"><%= employee.getRole() %></div>
                    </div>
                </div>
            </div>
        </div>
                    
                    <!-- Section of the dashbord's features -->
        <div class="stats-grid">
            <div class="stat-card">
                <div class="stat-header">
                    <div class="stat-icon purple">👥</div>
                    <span class="stat-change positive">+12%</span>
                </div>
                <div class="stat-value">156</div>
                <div class="stat-label">Total Employees</div>
            </div>
            
            <div class="stat-card">
                <div class="stat-header">
                    <div class="stat-icon green">🏢</div>
                    <span class="stat-change positive">+2</span>
                </div>
                <div class="stat-value">8</div>
                <div class="stat-label">Departments</div>
            </div>
            
            <div class="stat-card">
                <div class="stat-header">
                    <div class="stat-icon blue">💰</div>
                    <span class="stat-change positive">+5%</span>
                </div>
                <div class="stat-value">R2.4M</div>
                <div class="stat-label">Monthly Payroll</div>
            </div>
            
            <div class="stat-card">
                <div class="stat-header">
                    <div class="stat-icon orange">📅</div>
                    <span class="stat-change negative">-2</span>
                </div>
                <div class="stat-value">5</div>
                <div class="stat-label">Pending Leaves</div>
            </div>
        </div>

        <div class="content-grid">
            <div class="card">
                <div class="card-header">
                    <h3 class="card-title">Recent Activity</h3>
                    <button class="btn-sm">View All</button>
                </div>
                <div class="card-body">
                    <ul class="activity-list">
                        <li class="activity-item">
                            <div class="activity-icon">🆕</div>
                            <div class="activity-content">
                                <h4>New Employee Added</h4>
                                <p>Sarah Johnson joined the IT Department</p>
                            </div>
                            <span class="activity-time">2h ago</span>
                        </li>
                        <li class="activity-item">
                            <div class="activity-icon">💸</div>
                            <div class="activity-content">
                                <h4>Payroll Processed</h4>
                                <p>Monthly salaries have been disbursed</p>
                            </div>
                            <span class="activity-time">5h ago</span>
                        </li>
                        <li class="activity-item">
                            <div class="activity-icon">📝</div>
                            <div class="activity-content">
                                <h4>Department Updated</h4>
                                <p>HR Department structure modified</p>
                            </div>
                            <span class="activity-time">1d ago</span>
                        </li>
                    </ul>
                </div>
            </div>

            <div class="card">
                <div class="card-header">
                    <h3 class="card-title">Quick Actions</h3>
                </div>
                <div class="card-body">
                    <div class="quick-actions">
                        <a href="#" class="quick-action-btn">
                            <i>➕</i>
                            <span>Add Employee</span>
                        </a>
                        <a href="#" class="quick-action-btn">
                            <i>📄</i>
                            <span>Generate Report</span>
                        </a>
                        <a href="#" class="quick-action-btn">
                            <i>💵</i>
                            <span>Process Payroll</span>
                        </a>
                        <a href="#" class="quick-action-btn">
                            <i>🏢</i>
                            <span>Add Department</span>
                        </a>
                    </div>
                </div>
            </div>
        </div>
    </main>
</body>
</html>
