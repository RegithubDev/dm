<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Re AI Console</title>
	 <link rel="icon" type="image/png" sizes="96x96" href="https://resustainability.com/wp-content/uploads/2022/12/Logo-red-1.svg" >
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;600&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <script type="text/javascript">
    (function(c,l,a,r,i,t,y){
        c[a]=c[a]||function(){(c[a].q=c[a].q||[]).push(arguments)};
        t=l.createElement(r);t.async=1;t.src="https://www.clarity.ms/tag/"+i;
        y=l.getElementsByTagName(r)[0];y.parentNode.insertBefore(t,y);
    })(window, document, "clarity", "script", "rfoylc8ktq");
</script>

    <style>
 #toast {
      visibility: hidden;
      min-width: 300px;
      background-color: #0078d4;
      color: white;
      text-align: center;
      border-radius: 8px;
      padding: 16px;
      position: fixed;
      z-index: 99999;
      top: 20px;
      right: 20px;
      font-size: 16px;
      box-shadow: 0 4px 12px rgba(0,0,0,0.15);
      opacity: 0;
      transition: opacity 0.5s ease, visibility 0.5s;
    }
#toast.show {
  opacity: 75;
  visibility: visible;
}
    
:root {
    --bg-color: #f8f9fa;
    --text-color: #2c3e50;
    --header-bg: linear-gradient(135deg, #34495e 0%, #2c3e50 100%);
    --header-text: #ecf0f1;
    --panel-bg: #ffffff;
    --panel-border: #dfe6e9;
    --chat-bg: linear-gradient(135deg, #f0f2f5 0%, #e4e7eb 100%);
    --chat-text: #2c3e50;
    --user-message-bg: #e3f2fd;
    --ai-message-bg: #f5f5f5;
    --button-bg: #34495e;
    --button-text: #ecf0f1;
    --button-hover-bg: #4a6278;
    --modal-bg: #ffffff;
    --input-bg: #ffffff;
    --input-border: #dfe6e9;
}

[data-theme="dark"] {
    --bg-color: #1a1a1a;
    --text-color: #e0e0e0;
    --header-bg: linear-gradient(135deg, #1f2a44 0%, #16213e 100%);
    --header-text: #e0e0e0;
    --panel-bg: #2a2a2a;
    --panel-border: #3a3a3a;
    --chat-bg: linear-gradient(135deg, #2a2a2a 0%, #1f1f1f 100%);
    --chat-text: #e0e0e0;
    --user-message-bg: #3a5e85;
    --ai-message-bg: #3a3a3a;
    --button-bg: #3a5e85;
    --button-text: #e0e0e0;
    --button-hover-bg: #4a7ba3;
    --modal-bg: #2a2a2a;
    --input-bg: #3a3a3a;
    --input-border: #4a4a4a;
}
.header-3d {
    background: var(--header-bg);
    color: var(--header-text);
}

.logo-text, .status-text, .signout-btn, .user-manual-btn {
    color: var(--header-text);
}

.royal-panel {
    background: var(--panel-bg);
    border-right: 1px solid var(--panel-border);
}


.user-message {
    background: var(--user-message-bg);
    color: var(--chat-text);
}

.ai-message {
    background: var(--ai-message-bg);
    color: var(--chat-text);
}

.royal-btn, .login-button, #logoutBtn, .select-file-btn {
    background-color: var(--button-bg);
    color: var(--button-text);
}

.royal-btn:hover, .login-button:hover, #logoutBtn:hover, .select-file-btn:hover {
    background-color: var(--button-hover-bg);
}

.modal-content, .video-content {
    background: var(--modal-bg);
}

#royal-input, .royal-input {
    background: var(--input-bg);
    border: 1px solid var(--input-border);
    color: var(--text-color);
}

#royal-input:focus, .royal-input:focus {
    border-color: var(--button-bg);
}
    .theme-toggle {
    background: none;
    border: none;
    color: var(--header-text);
    font-size: 1.2rem;
    cursor: pointer;
    padding: 8px;
    border-radius: 6px;
    transition: background-color 0.3s ease, transform 0.2s ease;
}

.theme-toggle:hover {
    background-color: rgba(255, 255, 255, 0.15);
    transform: scale(1.05);
}
    .response-nav {
  display: inline-flex;
  align-items: center;
  gap: 6px;
  margin-left: 8px;
}

.resp-count {
  font-weight: bold;
}
    
    .iframe-wrapper {
  overflow: hidden;
  width: 100%;
  height: 545px;
  position: relative;
}

.dashboard-iframe {
  transform: scale(1.1);
  transform-origin: top left;
  width: 100%;
  height: 100%;
  border: none;
}
    
    /* General Reset and Base Styles */
* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
    font-family: 'Inter', 'Segoe UI', 'Arial', sans-serif;
}

body {
    background-color: #f8f9fa;
    color: #2c3e50;
}

