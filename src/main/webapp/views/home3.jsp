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
    
    
    .dropdown {
    position: relative;
    display: inline-block;
}

.user-manual-btn {
    padding: 8px 12px;
    font-size: 14px;
    cursor: pointer;
    background-color: #007bff;
    color: white;
    border: none;
    border-radius: 4px;
}

.dropdown-content {
    display: none;
    position: absolute;
    background-color: white;
    min-width: 180px;
    box-shadow: 0px 4px 8px rgba(0,0,0,0.2);
    z-index: 1;
    border-radius: 4px;
    overflow: hidden;
}

.dropdown-content a {
    color: black;
    padding: 10px 14px;
    text-decoration: none;
    display: block;
}

.dropdown-content a:hover {
    background-color: #f1f1f1;
}
     :root {
    --bg-dark: #1e1e1e;
    --bg-light: #ffffff;
    --text-dark: #ffffff;
    --text-light: #1e1e1e;
    --accent: #10a37f;
    --card-bg-dark: #2a2a2a;
    --card-bg-light: #f3f3f3;
    --border-radius: 12px;
    --transition: 0.3s ease-in-out;
    
    --royal-blue: grey;
    --gold-accent: #ffd700;
    --deep-purple: #4a148c;
    --light-bg: #f5f5f7;
    --dark-text: #1e1e1e;
    --success-green: #388e3c;
}

        body {
            font-family: 'Inter', sans-serif;
            margin: 0;
            padding: 0;
            background-color: var(--bg-dark);
            color: var(--text-dark);
            transition: background-color var(--transition), color var(--transition);
        }

        .container {
            max-width: 900px;
            margin: 50px auto;
            padding: 20px;
        }

        .chat-box {
            background-color: var(--card-bg-dark);
            padding: 20px;
            border-radius: var(--border-radius);
            box-shadow: 0 4px 12px rgba(0,0,0,0.4);
            transition: background-color var(--transition);
        }

        .chat-message {
            margin-bottom: 20px;
            padding: 10px 15px;
            border-radius: var(--border-radius);
            background-color: #2e2e2e;
            animation: fadeInUp 0.5s ease;
        }

        .user-message {
            background-color: #10a37f;
            color: white;
            align-self: flex-end;
        }

        .toggle-mode {
            background-color: transparent;
            border: 1px solid #10a37f;
            color: #10a37f;
            padding: 8px 16px;
            border-radius: 8px;
            cursor: pointer;
            transition: background-color var(--transition), color var(--transition);
            float: right;
        }

        .toggle-mode:hover {
            background-color: #10a37f;
            color: white;
        }

        @keyframes fadeInUp {
            0% {
                opacity: 0;
                transform: translateY(10px);
            }
            100% {
                opacity: 1;
                transform: translateY(0);
            }
        }

        .light-mode {
            background-color: var(--bg-light);
            color: var(--text-light);
        }

        .light-mode .chat-box {
            background-color: var(--card-bg-light);
        }

        .light-mode .chat-message {
            background-color: #e5e5e5;
            color: #1e1e1e;
        }

        .light-mode .user-message {
            background-color: #10a37f;
            color: white;
        }
.tab-pane > #loginContainer {
    position: relative;
    padding: 40px 30px;
    background: linear-gradient(to bottom right, #1a237e, #0d47a1);
    display: flex;
    justify-content: center;
    align-items: center;
    border-radius: 12px;
    box-shadow: 0 8px 30px rgba(0,0,0,0.4);
    margin: 30px auto;
    max-width: 500px;
    color: white;
}
/* Only affects elements inside #loginContainer */
#loginContainer h2 {
    color: #ffeb3b;
    font-size: 24px;
    margin-bottom: 20px;
}

#loginContainer p,
#loginContainer .contact-info {
    color: #e3f2fd;
    font-size: 15px;
    line-height: 1.5;
}

#loginContainer button {
    background-color: #ffca28;
    color: #1a237e;
    border: none;
    padding: 10px 25px;
    font-size: 16px;
    border-radius: 6px;
    cursor: pointer;
    transition: background 0.3s;
    margin-top: 20px;
}

#loginContainer button:hover {
    background-color: #fdd835;
}

/* Elegant login box */
#loginContainer.login-elegant {
    background: rgba(255, 255, 255, 0.06);
    border: 1px solid rgba(255, 255, 255, 0.15);
    border-radius: 12px;
    padding: 40px;
    max-width: 450px;
    width: 100%;
    text-align: center;
    box-shadow: 0 8px 30px rgba(0,0,0,0.3);
    backdrop-filter: blur(10px);
    color: #fff;
}

/* Heading */
.login-heading {
    font-size: 24px;
    font-weight: 600;
    margin-bottom: 20px;
    color: #ffeb3b;
}

/* Status message */
.login-status {
    font-size: 16px;
    margin-bottom: 30px;
    color: #f5f5f5;
}

