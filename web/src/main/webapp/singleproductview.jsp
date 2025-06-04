<%--
  Created by IntelliJ IDEA.
  User: Saumya
  Date: 5/29/2025
  Time: 12:48 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Eternal Brilliance Necklace | GoldAuction</title>
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

    .product-header {
      background: linear-gradient(135deg, #f9f9f9 0%, #fff8e8 100%);
      padding: 40px 0;
    }

    .product-gallery {
      border-radius: 10px;
      overflow: hidden;
      box-shadow: 0 5px 15px rgba(0,0,0,0.05);
    }

    .main-image {
      height: 400px;
      object-fit: cover;
      cursor: zoom-in;
    }

    .thumbnail {
      width: 80px;
      height: 80px;
      object-fit: cover;
      border: 2px solid transparent;
      cursor: pointer;
      transition: all 0.3s;
      border-radius: 5px;
    }

    .thumbnail:hover, .thumbnail.active {
      border-color: var(--gold);
    }

    .product-title {
      font-weight: 700;
      margin-bottom: 10px;
    }

    .product-price {
      color: var(--gold);
      font-weight: 700;
      font-size: 28px;
    }

    .bid-info-card {
      background: white;
      border-radius: 10px;
      padding: 25px;
      box-shadow: 0 5px 15px rgba(0,0,0,0.05);
    }

    .countdown {
      font-size: 18px;
      font-weight: 600;
      color: var(--dark-gold);
      background-color: #f8f0e0;
      padding: 8px 15px;
      border-radius: 5px;
      display: inline-block;
    }

    .bid-history {
      max-height: 200px;
      overflow-y: auto;
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

    #bidAmount {
      padding-left: 30px;
    }

    .btn-bid-now {
      background-color: var(--gold);
      color: white;
      font-weight: 600;
      padding: 12px;
      border: none;
      transition: all 0.3s;
    }

    .btn-bid-now:hover {
      background-color: var(--dark-gold);
      transform: translateY(-2px);
    }

    .tab-content {
      padding: 20px 0;
    }

    .nav-tabs .nav-link {
      color: #555;
      font-weight: 600;
    }

    .nav-tabs .nav-link.active {
      color: var(--gold);
      border-bottom: 2px solid var(--gold);
    }

    .product-specs li {
      margin-bottom: 8px;
    }

    .product-specs strong {
      color: var(--dark-gold);
      min-width: 120px;
      display: inline-block;
    }

    @media (max-width: 768px) {
      .main-image {
        height: 300px;
      }
    }

    #autoBidSection .bid-info-card {
      border: 2px solid var(--light-gold);
      background-color: #fffdf6;
    }

    .btn-gold {
      background-color: var(--gold);
      color: white;
      border: none;
      transition: all 0.3s;
    }

    .btn-gold:hover {
      background-color: var(--dark-gold);
      transform: translateY(-2px);
    }

    #autoBidForm .form-control:focus,
    #autoBidForm .form-select:focus {
      border-color: var(--gold);
      box-shadow: 0 0 0 0.25rem rgba(212, 175, 55, 0.25);
    }
  </style>
</head>
<body onload="loadSingleProduct();">

<!-- Product Header -->
<section class="product-header">
  <div class="container">
    <nav aria-label="breadcrumb">
      <ol class="breadcrumb">
        <li class="breadcrumb-item"><a href="home.jsp">Home</a></li>
      </ol>
    </nav>
  </div>
</section>

<!-- Product Main Section -->
<section class="py-5">
  <div class="container">
    <div class="row">
      <!-- Product Images -->
      <div class="col-lg-6">
        <div class="product-gallery mb-4">
          <img src="images/ring2.jpg" class="main-image w-100" id="mainImage" alt="Gold Necklace">
        </div>
      </div>

      <!-- Product Details -->
      <div class="col-lg-6">
        <h1 class="product-title" id="productTitle">Eternal Brilliance Gold Necklace</h1>
        <div class="d-flex align-items-center mb-3">
          <div class="me-3">
            <span class="product-price" id="maxBitAmount">$2,300</span>
            <small class="d-block text-muted">Current Bid</small>
          </div>
          <div class="countdown">
            <i class="fas fa-clock me-3"></i> <span id="countDownSpan">02:15:36</span>
          </div>
        </div>

        <!-- Bid Info Card -->
        <div class="bid-info-card mb-4">
          <h5 class="mb-4"><i class="fas fa-gavel me-2"></i>Place Your Bid</h5>

          <div class="mb-3">
            <label class="form-label">Your Bid Amount</label>
            <div class="bid-amount-input">
              <div class="input-group">
                <span class="input-group-text">$</span>
                <input type="number" class="form-control mb-2" id="bidAmountInput" placeholder="Enter amount" step="50">
              </div>
              <small class="text-muted">Minimum next bid: <label id="minimumNextBitAmount">$2,350</label></small>
            </div>
          </div>

          <div class="d-grid gap-2">
            <button class="btn btn-bid-now" onclick="placeBid();">
              <i class="fas fa-hammer me-2"></i>Place Bid Now
            </button>
          </div>
        </div>

        <!-- Bid History -->
        <div class="bid-info-card" >
          <h5 class="mb-3"><i class="fas fa-history me-2"></i>Bid History</h5>
          <div class="bid-history" id="bidList">



          </div>
        </div>

      </div>
    </div>
  </div>
