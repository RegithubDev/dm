<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding = "UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<!--
Template Name: Vuexy - Vuejs, HTML & Laravel Admin Dashboard Template
Author: PixInvent
Website: http://www.pixinvent.com/
Contact: hello@pixinvent.com
Follow: www.twitter.com/pixinvents
Like: www.facebook.com/pixinvents
Purchase: https://1.envato.market/vuexy_admin
Renew Support: https://1.envato.market/vuexy_admin
License: You must have a valid license purchased only from themeforest(the above link) in order to legally use the theme for your project.

-->
<html lang="en"><head>
    <meta charset="utf-8">
    <title>RE.Tech - Decision Making</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <meta content="" name="keywords">
    <meta content="" name="description">

    <!-- Favicon -->
    <link href="/reirm/resources/ai/img/logo.png" rel="icon">

    <!-- Google Web Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin="">
    <link href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@400;600&amp;family=Ubuntu:wght@500;700&amp;display=swap" rel="stylesheet">

    <!-- Icon Font Stylesheet -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">

    <!-- Libraries Stylesheet -->
    <link href="/reirm/resources/ai/lib/animate/animate.min.css" rel="stylesheet">
    <link href="/reirm/resources/ai/lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">

    <!-- Customized Bootstrap Stylesheet -->
    <link  href="/reirm/resources/ai/css/bootstrap.min.css" rel="stylesheet">

    <!-- Template Stylesheet -->
    <link  href="/reirm/resources/ai/css/style.css" rel="stylesheet">
    
    <style>
     /* Blur effect when modal is open */
        .modal-open .modal-backdrop {
            backdrop-filter: blur(14rem);
            background-color: rgba(0, 0, 0, 25);
        }
        /* Center the modal */
        .modal-dialog {
            display: flex;
            align-items: center;
            min-height: 100vh;
        }

        .modal-content {
            border-radius: 15px;
            padding: 20px;
        }

        .animated {
            animation: slideInRight 0.5s ease-in-out;
        }

        @keyframes slideInRight {
            from {
                transform: translateX(100px);
                opacity: 0;
            }
            to {
                transform: translateX(0);
                opacity: 1;
            }
        }
    .eye {
	    width: 20px;
	    height: 20px;
	    background: white;
	    border-radius: 50%;
	    position: absolute;
	    top: 47%;  /* Adjust based on the image */
	    left: 44%; /* Adjust for left eye */
	    transform: translate(-50%, -50%);
	    transition: transform 0.05s linear;
	}
	
	.right-eye {
	    left: 56%; /* Adjust for right eye */
	}
	     /* Glow Animation */
        @keyframes glow {
            0% { box-shadow: 0 0 10px rgba(255, 255, 255, 0.8); }
            50% { box-shadow: 0 0 20px rgba(255, 255, 255, 1); }
            100% { box-shadow: 0 0 10px rgba(255, 255, 255, 0.8); }
        }

        /* Apply Glow Effect */
        .glowing-button {
            animation: glow 2s infinite;
        }
	  .eyes-container {
	    display: flex;
	    justify-content: center;
	    align-items: center;
	    gap: 60px; /* Space between the eyes */
	}
	@media (max-width: 768px) { /* Adjust breakpoint as needed */
    .eyes-container {
        display: none;
    }
}
.eye {
    width: 25px;
    height: 23px;
    background: radial-gradient(circle, #ffffff 30%, #e0e0e0 70%);
    border-radius: 50%;
    border: 1.5px solid #776767;;
    position: relative;
     box-shadow: inset 0 0 10px rgba(0, 0, 0, 0.5), 0 5px 15px rgba(0, 0, 0, 0.3);
    display: flex
;
    justify-content: center;
    align-items: center;
     overflow: hidden;
}
.pupil {
    width: 14px;
    height: 14px;
    background: radial-gradient(circle, black 40%, #ffffff 60%, transparent 100%);
    border-radius: 50%;
    position: absolute;
    box-shadow: 0 0 10px #ffffff, 0 0 20px #62a9c1 inset;
    transition: all 0.1s ease-out;
}
/* Main Modal Styling */
.ai-login-modal {
    background: linear-gradient(135deg, #1a1a2e 0%, #16213e 100%);
    border: 1px solid rgba(0, 255, 255, 0.2);
    border-radius: 15px;
    overflow: hidden;
    box-shadow: 0 10px 30px rgba(0, 255, 255, 0.1);
    color: #e6f7ff;
    position: relative;
}

.ai-texture-overlay {
    position: absolute;
    top: 0;
    left: 0;
    right: 0;
    bottom: 0;
    background: 
        url('data:image/svg+xml;utf8,<svg xmlns="http://www.w3.org/2000/svg" width="100" height="100" viewBox="0 0 100 100"><rect width="100" height="100" fill="none" stroke="rgba(0,255,255,0.03)" stroke-width="0.5"/></svg>'),
        radial-gradient(circle at 30% 30%, rgba(0,255,255,0.05) 0%, transparent 70%);
    opacity: 0.5;
    pointer-events: none;
}

.modal-header {
    border-bottom: 1px solid rgba(0, 255, 255, 0.2);
    background: rgba(10, 25, 47, 0.7);
    backdrop-filter: blur(5px);
}

.modal-title {
    font-weight: 600;
    color: #00ffff;
    text-shadow: 0 0 10px rgba(0, 255, 255, 0.3);
}

.btn-close {
    filter: invert(1) brightness(2);
}

/* Robot Animation */
.robot-animation-container {
    display: flex;
    justify-content: center;
    margin: -20px auto 20px;
    height: 80px;
}

.robot-face {
    width: 60px;
    height: 60px;
    background: #2a3a5a;
        top: 1rem;
    border-radius: 50%;
    position: relative;
    box-shadow: 
        inset 0 0 15px rgba(0,0,0,0.5),
        0 5px 20px rgba(0,255,255,0.2);
    border: 2px solid rgba(0,255,255,0.3);
}

.robot-eye {
    width: 12px;
    height: 18px;
    background: #00ffff;
    border-radius: 50%;
    position: absolute;
    top: 20px;
    box-shadow: 0 0 10px #00ffff;
    transition: all 0.3s ease;
}

.left-eye {
    left: 15px;
}

.right-eye {
    right: 15px;
}

.robot-mouth {
    width: 20px;
    height: 5px;
    background: #00ffff;
    border-radius: 5px;
    position: absolute;
    bottom: 15px;
    left: 50%;
    transform: translateX(-50%);
    opacity: 0.7;
}

/* Form Styling */
.ai-auth-form {
    position: relative;
    z-index: 2;
}

.form-label {
    color: #a0d2eb;
    font-weight: 500;
    margin-bottom: 8px;
}

.ai-input {
    background: rgba(10, 25, 47, 0.7);
    border: 1px solid rgba(0, 255, 255, 0.3);
    color: #e6f7ff;
    border-radius: 8px !important;
    transition: all 0.3s ease;
}

.ai-input:focus {
    background: rgba(15, 35, 65, 0.8);
    border-color: #00ffff;
    box-shadow: 0 0 0 0.25rem rgba(0, 255, 255, 0.25);
    color: white;
}

.input-group-text {
    background: rgba(0, 255, 255, 0.1);
    border: 1px solid rgba(0, 255, 255, 0.3);
    color: #00ffff;
}

.view-password-btn {
    cursor: pointer;
    transition: all 0.3s ease;
}

.view-password-btn:hover {
    background: rgba(0, 255, 255, 0.2);
}

/* Password Strength Meter */
.password-strength {
    display: flex;
    gap: 4px;
    height: 4px;
}

.strength-bar {
    flex: 1;
    background: rgba(255,255,255,0.1);
    border-radius: 2px;
    transition: all 0.3s ease;
}

/* Submit Button */
.btn-ai-auth {
    background: linear-gradient(135deg, #00a1ff 0%, #00ffaa 100%);
    border: none;
    color: #0a192f;
    font-weight: 600;
    border-radius: 8px;
    overflow: hidden;
    position: relative;
    transition: all 0.3s ease;
}

.btn-ai-auth:hover {
    transform: translateY(-2px);
    box-shadow: 0 5px 15px rgba(0, 255, 255, 0.4);
}

.btn-ai-auth::before {
    content: '';
    position: absolute;
    top: 0;
    left: -100%;
    width: 100%;
    height: 100%;
    background: linear-gradient(90deg, transparent, rgba(255,255,255,0.2), transparent);
    transition: all 0.5s ease;
}

.btn-ai-auth:hover::before {
    left: 100%;
}

/* Footer */
.ai-modal-footer {
    border-top: 1px solid rgba(0, 255, 255, 0.2);
    background: rgba(10, 25, 47, 0.7);
    backdrop-filter: blur(5px);
    font-size: 0.8rem;
    color: rgba(0, 255, 255, 0.7);
}

/* Animations */
@keyframes pulse {
    0% { opacity: 0.6; }
    50% { opacity: 1; }
    100% { opacity: 0.6; }
}

.ai-footer-text {
    animation: pulse 3s infinite;
}

/* Responsive Adjustments */
@media (max-width: 576px) {
    .robot-animation-container {
        height: 60px;
        margin-top: -10px;
    }
    
    .robot-face {
        width: 50px;
        height: 50px;
    }
    
    .robot-eye {
        width: 10px;
        height: 15px;
        top: 15px;
    }
}
/* Validation Styles */
.ai-input:invalid {
    border-color: #ff5555;
    box-shadow: 0 0 0 0.25rem rgba(255, 85, 85, 0.15);
}

.ai-input:invalid ~ .input-group-text {
    border-color: #ff5555;
    color: #ff5555;
}

.ai-feedback {
    display: none;
    margin-top: 8px;
    padding: 10px;
    background: rgba(255, 85, 85, 0.1);
    border-left: 3px solid #ff5555;
    border-radius: 4px;
    color: #ffcccb;
    font-size: 0.9rem;
    animation: fadeIn 0.3s ease;
}

.was-validated .ai-input:invalid ~ .ai-feedback {
    display: block;
}

/* Alert Modal Styling */
.ai-alert-modal {
    background: linear-gradient(135deg, #1a1a2e 0%, #2a0a0a 100%);
    border: 1px solid rgba(255, 85, 85, 0.3);
    color: #e6f7ff;
}

.ai-alert-icon {
    font-size: 3rem;
    color: #ff5555;
    animation: pulse 1s infinite alternate;
}

@keyframes pulse {
    0% { transform: scale(1); }
    100% { transform: scale(1.1); }
}

@keyframes fadeIn {
    from { opacity: 0; transform: translateY(-10px); }
    to { opacity: 1; transform: translateY(0); }
}
    </style>
</head>

<body>
    <!-- Spinner Start -->
    <div id="spinner" class="bg-white position-fixed translate-middle w-100 vh-100 top-50 start-50 d-flex align-items-center justify-content-center">
        <div class="spinner-grow text-primary" style="width: 3rem; height: 3rem;" role="status">
            <span class="sr-only">Loading...</span>
        </div>
    </div>
    <!-- Spinner End -->


    <!-- Navbar Start -->
    <div class="container-fluid sticky-top" style="top: -150px;">
        <div class="container">
            <nav class="navbar navbar-expand-lg navbar-dark p-0">
                <a href="https://resustainability.com/" class="navbar-brand">
                    <h1 class="text-white">Re<span class="text-dark">.</span>Tech</h1>
                </a>
                <button type="button" class="navbar-toggler ms-auto me-0" data-bs-toggle="collapse" data-bs-target="#navbarCollapse">
                    <span class="navbar-toggler-icon"></span>
                </button>
                
            </nav>
        </div>
    </div>
    <!-- Navbar End -->


    <!-- Hero Start -->
    <div class="container-fluid pt-5 bg-primary hero-header">
        <div class="container pt-5">
            <div class="row g-5 pt-5">
                <div class="col-lg-6 align-self-center text-center text-lg-start mb-lg-5">
                    <div class="btn btn-sm border rounded-pill text-white px-3 mb-3 animated slideInRight">${sessionScope.EmailId } i Re.Tech</div> ${message }
                    <h1 class="display-4 text-white mb-4 animated slideInRight">Re Sustainability AI Chatbot</h1>
                    <p class="text-white mb-4 animated slideInRight">"Re Sustainability's AI-based chat system providing real-time insights and automated responses."</p>
    <a href="#" class="btn btn-light py-sm-3 px-sm-5 rounded-pill me-3 animated slideInRight glowing-button" data-bs-toggle="modal" data-bs-target="#loginModal">Login</a>
<!--                     <a href="" class="btn btn-outline-light py-sm-3 px-sm-5 rounded-pill animated slideInRight">Contact Us</a>
 -->                </div>
               <div class="col-lg-6 align-self-end img-div text-center text-lg-end position-relative">
				    <img class="img-fluid" id="robot-face" src="/reirm/resources/ai/img/hero-img.png" alt="">
					<div class="eyes-container" style="
    top: -19.6rem;
    left: -13.9rem;
    position: relative;
">
					    <div class="eye"><div class="pupil"></div></div>
					    <div class="eye"><div class="pupil"></div></div>
					</div>

				</div>
            </div>
        </div>
    </div>
     <div class="modal fade" id="loginModal" tabindex="-1" aria-labelledby="loginModalLabel" aria-hidden="true" style="backdrop-filter: blur(5px);background-color: rgba(0, 0, 0, .1);">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content ai-login-modal">
    <div class="modal-header">
        <h5 class="modal-title" id="loginModalLabel">
            <i class="fas fa-robot me-2"></i> Authentication
        </h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
    </div>
    <div class="modal-body">
        <!-- Background texture overlay -->
        <div class="ai-texture-overlay"></div>
        
        <!-- Robot animation container -->
        <div class="robot-animation-container">
            <div class="robot-face">
                <div class="robot-eye left-eye"></div>
                <div class="robot-eye right-eye"></div>
              <!--   <div class="robot-mouth"></div> -->
            </div>
        </div>
        
        <form class="ai-auth-form" id="aiAuthForm" novalidate action="<%=request.getContextPath() %>/login" method="POST">
    <div class="mb-4">
        <label for="username" class="form-label">
            <i class="fas fa-user-astronaut me-2"></i> Neural ID
        </label>
        <div class="input-group">
            <span class="input-group-text"><i class="fas fa-at"></i></span>
            <input type="text" class="form-control ai-input" id="username"  name = "userId"
                   placeholder="Enter your quantum signature" autocomplete="off" required>
            <span class="input-group-text"><i class="fas fa-brain"></i></span>
        </div>
        <div class="form-text">Your unique neural pattern identifier</div>
        <div class="invalid-feedback ai-feedback">
            <i class="fas fa-exclamation-triangle me-2"></i>
            <span class="feedback-message">Neural ID scan incomplete. Please provide your cognitive signature.</span>
        </div>
    </div>
    
    <div class="mb-4">
        <label for="password" class="form-label">
            <i class="fas fa-key me-2"></i> Bio-Encryption Key
        </label>
        <div class="input-group">
            <span class="input-group-text"><i class="fas fa-lock"></i></span>
            <input type="password" class="form-control ai-input" id="password"  name = "password"
                   placeholder="Enter your encrypted sequence" 
                   onfocus="robotCloseEyes()" onblur="robotOpenEyes()" required>
            <button class="input-group-text view-password-btn" type="button"
                    onclick="togglePasswordVisibility()">
                <i class="fas fa-eye"></i>
            </button>
        </div>
        <div class="password-strength mt-2">
            <div class="strength-bar strength-1"></div>
            <div class="strength-bar strength-2"></div>
            <div class="strength-bar strength-3"></div>
            <div class="strength-bar strength-4"></div>
        </div>
        <div class="invalid-feedback ai-feedback">
            <i class="fas fa-exclamation-triangle me-2"></i>
            <span class="feedback-message">Encryption key not detected. Neural security protocols require authentication.</span>
        </div>
    </div>
    
    <button type="submit" class="btn btn-ai-auth w-100 py-3 mt-3">
        <span class="auth-btn-text">Initiate Authentication</span>
        <i class="fas fa-fingerprint ms-2"></i>
    </button>
    
    <!-- Validation Error Modal (hidden by default) -->
    <div class="modal fade" id="validationErrorModal" tabindex="-1" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content ai-alert-modal">
                <div class="modal-header border-0">
                    <h5 class="modal-title text-danger">
                        <i class="fas fa-radiation me-2"></i> Authentication Failure
                    </h5>
                </div>
                <div class="modal-body text-center">
                    <div class="ai-alert-icon">
                        <i class="fas fa-exclamation-circle"></i>
                    </div>
                    <h4 class="mt-3">Authentication Incomplete</h4>
                    <p class="mb-4">Required cognitive parameters not detected. Please complete all authentication fields.</p>
                </div>
                <div class="modal-footer border-0 justify-content-center">
                    <button type="button" class="btn btn-ai-auth" data-bs-dismiss="modal">
                        <i class="fas fa-sync-alt me-2"></i> Retry Authentication
                    </button>
                </div>
            </div>
        </div>
    </div>
</form>
    </div>
    <div class="modal-footer ai-modal-footer">
        <div class="ai-footer-text" style="
    position: relative;
    left: -6rem;
">
            <i class="fas fa-shield-alt me-2" ></i>  © Secured by Re Sustainability Limited
        </div>
    </div>
</div>

        </div>
    </div>
    
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    
 <!--   <script  src="/reirm/resources/ai/js/main.js"></script> -->
  <!-- JavaScript Libraries -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
    <script  src="/reirm/resources/ai/lib/wow/wow.min.js"></script>
    <script  src="/reirm/resources/ai/lib/easing/easing.min.js"></script>
    <script  src="/reirm/resources/ai/lib/waypoints/waypoints.min.js"></script>
    <script  src="/reirm/resources/ai/lib/counterup/counterup.min.js"></script>
    <script  src="/reirm/resources/ai/lib/owlcarousel/owl.carousel.min.js"></script>
  <script>
  document.addEventListener('DOMContentLoaded', function() {
	    const form = document.getElementById('aiAuthForm');
	    const validationModal = new bootstrap.Modal(document.getElementById('validationErrorModal'));
	    
	    form.addEventListener('submit', function(event) {
	        event.preventDefault();
	        event.stopPropagation();
	        
	        form.classList.add('was-validated');
	        
	        if (!form.checkValidity()) {
	            // Show error modal instead of closing
	            validationModal.show();
	            
	            // Add shake animation to invalid fields
	            const invalidInputs = form.querySelectorAll(':invalid');
	            invalidInputs.forEach(input => {
	                input.classList.add('animate__animated', 'animate__headShake');
	                input.addEventListener('animationend', () => {
	                    input.classList.remove('animate__animated', 'animate__headShake');
	                }, { once: true });
	            });
	            
	            return false;
	        }
	        
	        // If form is valid, proceed with submission
	        initiateAuthentication();
	    });
	    
	    // Real-time validation
	    form.querySelectorAll('input').forEach(input => {
	        input.addEventListener('input', function() {
	            if (this.value.trim() !== '') {
	                this.classList.remove('is-invalid');
	            }
	            
	            // Special validation for password
	            if (this.id === 'password' && this.value.length > 0) {
	                updatePasswordStrength(this.value);
	            }
	        });
	    });
	});

	function initiateAuthentication() {
	    // Add loading state
	    const submitBtn = document.querySelector('.btn-ai-auth');
	    const originalText = submitBtn.querySelector('.auth-btn-text').textContent;
	    
	    submitBtn.disabled = true;
	    submitBtn.querySelector('.auth-btn-text').textContent = 'Validating Neural Patterns...';
	    submitBtn.querySelector('.fa-fingerprint').className = 'fas fa-circle-notch fa-spin';
	    
	    // Simulate API call
	    setTimeout(() => {
	        // Reset button state (in a real app, you'd handle success/error)
	        submitBtn.disabled = false;
	        submitBtn.querySelector('.auth-btn-text').textContent = originalText;
	        submitBtn.querySelector('.fa-circle-notch').className = 'fas fa-fingerprint';
	        
	        // Here you would actually submit the form
	         const form = document.getElementById('aiAuthForm');
	         form.submit();
	    }, 2000);
	}

	function updatePasswordStrength(password) {
	    const strengthBars = document.querySelectorAll('.strength-bar');
	    let strength = 0;
	    
	    // Reset
	    strengthBars.forEach(bar => {
	        bar.style.background = 'rgba(255,255,255,0.1)';
	        bar.style.boxShadow = 'none';
	    });
	    
	    // Calculate strength
	    if (password.length > 0) strength++;
	    if (password.length > 6) strength++;
	    if (/[A-Z]/.test(password)) strength++;
	    if (/[0-9!@#$%^&*]/.test(password)) strength++;
	    
	    // Visual feedback
	    for (let i = 0; i < strength; i++) {
	        let color;
	        if (strength === 1) color = '#ff5555';
	        else if (strength === 2) color = '#ffaa00';
	        else if (strength === 3) color = '#55aa55';
	        else color = '#00ffaa';
	        
	        strengthBars[i].style.background = color;
	        strengthBars[i].style.boxShadow = `0 0 5px ${color}`;
	    }
	}

	// Include these if not already present
	function togglePasswordVisibility() {
	    const passwordInput = document.getElementById('password');
	    const eyeIcon = document.querySelector('.view-password-btn i');
	    
	    if (passwordInput.type === 'password') {
	        passwordInput.type = 'text';
	        eyeIcon.classList.replace('fa-eye', 'fa-eye-slash');
	    } else {
	        passwordInput.type = 'password';
	        eyeIcon.classList.replace('fa-eye-slash', 'fa-eye');
	    }
	}

	function robotCloseEyes() {
	    document.querySelectorAll('.robot-eye').forEach(eye => {
	        eye.style.height = '3px';
	        eye.style.top = '28px';
	    });
	}

	function robotOpenEyes() {
	    document.querySelectorAll('.robot-eye').forEach(eye => {
	        eye.style.height = '18px';
	        eye.style.top = '20px';
	    });
	}
//Password visibility toggle
  function togglePasswordVisibility() {
      const passwordInput = document.getElementById('password');
      const eyeIcon = document.querySelector('.view-password-btn i');
      
      if (passwordInput.type === 'password') {
          passwordInput.type = 'text';
          eyeIcon.classList.remove('fa-eye');
          eyeIcon.classList.add('fa-eye-slash');
      } else {
          passwordInput.type = 'password';
          eyeIcon.classList.remove('fa-eye-slash');
          eyeIcon.classList.add('fa-eye');
      }
  }

  // Robot eye animations
  function robotCloseEyes() {
      const eyes = document.querySelectorAll('.robot-eye');
      eyes.forEach(eye => {
          eye.style.height = '3px';
          eye.style.borderRadius = '3px';
          eye.style.top = '28px';
      });
      
      // Add typing animation to mouth
      const mouth = document.querySelector('.robot-mouth');
      mouth.style.animation = 'typing 0.5s infinite alternate';
  }

  function robotOpenEyes() {
      const eyes = document.querySelectorAll('.robot-eye');
      eyes.forEach(eye => {
          eye.style.height = '18px';
          eye.style.borderRadius = '50%';
          eye.style.top = '20px';
      });
      
      // Remove typing animation from mouth
      const mouth = document.querySelector('.robot-mouth');
      mouth.style.animation = 'none';
  }

  // Password strength indicator (example implementation)
  document.getElementById('password').addEventListener('input', function(e) {
      const strengthBars = document.querySelectorAll('.strength-bar');
      const value = e.target.value;
      let strength = 0;
      
      // Reset all bars
      strengthBars.forEach(bar => {
          bar.style.background = 'rgba(255,255,255,0.1)';
      });
      
      if (value.length > 0) strength++;
      if (value.length > 6) strength++;
      if (/[A-Z]/.test(value)) strength++;
      if (/[0-9!@#$%^&*]/.test(value)) strength++;
      
      // Set active bars
      for (let i = 0; i < strength; i++) {
          let color;
          if (strength === 1) color = '#ff5555';
          else if (strength === 2) color = '#ffaa00';
          else if (strength === 3) color = '#55aa55';
          else color = '#00ffaa';
          
          strengthBars[i].style.background = color;
          strengthBars[i].style.boxShadow = `0 0 5px ${color}`;
      }
  });

  // Add typing animation to CSS
  const style = document.createElement('style');
  style.textContent = `
      @keyframes typing {
          0% { width: 20px; opacity: 0.7; }
          100% { width: 25px; opacity: 1; }
      }
  `;
  document.head.appendChild(style);
  $(document).on('mousemove', function (e) {
	    $('.eye').each(function () {
	        var eye = $(this);
	        var pupil = eye.find('.pupil');

	        var eyeOffset = eye.offset();
	        var eyeCenterX = eyeOffset.left + eye.width() / 2;
	        var eyeCenterY = eyeOffset.top + eye.height() / 2;

	        var dx = e.pageX - eyeCenterX;
	        var dy = e.pageY - eyeCenterY;

	        var distance = Math.sqrt(dx * dx + dy * dy);
	        var maxDistance = eye.width() / 4; // Limit movement within eye

	        if (distance > maxDistance) {
	            var angle = Math.atan2(dy, dx);
	            dx = Math.cos(angle) * maxDistance;
	            dy = Math.sin(angle) * maxDistance;
	        }

	        pupil.css({
	            left: eye.width() / 2 + dx - pupil.width() / 2,
	            top: eye.height() / 2 + dy - pupil.height() / 2
	        });
	    });
	});

  </script>
 




</body></html>