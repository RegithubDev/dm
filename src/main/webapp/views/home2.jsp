<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>RE.Tech - AI Sustainability Decision Platform</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <meta content="" name="keywords">
    <meta content="" name="description">

    <!-- Favicon -->
    <link href="/reirm/resources/ai/img/logo.png" rel="icon">

    <!-- Google Web Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@400;600&family=Ubuntu:wght@500;700&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Orbitron:wght@400;700&display=swap" rel="stylesheet">

    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">

    <!-- Animate.css -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css">

    <style>
        :root {
            --primary-color: #00e676;
            --secondary-color: #1de9b6;
            --dark-color: #0a192f;
            --light-color: #f8f9fa;
            --accent-color: #ff4081;
            --glass-effect: rgba(255, 255, 255, 0.08);
            --chat-bg: rgba(10, 25, 47, 0.7);
            --user-msg: rgba(29, 233, 182, 0.15);
            --bot-msg: rgba(10, 25, 47, 0.7);
        }

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            background-color: var(--dark-color);
            color: var(--light-color);
            font-family: 'Open Sans', sans-serif;
            overflow-x: hidden;
            background-image: 
                radial-gradient(circle at 25% 25%, rgba(29, 233, 182, 0.15) 0%, transparent 50%),
                radial-gradient(circle at 75% 75%, rgba(0, 230, 118, 0.15) 0%, transparent 50%);
        }

        /* Header Styles */
        .header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 15px 5%;
            background-color: rgba(10, 25, 47, 0.9);
            backdrop-filter: blur(10px);
            -webkit-backdrop-filter: blur(10px);
            position: fixed;
            width: 100%;
            top: 0;
            z-index: 1000;
            box-shadow: 0 4px 30px rgba(0, 0, 0, 0.3);
            border-bottom: 1px solid var(--glass-effect);
        }

        .logo {
            font-size: 1.5rem;
            font-weight: bold;
            font-family: 'Orbitron', sans-serif;
            background: linear-gradient(90deg, var(--primary-color), var(--secondary-color));
            -webkit-background-clip: text;
            background-clip: text;
            color: transparent;
            letter-spacing: 1px;
            animation: glow 2s ease-in-out infinite alternate;
        }

        @keyframes glow {
            from {
                text-shadow: 0 0 5px rgba(0, 230, 118, 0.5);
            }
            to {
                text-shadow: 0 0 15px rgba(29, 233, 182, 0.8), 0 0 20px rgba(0, 230, 118, 0.6);
            }
        }

        .logout-btn {
            background: linear-gradient(135deg, var(--accent-color), #ff6b6b);
            color: white;
            border: none;
            padding: 10px 20px;
            border-radius: 30px;
            cursor: pointer;
            font-weight: 600;
            transition: all 0.3s ease;
            display: flex;
            align-items: center;
            gap: 8px;
            box-shadow: 0 4px 15px rgba(255, 64, 129, 0.3);
            position: relative;
            overflow: hidden;
        }

        .logout-btn::before {
            content: '';
            position: absolute;
            top: 0;
            left: -100%;
            width: 100%;
            height: 100%;
            background: linear-gradient(90deg, transparent, rgba(255, 255, 255, 0.2), transparent);
            transition: 0.5s;
        }

        .logout-btn:hover {
            transform: translateY(-2px);
            box-shadow: 0 6px 20px rgba(255, 64, 129, 0.4);
        }

        .logout-btn:hover::before {
            left: 100%;
        }

        /* Main Content */
        .main-content {
            padding: 55px 5% 60px;
            min-height: 100vh;
        }

        .welcome-container {
            max-width: 1200px;
            margin: 0 auto;
            text-align: center;
            position: relative;
        }

        .welcome-text {
            font-size: 3.5rem;
            margin-bottom: 30px;
            background: linear-gradient(90deg, var(--primary-color), var(--secondary-color));
            -webkit-background-clip: text;
            background-clip: text;
            color: transparent;
            font-family: 'Orbitron', sans-serif;
            letter-spacing: 1px;
            position: relative;
            display: inline-block;
        }

        .welcome-text::after {
            content: '';
            position: absolute;
            bottom: -10px;
            left: 50%;
            transform: translateX(-50%);
            width: 100px;
            height: 3px;
            background: linear-gradient(90deg, var(--primary-color), var(--secondary-color));
            border-radius: 3px;
        }

        .description {
            font-size: 1.2rem;
            max-width: 800px;
            margin: 0 auto 50px;
            line-height: 1.8;
            color: rgba(255, 255, 255, 0.8);
        }

        /* AI Dashboard Cards */
        .dashboard {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
            gap: 30px;
            margin-top: 60px;
        }

        .card {
            background: var(--glass-effect);
            backdrop-filter: blur(10px);
            -webkit-backdrop-filter: blur(10px);
            border-radius: 15px;
            padding: 30px;
            transition: all 0.4s ease;
            border: 1px solid rgba(255, 255, 255, 0.1);
            box-shadow: 0 8px 32px rgba(0, 0, 0, 0.2);
            position: relative;
            overflow: hidden;
        }

        .card::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 5px;
            background: linear-gradient(90deg, var(--primary-color), var(--secondary-color));
        }

        .card:hover {
            transform: translateY(-10px);
            box-shadow: 0 15px 40px rgba(0, 0, 0, 0.3);
        }

        .card-icon {
            font-size: 2.5rem;
            margin-bottom: 20px;
            color: var(--primary-color);
        }

        .card-title {
            font-size: 1.5rem;
            margin-bottom: 15px;
            font-weight: 600;
            color: white;
        }

        .card-desc {
            color: rgba(255, 255, 255, 0.7);
            line-height: 1.6;
            margin-bottom: 20px;
        }

        .card-btn {
            background: rgba(255, 255, 255, 0.1);
            color: white;
            border: none;
            padding: 10px 20px;
            border-radius: 30px;
            cursor: pointer;
            transition: all 0.3s ease;
            display: inline-flex;
            align-items: center;
            gap: 8px;
        }

        .card-btn:hover {
            background: rgba(255, 255, 255, 0.2);
            transform: translateX(5px);
        }

        /* Chatbot UI */
        .chatbot-container {
            grid-column: span 2;
            background: var(--chat-bg);
            backdrop-filter: blur(10px);
            -webkit-backdrop-filter: blur(10px);
            border-radius: 15px;
            border: 1px solid rgba(255, 255, 255, 0.1);
            box-shadow: 0 8px 32px rgba(0, 0, 0, 0.2);
            overflow: hidden;
            display: flex;
            flex-direction: column;
            height: 400px;
        }

        .chat-header {
            padding: 15px 20px;
            background: linear-gradient(90deg, var(--primary-color), var(--secondary-color));
            color: white;
            font-weight: 600;
            display: flex;
            align-items: center;
            gap: 10px;
        }

        .chat-header i {
            font-size: 1.2rem;
        }

        .chat-messages {
            flex: 1;
            padding: 20px;
            overflow-y: auto;
            display: flex;
            flex-direction: column;
            gap: 15px;
        }

        .message {
            max-width: 80%;
            padding: 12px 18px;
            border-radius: 18px;
            line-height: 1.5;
            position: relative;
            animation: fadeIn 0.3s ease-out;
        }

        @keyframes fadeIn {
            from {
                opacity: 0;
                transform: translateY(10px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        .user-message {
            align-self: flex-end;
            background: var(--user-msg);
            border: 1px solid rgba(29, 233, 182, 0.3);
            border-bottom-right-radius: 5px;
            color: white;
        }

        .bot-message {
            align-self: flex-start;
            background: var(--bot-msg);
            border: 1px solid rgba(255, 255, 255, 0.1);
            border-bottom-left-radius: 5px;
            color: white;
        }

        .message-time {
            display: block;
            font-size: 0.7rem;
            opacity: 0.7;
            margin-top: 5px;
            text-align: right;
        }

        .chat-input-container {
            padding: 15px;
            background: rgba(10, 25, 47, 0.8);
            border-top: 1px solid rgba(255, 255, 255, 0.1);
            display: flex;
            gap: 10px;
        }

        .chat-input {
            flex: 1;
            padding: 12px 20px;
            border-radius: 30px;
            border: none;
            background: rgba(255, 255, 255, 0.1);
            color: white;
            font-size: 1rem;
            outline: none;
            transition: all 0.3s ease;
        }

        .chat-input:focus {
            background: rgba(255, 255, 255, 0.2);
            box-shadow: 0 0 0 2px var(--primary-color);
        }

        .send-btn {
            width: 50px;
            height: 50px;
            border-radius: 50%;
            border: none;
            background: linear-gradient(135deg, var(--primary-color), var(--secondary-color));
            color: white;
            cursor: pointer;
            transition: all 0.3s ease;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .send-btn:hover {
            transform: scale(1.05);
            box-shadow: 0 0 15px rgba(0, 230, 118, 0.5);
        }

        .typing-indicator {
            display: flex;
            align-items: center;
            gap: 5px;
            padding: 10px 15px;
            background: var(--bot-msg);
            border-radius: 18px;
            border-bottom-left-radius: 5px;
            align-self: flex-start;
            margin-bottom: 5px;
            opacity: 0;
            transition: opacity 0.3s ease;
        }

        .typing-indicator.active {
            opacity: 1;
        }

        .typing-dot {
            width: 8px;
            height: 8px;
            background-color: rgba(255, 255, 255, 0.7);
            border-radius: 50%;
            animation: typingAnimation 1.4s infinite ease-in-out;
        }

        .typing-dot:nth-child(1) {
            animation-delay: 0s;
        }

        .typing-dot:nth-child(2) {
            animation-delay: 0.2s;
        }

        .typing-dot:nth-child(3) {
            animation-delay: 0.4s;
        }

        @keyframes typingAnimation {
            0%, 60%, 100% {
                transform: translateY(0);
            }
            30% {
                transform: translateY(-5px);
            }
        }

        /* Floating Particles Animation */
        .particles {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            z-index: -1;
            overflow: hidden;
        }

        .particle {
            position: absolute;
            background: rgba(29, 233, 182, 0.3);
            border-radius: 50%;
            animation: float 15s infinite linear;
        }

        @keyframes float {
            0% {
                transform: translateY(0) rotate(0deg);
                opacity: 1;
            }
            100% {
                transform: translateY(-1000px) rotate(720deg);
                opacity: 0;
            }
        }

        /* Responsive */
        @media (max-width: 768px) {
            .header {
                padding: 15px 5%;
            }
            
            .logo {
                font-size: 1.2rem;
            }
            
            .welcome-text {
                font-size: 2.5rem;
            }
            
            .dashboard {
                grid-template-columns: 1fr;
            }
            
            .chatbot-container {
                grid-column: span 1;
                height: 500px;
            }
            
            .message {
                max-width: 90%;
            }
        }

        /* Animated Background Gradient */
        body::before {
            content: '';
            position: fixed;
            top: -50%;
            left: -50%;
            right: -50%;
            bottom: -50%;
            background: 
                radial-gradient(circle at 20% 30%, rgba(0, 230, 118, 0.1) 0%, transparent 30%),
                radial-gradient(circle at 80% 70%, rgba(29, 233, 182, 0.1) 0%, transparent 30%);
            animation: rotate 60s linear infinite;
            z-index: -2;
        }

        @keyframes rotate {
            from {
                transform: rotate(0deg);
            }
            to {
                transform: rotate(360deg);
            }
        }
        .mt-2{
        	margin-top: 7rem;
        }
    </style>
</head>
<body>
    <!-- Animated Background Particles -->
    <div class="particles" id="particles"></div>

    <!-- Header -->
    <header class="header animate__animated animate__fadeInDown">
        <div class="logo">Re.Tech AI Sustainability Platform</div>
        <button class="logout-btn" id="logoutBtn">
            <i class="fas fa-sign-out-alt"></i> Logout
        </button>
    </header>

    <!-- Main Content -->
    <main class="main-content">
        <div class="welcome-container animate__animated animate__fadeIn">
            
            <div class="dashboard mt-2">
                <!-- AI Chatbot Container -->
                <div class="chatbot-container">
                    <div class="chat-header">
                        <i class="fas fa-robot"></i>
                        <span>Re.Tech AI Assistant</span>
                    </div>
                    <div class="chat-messages" id="chatMessages">
                        <div class="message bot-message">
                            Hello! I'm your AI Assistant. How can I help you today?
                            <span class="message-time">Just now</span>
                        </div>
                    </div>
                    <div class="typing-indicator" id="typingIndicator">
                        <div class="typing-dot"></div>
                        <div class="typing-dot"></div>
                        <div class="typing-dot"></div>
                    </div>
                    <div class="chat-input-container">
                        <input type="text" class="chat-input" id="chatInput" placeholder="Ask Here..." autocomplete="off">
                        <button class="send-btn" id="sendBtn">
                            <i class="fas fa-paper-plane"></i>
                        </button>
                    </div>
                </div>
                
                <!-- Other dashboard cards can go here -->
                <!-- <div class="card">
                    <div class="card-icon">
                        <i class="fas fa-leaf"></i>
                    </div>
                    <h3 class="card-title">Sustainability Metrics</h3>
                    <p class="card-desc">Track and analyze your organization's sustainability performance with real-time metrics.</p>
                    <button class="card-btn">
                        View Metrics <i class="fas fa-arrow-right"></i>
                    </button>
                </div>
                 -->
              
            </div>
        </div>
    </main>

    <form action="<%=request.getContextPath() %>/logout" name="logoutForm" id="logoutForm" method="post">
        <input type="hidden" name="email" id="email"/>
    </form>

    <!-- JavaScript -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script>
 // Create animated particles
    function createParticles() {
        const particlesContainer = document.getElementById('particles');
        const particleCount = 30;
        
        for (let i = 0; i < particleCount; i++) {
            const particle = document.createElement('div');
            particle.classList.add('particle');
            
            // Random properties
            const size = Math.random() * 10 + 5;
            const posX = Math.random() * 100;
            const posY = Math.random() * 100;
            const delay = Math.random() * 15;
            const duration = Math.random() * 10 + 10;
            const opacity = Math.random() * 0.5 + 0.1;
            
            particle.style.width = `${size}px`;
            particle.style.height = `${size}px`;
            particle.style.left = `${posX}%`;
            particle.style.top = `${posY}%`;
            particle.style.animationDelay = `${delay}s`;
            particle.style.animationDuration = `${duration}s`;
            particle.style.opacity = opacity;
            
            particlesContainer.appendChild(particle);
        }
    }
    
    // Chatbot functionality
    function setupChatbot() {
        const chatInput = document.getElementById('chatInput');
        const sendBtn = document.getElementById('sendBtn');
        const chatMessages = document.getElementById('chatMessages');
        const typingIndicator = document.getElementById('typingIndicator');
        
        // Function to add a message to the chat
        function addMessage(text, isUser) {
            const messageDiv = document.createElement('div');
            messageDiv.classList.add('message');
            messageDiv.classList.add(isUser ? 'user-message' : 'bot-message');
            
            const time = new Date().toLocaleTimeString([], { hour: '2-digit', minute: '2-digit' });
            
            messageDiv.innerHTML = text+'<span class="message-time">'+time+'</span>';
            chatMessages.appendChild(messageDiv);
            
            // Scroll to bottom
            chatMessages.scrollTop = chatMessages.scrollHeight;
        }
        
        // Function to handle sending a message
        function sendMessage() {
            const message = chatInput.value.trim();
            if (message === '') return;
            
            // Add user message
            addMessage(message, true);
            chatInput.value = '';
            
            // Show typing indicator
            typingIndicator.classList.add('active');
            
            // Simulate bot thinking
            setTimeout(() => {
                typingIndicator.classList.remove('active');
                
                // Always respond with "Okay thanks"
                addMessage("Okay thanks", false);
            }, 1000 + Math.random() * 1000); // Random delay between 1-2 seconds
        }
        
        // Event listeners
        sendBtn.addEventListener('click', sendMessage);
        
        chatInput.addEventListener('keypress', (e) => {
            if (e.key === 'Enter') {
                sendMessage();
            }
        });
    }
    
    // Initialize everything
    document.addEventListener('DOMContentLoaded', function() {
        createParticles();
        setupChatbot();
        
        // Logout button
        document.getElementById('logoutBtn').addEventListener('click', function() {
            // Add logout animation
            this.innerHTML = '<i class="fas fa-spinner fa-spin"></i> Logging out...';
            setTimeout(() => {
                $("#logoutForm").submit();
            }, 1000);
        });
        
        // Card hover effects
        $('.card').hover(
            function() {
                $(this).css('transform', 'translateY(-10px)');
            },
            function() {
                $(this).css('transform', 'translateY(0)');
            }
        );
    });
       
    </script>
</body>
</html>