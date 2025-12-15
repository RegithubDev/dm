<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>${sessionScope.DEPT} AI Console</title>
    <link rel="icon" type="image/png" sizes="96x96" href="https://resustainability.com/wp-content/uploads/2022/12/Logo-red-1.svg">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <script type="text/javascript">
        (function(c,l,a,r,i,t,y){
            c[a]=c[a]||function(){(c[a].q=c[a].q||[]).push(arguments)};
            t=l.createElement(r);t.async=1;t.src="https://www.clarity.ms/tag/"+i;
            y=l.getElementsByTagName(r)[0];y.parentNode.insertBefore(t,y);
        })(window, document, "clarity", "script", "rfoylc8ktq");
    </script>

    <style>
        :root {
            /* Light Theme */
            --bg-color: #f8fafc;
            --text-color: #334155;
            --text-muted: #64748b;
            --header-bg: linear-gradient(135deg, #1e293b 0%, #0f172a 100%);
            --header-text: #f1f5f9;
            --panel-bg: #ffffff;
            --panel-border: #e2e8f0;
            --button-bg: #2563eb;
            --button-text: #ffffff;
            --button-hover-bg: #1d4ed8;
            --modal-bg: #ffffff;
            --input-bg: #f8fafc;
            --input-border: #cbd5e1;
            --accent-color: #2563eb;
            --accent-light: rgba(37, 99, 235, 0.1);
            --success-color: #10b981;
            --error-color: #ef4444;
            --warning-color: #f59e0b;
            --progress-bg: #e2e8f0;
            --shadow-sm: 0 1px 2px 0 rgb(0 0 0 / 0.05);
            --shadow-md: 0 4px 6px -1px rgb(0 0 0 / 0.1), 0 2px 4px -2px rgb(0 0 0 / 0.1);
            --shadow-lg: 0 10px 15px -3px rgb(0 0 0 / 0.1), 0 4px 6px -4px rgb(0 0 0 / 0.1);
        }

        [data-theme="dark"] {
            --bg-color: #0f172a;
            --text-color: #e2e8f0;
            --text-muted: #94a3b8;
            --header-bg: linear-gradient(135deg, #1e293b 0%, #020617 100%);
            --panel-bg: #1e293b;
            --panel-border: #334155;
            --button-bg: #3b82f6;
            --button-hover-bg: #2563eb;
            --modal-bg: #1e293b;
            --input-bg: #334155;
            --input-border: #475569;
            --accent-color: #60a5fa;
            --accent-light: rgba(96, 165, 250, 0.1);
            --progress-bg: #334155;
        }

        * { margin: 0; padding: 0; box-sizing: border-box; font-family: 'Inter', sans-serif; }

        body { background-color: var(--bg-color); color: var(--text-color); min-height: 100vh; transition: background-color 0.3s; }

        /* --- Header --- */
        .header-3d {
            display: flex; align-items: center; justify-content: space-between;
            background: var(--header-bg); padding: 0 24px; height: 64px;
            box-shadow: var(--shadow-md); position: fixed; width: 100%; top: 0; z-index: 1000;
        }

        .logo-container { display: flex; align-items: center; gap: 12px; }
        .logo-icon img { height: 40px; }
        .logo-text { color: var(--header-text); font-size: 1.4rem; font-weight: 700; letter-spacing: -0.5px; }

        .theme-toggle, .menu-toggle, .signout-btn {
            background: none; border: none; color: var(--header-text);
            font-size: 1.1rem; cursor: pointer; padding: 8px; border-radius: 8px;
            transition: all 0.2s;
        }
        .theme-toggle:hover, .menu-toggle:hover, .signout-btn:hover { background-color: rgba(255,255,255,0.1); }

        .status-indicator { display: flex; align-items: center; gap: 16px; }
        .status-dot {
            width: 10px; height: 10px; background-color: var(--success-color);
            border-radius: 50%; box-shadow: 0 0 10px var(--success-color);
            animation: pulse 2s infinite;
        }
        @keyframes pulse { 0% { transform: scale(1); opacity: 1; } 50% { transform: scale(1.5); opacity: 0.5; } 100% { transform: scale(1); opacity: 1; } }

        /* --- Layout --- */
        .royal-container { display: flex; margin-top: 64px; height: calc(100vh - 64px); overflow: hidden; }

        /* --- Sidebar --- */
        .royal-panel {
            width: 300px; background: var(--panel-bg); padding: 24px;
            height: 100%; overflow-y: auto; border-right: 1px solid var(--panel-border);
            transition: transform 0.3s ease; display: flex; flex-direction: column;
        }

        .panel-header {
            font-size: 0.85rem; font-weight: 600; color: var(--text-muted);
            text-transform: uppercase; letter-spacing: 1px; margin-bottom: 1rem;
            display: flex; align-items: center; gap: 8px;
        }

        .button-row { display: flex; flex-direction: column; gap: 10px; margin-bottom: 2rem; }

        .royal-btn {
            background-color: var(--button-bg); color: var(--button-text);
            border: none; padding: 10px 16px; border-radius: 6px;
            cursor: pointer; font-size: 0.9rem; font-weight: 500;
            display: flex; align-items: center; gap: 8px; justify-content: center;
            transition: all 0.2s; box-shadow: var(--shadow-sm);
        }
        .royal-btn:hover { background-color: var(--button-hover-bg); transform: translateY(-1px); box-shadow: var(--shadow-md); }
        .royal-btn:disabled { opacity: 0.7; cursor: not-allowed; transform: none; }

        /* --- Accordion / Data Nodes --- */
        .data-node { margin-bottom: 0.75rem; border-radius: 8px; overflow: hidden; border: 1px solid var(--panel-border); }
        
        .node-header {
            background: var(--panel-bg); padding: 12px 16px; cursor: pointer;
            display: flex; align-items: center; justify-content: space-between;
            font-weight: 500; font-size: 0.95rem; color: var(--text-color);
            transition: background 0.2s;
        }
        .node-header:hover { background: var(--bg-color); }
        .node-header i { font-size: 0.8rem; color: var(--text-muted); transition: transform 0.3s ease; }

        .node-content {
            max-height: 0; overflow: hidden; background: var(--bg-color);
            transition: max-height 0.4s cubic-bezier(0.4, 0, 0.2, 1);
        }
        .node-content.show { max-height: 500px; overflow-y: auto; border-top: 1px solid var(--panel-border); }

        .file-item {
            padding: 8px 16px; display: flex; align-items: center; justify-content: space-between;
            font-size: 0.85rem; color: var(--text-color); border-bottom: 1px solid var(--panel-border);
        }
        .file-item:last-child { border-bottom: none; }
        .file-item span { overflow: hidden; text-overflow: ellipsis; white-space: nowrap; max-width: 180px; }
        
        .delete-btn {
            background: none; border: none; color: var(--text-muted); cursor: pointer; padding: 4px;
            font-size: 0.8rem; transition: color 0.2s;
        }
        .delete-btn:hover { color: var(--error-color); }

        /* --- Main Content / Tabs --- */
        .tabs-container { flex: 1; padding: 32px; background: var(--bg-color); overflow-y: auto; }
        
        .tabs-header { display: flex; gap: 4px; border-bottom: 2px solid var(--panel-border); margin-bottom: 24px; }
        .tab-button {
            background: transparent; border: none; padding: 12px 20px;
            font-size: 0.95rem; font-weight: 600; color: var(--text-muted);
            cursor: pointer; position: relative; bottom: -2px;
            transition: color 0.2s; border-bottom: 2px solid transparent;
        }
        .tab-button.active { color: var(--accent-color); border-bottom-color: var(--accent-color); }
        .tab-button:hover:not(.active) { color: var(--text-color); }

        .login-elegant {
            background: var(--panel-bg); padding: 40px; border-radius: 16px;
            text-align: center; max-width: 480px; margin: 40px auto;
            box-shadow: var(--shadow-lg); border: 1px solid var(--panel-border);
        }
        .login-heading { font-size: 1.5rem; margin-bottom: 1rem; color: var(--text-color); }
        .login-status { color: var(--text-muted); margin-bottom: 2rem; line-height: 1.6; }

        /* --- Modals --- */
        .modal {
            display: none; position: fixed; top: 0; left: 0; width: 100%; height: 100%;
            background: rgba(15, 23, 42, 0.6); backdrop-filter: blur(4px); z-index: 2000;
        }
        .modal-content {
            background: var(--modal-bg); margin: 6% auto; padding: 32px;
            width: 90%; max-width: 500px; border-radius: 16px; position: relative;
            box-shadow: var(--shadow-lg); animation: slideDown 0.3s ease-out;
            border: 1px solid var(--panel-border);
        }
        @keyframes slideDown { from { opacity: 0; transform: translateY(-20px); } to { opacity: 1; transform: translateY(0); } }

        .close {
            position: absolute; top: 20px; right: 24px; font-size: 1.5rem;
            color: var(--text-muted); cursor: pointer; transition: color 0.2s;
        }
        .close:hover { color: var(--error-color); }

        .w { font-size: 1.25rem; font-weight: 600; color: var(--text-color); margin-bottom: 1.5rem; text-align: center; }

        .form-group { margin-bottom: 1.25rem; }
        .form-group label { display: block; margin-bottom: 0.5rem; font-weight: 500; font-size: 0.9rem; color: var(--text-color); }
        
        .royal-input, select.royal-input {
            width: 100%; padding: 12px; border: 1px solid var(--input-border);
            border-radius: 8px; font-size: 0.95rem; background: var(--input-bg);
            color: var(--text-color); transition: border-color 0.2s;
        }
        .royal-input:focus { outline: none; border-color: var(--accent-color); ring: 2px var(--accent-light); }

        /* Custom File Upload Styling */
        .file-drop-area {
            border: 2px dashed var(--input-border); border-radius: 8px;
            padding: 30px; text-align: center; background: var(--input-bg);
            transition: all 0.2s; position: relative; cursor: pointer;
        }
        .file-drop-area:hover { border-color: var(--accent-color); background: var(--accent-light); }
        .file-drop-area i { font-size: 2rem; color: var(--text-muted); margin-bottom: 10px; display: block; }
        .file-msg { font-size: 0.9rem; color: var(--text-muted); }
        .file-input {
            position: absolute; left: 0; top: 0; height: 100%; width: 100%;
            opacity: 0; cursor: pointer;
        }
        .selected-file-display {
            margin-top: 15px; padding: 10px; background: var(--accent-light);
            border-radius: 6px; font-size: 0.9rem; color: var(--accent-color);
            display: none; align-items: center; justify-content: space-between;
        }

        /* --- Toast & Loader --- */
        #toast {
            visibility: hidden; min-width: 300px; background-color: var(--success-color);
            color: #fff; text-align: center; border-radius: 8px; padding: 16px;
            position: fixed; z-index: 3000; top: 80px; right: 24px;
            box-shadow: var(--shadow-lg); opacity: 0; transform: translateY(-10px);
            transition: all 0.3s; font-weight: 500;
        }
        #toast.show { visibility: visible; opacity: 1; transform: translateY(0); }

        #loaderOverlay {
            position: fixed; top: 0; left: 0; width: 100%; height: 100%;
            background: rgba(0,0,0,0.7); display: none; align-items: center;
            justify-content: center; z-index: 9999; flex-direction: column; color: white;
            backdrop-filter: blur(5px);
        }
        #loaderOverlay p { margin-top: 15px; font-weight: 500; font-size: 1.1rem; }

        /* --- Storage Info --- */
        .storage-info {
            position: fixed; bottom: 20px; right: 20px; background: var(--panel-bg);
            padding: 16px; border-radius: 12px; box-shadow: var(--shadow-lg);
            width: 280px; z-index: 900; border: 1px solid var(--panel-border);
        }
        .storage-info .title { display: flex; align-items: center; gap: 8px; font-weight: 600; margin-bottom: 8px; font-size: 0.9rem; }
        .storage-info .progress-bar { height: 6px; background: var(--progress-bg); border-radius: 3px; overflow: hidden; margin-bottom: 8px; }
        .storage-info .progress { height: 100%; background: var(--success-color); border-radius: 3px; }
        .storage-info .details { font-size: 0.75rem; color: var(--text-muted); display: flex; justify-content: space-between; }

        /* Responsive */
        @media (max-width: 768px) {
            .royal-panel { position: fixed; transform: translateX(-100%); z-index: 1100; box-shadow: var(--shadow-lg); }
            .royal-panel.active { transform: translateX(0); }
            .menu-toggle { display: block; }
            .storage-info { width: calc(100% - 40px); bottom: 10px; }
        }
        @media (min-width: 769px) { .menu-toggle { display: none; } }
        
        .dropdown { position: relative; }
        .dropdown-content {
            display: none; position: absolute; right: 0; top: 120%;
            background: var(--panel-bg); min-width: 200px;
            box-shadow: var(--shadow-lg); border-radius: 8px;
            overflow: hidden; border: 1px solid var(--panel-border);
        }
        .dropdown-content a {
            display: block; padding: 12px 16px; color: var(--text-color);
            text-decoration: none; font-size: 0.9rem; transition: background 0.2s;
        }
        .dropdown-content a:hover { background: var(--input-bg); }
    </style>