/* Header Styles */
.header-3d {
    display: flex;
    align-items: center;
    justify-content: space-between;
    background: linear-gradient(135deg, #34495e 0%, #2c3e50 100%);
    padding: 14px 24px;
    box-shadow: 0 3px 6px rgba(0, 0, 0, 0.1);
    position: fixed;
    width: 100%;
    top: 0;
    z-index: 1000;
}

.logo-container {
    display: flex;
    align-items: center;
    gap: 12px;
}

.logo-icon img {
    height: 54px;
    filter: brightness(1.2);
}

.logo-text {
    color: #ecf0f1;
    font-size: 1.6rem;
    font-weight: 700;
    letter-spacing: 0.5px;
}



.status-indicator {
    display: flex;
    align-items: center;
    gap: 12px;
}

.status-text {
    color: #ecf0f1 !important;
    font-size: 0.95rem;
    font-weight: 500;
    text-transform: uppercase;
    letter-spacing: 0.5px;
}

.status-dot {
    width: 12px;
    height: 12px;
    background-color: #27ae60;
    border-radius: 50%;
    box-shadow: 0 0 8px rgba(39, 174, 96, 0.5);
    animation: pulse 2s infinite ease-in-out;
}

@keyframes pulse {
    0% { transform: scale(1); opacity: 1; }
    50% { transform: scale(1.3); opacity: 0.7; }
    100% { transform: scale(1); opacity: 1; }
}

.signout-btn {
    background: none;
    border: none;
    color: #ecf0f1;
    font-size: 1.1rem;
    cursor: pointer;
    padding: 8px 12px;
    border-radius: 6px;
    transition: background-color 0.3s ease, transform 0.2s ease;
}

.signout-btn:hover {
    background-color: rgba(255, 255, 255, 0.15);
    transform: scale(1.05);
}

/* Dropdown Styles */
.dropdown {
    position: relative;
}

.user-manual-btn {
    background: none;
    border: none;
    color: #ecf0f1;
    font-size: 0.95rem;
    font-weight: 500;
    padding: 8px 14px;
    cursor: pointer;
    border-radius: 6px;
    transition: background-color 0.3s ease;
    display: flex;
    align-items: center;
    gap: 6px;
}

.user-manual-btn:hover {
    background-color: rgba(255, 255, 255, 0.15);
}

.dropdown-content {
    display: none;
    position: absolute;
    background-color: #ffffff;
    min-width: 180px;
    box-shadow: 0 10px 20px rgba(0, 0, 0, 0.15);
    border-radius: 6px;
    z-index: 1;
    right: 0;
    top: 100%;
    margin-top: 8px;
    overflow: hidden;
}

.dropdown-content a {
    color: #2c3e50;
    padding: 12px 16px;
    text-decoration: none;
    display: flex;
    align-items: center;
    gap: 10px;
    font-size: 0.9rem;
    font-weight: 500;
    transition: background-color 0.2s ease;
}

.dropdown-content a:hover {
    background-color: #f0f2f5;
}

/* Video Modal Styles */
.video-modal {
    display: none;
    position: fixed;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    background: rgba(0, 0, 0, 0.75);
    z-index: 1000;
}

.video-content {
    background: #ffffff;
    margin: 5% auto;
    padding: 24px;
    width: 90%;
    max-width: 900px;
    border-radius: 10px;
    position: relative;
    box-shadow: 0 5px 15px rgba(0, 0, 0, 0.2);
}

.video-content .close {
    position: absolute;
    top: 12px;
    right: 16px;
    font-size: 1.6rem;
    cursor: pointer;
    color: #7f8c8d;
    transition: color 0.2s ease;
}

.video-content .close:hover {
    color: #e74c3c;
}

.video-controls {
    display: flex;
    gap: 12px;
    justify-content: center;
    align-items: center;
    margin-top: 12px;
    flex-wrap: wrap;
}

.video-controls button, 
.video-controls select, 
.video-controls input[type="range"] {
    padding: 8px 12px;
    border: none;
    border-radius: 6px;
    background-color: #34495e;
    color: #ecf0f1;
    cursor: pointer;
    font-size: 0.9rem;
    transition: background-color 0.3s ease, transform 0.2s ease;
}

.video-controls button:hover, 
.video-controls select:hover {
    background-color: #4a6278;
    transform: scale(1.05);
}

.video-controls input[type="range"] {
    width: 100px;
    cursor: pointer;
}

.video-controls select {
    background-color: #34495e;
    padding: 6px;
}

/* Overlay and Sidebar */
.overlay {
    display: none;
    position: fixed;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    background: rgba(0, 0, 0, 0.6);
    z-index: 900;
}

.royal-container {
    display: flex;
    margin-top: 64px;
    height: calc(100vh - 64px);
}

.royal-panel {
    width: 280px;
    background: #ffffff;
    padding: 24px;
    height: 100%;
    overflow-y: auto;
    border-right: 1px solid #dfe6e9;
    transition: transform 0.3s ease;
    box-shadow: 2px 0 8px rgba(0, 0, 0, 0.05);
}

.panel-header {
    font-size: 1.2rem;
    font-weight: 600;
    color: #2c3e50;
    margin-bottom: 1.2rem;
    display: flex;
    align-items: center;
    gap: 10px;
    border-bottom: 1px solid #dfe6e9;
    padding-bottom: 8px;
}

.button-row {
    display: flex;
    flex-direction: column;
    gap: 12px;
    margin-bottom: 1.5rem;
}

.royal-btn {
    background-color: #34495e;
    color: #ecf0f1;
    border: none;
    padding: 12px;
    border-radius: 6px;
    cursor: pointer;
    font-size: 0.95rem;
    font-weight: 500;
    transition: background-color 0.3s ease, transform 0.2s ease;
    display: flex;
    align-items: center;
    gap: 10px;
}

.royal-btn:hover {
    background-color: #4a6278;
    transform: translateY(-2px);
}

.data-nodes {
    margin-top: 1.2rem;
}

        /* Data Containers */
        .data-node {
            margin-bottom: 1rem;
            background: rgba(26, 35, 126, 0.2);
            border-radius: 8px;
            overflow: hidden;
            box-shadow: 0 4px 6px rgba(0,0,0,0.1);
            transition: all 0.3s ease;
            border-left: 3px solid var(--gold-accent);
        }
        
        .data-node:hover {
            transform: translateY(-3px);
            box-shadow: 0 6px 12px rgba(0,0,0,0.2);
        }

.node-header {
    background: #f0f2f5;
    padding: 12px 16px;
    border-radius: 6px;
    cursor: pointer;
    display: flex;
    align-items: center;
    justify-content: space-between;
    font-weight: 500;
    color: #2c3e50;
    transition: background-color 0.2s ease;
}

.node-header:hover {
    background: #dfe6e9;
}

.menu-toggle {
  display: none;
}
        .node-content {
            max-height: 0;
    background: #ffffff;
      border: 1px solid #dfe6e9;
    border-top: none;
    border-radius: 0 0 6px 6px;
            overflow: hidden;
            transition: max-height 0.6s cubic-bezier(0.4, 0, 0.2, 1);
        }
        
        .node-content.show {
            max-height: 5000px;
        }
        
.file-item {
    padding: 10px;
    border-bottom: 1px solid #dfe6e9;
    display: flex;
    align-items: center;
    gap: 12px;
    font-size: 0.9rem;
    color: #2c3e50;
}

.file-item:last-child {
    border-bottom: none;
}

.empty-message {
    color: #7f8c8d;
    font-style: italic;
    padding: 12px;
    font-size: 0.9rem;
}

/* Tabs and Console */
.tabs-container {
    flex: 1;
    padding: 24px;
    background: #f8f9fa;
}

.tabs-header {
    display: flex;
    gap: 12px;
    margin-bottom: 1.2rem;
    border-bottom: 1px solid #dfe6e9;
}

.tab-button {
    background: #ffffff;
    border: none;
    padding: 12px 24px;
    border-radius: 6px 6px 0 0;
    cursor: pointer;
    font-size: 0.95rem;
    font-weight: 500;
    color: #7f8c8d;
    transition: background-color 0.3s ease, color 0.3s ease;
}

.tab-button.active {
    background: #34495e;
    color: #ecf0f1;
    border-bottom: none;
}

.tab-button:hover {
    background: #dfe6e9;
    color: #2c3e50;
}

.tab-pane {
    display: none;
}

.tab-pane.active {
    display: block;
}

.royal-console {
    background: #ffffff;
    border-radius: 8px;
    box-shadow: 0 3px 8px rgba(0, 0, 0, 0.1);
    height: 100%;
    display: flex;
    flex-direction: column;
}

.console-header {
    display: flex;
    align-items: center;
    padding: 12px 16px;
    background: #f0f2f5;
    border-bottom: 1px solid #dfe6e9;
}

.console-title {
    font-size: 1.2rem;
    font-weight: 600;
    color: #2c3e50;
    flex: 1;
}

.model-dropdown {
    border: 1px solid #dfe6e9;
    border-radius: 6px;
    padding: 8px;
    font-size: 0.9rem;
    background: #ffffff;
    color: #2c3e50;
    cursor: pointer;
    transition: border-color 0.3s ease;
}

.model-dropdown:hover {
    border-color: #34495e;
}

.erase-btn {
    background: none;
    border: none;
    color: #2c3e50;
    font-size: 1.1rem;
    cursor: pointer;
    padding: 8px;
    border-radius: 6px;
    transition: background-color 0.3s ease;
}

.erase-btn:hover {
    background: #dfe6e9;
}

.chat-display {
  position: relative;
  overflow-y: auto;
     height: 58%;
  padding: 1rem;
  border-radius: 12px;
  color: #fff;
  z-index: 1;
}
.user-message {
    background: #cbdeec;
    margin-right: auto;
    color: #2c3e50;
}
.chat-display::before {
content: '';
position: absolute;
top: 0; left: 0;
width: 100%;
height: 100%;
background-image: url('[https://www.shutterstock.com/image-vector/social-media-sketch-vector-seamless-600nw-1660950727.jpg](https://www.shutterstock.com/image-vector/social-media-sketch-vector-seamless-600nw-1660950727.jpg)'); /\* Replace with your image */
background-repeat: repeat;
background-size: auto;
background-position: center;
opacity: 0.15; /* 25% opacity \*/
z-index: -1;
}
.message { 
    margin-bottom: 1.2rem;
    padding: 12px 16px;
    border-radius: 8px;
    max-width: 85%;
    font-size: 0.95rem;
    line-height: 1.5;
}

.ai-message {
    background: #e8ecef;
    margin-left: auto;
    color: #2c3e50;
}

.typing-indicator {
    display: none;
    padding: 12px;
}

.typing-dots span {
    display: inline-block;
    width: 8px;
    height: 8px;
    background: #7f8c8d;
    border-radius: 50%;
    margin: 0 2px;
    animation: blink 1.2s infinite both;
}

.typing-dots span:nth-child(2) { animation-delay: 0.2s; }
.typing-dots span:nth-child(3) { animation-delay: 0.4s; }

@keyframes blink {
    0% { opacity: 0.3; }
    20% { opacity: 1; }
    100% { opacity: 0.3; }
}

.input-area {
    display: flex;
    padding: 12px;
    border-top: 1px solid #dfe6e9;
    background: #ffffff;
}

#royal-input {
    flex: 1;
    border: 1px solid #dfe6e9;
    border-radius: 6px;
    padding: 12px;
    resize: none;
    font-size: 0.95rem;
    color: #2c3e50;
    transition: border-color 0.3s ease;
}

#royal-input:focus {
    border-color: #34495e;
    outline: none;
}

#send-btn {
    background: #34495e;
    border: none;
    color: #ecf0f1;
    padding: 12px;
    border-radius: 6px;
    margin-left: 12px;
    cursor: pointer;
    font-size: 1.1rem;
    transition: background-color 0.3s ease, transform 0.2s ease;
}

#send-btn:hover {
    background: #4a6278;
    transform: translateY(-2px);
}

/* Dashboard Tab */
.login-elegant {
    background: #ffffff;
    padding: 24px;
    border-radius: 8px;
    text-align: center;
    max-width: 550px;
    margin: 24px auto;
    box-shadow: 0 3px 8px rgba(0, 0, 0, 0.1);
}

.login-heading {
    font-size: 1.6rem;
    color: #2c3e50;
    margin-bottom: 1.2rem;
    font-weight: 600;
}

.login-status {
    font-size: 0.95rem;
    color: #7f8c8d;
    margin-bottom: 1.2rem;
    line-height: 1.5;
}

.login-button {
    background: #34495e;
    color: #ecf0f1;
    border: none;
    padding: 12px 24px;
    border-radius: 6px;
    cursor: pointer;
    font-size: 0.95rem;
    font-weight: 500;
    transition: background-color 0.3s ease, transform 0.2s ease;
}

.login-button:hover {
    background: #4a6278;
    transform: translateY(-2px);
}

.contact-info {
    font-size: 0.9rem;
    color: #7f8c8d;
    margin-top: 1.5rem;
    line-height: 1.5;
}

.dashboard-iframe {
    border-radius: 8px;
    margin-top: 1.5rem;
    box-shadow: 0 2px 6px rgba(0, 0, 0, 0.1);
}

#logoutBtn {
    background: #34495e;
    color: #ecf0f1;
    border: none;
    padding: 12px 24px;
    border-radius: 6px;
    cursor: pointer;
    font-size: 0.95rem;
    font-weight: 500;
    margin-top: 1.2rem;
    transition: background-color 0.3s ease, transform 0.2s ease;
}

#logoutBtn:hover {
    background: #4a6278;
    transform: translateY(-2px);
}

#errorMessage p {
    color: #e74c3c;
    font-size: 0.95rem;
    margin-top: 1.2rem;
}

/* Modal Styles */
.modal {
    display: none;
    position: fixed;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    background: rgba(0, 0, 0, 0.75);
    z-index: 1000;
}

.modal-content {
    background: #ffffff;
    margin: 10% auto;
    padding: 24px;
    width: 90%;
    max-width: 550px;
    border-radius: 10px;
    position: relative;
    box-shadow: 0 5px 15px rgba(0, 0, 0, 0.2);
}

.close {
    position: absolute;
    top: 12px;
    right: 16px;
    font-size: 1.6rem;
    cursor: pointer;
    color: #7f8c8d;
    transition: color 0.2s ease;
}

.close:hover {
    color: #e74c3c;
}

.modal-form .form-group {
    margin-bottom: 1.5rem;
}

.royal-input {
    width: 100%;
    padding: 12px;
    border: 1px solid #dfe6e9;
    border-radius: 6px;
    font-size: 0.95rem;
    color: #2c3e50;
    transition: border-color 0.3s ease;
}

.royal-input:focus {
    border-color: #34495e;
    outline: none;
}

.select-file-btn {
    background: #34495e;
    color: #ecf0f1;
    padding: 12px;
    border-radius: 6px;
    cursor: pointer;
    display: inline-flex;
    align-items: center;
    gap: 10px;
    font-size: 0.95rem;
    font-weight: 500;
    transition: background-color 0.3s ease, transform 0.2s ease;
}

.select-file-btn:hover {
    background: #4a6278;
    transform: translateY(-2px);
}

.w {
    color: #2c3e50;
    font-weight: 600;
    font-size: 1.2rem;
    margin-bottom: 1rem;
}

/* Document Modal */
#docModal .modal-content {
    max-width: 900px;
}

#closeModal {
    background: #e74c3c;
    color: #ffffff;
    border: none;
    padding: 8px 14px;
    border-radius: 6px;
    cursor: pointer;
    font-size: 0.9rem;
    transition: background-color 0.3s ease;
}

#closeModal:hover {
    background: #c0392b;
}

