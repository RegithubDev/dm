<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>Re Sustainability - Corporate Portal</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <meta content="Re Sustainability, corporate portal, employee login" name="keywords">
    <meta content="Secure corporate portal access for Re Sustainability employees" name="description">

    <!-- Favicon -->
    <link href="/reirm/resources/ai/img/logo.png" rel="icon">

    <!-- Google Web Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&display=swap" rel="stylesheet">

    <!-- Icon Font Stylesheet -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" rel="stylesheet">

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

    <style>
        :root {
            --primary-blue: #1e40af;
            --primary-dark: #1e3a8a;
            --primary-light: #3b82f6;
            --accent-green: #059669;
            --neutral-dark: #374151;
            --neutral-light: #6b7280;
            --background-light: #f8fafc;
            --white: #ffffff;
            --border-color: #e5e7eb;
        }

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Inter', sans-serif;
            background: linear-gradient(135deg, #f8fafc 0%, #e2e8f0 100%);
            color: var(--neutral-dark);
            min-height: 100vh;
            display: flex;
            flex-direction: column;
        }

        /* Header */
        .corporate-header {
            background: var(--white);
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.08);
            padding: 1rem 0;
            position: sticky;
            top: 0;
            z-index: 100;
        }

        .navbar-brand {
            display: flex;
            align-items: center;
            font-weight: 700;
            font-size: 1.5rem;
            color: var(--primary-dark);
            text-decoration: none;
        }

        .navbar-brand img {
            margin-right: 0.75rem;
        }

        .brand-name {
            font-size: 1.25rem;
            font-weight: 600;
            color: var(--primary-dark);
        }

        .brand-tagline {
            font-size: 0.875rem;
            color: var(--neutral-light);
            margin-top: 0.25rem;
        }

        /* Main Content */
        .main-container {
            flex: 1;
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 2rem 1rem;
        }

        .login-container {
            display: flex;
            max-width: 1000px;
            width: 100%;
            background: var(--white);
            border-radius: 12px;
            box-shadow: 0 10px 25px rgba(0, 0, 0, 0.1);
            overflow: hidden;
        }

        /* Left Panel - Information */
        .info-panel {
            flex: 1;
            background: linear-gradient(135deg, var(--primary-dark) 0%, var(--primary-blue) 100%);
            color: var(--white);
            padding: 3rem;
            display: flex;
            flex-direction: column;
            justify-content: center;
        }

        .info-panel h1 {
            font-size: 2rem;
            font-weight: 700;
            margin-bottom: 1.5rem;
            line-height: 1.3;
        }

        .info-panel p {
            font-size: 1rem;
            line-height: 1.6;
            opacity: 0.9;
            margin-bottom: 2rem;
        }

        .features-list {
            list-style: none;
            padding: 0;
        }

        .features-list li {
            display: flex;
            align-items: center;
            margin-bottom: 1rem;
            font-size: 0.95rem;
        }

        .features-list i {
            background: rgba(255, 255, 255, 0.2);
            width: 30px;
            height: 30px;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            margin-right: 1rem;
            flex-shrink: 0;
        }

        /* Right Panel - Login Form */
        .login-panel {
            flex: 1;
            padding: 3rem;
            display: flex;
            flex-direction: column;
            justify-content: center;
        }

        .login-header {
            text-align: center;
            margin-bottom: 2rem;
        }

        .login-header h2 {
            font-size: 1.75rem;
            font-weight: 600;
            color: var(--primary-dark);
            margin-bottom: 0.5rem;
        }

        .login-header p {
            color: var(--neutral-light);
            font-size: 0.95rem;
        }

        .form-group {
            margin-bottom: 1.5rem;
        }

        .form-label {
            font-weight: 500;
            color: var(--neutral-dark);
            margin-bottom: 0.5rem;
            display: block;
        }

        .form-control {
            padding: 0.75rem 1rem;
            border: 1px solid var(--border-color);
            border-radius: 8px;
            font-size: 1rem;
            transition: all 0.3s ease;
            width: 100%;
        }

        .form-control:focus {
            border-color: var(--primary-light);
            box-shadow: 0 0 0 3px rgba(59, 130, 246, 0.1);
            outline: none;
        }

        .input-group {
            position: relative;
        }

        .input-icon {
            position: absolute;
            left: 1rem;
            top: 50%;
            transform: translateY(-50%);
            color: var(--neutral-light);
            z-index: 2;
        }

        .input-with-icon {
            padding-left: 3rem;
        }

        .btn-login {
            background: var(--primary-blue);
            color: var(--white);
            border: none;
            padding: 0.75rem 1.5rem;
            border-radius: 8px;
            font-weight: 600;
            font-size: 1rem;
            width: 100%;
            cursor: pointer;
            transition: all 0.3s ease;
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 0.5rem;
        }

        .btn-login:hover {
            background: var(--primary-dark);
            transform: translateY(-1px);
            box-shadow: 0 4px 12px rgba(30, 64, 175, 0.3);
        }

        .login-footer {
            text-align: center;
            margin-top: 2rem;
            padding-top: 1.5rem;
            border-top: 1px solid var(--border-color);
        }

        .login-footer p {
            color: var(--neutral-light);
            font-size: 0.875rem;
        }

        .security-badge {
            display: inline-flex;
            align-items: center;
            gap: 0.5rem;
            background: rgba(5, 150, 105, 0.1);
            color: var(--accent-green);
            padding: 0.5rem 1rem;
            border-radius: 50px;
            font-size: 0.8rem;
            font-weight: 500;
        }

        /* Footer */
        .corporate-footer {
            background: var(--white);
            border-top: 1px solid var(--border-color);
            padding: 1.5rem 0;
            text-align: center;
        }

        .footer-content {
            display: flex;
            justify-content: space-between;
            align-items: center;
            max-width: 1000px;
            margin: 0 auto;
            padding: 0 1rem;
        }

        .footer-links {
            display: flex;
            gap: 1.5rem;
        }

        .footer-links a {
            color: var(--neutral-light);
            text-decoration: none;
            font-size: 0.875rem;
            transition: color 0.3s ease;
        }

        .footer-links a:hover {
            color: var(--primary-blue);
        }

        .copyright {
            color: var(--neutral-light);
            font-size: 0.875rem;
        }

        /* Responsive Design */
        @media (max-width: 768px) {
            .login-container {
                flex-direction: column;
                max-width: 500px;
            }
            
            .info-panel, .login-panel {
                padding: 2rem;
            }
            
            .info-panel {
                text-align: center;
            }
            
            .footer-content {
                flex-direction: column;
                gap: 1rem;
            }
            
            .footer-links {
                order: -1;
            }
        }

        @media (max-width: 480px) {
            .info-panel, .login-panel {
                padding: 1.5rem;
            }
            
            .info-panel h1 {
                font-size: 1.75rem;
            }
            
            .login-header h2 {
                font-size: 1.5rem;
            }
        }
    </style>