</head>
<body>
    <!-- Header -->
    <header class="header-3d">
        <button class="menu-toggle" id="menuToggle"><i class="fas fa-bars"></i></button>
        <div class="logo-container">
            <div class="logo-icon">
                <img src="/reirm/resources/ai/img/Logo-red-1 (1).svg" alt="Logo" />
            </div>
            <div class="logo-text">${sessionScope.DEPT}.AI</div>
        </div>
        <div class="status-indicator">
            <div class="dropdown">
                <button class="user-manual-btn royal-btn" onclick="toggleDropdown()" style="background: transparent; color: var(--header-text); box-shadow: none;">
                    <i class="fas fa-book"></i> Manuals
                </button>
                <div id="manualsDropdown" class="dropdown-content">
                   <!--  <a href="https://appmint.resustainability.com//reirm/resources/ai/ReSustainability_DM_Portal_User_Manual.pdf" target="_blank">
                        <i class="fas fa-file-pdf"></i> User Manual
                    </a> -->
                    <a href="javascript:void(0)" onclick="openVideoModal()">
                        <i class="fas fa-play-circle"></i> Video Manual
                    </a>
                </div>
            </div> 
            <button class="theme-toggle" id="themeToggle"><i class="fas fa-moon"></i></button>
            <div class="status-dot" title="System Online"></div>
            <form action="<%=request.getContextPath()%>/logout" method="post">
                <button type="submit" class="signout-btn" title="Sign Out"><i class="fas fa-sign-out-alt"></i></button>
            </form>
        </div>
    </header>
 
    <!-- Overlay for Mobile Sidebar -->
    <div class="overlay" id="overlay" onclick="closeSidebar()"></div>

    <div class="royal-container">
        <!-- Sidebar -->
        <div class="royal-panel" id="sidePanel">
            <div class="panel-header"><i class="fas fa-layer-group"></i> Blob Operations</div>
            <div class="button-row">
                <button class="royal-btn" onclick="openModal('upload')">
                    <i class="fas fa-cloud-upload-alt"></i> Upload File
                </button>
                <button id="refreshBtn" class="royal-btn" style="background: var(--input-bg); color: var(--text-color); border: 1px solid var(--input-border);" onclick="refreshIndex()">
                    <i class="fas fa-sync-alt"></i> Refresh Index
                </button>
            </div>

            <div class="panel-header" style="margin-top: 2rem;"><i class="fas fa-folder-open"></i> Containers</div>
            <div class="data-nodes">
                <c:choose>
                    <c:when test="${empty blobData}">
                        <div class="empty-message" style="text-align: center; color: var(--text-muted); margin-top: 20px;">No containers found</div>
                    </c:when>
                    <c:otherwise>
                        <c:forEach var="entry" items="${blobData}">
                            <c:if test="${entry.key != '__STORAGE_INFO__'}">
                                <div class="data-node">
                                    <div class="node-header" onclick="toggleNode(this)">
                                        <span>${entry.key}</span>
                                        <i class="fas fa-chevron-right"></i>
                                    </div>
                                    <div class="node-content">
                                        <c:choose>
                                            <c:when test="${empty entry.value.fileNames}">
                                                <div class="file-item" style="color: var(--text-muted); font-style: italic;">No files</div>
                                            </c:when>
                                            <c:otherwise>
                                                <c:forEach var="file" items="${entry.value.fileNames}">
                                                    <div class="file-item">
                                                        <span><i class="far fa-file-alt" style="margin-right: 8px;"></i> ${file}</span>
                                                        <button onclick="deleteFile('${entry.key}', '${file}')" class="delete-btn" title="Delete">
                                                            <i class="fas fa-trash-alt"></i>
                                                        </button>
                                                    </div>
                                                </c:forEach>
                                            </c:otherwise>
                                        </c:choose>
                                    </div>
                                </div>
                            </c:if>
                            <!-- Hidden Storage Info Capture -->
                            <c:if test="${entry.key == '__STORAGE_INFO__'}">
                                <input type="hidden" id="usedValue1" value="${entry.value.totalUsed}" />
                                <input type="hidden" id="freeValue1" value="${entry.value.free}" />
                                <input type="hidden" id="totalValue1" value="${entry.value.quota}" />
                            </c:if>
                        </c:forEach>
                    </c:otherwise>
                </c:choose>
            </div>
        </div>

        <!-- Main Content -->
        <div class="tabs-container">
            <div class="tabs-header">
                <button class="tab-button active" onclick="switchTab('dashboard')">Dashboard</button>
            </div>
            
            <div class="tab-pane active" id="dashboard-tab">
                <div id="loginContainer" class="login-elegant">
                    <h2 class="login-heading">Secure Portal Access</h2>
                    <p id="statusText" class="login-status">
                        Please sign in with your Microsoft Account to access the AI console features.
                    </p>
                    <button id="loginBtn" class="royal-btn" style="width: 100%; justify-content: center; padding: 12px;">
                        <i class="fab fa-microsoft"></i> Sign In with Microsoft
                    </button>
                    
                    <!-- Authenticated State Elements -->
                    <div id="userInfo" style="display:none; margin-top: 1rem; font-weight: 500;"></div>
                    <div id="loginTime" style="display:none; font-size: 0.85rem; color: var(--text-muted); margin-bottom: 1rem;"></div>
                    <div id="chatLinkContainer" style="display: none; margin-top: 1.5rem;">
                        <a href="https://${sessionScope.RoleTypeId}.azurewebsites.net/" target="_blank" class="royal-btn">
                            Start Chatting <i class="fas fa-external-link-alt" style="margin-left: 5px;"></i>
                        </a>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Upload Modal -->
    <div id="modal" class="modal">
        <div class="modal-content">
            <span class="close" onclick="closeModal()">&times;</span>
            
            <!-- Upload Form -->
            <div id="upload-file-form">
                <h3 class="w">Upload Document</h3>
                <form method="post" enctype="multipart/form-data" id="uploadForm">
                    
                    <div class="form-group">
                        <label for="containerName">Target Container <span style="color: var(--error-color);">*</span></label>
                        <select name="containerName" id="containerName" class="royal-input" required>
                            <option selected value="${sessionScope.container}">${sessionScope.container}</option>
                        </select>
                    </div>

                    <div class="form-group">
                        <label>Select File (Max 15MB) <span style="color: var(--error-color);">*</span></label>
                        <div class="file-drop-area">
                            <i class="fas fa-cloud-upload-alt"></i>
                            <span class="file-msg">Drag & Drop or Click to Browse</span>
                            <!-- Removed 'multiple' attribute -->
                            <input type="file" name="files" id="file-upload" class="file-input" required accept=".doc,.docx,.pdf,.ppt,.pptx,.txt,.xlsx">
                        </div>
                        <div id="file-display" class="selected-file-display">
                            <span id="file-name-text"></span>
                            <i class="fas fa-check-circle"></i>
                        </div>
                    </div>

                    <button type="submit" class="royal-btn" style="width: 100%; padding: 14px; margin-top: 10px;">
                        Upload File
                    </button>
                </form>
            </div>
        </div>
    </div>

    <!-- Video Modal -->
    <div id="videoModal" class="video-modal" style="display: none; position: fixed; top: 0; left: 0; width: 100%; height: 100%; background: rgba(0,0,0,0.8); z-index: 3000;">
        <div class="video-content" style="background: #000; width: 80%; max-width: 900px; margin: 5% auto; position: relative;">
            <span class="close" onclick="closeVideoModal()" style="color: white; top: -30px; right: 0;">&times;</span>
            <video id="manualVideo" width="100%" controls>
                <source src="https://appmint.resustainability.com/reirm/resources/ai/AI.mp4" type="video/mp4" />
                Your browser does not support HTML5 video.
            </video>
        </div>
    </div>

    <!-- Toast Notification -->
    <div id="toast">Notification Message</div>

    <!-- Loader -->
    <div id="loaderOverlay">
        <i class="fas fa-circle-notch fa-spin" style="font-size: 3rem; color: var(--accent-color);"></i>
        <p>Processing...</p>
    </div>

    <!-- Storage Widget -->
    <div class="storage-info" id="storageInfo">
        <div class="title"><i class="fas fa-database"></i> Storage Quota</div>
        <div class="progress-bar">
            <div class="progress" id="usedProgress" style="width: 0%"></div>
        </div>
        <div class="details">
            <span id="usedSpace">Used: 0 MB</span>
            <span id="freeSpace">Free: 0 GB</span>
        </div>
    </div>

    <!-- Scripts -->
    <script src="https://alcdn.msauth.net/browser/2.19.0/js/msal-browser.min.js"></script>
    <script>
        /* --- UI Logic --- */
        
        // Mobile Sidebar Toggle
        document.getElementById('menuToggle').addEventListener('click', () => {
            document.getElementById('sidePanel').classList.add('active');
            document.getElementById('overlay').style.display = 'block';
        });

        function closeSidebar() {
            document.getElementById('sidePanel').classList.remove('active');
            document.getElementById('overlay').style.display = 'none';
        }

        // Accordion Toggle (Fixed Chevron Logic)
        function toggleNode(header) {
            const content = header.nextElementSibling;
            const icon = header.querySelector('i');
            
            content.classList.toggle('show');
            
            // Explicitly swap classes based on state
            if (content.classList.contains('show')) {
                icon.classList.remove('fa-chevron-right');
                icon.classList.add('fa-chevron-down');
            } else {
                icon.classList.remove('fa-chevron-down');
                icon.classList.add('fa-chevron-right');
            }
        }

        // Modal Logic
        function openModal(type) {
            document.getElementById("modal").style.display = "block";
            closeSidebar(); // Close sidebar if on mobile
            // Reset form if opening upload
            if(type === 'upload') {
                document.getElementById('uploadForm').reset();
                $('#file-display').hide();
                $('.file-msg').text("Drag & Drop or Click to Browse");
            }
        }

        function closeModal() {
            document.getElementById("modal").style.display = "none";
        }

        window.onclick = function(event) {
            if (event.target == document.getElementById('modal')) closeModal();
            if (!event.target.matches('.user-manual-btn') && !event.target.closest('.dropdown-content')) {
                document.getElementById("manualsDropdown").style.display = "none";
            }
        }

        function toggleDropdown() {
            const dd = document.getElementById("manualsDropdown");
            dd.style.display = dd.style.display === "block" ? "none" : "block";
        }

        // Theme Toggle
        const themeBtn = document.getElementById('themeToggle');
        themeBtn.addEventListener('click', () => {
            const current = document.documentElement.getAttribute('data-theme');
            const next = current === 'dark' ? 'light' : 'dark';
            document.documentElement.setAttribute('data-theme', next);
            localStorage.setItem('theme', next);
            themeBtn.innerHTML = next === 'dark' ? '<i class="fas fa-sun"></i>' : '<i class="fas fa-moon"></i>';
        });

        // Initialize Theme
        if(localStorage.getItem('theme') === 'dark') {
            document.documentElement.setAttribute('data-theme', 'dark');
            themeBtn.innerHTML = '<i class="fas fa-sun"></i>';
        }

        /* --- File Upload Logic (Max 15MB, Single File) --- */
        $('#file-upload').on('change', function() {
            const file = this.files[0]; // Only get first file
            const display = $('#file-display');
            const msg = $('.file-msg');

            if (file) {
                // 15MB Limit Check (15 * 1024 * 1024 bytes)
                const maxSize = 15 * 1024 * 1024;
                
                if (file.size > maxSize) {
                    showToast("⚠️ File exceeds 15MB limit", "error");
                    this.value = ""; // Clear input
                    display.hide();
                    msg.text("Drag & Drop or Click to Browse");
                } else {
                    // Valid File
                    $('#file-name-text').text(file.name);
                    display.css('display', 'flex');
                    msg.text("Change File");
                }
            } else {
                display.hide();
                msg.text("Drag & Drop or Click to Browse");
            }
        });

        // Upload Form Submit
        document.getElementById('uploadForm').addEventListener('submit', function(e) {
            e.preventDefault();
            const loader = document.getElementById('loaderOverlay');
            loader.style.display = 'flex';
            loader.querySelector('p').innerText = "Uploading...";

            const formData = new FormData(this);
            
            fetch('<%=request.getContextPath()%>/uploadFile', {
                method: 'POST',
                body: formData
            })
            .then(response => {
                closeModal();
                if (!response.ok) throw new Error('Upload failed');
                return response.text();
            })
            .then(data => {
                showToast("✅ Upload Successful! Please refresh index.");
                this.reset();
            })
            .catch(err => {
                showToast("❌ Upload failed: " + err.message, "error");
            })
            .finally(() => {
                loader.style.display = 'none';
            });
        });

        /* --- Index Refresh --- */
        function refreshIndex() {
            const loader = document.getElementById('loaderOverlay');
            loader.style.display = 'flex';
            loader.querySelector('p').innerText = "Indexing Documents...";

            fetch('<%=request.getContextPath()%>/refreshIndex', {
                method: 'POST',
                headers: { 'Content-Type': 'application/json' }
            })
            .then(res => {
                if(!res.ok) throw new Error("Indexing failed");
                return res.text();
            })
            .then(msg => showToast("✅ Index Refreshed Successfully"))
            .catch(err => showToast("❌ Error: " + err.message, "error"))
            .finally(() => loader.style.display = 'none');
        }

        /* --- File Delete --- */
        function deleteFile(container, fileName) {
            if(!confirm(`Delete file "${fileName}"?`)) return;
            
            fetch('/dm/deleteFile', {
                method: 'POST',
                headers: { 'Content-Type': 'application/x-www-form-urlencoded' },
                body: new URLSearchParams({ containerName: container, fileName: fileName })
            })
            .then(res => res.text())
            .then(msg => {
                showToast("🗑️ File Deleted");
                setTimeout(() => location.reload(), 1000);
            })
            .catch(err => showToast("❌ Delete failed", "error"));
        }

        /* --- Toast System --- */
        function showToast(message, type = 'success') {
            const toast = document.getElementById('toast');
            toast.innerText = message;
            toast.style.backgroundColor = type === 'error' ? 'var(--error-color)' : 'var(--success-color)';
            toast.classList.add('show');
            setTimeout(() => toast.classList.remove('show'), 4000);
        }

        /* --- Storage Info Logic --- */
        $(document).ready(function() {
            const usedVal = $("#usedValue1").val() || "0 MB";
            const freeVal = $("#freeValue1").val() || "0 GB";
            const totalVal = $("#totalValue1").val() || "0 GB";

            // Helper to parse strings like "15 GB" or "500 MB" into GB float
            const parseToGB = (str) => {
                str = str.toUpperCase().trim();
                let num = parseFloat(str);
                if (str.includes("MB")) num /= 1024;
                if (str.includes("KB")) num /= (1024 * 1024);
                return num;
            };

            const used = parseToGB(usedVal);
            const total = parseToGB(totalVal);
            
            let percent = 0;
            if (total > 0) percent = (used / total) * 100;
            if (percent > 100) percent = 100;

            $("#usedProgress").css('width', percent.toFixed(1) + "%");
            
            // Color coding based on usage
            if(percent > 90) $("#usedProgress").css('background-color', 'var(--error-color)');
            else if(percent > 70) $("#usedProgress").css('background-color', 'var(--warning-color)');

            $("#usedSpace").text('Used: ' +usedVal);
            $("#freeSpace").text('Free: ' +freeVal);
        });

        /* --- Video Modal --- */
        function openVideoModal() {
            document.getElementById('videoModal').style.display = 'block';
        }
        function closeVideoModal() {
            const v = document.getElementById('manualVideo');
            v.pause();
            document.getElementById('videoModal').style.display = 'none';
        }

        /* --- MSAL Auth Logic (Preserved) --- */
        const msalConfig = {
            auth: {
                clientId: "${sessionScope.EmailId}",
                authority: "https://login.microsoftonline.com/${sessionScope.mobileNo}",
                redirectUri: "https://appmint.resustainability.com//dm/home",
            },
            cache: { cacheLocation: "localStorage", storeAuthStateInCookie: true }
        };
        
        const msalInstance = new msal.PublicClientApplication(msalConfig);
        const loginRequest = { scopes: ["User.Read"] };

        function updateUI(account) {
            const btn = document.getElementById("loginBtn");
            const status = document.getElementById("statusText");
            const chat = document.getElementById("chatLinkContainer");
            const user = document.getElementById("userInfo");
            const time = document.getElementById("loginTime");
            
            if (account) {
                btn.style.display = "none";
                status.style.display = "none";
                chat.style.display = "block";
                user.style.display = "block";
                time.style.display = "block";
                user.innerHTML = `Welcome, <span style="color:var(--accent-color)">${account.name}</span>`;
                time.innerText = "Session Started: " + new Date().toLocaleTimeString();
            } else {
                btn.style.display = "flex";
                status.style.display = "block";
                chat.style.display = "none";
                user.style.display = "none";
                time.style.display = "none";
            }
        }

        $(document).ready(function () {
            const currentAccount = msalInstance.getAllAccounts()[0] || null;
            updateUI(currentAccount);

            $("#loginBtn").click(function () {
                msalInstance.loginPopup(loginRequest).then(res => {
                    if(res && res.account) updateUI(res.account);
                }).catch(console.error);
            });
        });
    </script>
</body>
</html>