</section>

<!-- Product Tabs -->
<section class="pb-5">
  <div class="container">
    <ul class="nav nav-tabs" id="productTabs" role="tablist">
      <li class="nav-item" role="presentation">
        <button class="nav-link active" id="details-tab" data-bs-toggle="tab" data-bs-target="#details" type="button">Details</button>
      </li>
      <li class="nav-item" role="presentation">
        <button class="nav-link" id="shipping-tab" data-bs-toggle="tab" data-bs-target="#shipping" type="button">Shipping</button>
      </li>
      <li class="nav-item" role="presentation">
        <button class="nav-link" id="returns-tab" data-bs-toggle="tab" data-bs-target="#returns" type="button">Returns</button>
      </li>
    </ul>

    <div class="tab-content" id="productTabsContent">
      <div class="tab-pane fade show active" id="details" role="tabpanel">
        <div class="row">
          <div class="col-md-6">
            <h5 class="mb-3">Product Description</h5>
            <p id="singleProductDescription">This exquisite 18K gold necklace features a timeless design with brilliant-cut diamonds. Handcrafted by master jewelers, it's a perfect blend of tradition and modern elegance.</p>
<%--            <ul class="product-specs list-unstyled">--%>
<%--              <li><strong>Material:</strong> 18K Yellow Gold</li>--%>
<%--              <li><strong>Weight:</strong> 12.5 grams</li>--%>
<%--              <li><strong>Length:</strong> 18 inches</li>--%>
<%--              <li><strong>Clasp:</strong> Lobster clasp</li>--%>
<%--            </ul>--%>
          </div>
          <div class="col-md-6">
            <h5 class="mb-3">Auction Details</h5>
            <ul class="product-specs list-unstyled">
              <li><strong>Starting Bid:</strong> <label id="startBid">$1000</label></li>
              <li><strong>Bid Increment:</strong> $50</li>
            </ul>
          </div>
        </div>
      </div>

      <div class="tab-pane fade" id="shipping" role="tabpanel">
        <h5 class="mb-3">Shipping Information</h5>
        <p>All items are shipped via insured express delivery within 2 business days after payment confirmation. Signature required upon delivery.</p>
        <ul>
          <li>Free shipping for all winning bids</li>
          <li>International shipping available</li>
          <li>Tracking number provided</li>
        </ul>
      </div>

      <div class="tab-pane fade" id="returns" role="tabpanel">
        <h5 class="mb-3">Return Policy</h5>
        <p>We offer a 14-day return policy for all auction items. Items must be returned in original condition with all certificates.</p>
        <ul>
          <li>Buyer pays return shipping</li>
          <li>Refund processed within 5 business days</li>
          <li>No returns on customized items</li>
        </ul>
      </div>
    </div>
  </div>
</section>

<section class="pb-5" id="autoBidSection">
  <div class="container">
    <div class="row justify-content-center">
      <div class="col-lg-8">
        <div class="bid-info-card">
          <div class="d-flex align-items-center mb-4">
            <i class="fas fa-bolt me-3" style="color: var(--gold); font-size: 1.5rem;"></i>
            <h3 class="mb-0">Auto-Bid Setup</h3>
          </div>

          <div class="alert alert-warning mb-4">
            <i class="fas fa-info-circle me-2"></i>
            The system will automatically place bids for you up to your maximum amount.
          </div>

          <form id="autoBidForm">

            <div class="mb-4">
              <label class="form-label fw-bold">Maximum Bid Amount</label>
              <div class="input-group">
                <span class="input-group-text bg-white border-end-0">
                  <i class="fas fa-dollar-sign"></i>
                </span>
                <input type="number"
                       class="form-control border-start-0"
                       id="autoBidMaxAmount"
                       placeholder="Enter maximum amount"
                       min="2350"
                       step="50"
                       required>
              </div>
              <small class="text-muted">This is the highest amount you're willing to pay</small>
            </div>

            <div class="mb-4">
              <label class="form-label fw-bold">Bid Increment</label>
              <select class="form-select" id="autoBidIncrement" required>
                <option value="50">$50</option>
              </select>
            </div>

            <div class="d-grid">
              <button type="button" class="btn btn-gold py-3 fw-bold" onclick="autobid();">
                <i class="fas fa-robot me-2"></i> Activate Auto-Bidding
              </button>
            </div>

          </form>

        </div>
      </div>
    </div>
  </div>
</section>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<script src="js/script.js"></script>

</body>
</html>
