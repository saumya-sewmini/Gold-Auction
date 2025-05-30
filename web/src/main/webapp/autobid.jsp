<%--
  Created by IntelliJ IDEA.
  User: Saumya
  Date: 5/29/2025
  Time: 10:17 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Set Auto-Bid | GoldAuction</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        :root {
            --gold: #D4AF37;
            --dark-gold: #996515;
            --light-gold: #F0E68C;
        }

        body {
            background-color: #f8f9fa;
            font-family: 'Segoe UI', sans-serif;
        }

        .auth-container {
            max-width: 600px;
            margin: 5% auto;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.08);
            border-radius: 12px;
            overflow: hidden;
        }

        .auth-header {
            background: linear-gradient(135deg, var(--gold) 0%, var(--dark-gold) 100%);
            color: white;
            padding: 25px;
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

        .product-summary {
            display: flex;
            align-items: center;
            padding: 15px;
            background-color: #f9f9f9;
            border-radius: 8px;
            margin-bottom: 25px;
        }

        .product-summary img {
            width: 80px;
            height: 80px;
            object-fit: cover;
            border-radius: 6px;
            margin-right: 15px;
        }

        .product-info h5 {
            font-weight: 600;
            margin-bottom: 5px;
        }

        .current-bid {
            color: var(--gold);
            font-weight: 700;
        }

        .form-control:focus {
            border-color: var(--gold);
            box-shadow: 0 0 0 0.25rem rgba(212, 175, 55, 0.25);
        }

        .bid-amount-input {
            position: relative;
        }

        .bid-amount-input .input-group-text {
            position: absolute;
            left: 0;
            top: 0;
            height: 100%;
            background: transparent;
            border: none;
            z-index: 10;
            padding-left: 12px;
            color: var(--gold);
            font-weight: 600;
        }

        .range-slider {
            width: 100%;
            margin: 20px 0;
        }

        .range-slider input[type="range"] {
            width: 100%;
            height: 8px;
            -webkit-appearance: none;
            background: #e0e0e0;
            border-radius: 5px;
            outline: none;
        }

        .range-slider input[type="range"]::-webkit-slider-thumb {
            -webkit-appearance: none;
            width: 20px;
            height: 20px;
            background: var(--gold);
            border-radius: 50%;
            cursor: pointer;
        }

        .range-values {
            display: flex;
            justify-content: space-between;
            margin-top: 5px;
        }

        .btn-confirm {
            background-color: var(--gold);
            color: white;
            font-weight: 600;
            padding: 12px;
            border: none;
            transition: all 0.3s;
            width: 100%;
        }

        .btn-confirm:hover {
            background-color: var(--dark-gold);
            transform: translateY(-2px);
        }

        .auto-bid-features {
            margin-top: 25px;
        }

        .feature-item {
            display: flex;
            align-items: flex-start;
            margin-bottom: 15px;
        }

        .feature-icon {
            color: var(--gold);
            font-size: 20px;
            margin-right: 10px;
            margin-top: 3px;
        }
    </style>
</head>
<body>
<div class="container">
    <div class="auth-container">
        <!-- Header -->
        <div class="auth-header">
            <h2><i class="fas fa-bolt me-2"></i>Set Up Auto-Bid</h2>
            <p>Let the system bid for you automatically</p>
        </div>

        <!-- Body -->
        <div class="auth-body">
            <!-- Product Summary -->
            <div class="product-summary">
                <img src="images/ring2.jpg" alt="Gold Necklace">
                <div class="product-info">
                    <h5>Eternal Brilliance Necklace</h5>
                    <div class="d-flex align-items-center">
                        <span class="current-bid me-3">$2,300</span>
                        <span class="badge bg-warning text-dark">
                <i class="fas fa-clock me-1"></i>02:15:36
              </span>
                    </div>
                </div>
            </div>

            <!-- Auto-Bid Form -->
            <form id="autoBidForm">
                <!-- Max Bid Amount -->
                <div class="mb-4">
                    <label class="form-label fw-bold">Your Maximum Bid Amount</label>
                    <div class="bid-amount-input">
                        <div class="input-group">
                            <div class="col-1"><span class="input-group-text">$</span></div>
                            <div class="col-11"><input type="number" class="form-control" id="maxBidAmount" placeholder="Enter maximum amount" min="2350" step="50" value="3000" required></div>
                        </div>
                    </div>

                    <!-- Bid Increment -->
                    <div class="mt-4">
                        <label class="form-label fw-bold">Bid Increment</label>
                        <select class="form-select" id="bidIncrement">
                            <option value="50">$50 (Minimum)</option>
                            <option value="100">$100</option>
                            <option value="250">$250</option>
                            <option value="500">$500</option>
                            <option value="custom">Custom Amount</option>
                        </select>
                    </div>

                    <!-- Custom Increment (Hidden by Default) -->
                    <div class="mt-3" id="customIncrementContainer" style="display: none;">
                        <div class="bid-amount-input">
                            <div class="input-group">
                                <span class="input-group-text">$</span>
                                <input type="number" class="form-control" id="customIncrement" placeholder="Enter custom increment" min="50" step="10">
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Budget Range -->
                <div class="mb-4">
                    <label class="form-label fw-bold">Budget Range</label>
                    <div class="range-slider">
                        <input type="range" min="2350" max="10000" value="3000" step="50" id="budgetRange">
                        <div class="range-values">
                            <span>$2,350</span>
                            <span>$5,000</span>
                            <span>$10,000</span>
                        </div>
                    </div>
                </div>

                <!-- Confirm Button -->
                <button type="submit" class="btn btn-confirm">
                    <i class="fas fa-check-circle me-2"></i>Confirm Auto-Bid
                </button>
            </form>

            <!-- Auto-Bid Features -->
            <div class="auto-bid-features">
                <h5 class="mb-3"><i class="fas fa-star me-2"></i>How Auto-Bid Works</h5>

                <div class="feature-item">
                    <div class="feature-icon">
                        <i class="fas fa-robot"></i>
                    </div>
                    <div>
                        <h6>Smart Bidding</h6>
                        <p class="text-muted">System bids only when necessary, up to your maximum amount.</p>
                    </div>
                </div>

                <div class="feature-item">
                    <div class="feature-icon">
                        <i class="fas fa-bell"></i>
                    </div>
                    <div>
                        <h6>Instant Notifications</h6>
                        <p class="text-muted">Get notified when you're outbid or when you win.</p>
                    </div>
                </div>

                <div class="feature-item">
                    <div class="feature-icon">
                        <i class="fas fa-lock"></i>
                    </div>
                    <div>
                        <h6>Secure & Controlled</h6>
                        <p class="text-muted">You can cancel auto-bid anytime before auction ends.</p>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<script>
    // Show/hide custom increment field
    document.getElementById('bidIncrement').addEventListener('change', function() {
        const customContainer = document.getElementById('customIncrementContainer');
        customContainer.style.display = this.value === 'custom' ? 'block' : 'none';
    });

    // Sync range slider with input field
    const rangeSlider = document.getElementById('budgetRange');
    const maxBidInput = document.getElementById('maxBidAmount');

    rangeSlider.addEventListener('input', function() {
        maxBidInput.value = this.value;
    });

    maxBidInput.addEventListener('input', function() {
        rangeSlider.value = this.value;
    });

    // Form submission
    document.getElementById('autoBidForm').addEventListener('submit', function(e) {
        e.preventDefault();
        // Add your auto-bid logic here
        alert('Auto-bid set successfully!');
        // window.location.href = 'product.jsp'; // Redirect back to product page
    });
</script>
</body>
</html>