/* Button */
.login-button {
    background: #ffca28;
    color: #1a237e;
    border: none;
    padding: 12px 30px;
    font-size: 16px;
    font-weight: 600;
    border-radius: 8px;
    cursor: pointer;
    box-shadow: 0 4px 12px rgba(0,0,0,0.2);
    transition: all 0.3s ease;
}

.login-button:hover {
    background: #fdd835;
    transform: translateY(-1px);
}

/* Contact Info */
.contact-info {
    font-size: 14px;
    color: #cfd8dc;
    margin-top: 30px;
    line-height: 1.5;
}

.contact-info strong {
    color: #fffde7;
}
        /* Optional: Moving background scanline effect */
        .scanlines::before {
            content: "";
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background-image: repeating-linear-gradient(
                to bottom,
                rgba(0, 255, 255, 0.03) 0,
                rgba(0, 255, 255, 0.03) 1px,
                transparent 1px,
                transparent 2px
            );
            animation: moveScan 6s linear infinite;
            pointer-events: none;
        }

        @keyframes moveScan {
            0% { background-position: 0 0; }
            100% { background-position: 0 100%; }
        }
        :root {
            --royal-blue: #1a237e;
            --gold-accent: #ffd700;
            --deep-purple: #4a148c;
            --light-bg: #f5f5f7;
            --dark-text: #1e1e1e;
            --success-green: #388e3c;
        }
        
        * {
            box-sizing: border-box;
            margin: 0;
            padding: 0;
        }
        
        body {
            background: linear-gradient(135deg, #0f0c29, #302b63, #24243e);
            color: white;
            font-family: 'Montserrat', sans-serif;
            line-height: 1.6;
            overflow-x: hidden;
            min-height: 100vh;
        }
        
        /* 3D Header */
        .header-3d {
            background: linear-gradient(145deg, #ffffff, #ffffff);
            padding: 1rem 2rem;
            display: flex;
            align-items: center;
            justify-content: space-between;
            box-shadow: 0 10px 30px rgba(0,0,0,0.3);
            position: relative;
            z-index: 100;
            border-bottom: 2px solid var(--gold-accent);
        }
        
        .logo-container {
            display: flex;
            align-items: center;
            gap: 1rem;
        }
        
        .logo-icon {
            font-size: 2.5rem;
            color: var(--gold-accent);
            text-shadow: 0 0 15px rgba(255, 215, 0, 0.7);
        }
        
        .logo-text {
            font-family: 'Orbitron', sans-serif;
            font-size: 1.8rem;
            font-weight: 700;
               background: linear-gradient(to right, #ff2400, #eb2626);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
        }
        
        .status-indicator {
            display: flex;
            align-items: center;
            gap: 1rem;
        }
        
        .status-dot {
            width: 12px;
		    height: 12px;
		    border-radius: 50%;
		    background: #2bdf0e;
		    box-shadow: 0 0 10px #f5f5f5;
		    animation: pulse 2s infinite;
        }
        
        .menu-toggle {
            display: none;
            background: none;
            border: none;
            color: var(--gold-accent);
            font-size: 1.5rem;
            cursor: pointer;
        }
        
        @keyframes pulse {
            0%, 100% { opacity: 0.7; transform: scale(1); }
            50% { opacity: 1; transform: scale(1.2); }
        }
        
        /* Main Container */
        .royal-container {
            display: grid;
            grid-template-columns: 320px 1fr;
            height: calc(100vh - 70px);
            position: relative;
        }
        
        /* Royal Panel */
        .royal-panel {
            background: rgba(15, 12, 41, 0.7);
            border-radius: 15px;
            padding: 1.5rem;
            margin-right: 1.5rem;
            box-shadow: 5px 5px 15px rgba(0,0,0,0.4);
            backdrop-filter: blur(10px);
            border: 1px solid rgba(255, 215, 0, 0.2);
            transform-style: preserve-3d;
            transform: perspective(1000px) rotateY(0deg);
            transition: all 0.5s ease;
            height: 100%;
            overflow-y: auto;
        }
        
        .royal-panel:hover {
           /*  transform: perspective(1000px) rotateY(0deg); */
            box-shadow: 8px 8px 25px rgba(0,0,0,0.5);
        }
        
        .panel-header {
            color: var(--gold-accent);
            font-family: 'Orbitron', sans-serif;
            font-size: .9rem;
            margin-bottom: 1.5rem;
            padding-bottom: 0.5rem;
            border-bottom: 2px solid rgba(255, 215, 0, 0.3);
            text-transform: uppercase;
            letter-spacing: 2px;
            display: flex;
            align-items: center;
            gap: 10px;
        }
        
        .panel-header i {
            font-size: 1.2em;
            color: var(--gold-accent);
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
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 0.8rem 1rem;
            cursor: pointer;
            background: rgba(74, 20, 140, 0.3);
            color: white;
            font-weight: 500;
            transition: all 0.3s;
        }
        
        .node-header:hover {
            background: rgba(74, 20, 140, 0.5);
        }
        
        .node-header i {
            transition: transform 0.4s cubic-bezier(0.4, 0, 0.2, 1);
        }
        
        .node-content {
            max-height: 0;
            overflow: hidden;
            transition: max-height 0.6s cubic-bezier(0.4, 0, 0.2, 1);
            background: rgba(15, 12, 41, 0.5);
        }
        
        .node-content.show {
            max-height: 5000px;
        }
        
        .file-item {
            padding: 0.8rem 1.5rem;
            display: flex;
            align-items: center;
            gap: 10px;
            font-size: 0.9rem;
            color: rgba(255, 255, 255, 0.9);
            border-top: 1px solid rgba(255, 215, 0, 0.1);
            transition: all 0.2s;
        }
        
        .file-item:hover {
            background: rgba(255, 215, 0, 0.1);
        }
        
        .file-item i {
            color: var(--gold-accent);
        }
        
        .empty-message {
            padding: 1rem;
            text-align: center;
            color: rgba(255, 255, 255, 0.6);
            font-style: italic;
        }
        
        /* Royal Form */
        .royal-form {
            margin: 1.5rem 0;
        }
        
        .royal-input {
            background: rgba(0, 0, 0, 0.3);
            border: 1px solid rgba(255, 215, 0, 0.3);
            color: white;
            padding: 0.8rem 1rem;
            width: 100%;
            margin-bottom: 1rem;
            border-radius: 6px;
            transition: all 0.3s;
            font-family: 'Montserrat', sans-serif;
        }
        
        .royal-input:focus {
            outline: none;
            border-color: var(--gold-accent);
            box-shadow: 0 0 10px rgba(255, 215, 0, 0.3);
        }
        
        .royal-btn {
            background: linear-gradient(145deg, var(--royal-blue), var(--deep-purple));
            color: white;
            border: none;
            padding: 0.8rem 1.5rem;
            font-family: 'Orbitron', sans-serif;
            font-weight: 500;
            text-transform: uppercase;
            letter-spacing: 1px;
            cursor: pointer;
            transition: all 0.3s;
            border-radius: 6px;
            box-shadow: 0 4px 6px rgba(0,0,0,0.2);
            position: relative;
            overflow: hidden;
        }
        
        .royal-btn:hover {
            transform: translateY(-2px);
            box-shadow: 0 6px 12px rgba(0,0,0,0.3);
        }
        
        .royal-btn::after {
            content: "";
            position: absolute;
            top: -50%;
            left: -60%;
            width: 200%;
            height: 200%;
            background: linear-gradient(
                to bottom right,
                rgba(255, 255, 255, 0) 45%,
                rgba(255, 255, 255, 0.3) 50%,
                rgba(255, 255, 255, 0) 55%
            );
            transform: rotate(30deg);
            transition: all 0.7s;
        }
        
        .royal-btn:hover::after {
            left: 100%;
        }
        
        /* Main Console */
        .royal-console {
            background: rgba(15, 12, 41, 0.7);
            border-radius: 15px;
            padding: 1.5rem;
            display: flex;
            flex-direction: column;
            height: 100%;
            box-shadow: 5px 5px 15px rgba(0,0,0,0.4);
            backdrop-filter: blur(10px);
            border: 1px solid rgba(255, 215, 0, 0.2);
            transform-style: preserve-3d;
            transform: perspective(1000px) rotateY(0deg);
            transition: all 0.5s ease;
        }
        
        .royal-console:hover {
            transform: perspective(1000px) rotateY(0deg);
            box-shadow: 8px 8px 25px rgba(0,0,0,0.5);
        }
        
        .console-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 1.5rem;
            padding-bottom: 1rem;
            border-bottom: 2px solid rgba(255, 215, 0, 0.3);
        }
        
        .console-title {
            color: var(--gold-accent);
            font-family: 'Orbitron', sans-serif;
            font-size: 1.2rem;
            letter-spacing: 2px;
            text-transform: uppercase;
        }
        
        /* Chat Interface */
        .chat-display {
            flex-grow: 1;
            overflow-y: auto;
            padding: 1rem;
            margin-bottom: 1.5rem;
            background: rgba(0, 0, 0, 0.3);
            border-radius: 8px;
            border: 1px solid rgba(255, 215, 0, 0.1);
            position: relative;
            overflow-y: auto;
		    padding-right: 10px;
		    scroll-behavior: smooth;
		    border: 1px solid #ccc; /* optional for visibility */
		    border-radius: 8px;
        }
        
        .chat-display::before {
            content: "";
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            background: 
                linear-gradient(rgba(255, 215, 0, 0.03) 1px, transparent 1px),
                linear-gradient(90deg, rgba(255, 215, 0, 0.03) 1px, transparent 1px);
            background-size: 20px 20px;
            pointer-events: none;
            opacity: 0.5;
        }
        
        .message {
            margin-bottom: 1.2rem;
            opacity: 0;
            transform: translateY(10px);
            animation: messageIn 0.5s forwards;
            position: relative;
            padding-left: 1.5rem;
        }
        
        @keyframes messageIn {
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }
        
        .user-message {
            color: var(--gold-accent);
            border-left: 2px solid var(--gold-accent);
        }
        
        .ai-message {
            color: white;
            border-left: 2px solid var(--royal-blue);
        }
        
        .message::before {
            content: ">";
            position: absolute;
            left: 0.5rem;
            color: inherit;
            font-family: 'Orbitron', sans-serif;
        }
        
        .typing-indicator {
            display: none;
            color: rgba(255, 255, 255, 0.7);
            font-style: italic;
            padding-left: 1.5rem;
        }
        
        .typing-dots span {
            display: inline-block;
            animation: bounce 1.4s infinite;
        }
        
        .typing-dots span:nth-child(2) {
            animation-delay: 0.2s;
        }
        
        .typing-dots span:nth-child(3) {
            animation-delay: 0.4s;
        }
        
        @keyframes bounce {
            0%, 60%, 100% { transform: translateY(0); }
            30% { transform: translateY(-3px); }
        }
        
        /* Input Area */
        .input-area {
            display: flex;
            gap: 1rem;
        }
        
        #royal-input {
            flex-grow: 1;
            background: rgba(0, 0, 0, 0.3);
            border: 1px solid rgba(255, 215, 0, 0.3);
            color: white;
            padding: 1rem;
            font-family: 'Montserrat', sans-serif;
            resize: none;
            transition: all 0.3s;
            border-radius: 8px;
        }
        
        #royal-input:focus {
            outline: none;
            border-color: var(--gold-accent);
            box-shadow: 0 0 15px rgba(255, 215, 0, 0.3);
        }
        
        #send-btn {
            background: linear-gradient(145deg, var(--royal-blue), var(--deep-purple));
            color: white;
            border: none;
            width: 60px;
            height: 60px;
            border-radius: 50%;
            cursor: pointer;
            transition: all 0.3s;
            display: flex;
            align-items: center;
            justify-content: center;
            box-shadow: 0 4px 8px rgba(0,0,0,0.3);
        }
        
        #send-btn:hover {
            transform: translateY(-3px) scale(1.05);
            box-shadow: 0 6px 12px rgba(0,0,0,0.4);
        }
        
        /* Floating Particles */
        .particles {
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            pointer-events: none;
            z-index: -1;
        }
        
        .particle {
            position: absolute;
            background: rgba(255, 215, 0, 0.5);
            border-radius: 50%;
            animation: float 15s infinite linear;
        }
        
        @keyframes float {
            0% { transform: translateY(0) rotate(0deg); opacity: 0; }
            10% { opacity: 1; }
            90% { opacity: 1; }
            100% { transform: translateY(-100vh) rotate(360deg); opacity: 0; }
        }
        
        /* Modal Styles */
        .modal {
            display: none; 
            position: fixed; 
            z-index: 1000; 
            left: 0;
            top: 0;
            width: 100%; 
            height: 100%; 
            overflow: auto;
            background-color: rgba(0,0,0,0.5); 
        }
        
        .modal-content {
            background-color: #fefefe;
            margin: 10% auto;
            padding: 20px;
            border-radius: 10px;
            width: 90%;
            max-width: 500px;
            position: relative;
        }
        
        .close {
            color: #aaa;
            float: right;
            font-size: 28px;
            position: absolute;
            right: 20px;
            top: 10px;
            cursor: pointer;
        }
        
        .close:hover {
            color: black;
        }
        
        .button-row {
            display: flex;
            gap: 10px;
            margin-bottom: 20px;
        }

        .button-row .royal-btn {
            flex: 1;
            text-align: center;
            padding: 10px;
            font-size: 11px;
            background-color: #4a90e2;
            color: white;
            border: none;
            border-radius: 6px;
            cursor: pointer;
            transition: background-color 0.2s ease;
        }

        .button-row .royal-btn:hover {
            background-color: #357ab7;
        }
        
        .modal-form {
            padding: 20px;
            display: flex;
            flex-direction: column;
            gap: 15px;
        }

        .modal-form form {
            display: flex;
            flex-direction: column;
            gap: 15px;
        }

        .form-group {
            display: flex;
            flex-direction: column;
        }

        .royal-input,
        .select-file-btn {
            padding: 10px;
            font-size: 14px;
            border-radius: 5px;
            border: 1px solid #ccc;
        }

        .select-file-btn {
            background-color: #4a90e2;
            color: white;
            cursor: pointer;
            border: none;
            text-align: center;
        }

        .select-file-btn:hover {
            background-color: #357ab7;
        }
        
        /* Responsive Styles */
        @media (max-width: 1024px) {
            .royal-container {
                grid-template-columns: 280px 1fr;
                padding: 0 1rem 1rem;
            }
            
            .royal-panel {
                margin-right: 1rem;
                padding: 1rem;
            }
            
            .logo-text {
                font-size: 1.5rem;
            }
        }
        
        @media (max-width: 768px) {
            .royal-container {
                grid-template-columns: 1fr;
                padding: 0;
                height: auto;
                min-height: calc(100vh - 70px);
            }
            
            .royal-panel {
                position: fixed;
                top: 70px;
                left: -100%;
                width: 80%;
                max-width: 320px;
                height: calc(100vh - 70px);
                margin-right: 0;
                z-index: 90;
                transition: left 0.3s ease;
            }
            
            .royal-panel.active {
                left: 0;
            }
            
            .royal-console {
                margin-top: 0;
                border-radius: 0;
                transform: none;
                min-height: calc(100vh - 70px);
            }
            
            .menu-toggle {
                display: block;
            }
            
            .overlay {
                position: fixed;
                top: 70px;
                left: 0;
                right: 0;
                bottom: 0;
                background: rgba(0,0,0,0.5);
                z-index: 80;
                display: none;
            }
            
            .overlay.active {
                display: block;
            }
        }
        
        @media (max-width: 480px) {
            .header-3d {
                padding: 1rem;
            }
            
            .logo-text {
                font-size: 1.2rem;
            }
            
            .status-text {
                display: none;
            }
            
            .button-row {
                flex-direction: column;
            }
            
            .input-area {
                flex-direction: column;
            }
            
            #send-btn {
                width: 100%;
                height: 50px;
                border-radius: 6px;
                margin-top: 10px;
            }
        }
        .w{
        	color: black !important;
        }
		.logo-icon {
		    display: flex;
		    align-items: center;
		    justify-content: center;
		    height: 50px; /* adjust as needed */
		}
		
		.logo-img {
		    height: 4rem;
		    width: auto;
		}
		.erase-btn {
    background: none;
    border: none;
    color: #ff4d4d;
    font-size: 18px;
    cursor: pointer;
    margin-left: auto;
    transition: transform 0.2s ease;
}

