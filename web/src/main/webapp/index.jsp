<%--
  Created by IntelliJ IDEA.
  User: Saumya
  Date: 5/29/2025
  Time: 11:18 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>GoldAuction | Sign In</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        :root {
            --gold: #D4AF37;
            --dark-gold: #996515;
        }

        body {
            background-color: #f8f9fa;
            font-family: 'Segoe UI', sans-serif;
        }

        .auth-container {
            max-width: 500px;
            margin: 5% auto;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.08);
            border-radius: 12px;
            overflow: hidden;
        }

        .auth-header {
            background: linear-gradient(135deg, var(--gold) 0%, var(--dark-gold) 100%);
            color: white;
            padding: 30px;
            text-align: center;
        }

        .auth-header h2 {
            font-weight: 700;
            margin-bottom: 5px;
        }

        .auth-body {
            background: white;
            padding: 30px;
        }

        .form-control:focus {
            border-color: var(--gold);
            box-shadow: 0 0 0 0.25rem rgba(212, 175, 55, 0.25);
        }

        .btn-gold {
            background-color: var(--gold);
            color: white;
            font-weight: 600;
            padding: 10px;
            transition: all 0.3s;
        }

        .btn-gold:hover {
            background-color: var(--dark-gold);
            transform: translateY(-2px);
        }

        .divider {
            display: flex;
            align-items: center;
            margin: 20px 0;
        }

        .divider::before, .divider::after {
            content: "";
            flex: 1;
            border-bottom: 1px solid #ddd;
        }

        .divider-text {
            padding: 0 10px;
            color: #777;
        }

        .social-btn {
            border: 1px solid #ddd;
            border-radius: 6px;
            padding: 8px;
            text-align: center;
            margin-bottom: 10px;
            transition: all 0.3s;
        }

        .social-btn:hover {
            border-color: var(--gold);
            color: var(--gold);
        }

        .auth-footer {
            text-align: center;
            padding: 20px;
            background: #f8f9fa;
            border-top: 1px solid #eee;
        }

        .auth-footer a {
            color: var(--gold);
            font-weight: 500;
        }

        .input-group-text {
            background-color: white;
        }
    </style>
</head>
<body>
<div class="container">
    <div class="auth-container">
        <!-- Header -->
        <div class="auth-header">
            <h2>Welcome Back</h2>
            <p>Sign in to your GoldAuction account</p>
        </div>

        <!-- Body -->
        <div class="auth-body">
            <!-- Sign In Form -->
            <form id="signinForm">
                <!-- Email -->
                <div class="mb-3">
                    <label for="email" class="form-label">Email Address</label>
                    <div class="input-group">
                        <span class="input-group-text"><i class="fas fa-envelope"></i></span>
                        <input type="email" class="form-control" id="email" placeholder="your@email.com" required>
                    </div>
                </div>

                <!-- Password -->
                <div class="mb-3">
                    <label for="password" class="form-label">Password</label>
                    <div class="input-group">
                        <span class="input-group-text"><i class="fas fa-lock"></i></span>
                        <input type="password" class="form-control" id="password" placeholder="••••••••" required>
                        <button class="btn btn-outline-secondary" type="button" id="togglePassword">
                            <i class="fas fa-eye"></i>
                        </button>
                    </div>
                    <div class="form-text text-end">
                        <a href="#" class="text-decoration-none">Forgot password?</a>
                    </div>
                </div>

                <!-- Remember Me -->
                <div class="mb-3 form-check">
                    <input type="checkbox" class="form-check-input" id="remember">
                    <label class="form-check-label" for="remember">Remember me</label>
                </div>

                <!-- Submit -->
                <button type="submit" class="btn btn-gold w-100 mb-3">
                    Sign In
                </button>

                <!-- Divider -->
                <div class="divider">
                    <span class="divider-text">OR CONTINUE WITH</span>
                </div>

                <!-- Social Login -->
                <div class="row">
                    <div class="col-md-6">
                        <a href="#" class="social-btn">
                            <i class="fab fa-google me-2"></i> Google
                        </a>
                    </div>
                    <div class="col-md-6">
                        <a href="#" class="social-btn">
                            <i class="fab fa-facebook-f me-2"></i> Facebook
                        </a>
                    </div>
                </div>
            </form>
        </div>

        <!-- Footer -->
        <div class="auth-footer">
            Don't have an account? <a href="#" class="text-decoration-none">Sign up</a>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<script src="js/script.js"></script>
</body>
</html>