</head>

<body>
    <!-- Header -->
    <header class="corporate-header">
        <div class="container">
            <div class="d-flex justify-content-between align-items-center">
                <a href="https://resustainability.com/" class="navbar-brand">
                    <img src="/reirm/resources/ai/img/logo.png" alt="Re Sustainability" height="40">
                    <div>
                        <div class="brand-name">Re Sustainability</div>
                        <div class="brand-tagline">Leading ESG Solutions Provider</div>
                    </div>
                </a>
            </div>
        </div>
    </header>

    <!-- Main Content -->
    <div class="main-container">
        <div class="login-container">
            <!-- Information Panel -->
            <div class="info-panel">
                <h1>Corporate Employee Portal</h1>
                <p>Secure access to Re Sustainability's internal systems, resources, and collaboration tools for authorized personnel only.</p>
                
                <ul class="features-list">
                    <li>
                        <i class="fas fa-shield-alt"></i>
                        <span>Enterprise-grade security and encryption</span>
                    </li>
                    <li>
                        <i class="fas fa-users"></i>
                        <span>Collaborative workspace for teams</span>
                    </li>
                    <li>
                        <i class="fas fa-chart-line"></i>
                        <span>Real-time analytics and reporting</span>
                    </li>
                    <li>
                        <i class="fas fa-cloud"></i>
                        <span>Cloud-based accessibility</span>
                    </li>
                </ul>
            </div>

            <!-- Login Form Panel -->
            <div class="login-panel">
                <div class="login-header">
                    <h2>Sign In to Portal</h2>
                    <p>Enter your credentials to access the corporate system</p>
                </div>

                <form id="corporateAuthForm" novalidate action="<%=request.getContextPath()%>/login" method="POST">
                    <div class="form-group">
                        <label for="employeeId" class="form-label">Employee ID</label>
                        <div class="input-group">
                            <i class="fas fa-user-tie input-icon"></i>
                            <input type="text" class="form-control input-with-icon" id="employeeId" name="userId" 
                                   placeholder="Enter your employee ID" autocomplete="username" required>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="password" class="form-label">Password</label>
                        <div class="input-group">
                            <i class="fas fa-lock input-icon"></i>
                            <input type="password" class="form-control input-with-icon" id="password" name="password" 
                                   placeholder="Enter your password" autocomplete="current-password" required>
                        </div>
                    </div>

                    <button type="submit" class="btn-login">
                        <i class="fas fa-sign-in-alt"></i>
                        Sign In to Portal
                    </button>
                </form>

                <div class="login-footer">
                    <div class="security-badge">
                        <i class="fas fa-lock"></i>
                        Secured Connection • Encrypted Transmission
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Footer -->
    <footer class="corporate-footer">
        <div class="footer-content">
            <div class="copyright">
                &copy; 2025 Re Sustainability Limited. All Rights Reserved.
            </div>
            <div class="footer-links">
                <a href="https://resustainability.com/privacy-policy/">Privacy Policy</a>
                <a href="https://resustainability.com/terms-of-service/">Terms of Service</a>
                <a href="https://resustainability.com/contact/">Contact Support</a>
            </div>
        </div>
    </footer>

    <!-- JavaScript -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        document.addEventListener('DOMContentLoaded', function() {
            const form = document.getElementById('corporateAuthForm');
            
            form.addEventListener('submit', function(event) {
                if (!form.checkValidity()) {
                    event.preventDefault();
                    event.stopPropagation();
                }
                form.classList.add('was-validated');
            });

            // Add subtle animation to form elements on focus
            const inputs = form.querySelectorAll('.form-control');
            inputs.forEach(input => {
                input.addEventListener('focus', function() {
                    this.parentElement.classList.add('focused');
                });
                
                input.addEventListener('blur', function() {
                    if (this.value === '') {
                        this.parentElement.classList.remove('focused');
                    }
                });
            });
        });
    </script>
</body>
</html>