.erase-btn:hover {
    transform: scale(1.2);
}

.fade-out {
    animation: fadeOut 0.5s forwards;
}

@keyframes fadeOut {
    to {
        opacity: 0;
        transform: translateY(-10px);
    }
}
.royal-panel {
    overflow-y: auto;
}

body::-webkit-scrollbar,
.chat-display::-webkit-scrollbar,
.royal-panel::-webkit-scrollbar {
    width: 8px;
}

body::-webkit-scrollbar-track,
.chat-display::-webkit-scrollbar-track,
.royal-panel::-webkit-scrollbar-track {
    background: #f0f0f0;
    border-radius: 10px;
}

body::-webkit-scrollbar-thumb,
.chat-display::-webkit-scrollbar-thumb,
.royal-panel::-webkit-scrollbar-thumb {
    background: #c46f6f;
    border-radius: 10px;
    border: 2px solid transparent;
    background-clip: content-box;
}

body::-webkit-scrollbar-thumb:hover,
.chat-display::-webkit-scrollbar-thumb:hover,
.royal-panel::-webkit-scrollbar-thumb:hover {
    background: #a14545;
}

body, .chat-display, .royal-panel {
    scrollbar-width: thin;
    scrollbar-color: #c46f6f #f0f0f0;
}
.citation-wrapper a span:hover {
    background-color: #e8f0fe;
    cursor: pointer;
    border-color: #90caf9;
}
.m2{
	margin-top:5px;
}
/* Enhanced Model Dropdown Styles */
#modelSelector.model-dropdown {
    appearance: none;
    -webkit-appearance: none;
    -moz-appearance: none;
    background: rgba(15, 12, 41, 0.8) url("data:image/svg+xml;charset=UTF-8,%3csvg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 24 24' fill='%23ffd700'%3e%3cpath d='M7 10l5 5 5-5z'/%3e%3c/svg%3e") no-repeat;
    background-position: right 10px center;
    background-size: 12px;
    border: 1px solid rgba(255, 215, 0, 0.3);
    border-radius: 6px;
    padding: 8px 30px 8px 12px;
    color: white;
    font-family: inherit;
    font-size: 14px;
    cursor: pointer;
    transition: all 0.3s ease;
    box-shadow: 0 2px 5px rgba(0,0,0,0.1);
    backdrop-filter: blur(5px);
    width: 180px;
}