/* Responsive Design */
@media (max-width: 768px) {
    .royal-panel {
        position: fixed;
        transform: translateX(-100%);
        z-index: 950;
        width: 260px;
    }
.menu-toggle {
 display: block;
    background: none;
    border: none;
    color: #ecf0f1;
    font-size: 1.3rem;
    cursor: pointer;
    padding: 8px 12px;
    border-radius: 6px;
    transition: background-color 0.3s ease, transform 0.2s ease;
}

.menu-toggle:hover {
    background-color: rgba(255, 255, 255, 0.15);
    transform: scale(1.05);
}
    .royal-panel.active {
        transform: translateX(0);
    }

    .royal-container {
        flex-direction: column;
    }

    .tabs-container {
        padding: 16px;
    }

    .header-3d {
        padding: 12px 16px;
    }

    .logo-text {
        font-size: 1.3rem;
    }

    .video-content {
        width: 95%;
        padding: 16px;
    }

    .modal-content {
        width: 95%;
        padding: 16px;
    }
}    
/* Toggle button visible only on mobile */
.mobile-menu-toggle {
  display: none;
  position: absolute;
  top: 1rem;
  right: 1rem;
  background: transparent;
  border: none;
  font-size: 1.8rem;
  color: white;
  z-index: 1001;
}

@media (max-width: 768px) {
  .mobile-menu-toggle {
    display: block;
  }
  .status-dot{
   display: none;
  }
.status-indicator {
    flex-direction: column;
    align-items: flex-start;
  }
  .mobile-status-menu {
   display: flex;
    flex-direction: column;
    position: fixed;
         top: 34px;
        right: -100%;
        width: 137px;
                height: 14%;
    background-color: #222;
    color: white;
    padding: 1rem;
    transition: right 0.3s ease-in-out;
    z-index: 1000;
  }

  .mobile-status-menu.open {
    right: 0;
  }
   .menu-overlay.active {
    display: block;
    position: fixed;
    inset: 0;
    background: rgba(0, 0, 0, 0.3);
    z-index: 999;
  }
}
.input-area {
    display: flex;
    align-items: center;
    gap: 8px;
    margin-top: 10px;
}

#royal-input {
    flex: 1;
    resize: none;
    padding: 10px;
    border-radius: 8px;
    border: 1px solid #ccc;
}

#send-btn, .upload-btn {
    background-color: #007bff;
    color: white;
    border: none;
    padding: 10px;
    border-radius: 50%;
    cursor: pointer;
    font-size: 1.1rem;
}

.upload-btn {
    display: flex;
    align-items: center;
    justify-content: center;
}

    </style>
</head>
<body>
    <!-- 3D Header with Logo -->
    <header class="header-3d">
    <button class="menu-toggle" id="menuToggle">
        <i class="fas fa-bars"></i>
    </button>
    <div class="logo-container">
        <div class="logo-icon">
            <img src="/reirm/resources/ai/img/Logo-red-1 (1).svg" alt="Logo" class="logo-img" />
        </div>
        <div class="logo-text">Re AI</div>
    </div>
    
   <!--  <button class="theme-toggle" id="themeToggle" title="Toggle Theme">
        <i class="fas fa-moon"></i>
    </button> -->
   <button class="mobile-menu-toggle" onclick="toggleMobileMenu()">
  <i class="fas fa-user-circle"></i>
</button>

<!-- Transparent overlay to detect outside click -->
<div class="menu-overlay" id="menuOverlay" onclick="closeMobileMenu()"></div>

<!-- Slide-in status menu (your full div) -->
<div class="mobile-status-menu status-indicator" id="mobileStatusMenu">
  <!-- Dropdowns and content -->
  <div class="dropdown">
    <button class="user-manual-btn" onclick="toggleDropdown()" title="Manuals">
        <i class="fas fa-bars"></i> Manuals
    </button>
    <div id="manualsDropdown" class="dropdown-content">
        <a href="https://appmint.resustainability.com//reirm/resources/ai/ReSustainability_DM_Portal_User_Manual.pdf" target="_blank" title="User Manual">
            <i class="fas fa-book"></i> User Manual
        </a>
        <a href="javascript:void(0)" onclick="openVideoModal()" title="Video Manual">
            <i class="fas fa-video"></i> Video Manual
        </a>
    </div>
  </div>

  <div class="status-dot"></div>

  <form action="<%=request.getContextPath()%>/logout" method="post" style="margin-left: 10px;">
    <button type="submit" class="signout-btn" title="Sign Out">
      <i class="fas fa-sign-out-alt"></i>
    </button>
  </form>
</div>
</header>
<!-- Modal -->
<!-- Video Manual Modal -->
<div id="videoModal" class="video-modal">
  <div class="video-content">
    <span class="close" onclick="closeVideoModal()">&times;</span>
    
    <video id="manualVideo" width="100%">
      <source src="https://appmint.resustainability.com/reirm/resources/ai/manual.mp4" type="video/mp4" />
      Your browser does not support the video tag.
    </video>

    <div class="video-controls">
      <button onclick="skipTime(-10)">⏪ 10s</button>
      <button onclick="togglePlayPause()">⏯️</button>
      <button onclick="skipTime(10)">⏩ 10s</button>

      <!-- Volume -->
      <label>
        🔊
        <input type="range" min="0" max="1" step="0.05" onchange="setVolume(this.value)" value="1">
      </label>

      <!-- Speed -->
      <label>
        ⏩ Speed
        <select onchange="setSpeed(this.value)">
          <option value="0.5">0.5x</option>
          <option value="1" >1x</option>
          <option value="1.2" selected>1.2x</option>
          <option value="1.5">1.5x</option>
          <option value="2">2x</option>
        </select>
      </label>

      <!-- Fullscreen -->
      <button onclick="toggleFullScreen()">⛶ Fullscreen</button>
    </div>
  </div>
</div>



    <!-- Mobile Overlay -->
    <div class="overlay" id="overlay"></div>

    <div class="royal-container">
        <!-- Royal Panel - Side Menu -->
        <div class="royal-panel" id="sidePanel">
            <div class="panel-header">
                <i class="fas fa-database"></i> BLOB GRID
            </div>
            
            <div class="button-row">
                <button class="royal-btn" onclick="openModal('create')">🆕 New Container</button>
                <button class="royal-btn" onclick="openModal('upload')">📤 File Upload</button>
            </div>

            <div class="panel-header" style="margin-top: 2rem;">
                <i class="fas fa-folder"></i> BLOB CONTAINERS
            </div>
            
            <div class="data-nodes">
                <c:choose>
                    <c:when test="${empty blobData}">
                        <div class="empty-message">No containers found</div>
                    </c:when>
                    <c:otherwise>
                        <c:forEach var="entry" items="${blobData}">
                            <div class="data-node">
                                <div class="node-header" onclick="toggleNode(this)">
                                    <span>${entry.key}</span>
                                    <i class="fas fa-chevron-right"></i>
                                   <%--  <button onclick="deleteContainer('${entry.key}', event)" class="royal-btn" style="padding: 0.3rem 0.6rem; font-size: 0.8rem;">
                                        <i class="fas fa-trash"></i>
                                    </button> --%>
                                </div>
                                <div class="node-content">
                                    <c:choose>
                                        <c:when test="${empty entry.value}">
                                            <div class="empty-message">No files in container</div>
                                        </c:when>
                                        <c:otherwise>
                                           <c:forEach var="file" items="${entry.value}">
											    <div class="file-item" style="display: flex; align-items: center; gap: 10px;">
											        <i class="fas fa-file"></i>
											        <span style="word-wrap: break-word; max-width: 140px; display: inline-block;">${file}</span>
<%-- 											        <button onclick="deleteFile('${entry.key}', '${file}')" class="royal-btn" style="padding: 0.2rem 0.4rem; font-size: 0.6rem;"> <i class="fas fa-trash"></i></button>
 --%> 									    </div>
											</c:forEach>

                                        </c:otherwise>
                                    </c:choose>
                                </div>
                            </div>
                        </c:forEach>
                    </c:otherwise>
                </c:choose>
            </div>
        </div>
        
        <!-- Royal Console -->
        <!-- Replace your royal-console div with this tabs structure -->
<div class="tabs-container">
    <div class="tabs-header">
         <button class="tab-button active" id="dashboard" onclick="switchTab('dashboard')">Open AI ReSl</button>
        <button class="tab-button " onclick="switchTab('chat')">Chat</button>
   
    </div> 
    
    <div class="tabs-content">
        <!-- Chat Tab -->
        <div class="tab-pane " id="chat-tab" >
            <div class="royal-console" style="height: 91%; border-radius: 0; box-shadow: none; border: none;">
                <div class="console-header">
                    <div class="console-title">Chat Playground</div>
                   
                    <!-- Dropdown for model selection -->
                    <select id="modelSelector" class="model-dropdown" style="margin: 0 10px; padding: 4px;">
                        <option value="gpt-35-turbo-16k" selected>gpt-35-turbo-16k</option>
                        <option value="gpt-4">gpt-4</option>
                    </select>
                    
                    <div class="console-status"></div>
                    
                    <button class="erase-btn" onclick="eraseChat()" title="Clear Chat">
                        <i class="fas fa-eraser"></i>
                    </button>
                </div>
                <!-- Button to trigger re-connection -->
<!-- <button id="reconnectBtn">Reconnect Model and Re-index</button>
 -->
<!-- Optional feedback area -->
<div id="status"></div>
                <div class="chat-display" id="chatDisplay" >
                    <div class="message ai-message" style="opacity: 1; transform: none;">
                        Re AI SYSTEM
                    </div>
                    <div class="message ai-message" style="opacity: 1; transform: none; animation-delay: 0.3s;">
                        AWAITING USER QUERY
                    </div>
                   
                </div>
                
               <div class="input-area">
          <!--       <label for="file-upload" class="upload-btn" title="Upload File">
			        <i class="fas fa-paperclip"></i>
			    </label>  -->
