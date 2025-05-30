<%--
  Created by IntelliJ IDEA.
  User: Saumya
  Date: 5/29/2025
  Time: 11:21 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Gold Auction | Home</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        :root {
            --gold: #D4AF37;
            --dark-gold: #996515;
            --light-gold: #F0E68C;
        }

        body {
            font-family: 'Segoe UI', sans-serif;
            background-color: #f8f9fa;
            color: #333;
        }

        .navbar {
            box-shadow: 0 2px 10px rgba(0,0,0,0.1);
        }

        .navbar-brand {
            font-weight: 700;
            color: var(--gold) !important;
        }

        .nav-link {
            font-weight: 500;
        }

        .hero {
            background: linear-gradient(135deg, #f9f9f9 0%, #fff8e8 100%);
            padding: 80px 40px;
            position: relative;
            overflow: hidden;
        }

        .hero-text {
            max-width: 50%;
            z-index: 2;
        }

        .hero h1 {
            font-size: 48px;
            font-weight: 700;
            line-height: 1.2;
        }

        .hero p {
            font-size: 18px;
            margin: 20px 0 30px;
        }

        .btn-auction {
            background-color: var(--gold);
            color: white;
            font-weight: 600;
            padding: 10px 25px;
            border: none;
            transition: all 0.3s;
        }

        .btn-auction:hover {
            background-color: var(--dark-gold);
            transform: translateY(-2px);
        }

        .section-title {
            font-size: 32px;
            font-weight: 700;
            margin-bottom: 30px;
            position: relative;
            display: inline-block;
        }

        .section-title:after {
            content: '';
            position: absolute;
            bottom: -10px;
            left: 0;
            width: 50px;
            height: 3px;
            background-color: var(--gold);
        }

        .auction-card {
            border: none;
            border-radius: 10px;
            overflow: hidden;
            box-shadow: 0 5px 15px rgba(0,0,0,0.05);
            transition: all 0.3s;
            height: 100%;
        }

        .auction-card:hover {
            transform: translateY(-10px);
            box-shadow: 0 15px 30px rgba(0,0,0,0.1);
        }

        .auction-card img {
            height: 200px;
            object-fit: cover;
        }

        .card-body {
            padding: 20px;
        }

        .card-title {
            font-weight: 600;
            margin-bottom: 10px;
        }

        .auction-meta {
            display: flex;
            justify-content: space-between;
            margin-bottom: 15px;
            font-size: 14px;
        }

        .current-bid {
            color: var(--gold);
            font-weight: 700;
            font-size: 18px;
        }

        .time-left {
            background-color: #f8f0e0;
            color: var(--dark-gold);
            padding: 3px 8px;
            border-radius: 4px;
            font-weight: 600;
        }

        .bid-btn {
            width: 100%;
            background-color: var(--gold);
            color: white;
            border: none;
            padding: 8px;
            border-radius: 5px;
            font-weight: 600;
            transition: all 0.3s;
        }

        .bid-btn:hover {
            background-color: var(--dark-gold);
        }

        .countdown {
            display: flex;
            gap: 5px;
            align-items: center;
            color: #666;
        }

        @media (max-width: 768px) {
            .hero {
                flex-direction: column;
                padding: 60px 20px;
                text-align: center;
            }

            .hero-text {
                max-width: 100%;
                margin-bottom: 30px;
            }

            .hero img {
                width: 100%;
            }
        }
    </style>
</head>
<body>

<!-- Navbar -->
<nav class="navbar navbar-expand-lg navbar-light bg-white">
    <div class="container">
        <a class="navbar-brand" href="#">GoldAuction</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse justify-content-end" id="navbarNav">
            <ul class="navbar-nav">
                <li class="nav-item mx-3"><a class="nav-link active" href="#">Home</a></li>
                <li class="nav-item mx-3"><a class="nav-link" href="#">Live Auctions</a></li>
                <li class="nav-item mx-3"><a class="nav-link" href="#">How It Works</a></li>
                <li class="nav-item mx-3"><a class="nav-link" href="#">About</a></li>
                <li class="nav-item ms-3">
                    <a class="btn btn-outline-dark" href="signin.jsp">
                        <i class="fas fa-user me-2"></i>Login
                    </a>
                </li>
            </ul>
        </div>
    </div>
</nav>

<!-- Hero Section -->
<section class="hero d-flex align-items-center">
    <div class="container">
        <div class="row align-items-center">
            <div class="col-lg-7">
                <div class="hero-text">
                    <h1>Exclusive Gold Jewelry Auctions</h1>
                    <p>Discover and bid on exquisite gold pieces in our real-time auctions. Own timeless treasures at competitive prices.</p>
                    <a href="singleproductview.jsp" class="btn btn-auction">View Live Auctions</a>
                </div>
            </div>
            <div class="col-lg-5">
                <img src="images/chain.jpg" alt="Luxury Gold Jewelry" class="img-fluid">
            </div>
        </div>
    </div>
</section>

<!-- Live Auctions Section -->
<section class="py-5">
    <div class="container">
        <h2 class="section-title">Live Auctions</h2>

        <div class="row row-cols-1 row-cols-md-2 row-cols-lg-3 g-4">
            <!-- Auction Item 1 -->
            <div class="col">
                <div class="auction-card">
                    <img src="images/ring2.jpg" class="card-img-top" alt="Gold Necklace">
                    <div class="card-body">
                        <h5 class="card-title">Eternal Brilliance Ring</h5>
                        <div class="auction-meta">
                            <span class="current-bid">$2,300</span>
                            <span class="time-left">
                  <i class="fas fa-clock me-1"></i>2h 15m
                </span>
                        </div>
                        <div class="d-flex justify-content-between mb-3">
                            <small>Bids: 12</small>
                            <small>Min increment: $50</small>
                        </div>
                        <button class="bid-btn">Place Bid</button>
                    </div>
                </div>
            </div>

            <!-- Auction Item 2 -->
            <div class="col">
                <div class="auction-card">
                    <img src="images/ring1.jpg" class="card-img-top" alt="Gold Ring">
                    <div class="card-body">
                        <h5 class="card-title">Harmonic Serenity Ring</h5>
                        <div class="auction-meta">
                            <span class="current-bid">$1,950</span>
                            <span class="time-left">
                  <i class="fas fa-clock me-1"></i>1h 30m
                </span>
                        </div>
                        <div class="d-flex justify-content-between mb-3">
                            <small>Bids: 8</small>
                            <small>Min increment: $25</small>
                        </div>
                        <button class="bid-btn">Place Bid</button>
                    </div>
                </div>
            </div>

            <!-- Auction Item 3 -->
            <div class="col">
                <div class="auction-card">
                    <img src="images/earrings1.jpg" class="card-img-top" alt="Gold Bracelet">
                    <div class="card-body">
                        <h5 class="card-title">Stellar Voyage Earrings</h5>
                        <div class="auction-meta">
                            <span class="current-bid">$1,675</span>
                            <span class="time-left">
                  <i class="fas fa-clock me-1"></i>3h 45m
                </span>
                        </div>
                        <div class="d-flex justify-content-between mb-3">
                            <small>Bids: 5</small>
                            <small>Min increment: $30</small>
                        </div>
                        <button class="bid-btn">Place Bid</button>
                    </div>
                </div>
            </div>
        </div>

        <div class="text-center mt-5">
            <a href="#" class="btn btn-outline-dark px-4">View All Auctions</a>
        </div>
    </div>
</section>

<!-- How It Works Section -->
<section class="py-5 bg-light">
    <div class="container">
        <h2 class="section-title text-center">How It Works</h2>

        <div class="row text-center mt-4">
            <div class="col-md-4 mb-4">
                <div class="p-4">
                    <div class="bg-gold-light rounded-circle d-inline-flex align-items-center justify-content-center mb-3" style="width: 80px; height: 80px; background-color: #f8f0e0;">
                        <i class="fas fa-user-plus fa-2x" style="color: var(--gold);"></i>
                    </div>
                    <h5>1. Register</h5>
                    <p>Create your free account to participate in auctions.</p>
                </div>
            </div>

            <div class="col-md-4 mb-4">
                <div class="p-4">
                    <div class="bg-gold-light rounded-circle d-inline-flex align-items-center justify-content-center mb-3" style="width: 80px; height: 80px; background-color: #f8f0e0;">
                        <i class="fas fa-gavel fa-2x" style="color: var(--gold);"></i>
                    </div>
                    <h5>2. Bid</h5>
                    <p>Place your bids on items you love in real-time.</p>
                </div>
            </div>

            <div class="col-md-4 mb-4">
                <div class="p-4">
                    <div class="bg-gold-light rounded-circle d-inline-flex align-items-center justify-content-center mb-3" style="width: 80px; height: 80px; background-color: #f8f0e0;">
                        <i class="fas fa-trophy fa-2x" style="color: var(--gold);"></i>
                    </div>
                    <h5>3. Win</h5>
                    <p>If you have the highest bid when time runs out, you win!</p>
                </div>
            </div>
        </div>
    </div>
</section>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<script src="js/script.js"></script>
</body>
</html>