#modelSelector.model-dropdown:hover {
    border-color: var(--gold-accent);
    box-shadow: 0 0 10px rgba(255, 215, 0, 0.2);
}

#modelSelector.model-dropdown:focus {
    outline: none;
    border-color: var(--gold-accent);
    box-shadow: 0 0 15px rgba(255, 215, 0, 0.3);
}

/* Style the options */ 
#modelSelector.model-dropdown option {
    background: rgba(15, 12, 41, 0.9);
    color: white;
    padding: 8px;
}

/* For Firefox */
@-moz-document url-prefix() {
    #modelSelector.model-dropdown {
        color: white !important;
        text-shadow: 0 0 0 white;
    }
}

/* For IE10+ */
@media screen and (-ms-high-contrast: active), (-ms-high-contrast: none) {
    #modelSelector.model-dropdown {
        padding: 8px;
    }
}
#chatDisplay {
    height: 330px; /* or any fixed height you prefer */
    overflow-y: auto;
    padding: 10px;
    border: 1px solid #ccc;
    scroll-behavior: smooth;
}
#chatDisplay::-webkit-scrollbar {
    width: 8px;
}
#chatDisplay::-webkit-scrollbar-thumb {
    background: #888;
    border-radius: 4px;
}
#chatDisplay::-webkit-scrollbar-thumb:hover {
    background: #555;
}
  /* Sliding Tabs CSS */
    .tabs-container {
        width: 100%;
        height: 100%;
        display: flex;
        flex-direction: column;
    }
    
    .tabs-header {
        display: flex;
        background: rgba(15, 12, 41, 0.7);
        border-bottom: 1px solid rgba(255, 215, 0, 0.3);
        border-radius: 8px 8px 0 0;
        overflow: hidden;
    }
    
    .tab-button {
        flex: 1;
        padding: 12px 20px;
        border: none;
        background: none;
        cursor: pointer;
        font-family: 'Orbitron', sans-serif;
        font-size: 14px;
        font-weight: 500;
        color: rgba(255, 255, 255, 0.7);
        transition: all 0.3s;
        text-transform: uppercase;
        letter-spacing: 1px;
        position: relative;
    }
    
    .tab-button.active {
        color: var(--gold-accent);
        background: rgba(26, 35, 126, 0.3);
    }
    
    .tab-button.active::after {
        content: '';
        position: absolute;
        bottom: 0;
        left: 0;
        right: 0;
        height: 2px;
        background: var(--gold-accent);
        box-shadow: 0 0 10px var(--gold-accent);
    }
    
    .tabs-content {
        flex-grow: 1;
        position: relative;
        overflow: hidden;
        background: rgba(15, 12, 41, 0.7);
        border-radius: 0 0 8px 8px;
    }
    
    .tab-pane {
        position: absolute;
        top: 0;
        left: 0;
        right: 0;
        bottom: 0;
        opacity: 0;
        transform: translateX(20px);
        transition: all 0.4s ease;
        visibility: hidden;
        overflow-y: auto;
    }
    
    .tab-pane.active {
        opacity: 1;
        transform: translateX(0);
        visibility: visible;
    }
    
    /* Adjust the iframe styling */
    .dashboard-iframe {
        width: 100%;
        height: 100%;
        border: none;
        background: transparent;
    }
    .user-manual-btn {
    background: transparent;
    border: none;
    color: black;
    cursor: pointer;
    display: flex;
    align-items: center;
    padding: 8px 12px;
    margin-right: 10px;
    border-radius: 4px;
    font-size: 14px;
    font-weight: 500;
    transition: all 0.3s ease;
}