<!--                 <input type="file" id="file-upload" style="display: none;"  accept=".doc,.docx,.pdf,.ppt,.pptx,.txt,.html,.htm,.csv,.rtf,.odt,.ods,.odp,.xml,image/*,video/*,audio/*">
 -->			    <textarea id="royal-input" rows="3" placeholder="Type a new question..."></textarea>
			   
			    <button id="send-btn" onclick="sendQuery()" title="Send">
			        <i class="fas fa-paper-plane"></i>
			    </button>
			    
			   
			   
			</div>

            </div>
        </div>
        
        <!-- Dashboard Tab -->
       <div class="tab-pane active" id="dashboard-tab">
      <!-- Place this inside your .tab-pane -->
<div id="loginContainer" class="login-elegant" style="display: block;">

 

    <h2 class="login-heading">Secure Portal Access</h2>

 

    <p id="statusText" class="login-status">You do not seem to have a Microsoft Account. If so, please create one to access this tab. In case you already have, please login using the tab given below<br> <b>OpenAI ReSL ChatBot.</b></p>

 

    <button id="loginBtn" class="login-button">Sign In with Microsoft</button>

 

    <div class="contact-info">

In case of any support, please contact  <strong>Mr. Sai Dileep</strong>(9441391620)| <strong>Mr. Santhosh</strong>(9154789979)


    </div>
    <br>
	<p style="font-size: 0.80em; color: #d7d4d4;">
  Still facing issues? Please use the “CHAT” Tab. This tab, too, uses the same algorithm.
</p>
 

</div>
<div class="iframe-wrapper " id="iframewrapper" style="position: relative;">

  <!-- 🔄 Reload Button (Top Right) -->
  <button id="reloadIframeBtn"
    style="
    
      position: absolute;
         top: 20px;
    right:-11px;
      z-index: 1;
      padding: 6px 12px;
      background-color: #007bff;
      color: white;
      border: none;
      border-radius: 6px;
      cursor: pointer;
      box-shadow: 0 2px 8px rgba(0,0,0,0.2);
    
    ">
    🔄 Reload
  </button>

  <!-- 🚪 Logout Button (Top Left) -->
  <button id="logoutBtn"
    style="
     position: absolute;top: 30px;left: 8px;z-index: 1;padding: 6px 12px;background-color: rgb(220, 53, 69);color: white;border: none;border-radius: 6px;cursor: pointer;box-shadow: rgba(0, 0, 0, 0.2) 0px 2px 8px;display: inline-block;
    ">
    🚪 Logout
  </button>

  <!-- 🖥️ iFrame -->
  <iframe class="dashboard-iframe" id="dashboardIframe"
    sandbox="allow-scripts allow-same-origin allow-forms allow-popups allow-top-navigation-by-user-activation"
    title="Open Ai ReSl" 
    frameborder="0"  
    allowfullscreen="true"  
    style="
      transform: scale(1.1);
      transform-origin: 34% 95%;
      border: none;
      width: 99%;
      position: relative;
      top: -2rem;
      height: 545px;
      display: block;">
  </iframe> 

</div>


    
    <div class="row" id="errorMessage" style="display: none;">
        <p>Failed to load dashboard. Please check your connection and try again.</p>
    </div>
</div>

    </div>
</div>
    </div>

    <!-- Modal Dialogs -->
    <div id="modal" class="modal">
        <div class="modal-content">
            <span class="close" id="closeModal" onclick="closeModal()">&times;</span>

            <!-- Create Container Form -->
            <div id="create-container-form" style="display: none;">
                <form action="<%=request.getContextPath() %>/createContainer" method="post">
                    <h3 class="w">Create New Container</h3>
                    <input type="text" name="containerName" class="royal-input" placeholder="Container Name" required />
                    <button type="submit" class="royal-btn">
                        <i class="fas fa-plus"></i> CREATE
                    </button>
                </form>
            </div>
<!-- Toast Notification -->
<!-- Toast Notification -->

            <!-- Upload File Form -->
            <!-- Loader Overlay -->
<div id="loaderOverlay" style="display:none; position:fixed; top:0; left:0; width:100%; height:100%; background:rgba(255,255,255,0.8); z-index:9999; text-align:center;">
  <div style="position:absolute; top:50%; left:50%; transform:translate(-50%, -50%);">
    <img src="https://media.tenor.com/LeDb4HArelwAAAAm/loading-betterttv.webp" alt="Loading..." width="80" />
    <p style="font-weight:bold; color:#0078d4;">Uploading... Please wait</p>
  </div>
</div>



            <div id="upload-file-form" class="modal-form" style="display: none;">
    <form method="post" enctype="multipart/form-data" id="uploadForm">
        <h3 class="w" style="text-align: center; margin-bottom: 1.5rem;">Upload File to Container</h3>
        
        <div style="display: flex; gap: 1rem; align-items: flex-end; margin-bottom: 1rem;">
            <!-- Container Dropdown -->
            <div class="form-group" style="flex: 1;">
                <label for="containerName" class="w" style="display: block; margin-bottom: 0.5rem; font-weight: 500;">Container <span style="color: #e74c3c;">*</span></label>
                <select name="containerName" id="containerName" class="royal-input" required
                    style="width: 100%; padding: 0.75rem; border: 1px solid #ddd; border-radius: 4px; background-color: #f9f9f9;">
                    <option value="">Select a container</option>
                    <c:forEach var="entry" items="${blobData}">
                        <option value="${entry.key}">${entry.key}</option>
                    </c:forEach>
                </select>
            </div>
            
            <!-- File Input -->
            <div class="form-group" style="flex: 1;">
                <label for="file-upload" class="w" style="display: block; margin-bottom: 0.5rem; font-weight: 500;">File <span style="color: #e74c3c;">*</span></label>
                <label for="file-upload" class="royal-btn select-file-btn"
                    style="padding: 0.75rem 1.25rem; background-color: #3498db; color: white; border-radius: 4px; cursor: pointer; display: flex; align-items: center; gap: 0.5rem; width: 100%; justify-content: center;">
                    <i class="fas fa-cloud-upload-alt"></i> Choose File
                </label>
                <div id="file-name" style="margin-top: 0.5rem; color: #555; font-size: 0.85rem; text-align: center; font-style: italic;">
                    No file selected
                </div>
                <input type="file" name="file" id="file-upload" required
                    style="opacity: 0; width: 1px; height: 1px; position: absolute;"
                    accept=".doc,.docx,.pdf,.ppt,.pptx,.txt,.html,.htm,.csv,.rtf,.odt,.ods,.odp,.xml,image/*,video/*,audio/*" />
            </div>
        </div>
        
        <!-- Upload Button -->
        <div class="form-group" style="text-align: center; margin-top: 1.5rem;">
            <button type="submit" class="royal-btn"
                style="padding: 0.75rem 2rem; background-color: #2ecc71; color: white; border: none; border-radius: 4px; cursor: pointer; font-weight: 500; display: inline-flex; align-items: center; gap: 0.5rem;">
                <i class="fas fa-upload"></i> Upload File
            </button>
        </div>
    </form>
</div>
            
        </div>
    </div>
<!-- Modal Structure -->
<!-- Modal -->
<!-- Modal -->
<div id="docModal" class="modal" style="display:none; position:fixed; top:0; left:0; width:100%; height:100%; background:rgba(0,0,0,0.6); z-index:9999;">
  <div class="modal-content" style="background:#fff; margin:5% auto; padding:20px; width:80%; position:relative; border-radius:8px;">
    <button id="closeModal" style="position:absolute; top:10px; right:10px; background:red; color:white; border:none; border-radius:4px; padding:5px 10px; cursor:pointer;">Close ✖</button>
    <iframe id="docViewer" width="100%" height="500px" style="border:none;"></iframe>
  </div>
</div>
<div id="toast" style="
  visibility: hidden;
  min-width: 300px;
  background-color: #0078d4;
  color: white;
  text-align: center;
  border-radius: 8px;
  padding: 16px;
  position: fixed;
  z-index: 99999;
  top: 20px;
  right: 20px;
  font-size: 16px;
  box-shadow: 0 4px 12px rgba(0,0,0,0.15);
  opacity: 0;
  transition: opacity 0.5s ease, visibility 0.5s;
">
  ✅ File uploaded successfully!
</div>


    <!-- Floating Particles -->
    <div class="particles" id="particles"></div>
