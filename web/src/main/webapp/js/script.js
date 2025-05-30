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
        alert("Raw response: [" + responseText + "]");

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