.user-manual-btn:hover {
    background: rgba(255, 255, 255, 0.1);
}

.user-manual-btn i { 
    margin-right: 8px;
    font-size: 14px;
}

/* If you want it to match the signout button style */
.user-manual-btn {
    background: rgba(255, 255, 255, 0.1);
}

.user-manual-btn:hover {
    background: rgba(255, 255, 255, 0.2);
}
.video-modal {
    display: none;
    position: fixed;
    z-index: 999;
    left: 0;
    top: 0;
    width: 100%;
    height: 100%;
    overflow: auto;
    background-color: rgba(0,0,0,0.8);
}

.video-content {
    position: relative;
    background-color: #fff;
    margin: 5% auto;
    padding: 20px;
    width: 80%;
    max-width: 900px;
    border-radius: 8px;
}

.close {
    position: absolute;
    top: 10px;
    right: 25px;
    color: #000;
    font-size: 28px;
    font-weight: bold;
    cursor: pointer;
}

.video-controls {
    display: flex;
    justify-content: center;
    margin-top: 10px;
}

.video-controls button {
    margin: 0 10px;
    padding: 10px 20px;
    font-size: 16px;
}
.video-modal {
    display: none;
    position: fixed;
    z-index: 9999;
    left: 0;
    top: 0;
    width: 100%;
    height: 100%;
    overflow: auto;
    background-color: rgba(0,0,0,0.85);
}