<script src="https://alcdn.msauth.net/browser/2.19.0/js/msal-browser.min.js"></script>

    <script>
    $('#reconnectBtn').click(function () {
        $('#status').text('Reconnecting and re-indexing...');

        $.ajax({
          url: '/dm/reconnect-index',  // Your backend endpoint
          method: 'POST',
          contentType: 'application/json',
          data: JSON.stringify({
            indexName: 'openai' // index name to use
          }),
          success: function (response) {
            $('#status').text('Reconnection and re-indexing successful!');
          },
          error: function (xhr, status, error) {
            $('#status').text('Error: ' + xhr.responseText || error);
          }
        });
      });
    function handleFileUpload(input) {
        const file = input.files[0];
        if (file) {
            console.log("File selected:", file.name);
            // Add your file handling logic here
        }
    }

    function toggleMobileMenu() {
        const menu = document.getElementById('mobileStatusMenu');
        const overlay = document.getElementById('menuOverlay');
        menu.classList.toggle('open');
        overlay.classList.toggle('active');
      }

      function closeMobileMenu() {
        document.getElementById('mobileStatusMenu').classList.remove('open');
        document.getElementById('menuOverlay').classList.remove('active');
      }
    // Optional: close dropdown if clicked outside
    window.addEventListener('click', function (event) {
      const dropdown = document.getElementById("manualsDropdown"); 
      if (!event.target.closest('.dropdown')) {
        dropdown.classList.remove("show");
      }
    });

    function toggleDropdown() {
        const dropdown = document.getElementById("manualsDropdown");
        dropdown.style.display = (dropdown.style.display === "block") ? "none" : "block";
    }

    // Optional: Close dropdown when clicking outside
    window.onclick = function(event) {
        if (!event.target.closest('.dropdown')) {
            document.getElementById("manualsDropdown").style.display = "none";
        }
    }
    const msalConfig = {
            auth: {
                clientId: "1febe68d-bdea-4be1-9cfe-8db99146a291",
                authority: "https://login.microsoftonline.com/c93065f9-8587-4bfc-9b43-c2afa0dc5650", 
                redirectUri: "http://localhost/dm/home",
            },
            cache: {
                cacheLocation: "localStorage",
                storeAuthStateInCookie: true,
            }
        };

        const msalInstance = new msal.PublicClientApplication(msalConfig);

        const loginRequest = {
            scopes: ["User.Read"]
        };

        function updateUI(account) {
            if (account && Object.keys(account).length > 0) {
                document.getElementById("loginContainer").style.display = "none";
                const iframe = document.getElementById("dashboardIframe");
                iframe.src = "https://openairesl.azurewebsites.net/";
                iframe.style.display = "block";
                document.getElementById("logoutBtn").style.display = "inline-block";
                document.getElementById("iframewrapper").style.display = "block";
            } else {
                document.getElementById("loginContainer").style.display = "block";
                document.getElementById("statusText").innerHTML = "You do not seem to have a Microsoft Account. If so, please create one to access this tab. In case you already have, please login using the tab given below<br> <b>OpenAI ReSL ChatBot.</b></p>";
                document.getElementById("dashboardIframe").style.display = "none";
                document.getElementById("logoutBtn").style.display = "none";
                document.getElementById("iframewrapper").style.display = "none";
            }
        }

        function handleResponse(response) {
            if (response !== null && response.account) {
                updateUI(response.account);
            } else {
                const currentAccounts = msalInstance.getAllAccounts();
                if (currentAccounts.length === 1) {
                    updateUI(currentAccounts[0]);
                } else if (currentAccounts.length > 1) {
                    // Optional: let user choose account
                    updateUI(currentAccounts[0]);
                }
            }
        }

        $(document).ready(function () {
            // Try silent login first
            msalInstance.ssoSilent(loginRequest)
                .then(handleResponse)
                .catch(error => {
                    const accounts = msalInstance.getAllAccounts();
                    if (accounts.length > 0) {
                        msalInstance.acquireTokenSilent({
                            ...loginRequest,
                            account: accounts[0]
                        }).then(handleResponse).catch(err => {
                            console.error("Silent token acquisition failed:", err);
                        });
                    }
                });

            // Login button click
            $("#loginBtn").click(function () {
                msalInstance.loginPopup(loginRequest)
                    .then(handleResponse)
                    .catch(error => {
                        console.error("Login failed:", error);
                    });
            });

            // Logout button click
            $("#logoutBtn").click(function () {
                const logoutRequest = {
                    account: msalInstance.getAllAccounts()[0]
                };
                msalInstance.logoutPopup(logoutRequest)
                    .then(() => {
                        updateUI(null);
                    })
                    .catch(error => {
                        console.error("Logout failed:", error);
                    });
            });

            // Set initial UI based on existing account
            const currentAccount = msalInstance.getAllAccounts()[0] || null;
            updateUI(currentAccount);
        });
    $('#closeModal').on('click', function() {
        $('#docModal').hide();
        $('#docViewer').attr('src', '');
    });

        // Initialize all nodes as collapsed
        document.querySelectorAll('.node-content').forEach(node => {
            node.classList.remove('show');
        });
        function eraseChat() {
            const chatDisplay = document.getElementById("chatDisplay");
            const messages = chatDisplay.querySelectorAll(".message, .typing-indicator");

            messages.forEach((msg, index) => {
                setTimeout(() => {
                    msg.classList.add("fade-out");
                    setTimeout(() => msg.remove(), 500); // remove after fade-out
                }, index * 100); // staggered animation
            });
        }
        // Toggle mobile menu
        const menuToggle = document.getElementById('menuToggle');
        const sidePanel = document.getElementById('sidePanel');
        const overlay = document.getElementById('overlay');
        
        menuToggle.addEventListener('click', function() {
            sidePanel.classList.toggle('active');
            overlay.classList.toggle('active');
        });
        
        overlay.addEventListener('click', function() {
            sidePanel.classList.remove('active');
            overlay.classList.remove('active');
        });
        
        // Modal functions
        function openModal(type) {
            document.getElementById("modal").style.display = "block";
            document.getElementById("create-container-form").style.display = (type === 'create') ? "block" : "none";
            document.getElementById("upload-file-form").style.display = (type === 'upload') ? "block" : "none";
            // Close mobile menu if open
            sidePanel.classList.remove('active');
            overlay.classList.remove('active');
        }
        
        function closeModal() {
            document.getElementById("modal").style.display = "none";
        }
        
        // Close modal when clicking outside
        window.addEventListener('click', function(event) {
            if (event.target == document.getElementById('modal')) {
                closeModal();
            }
        });
        
        // Create floating particles
        function createParticles() {
            const particlesContainer = document.getElementById('particles');
            const particleCount = 20;
            
            for (let i = 0; i < particleCount; i++) {
                const particle = document.createElement('div');
                particle.classList.add('particle');
                
                // Random size between 2px and 5px
                const size = Math.random() * 3 + 2;
                particle.style.width = `${size}px`;
                particle.style.height = `${size}px`;
                
                // Random position
                particle.style.left = `${Math.random() * 100}%`;
                particle.style.bottom = `-10px`;
                
                // Random animation duration and delay
                const duration = Math.random() * 10 + 10;
                const delay = Math.random() * 5;
                particle.style.animation = `float ${duration}s ${delay}s infinite linear`;
                
                particlesContainer.appendChild(particle);
            }
        }
        
        // Delete container function
        function deleteContainer(containerName, event) {
            event.stopPropagation();
            
            if (confirm(`Delete container "${containerName}" and all its contents?`)) {
                fetch('/dm/deleteContainer', {
                    method: 'POST',
                    headers: {
                        'Content-Type': 'application/x-www-form-urlencoded'
                    },
                    body: 'containerName=' + encodeURIComponent(containerName)
                })
                .then(response => response.text())
                .then(result => {
                    location.reload();
                })
                .catch(error => {
                	 location.reload();
                });
            }
        }
        
        // Toggle data nodes with smooth animation
        function toggleNode(header) {
            const node = header.parentElement;
            const content = node.querySelector('.node-content');
            const icon = node.querySelector('.fa-chevron-right');
            
            content.classList.toggle('show');
            icon.classList.toggle('fa-chevron-down');
        }
        function createIcons(uniqueId) {
            const icons = document.createElement('div');
            icons.className = 'action-icons';
            icons.innerHTML = `
             /*    <button class="copy-btn">📋</button>
                <button class="regenerate-btn">🔁</button>
                <button class="like-btn">👍</button>
                <button class="dislike-btn">👎</button> */
               // <div class="response-nav">
                //    <button class="prev-resp">←</button>
                  //  <span class="resp-count">1/1</span>
                 //   <button class="next-resp">→</button>
               // </div>
            `;

            icons.querySelector('.copy-btn').onclick = () => {
                const current = chatHistory[uniqueId].currentIndex;
                navigator.clipboard.writeText(chatHistory[uniqueId].responses[current]);
                alert("Copied!");
            };

            icons.querySelector('.regenerate-btn').onclick = () => {
                const query = chatHistory[uniqueId].query;
                sendQuery(true, query, uniqueId); // Reuse ID
            };

            icons.querySelector('.prev-resp').onclick = () => navigateResponse(uniqueId, -1);
            icons.querySelector('.next-resp').onclick = () => navigateResponse(uniqueId, 1);

            return null;
        }
        function navigateResponse(uniqueId, direction) {
            const entry = chatHistory[uniqueId];
            const newIndex = entry.currentIndex + direction;

            if (newIndex >= 0 && newIndex < entry.responses.length) {
                entry.currentIndex = newIndex;

                const wrapper = document.querySelector(`.ai-response-wrapper[data-id="${uniqueId}"]`);
                wrapper.dataset.index = newIndex;

                const messageDiv = wrapper.querySelector('.ai-message');
                messageDiv.innerHTML = entry.responses[newIndex];

                updateSlider(wrapper, uniqueId);
                saveChatToLocal();
            }
        }

        function updateSlider(wrapper, uniqueId) {
            const entry = chatHistory[uniqueId];
            const count = wrapper.querySelector('.resp-count');
            count.textContent = `${entry.currentIndex + 1}/${entry.responses.length}`;
        }

        // Send query to AI
