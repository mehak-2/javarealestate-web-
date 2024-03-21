let slideIndex = 0;
showSlides();

function showSlides() {
  let i;
  const slides = document.getElementsByClassName("mySlides");
  
  // Hide all slides
  for (i = 0; i < slides.length; i++) {
    slides[i].style.display = "none";
  }
  
  // Increment slideIndex
  slideIndex++;
  
  // Reset to the first slide if out of images
  if (slideIndex > slides.length) {
    slideIndex = 1;
  }
  
  // Display the current slide
  slides[slideIndex - 1].style.display = "block";
  
  // Call the function again to create a slideshow effect
  setTimeout(showSlides, 4000); // Change image every 4 seconds
}

let cart = {}; // Object to store selected medicines and quantities

function addToCart(medicineId) {
    const quantity = parseInt(document.getElementById(`quantity-${medicineId}`).value);
    if (quantity > 0) {
        cart[`Medicine ${medicineId}`] = quantity;
        updateCartButton();
    }
}

function updateCartButton() {
    const getNowButton = document.getElementById("get-now-button");
    getNowButton.disabled = Object.keys(cart).length === 0;
}

function showUserDetailsForm() {
    const userForm = document.getElementById("user-details-form");
    userForm.style.display = "block";
}

function placeOrder() {
    const name = document.getElementById("name").value;
    const address = document.getElementById("address").value;

    // In a real application, you would send the order details to a server for processing and database storage.
    console.log("Order placed with the following details:");
    console.log("Medicines in Cart:", cart);
    console.log("User Name:", name);
    console.log("User Address:", address);

    // You can reset the cart and form here if needed.
    cart = {};
    updateCartButton();
    document.getElementById("user-details-form").style.display = "none";
}