.video-content {
    position: relative;
    background-color: #fff;
    margin: 5% auto;
    padding: 15px;
    width: 80%;
    max-width: 960px;
    border-radius: 10px;
    box-shadow: 0 0 10px #000;
}

.close {
    position: absolute;
      top: -14px;
    right: 2px;
    font-size: 28px;
    color: #333;
    cursor: pointer;
    font-weight: bold;
} 

.video-controls {
    display: flex;
    flex-wrap: wrap;
    justify-content: center;
    align-items: center;
    margin-top: 12px;
    gap: 12px;
}

.video-controls button, .video-controls select {
    padding: 6px 12px;
    font-size: 14px;
    cursor: pointer;
}

.video-controls label {
    display: flex;
    align-items: center;
    gap: 5px;
}
 #loginContainer {
            display: block;
            text-align: center;
            margin-top: 50px;
        }

        #logoutBtn {
            display: none;
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
            <img src="https://resustainability.com/wp-content/uploads/2022/12/Logo-red-1.svg" alt="Logo" class="logo-img" />
        </div>
        <div class="logo-text">Re AI</div>
    </div>
    <div class="status-indicator">
   <!-- Manuals Toggle Button -->

<!-- Hidden Manual Buttons -->
<!-- Manuals Dropdown Toggle -->
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


   <div id="login-status"></div>
     
        <div class="status-text" style="
    color: black;