function sendQuery(originalQuery = null) {
    const input = document.getElementById('royal-input');
    if (!input) {
        console.error('Input element with id "royal-input" not found.');
        return;
    }
    const query = originalQuery !== null ? originalQuery.trim() : input.value.trim();
    if (!query) return;

    const selectedModel = document.getElementById('modelSelector')?.value || '';
    const chatDisplay = document.getElementById('chatDisplay');
    if (!chatDisplay) {
        console.error('Chat display element with id "chatDisplay" not found.');
        return;
    }

    let aiMessage, contentDiv, responseContainer, responses = [], currentResponseIndex = 0;

    if (originalQuery === null) {
        // User message (left side)
        const userMessage = document.createElement('div');
        userMessage.className = 'message user-message';
        userMessage.style.cssText = `
            text-align: left;
            position: relative;
            top: 2rem;
            margin-right: auto;
            background-color: #e3f2fd;
            border-radius: 10px;
            padding: 10px;
            max-width: 80%;
            margin-bottom: 10px;
        `;
        userMessage.textContent = query;
        chatDisplay.appendChild(userMessage);
        input.value = '';

        // Create AI message container (right side)
        aiMessage = document.createElement('div');
        aiMessage.className = 'message ai-message';
        aiMessage.style.cssText = `
            //text-align: right;
        	 position: relative;
            top: 2rem;
            margin-left: auto;
            background-color: #f5f5f5;
            border-radius: 10px;
            padding: 10px;
            max-width: 80%;
            margin-bottom: 10px;
            position: relative;
        `;
        aiMessage.dataset.query = query;
        
        contentDiv = document.createElement('div');
        contentDiv.className = 'ai-content';
        aiMessage.appendChild(contentDiv);
        
        responseContainer = document.createElement('div');
        responseContainer.className = 'response-container';
        aiMessage.appendChild(responseContainer);
        
        chatDisplay.appendChild(aiMessage);
    } else {
        // Find existing AI message for this query
        aiMessage = Array.from(chatDisplay.getElementsByClassName('ai-message')).find(
            msg => msg.dataset.query === query
        );
        if (aiMessage) {
            contentDiv = aiMessage.querySelector('.ai-content');
            responseContainer = aiMessage.querySelector('.response-container');
            responses = JSON.parse(aiMessage.dataset.responses || '[]');
            currentResponseIndex = responses.length;
        } else {
            console.error('AI message for query not found.');
            return;
        }
    }

    // Add typing indicator
    const typingIndicator = document.createElement('div');
    typingIndicator.id = 'currentTypingIndicator';
    typingIndicator.className = 'typing-indicator';
    typingIndicator.innerHTML = `
        <div class="typing-container" style="display:flex; align-items:center; gap:5px; justify-content:flex-end;">
            <span class="typing-text" style="font-weight:bold;">Generating answer</span>
            <div class="typing-dot"></div>
            <div class="typing-dot"></div>
            <div class="typing-dot"></div>
        </div>`;
    responseContainer.appendChild(typingIndicator);
    chatDisplay.scrollTop = chatDisplay.scrollHeight;

    // AJAX POST to server
    $.post("/dm/askAI", { question: query, deploy: selectedModel }, function(response) {
        typingIndicator.remove();

        // Extract and clean citations
        const citationPattern = /\{\*(https?:\/\/[^\*\}]+)\*\}/g;
        let urlSet = new Set();
        let match;
        while ((match = citationPattern.exec(response)) !== null) {
            if (match[1].startsWith("http")) urlSet.add(match[1]);
        }
        const urls = Array.from(urlSet);
        const cleanResponse = response.replace(citationPattern, '').trim();

        // Store response
        responses.push(cleanResponse);
        aiMessage.dataset.responses = JSON.stringify(responses);

        // Update content
        contentDiv.innerHTML = '';
        let i = 0;
        const text = cleanResponse;
        const interval = setInterval(() => {
            if (i < text.length) {
                if (text[i] === '\n') {
                    contentDiv.innerHTML += '<br>';
                } else {
                    contentDiv.innerHTML += text[i];
                }
                i++;
                chatDisplay.scrollTop = chatDisplay.scrollHeight;
            } else {
                clearInterval(interval);
            }
        }, 15);

        // Create controls container (left bottom corner)
       /*  const controlsContainer = document.createElement('div');
        controlsContainer.style.cssText = `
            position: absolute;
            left: 5px;
            top: 4rem;
            bottom: 5px;
            display: flex;
            gap: 5px;
            align-items: center;
        `;
        aiMessage.appendChild(controlsContainer);

        // Copy button
        const copyBtn = document.createElement('button');
        copyBtn.className = 'action-btn';
        copyBtn.title = 'Copy';
        copyBtn.textContent = '📋';
        copyBtn.style.cssText = `
            cursor: pointer;
            border: 1px solid #ccc;
            background: transparent;
            border-radius: 4px;
            padding: 2px 5px;
            font-size: 12px;
        `;
        copyBtn.onclick = () => {
            navigator.clipboard.writeText(contentDiv.innerText).then(() => {
                // Create and show "Copied" popup
                const popup = document.createElement('div');
                popup.textContent = 'Copied!';
                popup.style.cssText = `
                    position: fixed;
                    top: 20px;
                    left: 50%;
                    transform: translateX(-50%);
                    background-color: #333;
                    color: #fff;
                    padding: 5px 10px;
                    border-radius: 4px;
                    z-index: 1000;
                    box-shadow: 0 2px 5px rgba(0,0,0,0.2);
                    font-size: 12px;
                `;
                document.body.appendChild(popup);
                
                setTimeout(() => {
                    document.body.removeChild(popup);
                }, 2000);
            });
        };
        controlsContainer.appendChild(copyBtn);

        // Reload button
        const reloadBtn = document.createElement('button');
        reloadBtn.className = 'action-btn';
        reloadBtn.title = 'Regenerate';
        reloadBtn.textContent = '🔄';
        reloadBtn.style.cssText = `
            cursor: pointer;
            border: 1px solid #ccc;
            background: transparent;
            border-radius: 4px;
            padding: 2px 5px;
            font-size: 12px;
        `;
        reloadBtn.onclick = () => {
            contentDiv.innerHTML = '';
            sendQuery(query);
        };
        controlsContainer.appendChild(reloadBtn);

        // Like button
        const likeBtn = document.createElement('button');
        likeBtn.className = 'action-btn';
        likeBtn.title = 'Like';
        likeBtn.textContent = '👍';
        likeBtn.style.cssText = `
            cursor: pointer;
            border: 1px solid #ccc;
            background: transparent;
            border-radius: 4px;
            padding: 2px 5px;
            font-size: 12px;
        `;
        likeBtn.onclick = () => {
            likeBtn.style.backgroundColor = '#ffeb3b';
            dislikeBtn.style.display = 'none';
        };
        controlsContainer.appendChild(likeBtn);

        // Dislike button
        const dislikeBtn = document.createElement('button');
        dislikeBtn.className = 'action-btn';
        dislikeBtn.title = 'Dislike';
        dislikeBtn.textContent = '👎';
        dislikeBtn.style.cssText = `
            cursor: pointer;
            border: 1px solid #ccc;
            background: transparent;
            border-radius: 4px;
            padding: 2px 5px;
            font-size: 12px;
        `;
        dislikeBtn.onclick = () => {
            dislikeBtn.style.backgroundColor = '#ffeb3b';
            likeBtn.style.display = 'none';
            
            // Show feedback popup
            const popup = document.createElement('div');
            popup.textContent = 'Feedback received. Thank you.';
            popup.style.cssText = `
                position: fixed;
                bottom: 20px;
                left: 50%;
                transform: translateX(-50%);
                background-color: #333;
                color: #fff;
                padding: 5px 10px;
                border-radius: 4px;
                z-index: 1000;
                box-shadow: 0 2px 5px rgba(0,0,0,0.2);
                font-size: 12px;
            `;
            document.body.appendChild(popup);
            
            setTimeout(() => {
                document.body.removeChild(popup);
            }, 2000);
        };
        controlsContainer.appendChild(dislikeBtn);

        // Speaker button
        const speakerBtn = document.createElement('button');
        speakerBtn.className = 'action-btn';
        speakerBtn.title = 'Read aloud';
        speakerBtn.textContent = '🔊';
        speakerBtn.style.cssText = `
            cursor: pointer;
            border: 1px solid #ccc;
            background: transparent;
            border-radius: 4px;
            padding: 2px 5px;
            font-size: 12px;
        `;
        speakerBtn.onclick = () => {
            const speech = new SpeechSynthesisUtterance();
            speech.text = contentDiv.innerText;
            speech.volume = 1;
            speech.rate = 1;
            speech.pitch = 1;
            
            const voices = window.speechSynthesis.getVoices();
            const femaleVoice = voices.find(voice => 
                voice.name.includes('Female') || 
                voice.name.includes('Woman') || 
                voice.name.includes('Alice')
            );
            
            if (femaleVoice) {
                speech.voice = femaleVoice;
            }
            
            window.speechSynthesis.speak(speech);
        };
        controlsContainer.appendChild(speakerBtn); */

        // Response navigation
      /*   const navContainer = document.createElement('div');
        navContainer.style.cssText = `
            display: flex;
            align-items: center;
            gap: 5px;
            margin-left: 5px;
        `;
        controlsContainer.appendChild(navContainer);

        const prevArrow = document.createElement('button');
        prevArrow.className = 'nav-arrow';
        prevArrow.textContent = '←';
        prevArrow.style.cssText = `
            cursor: pointer;
            border: 1px solid #ccc;
            background: transparent;
            border-radius: 4px;
            padding: 2px 5px;
            font-size: 12px;
        `;
        prevArrow.disabled = currentResponseIndex === 0;
        prevArrow.onclick = () => {
            if (currentResponseIndex > 0) {
                currentResponseIndex--;
                contentDiv.innerHTML = responses[currentResponseIndex].replace(/\n/g, '<br>');
                countSpan.textContent = `${currentResponseIndex + 1}/${responses.length}`;
                chatDisplay.scrollTop = chatDisplay.scrollHeight;
            }
        };
        navContainer.appendChild(prevArrow);

        const countSpan = document.createElement('span');
        countSpan.className = 'response-count';
        countSpan.style.cssText = `
            font-size: 12px;
            padding: 0 2px;
        `;
        countSpan.textContent = '';
        countSpan.textContent = currentResponseIndex + 1;
        navContainer.appendChild(countSpan);

        const nextArrow = document.createElement('button');
        nextArrow.className = 'nav-arrow';
        nextArrow.textContent = '';
        nextArrow.textContent = '→';
        nextArrow.style.cssText = `
            cursor: pointer;
            border: 1px solid #ccc;
            background: transparent;
            border-radius: 4px;
            padding: 2px 5px;
            font-size: 12px;
        `;
        nextArrow.disabled = currentResponseIndex === responses.length - 1;
        nextArrow.onclick = () => {
            if (currentResponseIndex < responses.length - 1) {
                currentResponseIndex++;
                contentDiv.innerHTML = responses[currentResponseIndex].replace(/\n/g, '<br>');
                countSpan.textContent = `${currentResponseIndex + 1}/${responses.length}`;
                chatDisplay.scrollTop = chatDisplay.scrollHeight;
            }
        };
        navContainer.appendChild(nextArrow); */

        // Citations
        if (urls.length > 0) {
            const refContainer = document.createElement('div');
            refContainer.style.cssText = `
                margin-top: 10px;
                text-align: right;
            `;
            
            const refHeader = document.createElement('div');
            refHeader.style.cssText = `
                font-weight: bold;
                margin-bottom: 5px;
                font-size: 12px;
            `;
            refHeader.textContent = `${urls.length} reference${urls.length > 1 ? 's' : ''}`;
            refContainer.appendChild(refHeader);

            const citationList = document.createElement('div');
            citationList.className = 'citation-list';
            citationList.style.cssText = `
                display: flex;
                flex-wrap: wrap;
                gap: 5px;
                justify-content: flex-end;
            `;

            urls.forEach((url, idx) => {
                const filename = decodeURIComponent(url.substring(url.lastIndexOf('/') + 1));
                const refDiv = document.createElement('div');
                refDiv.style.cssText = `
                    border: 1px solid #000;
                    padding: 2px 5px;
                    border-radius: 4px;
                    cursor: pointer;
                    background: #f9f9f9;
                    user-select: none;
                    font-size: 12px;
                `;
                refDiv.title = filename;
                refDiv.innerHTML = `<span style="margin-right:3px; font-weight:bold;">${idx + 1}</span><a href="#" class="doc-link" data-url="${url}" data-filename="${filename}" style="text-decoration:none; color:#007bff;">${filename}</a>`;
                citationList.appendChild(refDiv);
            });

            refContainer.appendChild(citationList);
            responseContainer.appendChild(refContainer);

            $(aiMessage).find('.doc-link').off('click').on('click', function(e) {
                e.preventDefault();
                const filename = $(this).data('filename');
                if (!filename) {
                    alert("Filename missing.");
                    return;
                }
                $.post('/dm/generateBlobUrl', { filename: filename }, function(sasUrl) {
                    if (!sasUrl || sasUrl.includes("AccessDenied") || sasUrl.includes("error")) {
                        alert("Invalid or inaccessible file URL.");
                        return;
                    }
                    const extension = filename.split('.').pop().toLowerCase();
                    let viewerUrl = '';
                    let openInIframe = true;
                    if (['doc','docx','ppt','pptx','xls','xlsx'].includes(extension)) {
                        viewerUrl = 'https://view.officeapps.live.com/op/embed.aspx?src=' + encodeURIComponent(sasUrl);
                    } else if (extension === 'pdf') {
                        viewerUrl = sasUrl;
                    } else if (['jpg','jpeg','png','gif','bmp','svg','webp'].includes(extension)) {
                        viewerUrl = sasUrl;
                    } else {
                        window.open(sasUrl, '_blank');
                        openInIframe = false;
                    }
                    if (openInIframe) {
                        $('#docViewer').attr('src', viewerUrl);
                        $('#docModal').fadeIn();
                    }
                }).fail(function(xhr, status, error) {
                    alert("Failed to get secure link: " + error);
                });
            });
        }

        chatDisplay.scrollTop = chatDisplay.scrollHeight;
    }).fail(function() {
        typingIndicator.remove();
        const errorMessage = document.createElement('div');
        errorMessage.className = 'message ai-message';
        errorMessage.textContent = "SYSTEM ERROR: Unable to process request";
        responseContainer.appendChild(errorMessage);
        chatDisplay.scrollTop = chatDisplay.scrollHeight;
    });
}
function processAIResponse(response, chatDisplay, originalQuery) {
    const indicator = document.getElementById('currentTypingIndicator');
    if (indicator) indicator.remove();

    // Process citations and clean response
    const citationPattern = /\{\*(https?:\/\/[^\*\}]+)\*\}/g;
    let urlSet = new Set();
    let match;
    while ((match = citationPattern.exec(response)) !== null) {
        if (match[1].startsWith("http")) urlSet.add(match[1]);
    }
    const urls = Array.from(urlSet);
    const cleanResponse = response.replace(citationPattern, '').trim();

    // Create AI message container
    const aiMessage = document.createElement('div');
    aiMessage.className = 'message ai-message';

    // Content div
    const contentDiv = document.createElement('div');
    contentDiv.className = 'ai-content';
    aiMessage.appendChild(contentDiv);

    // Create action buttons
    createActionButtons(aiMessage, contentDiv, originalQuery);

    chatDisplay.appendChild(aiMessage);
    animateText(contentDiv, cleanResponse);

    // Add citations if available
    if (urls.length > 0) {
        addCitations(aiMessage, urls);
    }
}

