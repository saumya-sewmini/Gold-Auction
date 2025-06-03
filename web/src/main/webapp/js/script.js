// Toggle password visibility
document.getElementById('togglePassword').addEventListener('click', function() {
    const password = document.getElementById('password');
    const icon = this.querySelector('i');
    if (password.type === 'password') {
        password.type = 'text';
        icon.classList.replace('fa-eye', 'fa-eye-slash');
    } else {
        password.type = 'password';
        icon.classList.replace('fa-eye-slash', 'fa-eye');
    }
});

//signin
const signinForm = document.getElementById('signinForm');

signinForm.addEventListener('submit',async function(e){
    e.preventDefault();

    const email = document.getElementById("email").value.trim();
    const password = document.getElementById("password").value.trim();

    const formData = new URLSearchParams();
    formData.append("email", email);
    formData.append("password", password);
    // alert(formData.toString());

    try {
        const response = await fetch("/ee-app/index", {
            method: "POST",
            headers:{
                "Content-Type": "application/x-www-form-urlencoded"
            },
            body: formData.toString()
        });

        // alert(response);

        const responseText = await response.text();
        console.log("Raw response from server:", responseText);
        // alert("Raw response: [" + responseText + "]");

        if (responseText.trim() === "success") {
            alert("Login successful");
            window.location = "home.jsp";
        }else {
            alert("Login failed");
        }

    }catch (error){
        console.error("Fetch error:", error);
        alert("Error");
    }
    signinForm.reset();
})

function getTimeLeft(date) {
    const endTime = new Date(date).getTime();
    const now = Date.now();
    const diff = endTime - now;

    if (diff <= 0) return "Ended";

    const minutes = Math.floor((diff / 1000 / 60) % 60);
    const hours = Math.floor((diff / (1000 * 60 * 60)) % 24);

    return `${hours}h ${minutes}m`;
}

//load product to home
async function loadProducts() {
    try {
        const response = await fetch("/ee-app/home");
        const products = await response.json();

        console.log("Products received:", products);
        // alert("Products loaded: " + products.length);

        const productContainer = document.getElementById("productContainer-box");
        if (!productContainer) {
            alert("productContainer not found!");
            return;
        }

        if (products.length === 0){
            alert("No products found");
            return;
        }

        products.forEach(product => {
            console.log("Adding Product:", product);

            const card = document.createElement("div");
            card.className = "col";
            card.innerHTML = `
                <div class="auction-card">
                    <img src="${product.image}" class="card-img-top" alt="Gold Necklace">
                    <div class="card-body">
                        <h5 class="card-title">${product.name}</h5>
                        <div class="auction-meta">
                            <span class="current-bid">Rs. ${product.maxBidPrice.toFixed(2)}</span>
                            <span class="time-left">
                  <i class="fas fa-clock me-1"></i>${getTimeLeft(product.date)}
                </span>
                        </div>
                        <div class="d-flex justify-content-between mb-3">
                            <small>Bids: ${product.bidderQty}</small>
                            <small>Min increment: $50</small>
                        </div>
                        <button class="bid-btn" onclick="window.location.href='singleproductview.jsp?id=${product.id}'">Place Bid</button>
                    </div>
                </div>
            `;

            productContainer.appendChild(card);

        });

        // alert("Products loaded");
    }catch (error) {
        console.error("Error loading products:", error);
        alert("Failed to load products");
    }
}

async function loadSingleProduct(id) {
    const param = new URLSearchParams(window.location.search);

    if (!param.has("id")) {
        alert("No product id found");
        return;
    }

    const productId = param.get("id");

    try {
        const response = await fetch("/ee-app/singleproductview?id=" + productId);

        if (!response.ok){
            throw new Error("Failed to fetch product");
        }

        const json = await response.json();
        console.log("Product received:", json);

        const id = json.id;
        const title = json.name;

        document.getElementById("productTitle").innerHTML = title;
        document.getElementById("maxBitAmount").innerHTML = json.maxBidPrice;
        document.getElementById("bidAmountInput").innerHTML = json.maxBidPrice + 50;
        document.getElementById("minimumNextBitAmount").innerHTML = json.maxBidPrice + 50;
        document.getElementById("mainImage").src = json.image;
        document.getElementById("countDownSpan").innerHTML = getTimeLeft(json.date);
        document.getElementById("singleProductDescription").innerHTML = json.description;

    }catch (error) {
        console.error("Error loading product:", error);
        alert("Failed to load product");
    }
}

async function placeBid(id){
    // alert("Bid placed");

    const input = document.getElementById("bidAmountInput");

    if (!input || input.value.trim() === ""){
        alert("Please enter bid amount");
        return;
    }

    const amount = input.value.trim();

    console.log("Amount:", amount);

    const param = new URLSearchParams(window.location.search);
    const itemId = param.get("id");

    const formData = new URLSearchParams();
    formData.append("amount", amount);
    formData.append("itemId", itemId);

    console.log(itemId, amount);

    const response = await fetch("/ee-app/bid", {
       method: "POST",
       headers: {"Content-Type": "application/x-www-form-urlencoded"},
       body: formData
    });

    console.log("Fetch response:", response);

    if (response.ok){
        alert("Bid submitted!");
    }else {
        alert("Failed to submit bid!");
    }
}