">ONLINE</div>
        <div class="status-dot"></div>

        <!-- Sign Out Button -->
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
                                    <button onclick="deleteContainer('${entry.key}', event)" class="royal-btn" style="padding: 0.3rem 0.6rem; font-size: 0.8rem;">
                                        <i class="fas fa-trash"></i>
                                    </button>
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
											        <span>${file}</span>
											        <button onclick="deleteFile('${entry.key}', '${file}')" class="royal-btn" style="padding: 0.2rem 0.4rem; font-size: 0.6rem;"> <i class="fas fa-trash"></i></button>
											    </div>
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
        <button class="tab-button active" onclick="switchTab('chat')">Chat</button>
        <button class="tab-button" onclick="switchTab('dashboard')">Open AI ReSl</button>
    </div>
    
    <div class="tabs-content">
        <!-- Chat Tab -->
        <div class="tab-pane active" id="chat-tab">
            <div class="royal-console" style="height: 100%; border-radius: 0; box-shadow: none; border: none;">
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
                
                <div class="chat-display" id="chatDisplay">
                    <div class="message ai-message" style="opacity: 1; transform: none;">
                        Re AI SYSTEM
                    </div>
                    <div class="message ai-message" style="opacity: 1; transform: none; animation-delay: 0.3s;">
                        AWAITING USER QUERY
                    </div>
                    <div class="typing-indicator" id="typingIndicator">
                        <div class="typing-dots">
                            <span>.</span><span>.</span><span>.</span>
                        </div>
                    </div>
                </div>
                
                <div class="input-area">
                    <textarea id="royal-input" rows="3" placeholder="Enter your query..."></textarea>
                    <button id="send-btn" onclick="sendQuery()">
                        <i class="fas fa-paper-plane"></i>
                    </button>
                </div>
            </div>
        </div>
        
        <!-- Dashboard Tab -->
       <div class="tab-pane" id="dashboard-tab">
      <!-- Place this inside your .tab-pane -->
<div id="loginContainer" class="login-elegant" style="display: block;">

 

    <h2 class="login-heading">Secure Portal Access</h2>

 

    <p id="statusText" class="login-status">You do not seem to have a Microsoft Account. If so, please create one to access this tab. In case you already have, please login using the tab given below<br> <b>OpenAI ReSL ChatBot.</b></p>

 

    <button id="loginBtn" class="login-button">Sign In with Microsoft</button>

 

    <div class="contact-info">

In case of any support, please contact <br> <strong>Mr. Sai Dileep</strong>(9441391620)| <strong>Mr. Santhosh</strong>(9154789979)


    </div>
    <br>
	<p style="font-size: 0.80em; color: #d7d4d4;">
  Still facing issues? Please use the “CHAT” Tab. This tab, too, uses the same algorithm.
</p>
 

</div>

<iframe class="dashboard-iframe" id="dashboardIframe" sandbox="allow-scripts allow-same-origin allow-forms allow-popups allow-top-navigation-by-user-activation"

        title="Open Ai ReSl" 
        
        frameborder="0"  
        allowfullscreen="true"  
        style="transform: scale(1.1);
               transform-origin: 34% 95%; 
               border: none;
               width: 96%;
               height: 545px;">
</iframe> 

<button id="logoutBtn">Logout</button>
    
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

            <!-- Upload File Form -->
            <div id="upload-file-form" class="modal-form" style="display: none;">
                <form action="<%=request.getContextPath() %>/uploadFile" method="post" enctype="multipart/form-data">
                    <h3 class="w">Upload File into Selected Container</h3>

                    <!-- Container Dropdown -->
                    <div class="form-group">
                        <label for="containerName" class="w">Select Container</label>
                        <select name="containerName" id="containerName" class="royal-input" required>
                         <option value="">select Container</option>
                            <c:forEach var="entry" items="${blobData}">
                                <option value="${entry.key}">${entry.key}</option>
                            </c:forEach>
                        </select>
                    </div>

                    <!-- File Input -->
                    <div class="form-group">
                        <input type="file" name="file" id="file-upload" style="display: none;" required accept=".doc,.docx,.pdf,.ppt,.pptx,.txt,.html,.htm,.csv,.rtf,.odt,.ods,.odp,.xml,image/*,video/*,audio/*" />
                        <label for="file-upload" class="royal-btn select-file-btn">
                            <i class="fas fa-file-upload"></i> SELECT FILE
                        </label>
                    </div>

                    <!-- Upload Button -->
                    <div class="form-group">
                        <button type="submit" class="royal-btn">
                            <i class="fas fa-upload"></i> UPLOAD
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



    <!-- Floating Particles -->
    <div class="particles" id="particles"></div>
