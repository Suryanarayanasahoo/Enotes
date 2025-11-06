<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.Connection" %>
<%@ page import="com.DB.DBconnection" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>E-Notes | Home</title>
<link rel="stylesheet" href="Cssfile/style.css">
<%@ include file="Allcomponent/component.jsp" %>

<style>
body {
  margin: 0;
  font-family: "Poppins", sans-serif;
  background-color: #f9fafc;
  color: #333;
}

/* Hero Section */
.hero {
  display: flex;
  align-items: center;
  justify-content: space-between;
  flex-wrap: wrap;
  padding: 4rem 5%;
  min-height: 100vh;
  background: url("img/bg.jpeg") no-repeat center center/cover;
  position: relative;
}

.hero::before {
  content: "";
  position: absolute;
  top: 0; left: 0; right: 0; bottom: 0;
  background: rgba(0, 0, 0, 0.55);
  z-index: 1;
}

.hero-content {
  position: relative;
  z-index: 2;
  color: #fff;
  max-width: 550px;
}

.hero h1 {
  font-size: 3rem;
  margin-bottom: 1rem;
  color: #fff;
}

.hero p {
  font-size: 1.2rem;
  margin-bottom: 2rem;
  line-height: 1.6;
  color: #e5e7eb;
}

.hero-buttons a {
  margin-right: 1rem;
  padding: 0.75rem 1.5rem;
  border-radius: 8px;
  font-size: 1rem;
  text-decoration: none;
  transition: 0.3s ease;
}

.btn-primary {
  background-color: #3b82f6;
  color: #fff;
}

.btn-primary:hover {
  background-color: #2563eb;
}

.btn-outline {
  border: 2px solid #fff;
  color: #fff;
}

.btn-outline:hover {
  background-color:rgb(0, 255, 128);
  color: #111;
}

/* Features Section */
.features {
  background-color: #fff;
  text-align: center;
  padding: 4rem 2rem;
}

.features h2 {
  font-size: 2rem;
  color: #111827;
  margin-bottom: 2rem;
}

.feature-container {
  display: flex;
  justify-content: center;
  flex-wrap: wrap;
  gap: 2rem;
}

.feature {
  background: #f3f4f6;
  padding: 2rem;
  border-radius: 12px;
  width: 280px;
  transition: 0.3s;
}

.feature:hover {
  transform: translateY(-5px);
  box-shadow: 0 4px 10px rgba(0,0,0,0.1);
}

.feature h3 {
  margin-top: 1rem;
  color: #1e40af;
}

.feature p {
  color: #4b5563;
  margin-top: 0.5rem;
}

/* Footer */
footer {
  background: #f3f4f6;
  padding: 1rem;
  text-align: center;
  color: #555;
}
footer a {
  color: #3b82f6;
  text-decoration: none;
}
footer a:hover {
  text-decoration: underline;
}

footer {
  position: relative;
  opacity: 0;
  transition: opacity 0.5s ease;
}

.hero-image {
  position: relative;
  z-index: 2;
  flex: 1;
  display: flex;
  justify-content: center;
  align-items: center;
}

.hero-image img {
  width: 350px;
  height: auto;
  animation: float 3s ease-in-out infinite;
}

@keyframes float {
  0% { transform: translateY(0px); }
  50% { transform: translateY(-12px); }
  100% { transform: translateY(0px); }
}


</style>
</head>

<body>

<%@ include file="Allcomponent/navbar.jsp" %>

<!-- Hero Section -->
<section class="hero">
  <div class="hero-content">
    <h1><i class="fa fa-book"></i> eNotes</h1>
    <p>Save, organize, and access your notes anytime, anywhere — because your ideas deserve a smart home.</p>
    <div class="hero-buttons">
      <a href="login.jsp" class="btn-primary"><i class="fa fa-sign-in"></i> Login</a>
      <a href="register.jsp" class="btn-outline"><i class="fa fa-user-plus"></i> Register</a>
    </div>
  </div>
  
  <!-- ✅ NEW IMAGE SECTION -->
  <div class="hero-image">
    <img src="img/note.png" alt="Note Icon">
  </div>
  
</section>

<!-- Features -->
<section class="features" id="features">
  <h2>Why Choose eNotes?</h2>
  <div class="feature-container">
    <div class="feature">
      📝
      <h3>Create & Organize Notes</h3>
      <p>Keep all your study notes structured and accessible in one place.</p>
    </div>
    <div class="feature">
      ☁️
      <h3>Cloud Access</h3>
      <p>Access your notes from anywhere, anytime — on any device.</p>
    </div>
    <div class="feature">
      🔒
      <h3>Safe & Secure</h3>
      <p>Your notes are encrypted and visible only to you.</p>
    </div>
  </div>
</section>




</body>
<%@ include file="Allcomponent/footer.jsp" %>

<script>
// Get footer element
const footer = document.querySelector("footer");

// Initially hidden
footer.style.display = "none";
footer.style.position = "fixed";
footer.style.bottom = "0";
footer.style.left = "0";
footer.style.width = "100%";
footer.style.zIndex = "999";
footer.style.transition = "transform 0.4s ease, opacity 0.4s ease";
footer.style.transform = "translateY(100%)";
footer.style.opacity = "0";

// Show footer only after scrolling 300px
window.addEventListener("scroll", () => {
  if (window.scrollY > 300) {
    footer.style.display = "block";
    footer.style.transform = "translateY(0)";
    footer.style.opacity = "1";
  } else {
    footer.style.transform = "translateY(100%)";
    footer.style.opacity = "0";
  }
});
</script>

</html>
