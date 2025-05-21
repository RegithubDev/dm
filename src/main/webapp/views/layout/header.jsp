<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html class="loading" lang="en" data-textdirection="ltr">
<head>
<meta charset="UTF-8">
<!-- <meta name="google-signin-client_id" content="180023549420-4araucipo8cil4matp902f64cte57md9.apps.googleusercontent.com">
 --> <script src="https://accounts.google.com/gsi/client" onload="initClient()" async defer></script>
<title>Header</title>
<style type="text/css">
.horizontal-menu .header-navbar.navbar-brand-center .navbar-header {
    left: calc(3% - 56px) !important;
    }
.card-img {
    max-width: 59% !important;
    margin-left: 0%;
    margin-top: -10% !important;
}
.navbar-brand {
    margin-right: 0rem !important;
    white-space: nowrap;
}
.horizontal-menu .header-navbar.navbar-brand-center .navbar-header {
    position: initial !important;
    left: calc(50% - 56px);
    padding: 0;
    z-index: 1000;
}
.vv {
	background: linear-gradient(to bottom, #ffffff, #aed580)!important;;
}
/* .horizontal-menu .header-navbar {
    background: #FFF !important;
    z-index: 999!important;
    line-height: 1;
    min-height: auto;
} */
</style>
</head>
<body>
<nav class="vv header-navbar navbar-expand-lg navbar navbar-fixed align-items-center navbar-shadow navbar-brand-center" data-nav="brand-center">
      <div class="navbar-header d-xl-block d-none">
        <ul class="nav navbar-nav">
          <li class="nav-item"><a class="navbar-brand" href="index-2.html"><span class="brand-logo">
                </span>
               <img src="/reirm/resources/images/logo/top_right_logo (1).jpg" width="50" height="" class="card-img" style="
    width: 51rem;
    top: 1.5rem;
    margin-top: 10%;
    position: relative;
">
        </ul>
      </div>
      <div class="navbar-container d-flex content">
        <div class="bookmark-wrapper d-flex align-items-center">
          
          
          <ul class="nav navbar-nav">
					<li class="nav-item d-none d-lg-block"><a
						href="<%=request.getContextPath()%>/home"
						class="nav-link bookmark-star">
						<img src="/reirm/resources/images/logo/Logo_dmswsl.jpg"
									width="50" height="" class="card-img" style="
    position: relative;
    left: 6rem;
    width: 21rem;
">
						</a>
						<div class="bookmark-input search-input">
							<div class="bookmark-input-icon">
								<img src="/reirm/resources/images/logo/Logo_dmswsl.jpg" style="
    position: relative;
    left: 6rem;
    width: 21rem;
"
									width="50" height="" class="card-img">
							</div>

						</div></li>
				</ul>
        </div>
        <ul class="nav navbar-nav align-items-center ms-auto">
          
          <li class="nav-item dropdown dropdown-user"><a class="nav-link dropdown-toggle dropdown-user-link" id="dropdown-user" href="#" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
              <div class="user-nav d-sm-flex d-none"><span class="user-name fw-bolder">${sessionScope.USER_NAME }</div><span class="avatar"><img class="round" src="data:image/jpeg;base64,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" alt="avatar" height="40" width="40"><span class="avatar-status-online"></span></span></a>
              <div class="dropdown-menu dropdown-menu-end" aria-labelledby="dropdown-user">
				 <a class="dropdown-item g_id_signout" href="#"  id="signout_button" ><i class="me-50" data-feather="power"></i> Logout</a>
            </div>
          </li>
          
        </ul>
      </div>
    </nav>
	    
     <form action="<%=request.getContextPath() %>/logout" name="logoutForm" id="logoutForm" method="post">
		<input type="hidden" name="email" id="email"/>
	</form>
    <script>
    $(window).on("load",(function(){

        if (feather) {
          feather.replace({ width: 14, height: 14 });
        }
        if('${welcome}' != ''){
        	  "use strict";var e,o,t,r,a,s="#ebf0f7",i="#5e5873",n="#ebe9f1",d=document.querySelector("#gained-chart"),l=document.querySelector("#order-chart"),h=document.querySelector("#avg-sessions-chart"),p=document.querySelector("#support-trackers-chart"),c=document.querySelector("#sales-visit-chart"),w="rtl"===$("html").attr("data-textdirection");setTimeout(
          			  (function(){toastr.success("You have successfully logged in. Now you can start to explore!","👋 Welcome ${sessionScope.USER_NAME}",{closeButton:!0,tapToDismiss:!1,rtl:w})}),2e3),e={chart:{height:100,type:"area",toolbar:{show:!1},sparkline:{enabled:!0},grid:{show:!1,padding:{left:0,right:0}}},colors:[window.colors.solid.primary],dataLabels:{enabled:!1},stroke:{curve:"smooth",width:2.5},fill:{type:"gradient",gradient:{shadeIntensity:.9,opacityFrom:.7,opacityTo:.5,stops:[0,80,100]}},series:[{name:"Subscribers",data:[28,40,36,52,38,60,55]}],xaxis:{labels:{show:!1},axisBorder:{show:!1}},yaxis:[{y:0,offsetX:0,offsetY:0,padding:{left:0,right:0}}],tooltip:{x:{show:!1}}},new ApexCharts(d,e).render(),o={chart:{height:100,type:"area",toolbar:{show:!1},sparkline:{enabled:!0},grid:{show:!1,padding:{left:0,right:0}}},colors:[window.colors.solid.warning],dataLabels:{enabled:!1},stroke:{curve:"smooth",width:2.5},fill:{type:"gradient",gradient:{shadeIntensity:.9,opacityFrom:.7,opacityTo:.5,stops:[0,80,100]}},series:[{name:"Orders",data:[10,15,8,15,7,12,8]}],xaxis:{labels:{show:!1},axisBorder:{show:!1}},yaxis:[{y:0,offsetX:0,offsetY:0,padding:{left:0,right:0}}],tooltip:{x:{show:!1}}},new ApexCharts(l,o).render(),t={chart:{type:"bar",height:200,sparkline:{enabled:!0},toolbar:{show:!1}},states:{hover:{filter:"none"}},colors:[s,s,window.colors.solid.primary,s,s,s],series:[{name:"Sessions",data:[75,125,225,175,125,75,25]}],grid:{show:!1,padding:{left:0,right:0}},plotOptions:{bar:{columnWidth:"75%",distributed:!0,endingShape:"rounded"}},tooltip:{x:{show:!1}},xaxis:{type:"numeric"}},new ApexCharts(h,t).render(),r={chart:{height:270,type:"radialBar"},plotOptions:{radialBar:{size:150,offsetY:20,startAngle:-150,endAngle:150,hollow:{size:"65%"},track:{background:"#fff",strokeWidth:"100%"},dataLabels:{name:{offsetY:-5,color:i,fontSize:"1rem"},value:{offsetY:15,color:i,fontSize:"1.714rem"}}}},colors:[window.colors.solid.danger],fill:{type:"gradient",gradient:{shade:"dark",type:"horizontal",shadeIntensity:.5,gradientToColors:[window.colors.solid.primary],inverseColors:!0,opacityFrom:1,opacityTo:1,stops:[0,100]}},stroke:{dashArray:8},series:[83],labels:["Completed Tickets"]},new ApexCharts(p,r).render(),a={chart:{height:300,type:"radar",dropShadow:{enabled:!0,blur:8,left:1,top:1,opacity:.2},toolbar:{show:!1},offsetY:5},series:[{name:"Sales",data:[90,50,86,40,100,20]},{name:"Visit",data:[70,75,70,76,20,85]}],stroke:{width:0},colors:[window.colors.solid.primary,window.colors.solid.info],plotOptions:{radar:{polygons:{strokeColors:[n,"transparent","transparent","transparent","transparent","transparent"],connectorColors:"transparent"}}},fill:{type:"gradient",gradient:{shade:"dark",gradientToColors:[window.colors.solid.primary,window.colors.solid.info],shadeIntensity:1,type:"horizontal",opacityFrom:1,opacityTo:1,stops:[0,100,100,100]}},markers:{size:0},legend:{show:!1},labels:["Jan","Feb","Mar","Apr","May","Jun"],dataLabels:{background:{foreColor:[n,n,n,n,n,n]}},yaxis:{show:!1},grid:{show:!1,padding:{bottom:-27}}},new ApexCharts(c,a).render()
        }
        if('${NewUser}' != ''){
      	  "use strict";var e,o,t,r,a,s="#ebf0f7",i="#5e5873",n="#ebe9f1",d=document.querySelector("#gained-chart"),l=document.querySelector("#order-chart"),h=document.querySelector("#avg-sessions-chart"),p=document.querySelector("#support-trackers-chart"),c=document.querySelector("#sales-visit-chart"),w="rtl"===$("html").attr("data-textdirection");setTimeout(
        			  (function(){toastr.success("You have been <b>Rewarded with 100 points</b> By Registering into <b>Safety Portal</b>"," Congratulations ${sessionScope.USER_NAME}! ",{closeButton:!0,tapToDismiss:!1,rtl:w})}),2e3),e={chart:{height:100,type:"area",toolbar:{show:!1},sparkline:{enabled:!0},grid:{show:!1,padding:{left:0,right:0}}},colors:[window.colors.solid.primary],dataLabels:{enabled:!1},stroke:{curve:"smooth",width:2.5},fill:{type:"gradient",gradient:{shadeIntensity:.9,opacityFrom:.7,opacityTo:.5,stops:[0,80,100]}},series:[{name:"Subscribers",data:[28,40,36,52,38,60,55]}],xaxis:{labels:{show:!1},axisBorder:{show:!1}},yaxis:[{y:0,offsetX:0,offsetY:0,padding:{left:0,right:0}}],tooltip:{x:{show:!1}}},new ApexCharts(d,e).render(),o={chart:{height:100,type:"area",toolbar:{show:!1},sparkline:{enabled:!0},grid:{show:!1,padding:{left:0,right:0}}},colors:[window.colors.solid.warning],dataLabels:{enabled:!1},stroke:{curve:"smooth",width:2.5},fill:{type:"gradient",gradient:{shadeIntensity:.9,opacityFrom:.7,opacityTo:.5,stops:[0,80,100]}},series:[{name:"Orders",data:[10,15,8,15,7,12,8]}],xaxis:{labels:{show:!1},axisBorder:{show:!1}},yaxis:[{y:0,offsetX:0,offsetY:0,padding:{left:0,right:0}}],tooltip:{x:{show:!1}}},new ApexCharts(l,o).render(),t={chart:{type:"bar",height:200,sparkline:{enabled:!0},toolbar:{show:!1}},states:{hover:{filter:"none"}},colors:[s,s,window.colors.solid.primary,s,s,s],series:[{name:"Sessions",data:[75,125,225,175,125,75,25]}],grid:{show:!1,padding:{left:0,right:0}},plotOptions:{bar:{columnWidth:"75%",distributed:!0,endingShape:"rounded"}},tooltip:{x:{show:!1}},xaxis:{type:"numeric"}},new ApexCharts(h,t).render(),r={chart:{height:270,type:"radialBar"},plotOptions:{radialBar:{size:150,offsetY:20,startAngle:-150,endAngle:150,hollow:{size:"65%"},track:{background:"#fff",strokeWidth:"100%"},dataLabels:{name:{offsetY:-5,color:i,fontSize:"1rem"},value:{offsetY:15,color:i,fontSize:"1.714rem"}}}},colors:[window.colors.solid.danger],fill:{type:"gradient",gradient:{shade:"dark",type:"horizontal",shadeIntensity:.5,gradientToColors:[window.colors.solid.primary],inverseColors:!0,opacityFrom:1,opacityTo:1,stops:[0,100]}},stroke:{dashArray:8},series:[83],labels:["Completed Tickets"]},new ApexCharts(p,r).render(),a={chart:{height:300,type:"radar",dropShadow:{enabled:!0,blur:8,left:1,top:1,opacity:.2},toolbar:{show:!1},offsetY:5},series:[{name:"Sales",data:[90,50,86,40,100,20]},{name:"Visit",data:[70,75,70,76,20,85]}],stroke:{width:0},colors:[window.colors.solid.primary,window.colors.solid.info],plotOptions:{radar:{polygons:{strokeColors:[n,"transparent","transparent","transparent","transparent","transparent"],connectorColors:"transparent"}}},fill:{type:"gradient",gradient:{shade:"dark",gradientToColors:[window.colors.solid.primary,window.colors.solid.info],shadeIntensity:1,type:"horizontal",opacityFrom:1,opacityTo:1,stops:[0,100,100,100]}},markers:{size:0},legend:{show:!1},labels:["Jan","Feb","Mar","Apr","May","Jun"],dataLabels:{background:{foreColor:[n,n,n,n,n,n]}},yaxis:{show:!1},grid:{show:!1,padding:{bottom:-27}}},new ApexCharts(c,a).render()
      }
        if('${success}' != ''){
        	 "use strict";var e,o,t,r,a,s="#ebf0f7",i="#5e5873",n="#ebe9f1",d=document.querySelector("#gained-chart"),l=document.querySelector("#order-chart"),h=document.querySelector("#avg-sessions-chart"),p=document.querySelector("#support-trackers-chart"),c=document.querySelector("#sales-visit-chart"),w="rtl"===$("html").attr("data-textdirection");setTimeout(
         			  (function(){toastr.success("${success}",{closeButton:!0,tapToDismiss:!1,rtl:w})}),2e3),e={chart:{height:100,type:"area",toolbar:{show:!1},sparkline:{enabled:!0},grid:{show:!1,padding:{left:0,right:0}}},colors:[window.colors.solid.primary],dataLabels:{enabled:!1},stroke:{curve:"smooth",width:2.5},fill:{type:"gradient",gradient:{shadeIntensity:.9,opacityFrom:.7,opacityTo:.5,stops:[0,80,100]}},series:[{name:"Subscribers",data:[28,40,36,52,38,60,55]}],xaxis:{labels:{show:!1},axisBorder:{show:!1}},yaxis:[{y:0,offsetX:0,offsetY:0,padding:{left:0,right:0}}],tooltip:{x:{show:!1}}},new ApexCharts(d,e).render(),o={chart:{height:100,type:"area",toolbar:{show:!1},sparkline:{enabled:!0},grid:{show:!1,padding:{left:0,right:0}}},colors:[window.colors.solid.warning],dataLabels:{enabled:!1},stroke:{curve:"smooth",width:2.5},fill:{type:"gradient",gradient:{shadeIntensity:.9,opacityFrom:.7,opacityTo:.5,stops:[0,80,100]}},series:[{name:"Orders",data:[10,15,8,15,7,12,8]}],xaxis:{labels:{show:!1},axisBorder:{show:!1}},yaxis:[{y:0,offsetX:0,offsetY:0,padding:{left:0,right:0}}],tooltip:{x:{show:!1}}},new ApexCharts(l,o).render(),t={chart:{type:"bar",height:200,sparkline:{enabled:!0},toolbar:{show:!1}},states:{hover:{filter:"none"}},colors:[s,s,window.colors.solid.primary,s,s,s],series:[{name:"Sessions",data:[75,125,225,175,125,75,25]}],grid:{show:!1,padding:{left:0,right:0}},plotOptions:{bar:{columnWidth:"75%",distributed:!0,endingShape:"rounded"}},tooltip:{x:{show:!1}},xaxis:{type:"numeric"}},new ApexCharts(h,t).render(),r={chart:{height:270,type:"radialBar"},plotOptions:{radialBar:{size:150,offsetY:20,startAngle:-150,endAngle:150,hollow:{size:"65%"},track:{background:"#fff",strokeWidth:"100%"},dataLabels:{name:{offsetY:-5,color:i,fontSize:"1rem"},value:{offsetY:15,color:i,fontSize:"1.714rem"}}}},colors:[window.colors.solid.danger],fill:{type:"gradient",gradient:{shade:"dark",type:"horizontal",shadeIntensity:.5,gradientToColors:[window.colors.solid.primary],inverseColors:!0,opacityFrom:1,opacityTo:1,stops:[0,100]}},stroke:{dashArray:8},series:[83],labels:["Completed Tickets"]},new ApexCharts(p,r).render(),a={chart:{height:300,type:"radar",dropShadow:{enabled:!0,blur:8,left:1,top:1,opacity:.2},toolbar:{show:!1},offsetY:5},series:[{name:"Sales",data:[90,50,86,40,100,20]},{name:"Visit",data:[70,75,70,76,20,85]}],stroke:{width:0},colors:[window.colors.solid.primary,window.colors.solid.info],plotOptions:{radar:{polygons:{strokeColors:[n,"transparent","transparent","transparent","transparent","transparent"],connectorColors:"transparent"}}},fill:{type:"gradient",gradient:{shade:"dark",gradientToColors:[window.colors.solid.primary,window.colors.solid.info],shadeIntensity:1,type:"horizontal",opacityFrom:1,opacityTo:1,stops:[0,100,100,100]}},markers:{size:0},legend:{show:!1},labels:["Jan","Feb","Mar","Apr","May","Jun"],dataLabels:{background:{foreColor:[n,n,n,n,n,n]}},yaxis:{show:!1},grid:{show:!1,padding:{bottom:-27}}},new ApexCharts(c,a).render()
        }
        if('${error}' != ''){
       	 "use strict";var e,o,t,r,a,s="#ebf0f7",i="#5e5873",n="#ebe9f1",d=document.querySelector("#gained-chart"),l=document.querySelector("#order-chart"),h=document.querySelector("#avg-sessions-chart"),p=document.querySelector("#support-trackers-chart"),c=document.querySelector("#sales-visit-chart"),w="rtl"===$("html").attr("data-textdirection");setTimeout(
        			  (function(){toastr.error("${error}",{closeButton:!0,tapToDismiss:!1,rtl:w})}),2e3),e={chart:{height:100,type:"area",toolbar:{show:!1},sparkline:{enabled:!0},grid:{show:!1,padding:{left:0,right:0}}},colors:[window.colors.solid.primary],dataLabels:{enabled:!1},stroke:{curve:"smooth",width:2.5},fill:{type:"gradient",gradient:{shadeIntensity:.9,opacityFrom:.7,opacityTo:.5,stops:[0,80,100]}},series:[{name:"Subscribers",data:[28,40,36,52,38,60,55]}],xaxis:{labels:{show:!1},axisBorder:{show:!1}},yaxis:[{y:0,offsetX:0,offsetY:0,padding:{left:0,right:0}}],tooltip:{x:{show:!1}}},new ApexCharts(d,e).render(),o={chart:{height:100,type:"area",toolbar:{show:!1},sparkline:{enabled:!0},grid:{show:!1,padding:{left:0,right:0}}},colors:[window.colors.solid.warning],dataLabels:{enabled:!1},stroke:{curve:"smooth",width:2.5},fill:{type:"gradient",gradient:{shadeIntensity:.9,opacityFrom:.7,opacityTo:.5,stops:[0,80,100]}},series:[{name:"Orders",data:[10,15,8,15,7,12,8]}],xaxis:{labels:{show:!1},axisBorder:{show:!1}},yaxis:[{y:0,offsetX:0,offsetY:0,padding:{left:0,right:0}}],tooltip:{x:{show:!1}}},new ApexCharts(l,o).render(),t={chart:{type:"bar",height:200,sparkline:{enabled:!0},toolbar:{show:!1}},states:{hover:{filter:"none"}},colors:[s,s,window.colors.solid.primary,s,s,s],series:[{name:"Sessions",data:[75,125,225,175,125,75,25]}],grid:{show:!1,padding:{left:0,right:0}},plotOptions:{bar:{columnWidth:"75%",distributed:!0,endingShape:"rounded"}},tooltip:{x:{show:!1}},xaxis:{type:"numeric"}},new ApexCharts(h,t).render(),r={chart:{height:270,type:"radialBar"},plotOptions:{radialBar:{size:150,offsetY:20,startAngle:-150,endAngle:150,hollow:{size:"65%"},track:{background:"#fff",strokeWidth:"100%"},dataLabels:{name:{offsetY:-5,color:i,fontSize:"1rem"},value:{offsetY:15,color:i,fontSize:"1.714rem"}}}},colors:[window.colors.solid.danger],fill:{type:"gradient",gradient:{shade:"dark",type:"horizontal",shadeIntensity:.5,gradientToColors:[window.colors.solid.primary],inverseColors:!0,opacityFrom:1,opacityTo:1,stops:[0,100]}},stroke:{dashArray:8},series:[83],labels:["Completed Tickets"]},new ApexCharts(p,r).render(),a={chart:{height:300,type:"radar",dropShadow:{enabled:!0,blur:8,left:1,top:1,opacity:.2},toolbar:{show:!1},offsetY:5},series:[{name:"Sales",data:[90,50,86,40,100,20]},{name:"Visit",data:[70,75,70,76,20,85]}],stroke:{width:0},colors:[window.colors.solid.primary,window.colors.solid.info],plotOptions:{radar:{polygons:{strokeColors:[n,"transparent","transparent","transparent","transparent","transparent"],connectorColors:"transparent"}}},fill:{type:"gradient",gradient:{shade:"dark",gradientToColors:[window.colors.solid.primary,window.colors.solid.info],shadeIntensity:1,type:"horizontal",opacityFrom:1,opacityTo:1,stops:[0,100,100,100]}},markers:{size:0},legend:{show:!1},labels:["Jan","Feb","Mar","Apr","May","Jun"],dataLabels:{background:{foreColor:[n,n,n,n,n,n]}},yaxis:{show:!1},grid:{show:!1,padding:{bottom:-27}}},new ApexCharts(c,a).render()
       }
        $.blockUI({
            message:
              '<div class="d-flex justify-content-center align-items-center"><p class="me-50 mb-0">Please wait Fetching data...</p> <div class="spinner-border text-danger text-white" role="status"></div> </div>',
            timeout: 1000,
            css: {
              backgroundColor: 'transparent',
              color: '#fff',
              border: '0'
            },
            overlayCSS: {
              opacity: 0.8
            }
          });
  	 }));
    
    const button = document.getElementById("signout_button");
    button.onclick = () => {
      google.accounts.id.disableAutoSelect();
      console.log('User signed out.');
      $("#email").val('');
		$("#logoutForm").submit();
    }
	  
    </script>
</body>
</html>