<script src="https://alcdn.msauth.net/browser/2.19.0/js/msal-browser.min.js"></script>

    <script>
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
            } else {
                document.getElementById("loginContainer").style.display = "block";
                document.getElementById("statusText").innerHTML = "Not signed in. Please log in to access the <br> <b>OpenAi ReSL ChatBot.</b>";
                document.getElementById("dashboardIframe").style.display = "none";
                document.getElementById("logoutBtn").style.display = "none";
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
        
        // Send query to AI
function sendQuery() {
    const input = document.getElementById('royal-input');
    const query = input.value.trim();
    const selectedModel = document.getElementById('modelSelector').value;

    if (!query) return;

    const chatDisplay = document.getElementById('chatDisplay');

    // Add user message
    const userMessage = document.createElement('div');
    userMessage.className = 'message user-message';
    userMessage.textContent = query;
    chatDisplay.appendChild(userMessage);

    // Add typing indicator
    const typingIndicator = document.createElement('div');
    typingIndicator.id = 'currentTypingIndicator';
    typingIndicator.className = 'typing-indicator';
    typingIndicator.innerHTML = `
        <div class="typing-container">
            <div class="typing-dot"></div>
            <div class="typing-dot"></div>
            <div class="typing-dot"></div>
        </div>
        <span class="typing-text">Generating answer</span>
    `;
    chatDisplay.appendChild(typingIndicator);

    // Clear input and scroll down
    input.value = '';
    chatDisplay.scrollTop = chatDisplay.scrollHeight;

    $.ajax({
        url: "/dm/askAI",
        type: "POST",
        contentType: "application/json",
        data: JSON.stringify({ question: query, deploy: selectedModel }),
        success: function(response) {
            // Remove typing indicator
            const currentTypingIndicator = document.getElementById('currentTypingIndicator');
            if (currentTypingIndicator) currentTypingIndicator.remove();

            // Process response and display (your existing code can be used here)
            const citationPattern = /\{\*(https?:\/\/[^\*\}]+)\*\}/g;
            let urlSet = new Set();
            let match;
            while ((match = citationPattern.exec(response)) !== null) {
                if (match[1].startsWith("http")) urlSet.add(match[1]);
            }
            let urls = Array.from(urlSet);
            const cleanContent = response.replace(citationPattern, '').trim();

            const aiMessage = document.createElement('div');
            aiMessage.className = 'message ai-message';
            aiMessage.innerHTML = cleanContent.replace(/\n/g, '<br>');

            if (urls.length > 0) {
                const referenceContainer = document.createElement('div');
                referenceContainer.style.marginTop = '10px';

                const referenceHeader = document.createElement('div');
                referenceHeader.textContent = `${urls.length} reference${urls.length > 1 ? 's' : ''}`;
                referenceHeader.style.fontWeight = 'bold';
                referenceHeader.style.marginBottom = '5px';

                const citationList = document.createElement('div');
                citationList.className = 'citation-list';

                urls.forEach((url, index) => {
                    const fileName = decodeURIComponent(url.substring(url.lastIndexOf('/') + 1));
                    const refDiv = document.createElement('div');
                    refDiv.style.display = 'inline-block';
                    refDiv.style.margin = '4px';
                    refDiv.style.border = '1px solid #000';
                    refDiv.style.padding = '4px 8px';
                    refDiv.style.borderRadius = '6px';
                    refDiv.style.cursor = 'pointer';
                    refDiv.style.background = '#f9f9f9';
                    refDiv.innerHTML = `<span style="margin-right:5px;">${index + 1}</span><a href="#" class="doc-link" data-url="${url}" data-filename="${fileName}">${fileName}</a>`;
                    citationList.appendChild(refDiv);
                });

                referenceContainer.appendChild(referenceHeader);
                referenceContainer.appendChild(citationList);
                aiMessage.appendChild(referenceContainer);
            }

            chatDisplay.appendChild(aiMessage);
            chatDisplay.scrollTop = chatDisplay.scrollHeight;

            // Attach modal behavior to links
            $('.doc-link').off('click').on('click', function(e) {
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

                    if (['doc', 'docx', 'ppt', 'pptx', 'xls', 'xlsx'].includes(extension)) {
                        viewerUrl = 'https://view.officeapps.live.com/op/embed.aspx?src=' + encodeURIComponent(sasUrl);
                    } else if (extension === 'pdf') {
                        viewerUrl = sasUrl;
                    } else if (['jpg', 'jpeg', 'png', 'gif', 'bmp', 'svg', 'webp'].includes(extension)) {
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

        },
        error: function(xhr, status, error) {
            const currentTypingIndicator = document.getElementById('currentTypingIndicator');
            if (currentTypingIndicator) currentTypingIndicator.remove();

            const errorMessage = document.createElement('div');
            errorMessage.className = 'message ai-message';
            errorMessage.textContent = "SYSTEM ERROR: Unable to process request";
            chatDisplay.appendChild(errorMessage);
            chatDisplay.scrollTop = chatDisplay.scrollHeight;
        }
    });
}

// Close modal on click
$('#closeModal').on('click', function() {
    $('#docModal').hide();
    $('#docViewer').attr('src', '');
});

        // Initialize on load
        window.onload = function() {
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
            	    iframe.src = "https://openairesl.azurewebsites.net/";
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
    </script>

</body>
</html>