function createActionButtons(container, contentDiv, originalQuery) {
    const actionDiv = document.createElement('div');
    actionDiv.className = 'action-icons';

    // Copy button
    const copyBtn = createIconButton('Copy', 'copy-icon', () => {
        navigator.clipboard.writeText(contentDiv.innerText)
            .then(() => showTooltip(copyBtn, 'Copied!'));
    });
    actionDiv.appendChild(copyBtn);

    // Reload button
    const reloadBtn = createIconButton('Regenerate', 'reload-icon', () => {
        reloadBtn.innerHTML = '<div class="spinner"></div>';
        setTimeout(() => {
            container.remove();
            sendQuery(originalQuery);
        }, 300);
    });
    actionDiv.appendChild(reloadBtn);

    // Like/Dislike buttons
    const likeBtn = createIconButton('Like', 'like-icon', () => {
        likeBtn.classList.toggle('active');
        if (dislikeBtn.classList.contains('active')) {
            dislikeBtn.classList.remove('active');
        }
    });
    actionDiv.appendChild(likeBtn);

    const dislikeBtn = createIconButton('Dislike', 'dislike-icon', () => {
        dislikeBtn.classList.toggle('active');
        if (likeBtn.classList.contains('active')) {
            likeBtn.classList.remove('active');
        }
        showFeedbackMessage('We regret that you disliked this response. We will try to improve.');
    });
    actionDiv.appendChild(dislikeBtn);

    container.appendChild(actionDiv);
}

function createIconButton(title, iconClass, onClick) {
    const btn = document.createElement('button');
    btn.title = title;
    btn.className = `icon-btn ${iconClass}`;
    btn.addEventListener('click', onClick);
    return btn;
}

function animateText(element, text) {
    let i = 0;
    element.innerHTML = '';
    const interval = setInterval(() => {
        if (i < text.length) {
            element.innerHTML += text[i] === '\n' ? '<br>' : text[i];
            i++;
            element.parentElement.scrollTop = element.parentElement.scrollHeight;
        } else {
            clearInterval(interval);
        }
    }, 15);
}

function addCitations(container, urls) {
    const refContainer = document.createElement('div');
    refContainer.className = 'citation-container';

    const refHeader = document.createElement('div');
    refHeader.className = 'citation-header';
    refHeader.textContent = `${urls.length} reference${urls.length > 1 ? 's' : ''}`;
    refContainer.appendChild(refHeader);

    const citationList = document.createElement('div');
    citationList.className = 'citation-list';

    urls.forEach((url, idx) => {
        const filename = decodeURIComponent(url.substring(url.lastIndexOf('/') + 1));
        const refDiv = document.createElement('div');
        refDiv.className = 'citation-item';
        refDiv.innerHTML = `
            <span class="citation-number">${idx + 1}</span>
            <a href="#" class="doc-link" data-url="${url}" data-filename="${filename}">
                ${filename}
            </a>
        `;
        citationList.appendChild(refDiv);
    });

    refContainer.appendChild(citationList);
    container.appendChild(refContainer);

    // Add click handlers for document links
    container.querySelectorAll('.doc-link').forEach(link => {
        link.addEventListener('click', handleDocLinkClick);
    });
}

function handleDocLinkClick(event) {
    event.preventDefault();
    const filename = event.target.dataset.filename;
    if (!filename) return;

    fetch('/dm/generateBlobUrl', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json',
        },
        body: JSON.stringify({ filename })
    })
    .then(response => response.json())
    .then(sasUrl => {
        if (!sasUrl || sasUrl.includes("AccessDenied") || sasUrl.includes("error")) {
            throw new Error('Invalid or inaccessible file URL');
        }
        openDocumentViewer(sasUrl, filename);
    })
    .catch(error => {
        console.error('Failed to get secure link:', error);
    });
}

function openDocumentViewer(url, filename) {
    const extension = filename.split('.').pop().toLowerCase();
    let viewerUrl = '';
    let openInIframe = true;

    if (['doc','docx','ppt','pptx','xls','xlsx'].includes(extension)) {
        // Properly encode the URL for Office Online Viewer
        viewerUrl = 'https://view.officeapps.live.com/op/embed.aspx?src=' + 
                   encodeURIComponent(url);
    } else if (extension === 'pdf') {
        viewerUrl = url;
    } else if (['jpg','jpeg','png','gif','bmp','svg','webp'].includes(extension)) {
        viewerUrl = url;
    } else {
        window.open(url, '_blank');
        openInIframe = false;
    }

    if (openInIframe) {
        document.getElementById('docViewer').src = viewerUrl;
        document.getElementById('docModal').style.display = 'block';
    }
}
function showTooltip(element, message) {
    const tooltip = document.createElement('div');
    tooltip.className = 'tooltip';
    tooltip.textContent = message;
    element.appendChild(tooltip);
    setTimeout(() => tooltip.remove(), 2000);
}

function showFeedbackMessage(message) {
    const feedbackMsg = document.createElement('div');
    feedbackMsg.className = 'feedback-message';
    feedbackMsg.textContent = message;
    document.body.appendChild(feedbackMsg);
    setTimeout(() => feedbackMsg.remove(), 3000);
}

function handleError(error, chatDisplay) {
    const indicator = document.getElementById('currentTypingIndicator');
    if (indicator) indicator.remove();

    const errorMessage = document.createElement('div');
    errorMessage.className = 'message error-message';
    errorMessage.textContent = "Error: Unable to process request";
    chatDisplay.appendChild(errorMessage);
    chatDisplay.scrollTop = chatDisplay.scrollHeight;
}

// Add styles
const style = document.createElement('style');
style.textContent = `
.message {
    margin: 10px;
    padding: 12px;
    border-radius: 8px;
    max-width: 80%;
}

.user-message {
    background: #e3f2fd;
    align-self: flex-end;
}

.ai-message {
    background: #f5f5f5;
    align-self: flex-start;
}

.error-message {
    background: #ffebee;
    color: #d32f2f;
}

.typing-indicator {
    display: flex;
    align-items: center;
    gap: 8px;
    padding: 12px;
}

.typing-dot {
    width: 8px;
    height: 8px;
    background: #666;
    border-radius: 50%;
    animation: typingAnimation 1.4s infinite ease-in-out;
}

.typing-dot:nth-child(2) {
    animation-delay: 0.2s;
}

.typing-dot:nth-child(3) {
    animation-delay: 0.4s;
}

@keyframes typingAnimation {
    0%, 60%, 100% { transform: translateY(0); }
    30% { transform: translateY(-5px); }
}

.action-icons {
    display: flex;
    gap: 8px;
    margin-top: 8px;
}

.icon-btn {
    background: none;
    border: none;
    cursor: pointer;
    padding: 4px;
    border-radius: 4px;
    transition: all 0.2s;
}

.icon-btn:hover {
    background: #f0f0f0;
}

.like-icon.active {
    color: #FFD700;
}

.dislike-icon.active {
    color: #FF0000;
}

.spinner {
    width: 16px;
    height: 16px;
    border: 2px solid #f3f3f3;
    border-top: 2px solid #3498db;
    border-radius: 50%;
    animation: spin 1s linear infinite;
}

@keyframes spin {
    0% { transform: rotate(0deg); }
    100% { transform: rotate(360deg); }
}

.tooltip {
    position: absolute;
    background: #333;
    color: white;
    padding: 4px 8px;
    border-radius: 4px;
    font-size: 12px;
    top: -30px;
    left: 50%;
    transform: translateX(-50%);
    z-index: 100;
}

.feedback-message {
    position: fixed;
    top: 20px;
    left: 20px;
    background: #ffebee;
    color: #d32f2f;
    padding: 10px 15px;
    border-radius: 4px;
    box-shadow: 0 2px 10px rgba(0,0,0,0.1);
    z-index: 1000;
    animation: fadeIn 0.3s, fadeOut 0.3s 2.7s forwards;
}

@keyframes fadeIn {
    from { opacity: 0; transform: translateY(-10px); }
    to { opacity: 1; transform: translateY(0); }
}

@keyframes fadeOut {
    from { opacity: 1; transform: translateY(0); }
    to { opacity: 0; transform: translateY(-10px); }
}

.citation-container {
    margin-top: 12px;
    padding-top: 8px;
    border-top: 1px solid #ddd;
}

.citation-header {
    font-weight: bold;
    margin-bottom: 6px;
}

.citation-list {
    display: flex;
    flex-wrap: wrap;
    gap: 6px;
}

.citation-item {
    border: 1px solid #ccc;
    padding: 4px 8px;
    border-radius: 4px;
    background: #f9f9f9;
}

.citation-number {
    font-weight: bold;
    margin-right: 6px;
}

.doc-link {
    text-decoration: none;
    color: #007bff;
}
`;
document.head.appendChild(style);
// Close modal on click
$('#closeModal').on('click', function() {
    $('#docModal').hide();
    $('#docViewer').attr('src', '');
});

document.getElementById('dashboard').addEventListener('click', () => {
	  const iframe = document.getElementById('dashboardIframe');
	  iframe.style.transform = 'scale(0.99)';
	  setTimeout(() => {
	    iframe.style.transform = 'scale(1.1)';
	  }, 50);
	});
	
        // Initialize on load
        window.onload = function() {
        	 const iframe = document.getElementById("dashboardIframe");
        	 const targetSrc = "https://openairesl.azurewebsites.net/";
        	 const src = iframe.src;
                 iframe.src = targetSrc;
                 iframe.style.display = "block";
            createParticles();
            
            // Allow Enter to send (Shift+Enter for new line)
            document.getElementById('royal-input').addEventListener('keydown', function(e) {
                if (e.key === 'Enter' && !e.shiftKey) {
                    e.preventDefault();
                    sendQuery();
                }
            });
        };
        
        function deleteFile(containerName, fileName) {
            if (confirm("Are you sure you want to delete '" + fileName + "'?")) {
                fetch('/dm/deleteFile', {
                    method: 'POST',
                    headers: {
                        'Content-Type': 'application/x-www-form-urlencoded'
                    },
                    body: new URLSearchParams({
                        containerName: containerName,
                        fileName: fileName
                    })
                })
                .then(response => response.text())
                .then(message => {
                    alert(message);
                    location.reload(); // Refresh the page after deletion
                })
                .catch(error => {
                    alert("Error deleting file.");
                });
            }
        }
        function switchTab(tabName) {
            // Hide all tab panes
            document.querySelectorAll('.tab-pane').forEach(pane => {
                pane.classList.remove('active');
            });
            
            // Deactivate all tab buttons
            document.querySelectorAll('.tab-button').forEach(button => {
                button.classList.remove('active');
            });
            
            // Activate selected tab
            document.getElementById(tabName + '-tab').classList.add('active');
            document.querySelector('.tab-button[onclick="switchTab(\'' + tabName + '\')"]').classList.add('active');

            
            if (tabName === 'dashboard') {
            	 const iframe = document.getElementById("dashboardIframe");
            	 const targetSrc = "https://openairesl.azurewebsites.net/";
            	 const src = iframe.src;
                 if (src !== targetSrc) {
                     iframe.src = targetSrc;
                     iframe.style.display = "block";
                 }
            } 

        }
        $('#dashboardIframe').on('load', function () {
            console.log('Iframe loaded:', $(this).attr('src'));
          }).on('error', function () {
            alert('Iframe failed to load!');
          });
        // Initialize the iframe size when page loads
        window.addEventListener('load', function() {
            const iframe = document.querySelector('.dashboard-iframe');
            if (iframe) {
                iframe.style.height = iframe.parentElement.clientHeight + 'px';
            }
        });
        
        // Handle window resize
        window.addEventListener('resize', function() {
            const activeTab = document.querySelector('.tab-pane.active');
            if (activeTab && activeTab.id === 'dashboard-tab') {
                const iframe = document.querySelector('.dashboard-iframe');
                iframe.style.height = iframe.parentElement.clientHeight + 'px';
            }
        });
        function openVideoModal() {
            const modal = document.getElementById("videoModal");
            const video = document.getElementById("manualVideo");
            modal.style.display = "block";
            video.currentTime = 0;
            video.play();
        }

        function closeVideoModal() {
            const modal = document.getElementById("videoModal");
            const video = document.getElementById("manualVideo");
            video.pause();
            modal.style.display = "none";
        }

        function skipTime(seconds) {
            const video = document.getElementById("manualVideo");
            video.currentTime += seconds;
        }

        function togglePlayPause() {
            const video = document.getElementById("manualVideo");
            if (video.paused) {
                video.play();
            } else {
                video.pause();
            }
        }

        function setVolume(value) {
            const video = document.getElementById("manualVideo");
            video.volume = parseFloat(value);
        }

        function setSpeed(value) {
            const video = document.getElementById("manualVideo");
            video.playbackRate = parseFloat(value);
        }

        function toggleFullScreen() {
            const video = document.getElementById("manualVideo");
            if (video.requestFullscreen) {
                video.requestFullscreen();
            } else if (video.webkitRequestFullscreen) { /* Safari */
                video.webkitRequestFullscreen();
            } else if (video.msRequestFullscreen) { /* IE11 */
                video.msRequestFullscreen();
            }
        }
     // Theme toggle
        function toggleTheme() {
            const currentTheme = document.documentElement.getAttribute('data-theme') || 'light';
            const newTheme = currentTheme === 'light' ? 'dark' : 'light';
            document.documentElement.setAttribute('data-theme', newTheme);
            localStorage.setItem('theme', newTheme);
            const themeIcon = document.getElementById('themeToggle').querySelector('i');
            themeIcon.className = newTheme === 'light' ? 'fas fa-moon' : 'fas fa-sun';
        }

        // Initialize theme
     /*    document.addEventListener('DOMContentLoaded', () => {
            const savedTheme = localStorage.getItem('theme') || 'light';
            document.documentElement.setAttribute('data-theme', savedTheme);
            const themeIcon = document.getElementById('themeToggle').querySelector('i');
            themeIcon.className = savedTheme === 'light' ? 'fas fa-moon' : 'fas fa-sun';
        }); */

       // document.getElementById('themeToggle').addEventListener('click', toggleTheme);
        
        document.addEventListener('DOMContentLoaded', () => {
          document.getElementById('reloadIframeBtn').addEventListener('click', () => {
            const iframe = document.getElementById('dashboardIframe');
            iframe.src = iframe.src; // Safe reload for cross-origin iframe

          });
        });
        document.getElementById('uploadForm').addEventListener('submit', function (e) {
            const fileInput = document.getElementById('file-upload');
            const container = document.getElementById('containerName');

            if (!fileInput.files.length) {
              alert("Please select a file to upload.");
              e.preventDefault();
              return;
            }

            if (!container.value) {
              alert("Please select a container.");
              e.preventDefault();
            }
          });
        function showToast(message = '✅ Upload completed!') {
            const toast = document.getElementById('toast');
            toast.textContent = message;
            toast.style.visibility = 'visible';
            toast.style.opacity = '1';

            setTimeout(() => {
              toast.style.opacity = '0';
              toast.style.visibility = 'hidden';
              location.reload();
            }, 5000);
          }
          // Optional: Show selected file name
          document.getElementById('file-upload').addEventListener('change', function () {
            const fileName = this.files[0]?.name || '';
            document.getElementById('file-name').textContent = fileName;
          });
          document.getElementById('uploadForm').addEventListener('submit', function(e) {
        	  e.preventDefault();  // Prevent normal form submission

        	  // Show loader
        	  document.getElementById('loaderOverlay').style.display = 'block';

        	  // Prepare form data
        	  const formData = new FormData(this);
        	
        	  // Send AJAX request
        	  fetch('<%=request.getContextPath()%>/uploadFile', {
        	    method: 'POST',
        	    body: formData
        	  })
        	  .then(response => {
        		  document.getElementById("modal").style.display = "none";
        	    if (!response.ok) throw new Error('Upload failed');
        	    return response.text(); // or json()
        	  })
        	  .then(data => {
        	    // Hide loader
        	    document.getElementById('loaderOverlay').style.display = 'none';
        	    showToast("✅ Your Document is uploaded and in the Review Stage. Wait for 10 min for admin to Approve your request.");
        	    // Show toast
        	    const toast = document.getElementById('toast');
        	    toast.style.visibility = 'visible';
        	 

        	    // Hide toast after 5 seconds
        	 setTimeout(() => {
			  const toast = document.getElementById('toast');
			  if (toast) {
			    toast.style.visibility = 'hidden';
			    toast.style.opacity = '100';
			  }
			
			  // Reload the page
			  location.reload(); // or window.location.href = '/home';
			}, 5000);

        	    // Optionally reset form
        	    this.reset();
        	  })
        	  .catch(err => {
        	    alert('Upload failed: ' + err.message);
        	    document.getElementById('loaderOverlay').style.display = 'none';
        	  });
        	});
          

          function closeModal1() {
        	  //document.getElementById("modal").style.display = "none";
        	  }
          
          // Update file name display when file is selected
          document.getElementById('file-upload').addEventListener('change', function(e) {
              var fileName = e.target.files[0] ? e.target.files[0].name : 'No file selected';
              document.getElementById('file-name').textContent = fileName;
              
              // Add a title attribute for hover tooltip on long filenames
              if (fileName.length > 30) {
                  document.getElementById('file-name').setAttribute('title', fileName);
              } else {
                  document.getElementById('file-name').removeAttribute('title');
              }
          });
    </script>

</body>
</html>