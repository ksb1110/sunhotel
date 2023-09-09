<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

<%@ page import="nextez.com.vo.SingletonData" %>
 
<%@ include file="/WEB-INF/jsp/common/pageHeader_jejusi.jsp" %>
              
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/kiosk/threesixty.css">
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jejusiBuilding/office.js?v=<%=SingletonData.getInstance().getJsCssVersion()%>"></script>


<!-- 지도영역 ZoomIn ZoomOut script --> 
<script src="../../../js/comm/pinch-zoom.umd.js"></script>  



<title>메인페이지 - 제주시 스마트청사 안내</title> 
 
</head>
<body>

<div id="wrap">

    <!--Contents 영역-->
    <main id="main_wrap">
        <section id="container_wrap">
            <div class="content_top_wrap">
               
    
              <%/* home btn, search area - content_top_wrap */%>
              <%@ include file="/WEB-INF/jsp/common/pageSearch_jejusi.jsp" %>

            </div>
    
 
            
            <div class="content_area">          
                <div id="container">
                    <div id="contents"> 
                    <!--실제 컨텐츠-->               
                    <h2 class="title1"><span>청사</span> <span class="inline">전체보기</span></h2>
                        
                    <div class="office_info_area">
                    
                        <div class="office_map3d_wrap pinch-zoom"> 
                            
                            <!--// 360 영역 -->  
                            <div class="threesixty product1"  id="loading_now_ul" style="display:none;">
                                <div class="spinner">
                                    <span>0%</span>
                                </div>
                                <ul class="office_map3d threesixty_images">
                                </ul>
                            </div> 
                            <!-- 360 영역 //-->
                            
                             <!--// 360 로딩 전 노출  
                                  // 360도 로딩시 정면 이미지를 먼저 보여주고 로딩이 다 되면 360 이미지로 변경
                             -->
                              <ul id="loading_prev_ul"  style="display:;"   >
                                  <li><img src="/images/kiosk/sub/office/map3d/map3d_1.png" class="current-image"></li>
                                <ul class="building_name">
                                    <li onclick="fn_gomap('B01',1);" style="left: 819px; top: 243px;"><button type="button">본관</button></li>
                                    <li onclick="fn_gomap('B02',1);" style="left: 450px; top: 230px;"><button type="button">1별관</button></li>
                                    <li onclick="fn_gomap('B03',1);" style="left: 245px; top: 290px;"><button type="button">2별관</button></li>
                                    <li onclick="fn_gomap('B08',1);" style="left: 145px; top: 255px;"><button type="button">복지동</button></li>
                                    <li onclick="fn_gomap('B09',1);" style="left: 120px; top: 308px;"><button type="button">상하수도과</button></li>
                                    <li onclick="fn_gomap('B04',1);" style="left: 475px; top: 385px;"><button type="button">3별관</button></li>
                                    <li onclick="fn_gomap('B05',1);" style="left: 680px; top: 395px;"><button type="button">4별관</button></li>
                                    <li onclick="fn_gomap('B06',1);" style="left: 1135px; top: 435px;"><button type="button">5별관</button></li>
                                    <li onclick="fn_gomap('B07',1);" style="left: 1320px; top: 480px;"><button type="button">5별관 부속동</button></li>
                                    <li onclick="fn_gomap('B10',1);" style="left: 583px; top: 340px;"><button type="button">6별관</button></li>
                                </ul>
                              </ul>
                            <!-- 360 로딩 전 노출  //-->

                            <div style="display:none;" id="office_map_li01" >
                                <ul class="building_name">
                                    <li onclick="fn_gomap('B01',1);" style="left: 819px; top: 243px;"><button type="button">본관</button></li>
                                    <li onclick="fn_gomap('B02',1);" style="left: 450px; top: 230px;"><button type="button">1별관</button></li>
                                    <li onclick="fn_gomap('B03',1);" style="left: 245px; top: 290px;"><button type="button">2별관</button></li>
                                    <li onclick="fn_gomap('B08',1);" style="left: 145px; top: 255px;"><button type="button">복지동</button></li>
                                    <li onclick="fn_gomap('B09',1);" style="left: 120px; top: 308px;"><button type="button">상하수도과</button></li>
                                    <li onclick="fn_gomap('B04',1);" style="left: 475px; top: 385px;"><button type="button">3별관</button></li>
                                    <li onclick="fn_gomap('B05',1);" style="left: 680px; top: 395px;"><button type="button">4별관</button></li>
                                    <li onclick="fn_gomap('B06',1);" style="left: 1135px; top: 435px;"><button type="button">5별관</button></li>
                                    <li onclick="fn_gomap('B07',1);" style="left: 1320px; top: 480px;"><button type="button">5별관 부속동</button></li>
                                    <li onclick="fn_gomap('B10',1);" style="left: 583px; top: 340px;"><button type="button">6별관</button></li>
                                </ul>
                            </div>
                            <div style="display:none;" id="office_map_li02" >
                               <ul class="building_name">
                                    <li onclick="fn_gomap('B01',1);" style="left: 829px; top: 250px;"><button type="button">본관</button></li>
                                    <li onclick="fn_gomap('B02',1);" style="left: 465px; top: 210px;"><button type="button">1별관</button></li>
                                    <li onclick="fn_gomap('B03',1);" style="left: 262px; top: 257px;"><button type="button">2별관</button></li>
                                    <li onclick="fn_gomap('B08',1);" style="left: 190px; top: 215px;"><button type="button">복지동</button></li>
                                    <li onclick="fn_gomap('B09',1);" style="left: 140px; top: 263px;"><button type="button">상하수도과</button></li>
                                    <li onclick="fn_gomap('B04',1);" style="left: 425px; top: 365px;"><button type="button">3별관</button></li>
                                    <li onclick="fn_gomap('B05',1);" style="left: 628px; top: 395px;"><button type="button">4별관</button></li>
                                    <li onclick="fn_gomap('B06',1);" style="left: 1070px; top: 465px;"><button type="button">5별관</button></li>
                                    <li onclick="fn_gomap('B07',1);" style="left: 1235px; top: 530px;"><button type="button">5별관 부속동</button></li>
                                    <li onclick="fn_gomap('B10',1);" style="left: 530px; top: 320px;"><button type="button">6별관</button></li>
                                </ul>
                            </div>
                            <div style="display:none;" id="office_map_li03" >
                               <ul class="building_name">
                                    <li onclick="fn_gomap('B01',1);" style="left: 835px; top: 258px;"><button type="button">본관</button></li>
                                    <li onclick="fn_gomap('B02',1);" style="left: 485px; top: 195px;"><button type="button">1별관</button></li>
                                    <li onclick="fn_gomap('B03',1);" style="left: 287px; top: 228px;"><button type="button">2별관</button></li>
                                    <li onclick="fn_gomap('B08',1);" style="left: 248px; top: 185px;"><button type="button">복지동</button></li>
                                    <li onclick="fn_gomap('B09',1);" style="left: 180px; top: 225px;"><button type="button">상하수도과</button></li>
                                    <li onclick="fn_gomap('B04',1);" style="left: 385px; top: 340px;"><button type="button">3별관</button></li>
                                    <li onclick="fn_gomap('B05',1);" style="left: 575px; top: 383px;"><button type="button">4별관</button></li>
                                    <li onclick="fn_gomap('B06',1);" style="left: 970px; top: 490px;"><button type="button">5별관</button></li>
                                    <li onclick="fn_gomap('B07',1);" style="left: 1125px; top: 575px;"><button type="button">5별관 부속동</button></li>
                                    <li onclick="fn_gomap('B10',1);" style="left: 495px; top: 305px;"><button type="button">6별관</button></li>
                                </ul>
                            </div>
                            <div style="display:none;" id="office_map_li04" >
                               <ul class="building_name">
                                    <li onclick="fn_gomap('B01',1);" style="left: 840px; top: 265px;"><button type="button">본관</button></li>
                                    <li onclick="fn_gomap('B02',1);" style="left: 525px; top: 180px;"><button type="button">1별관</button></li>
                                    <li onclick="fn_gomap('B03',1);" style="left: 325px; top: 200px;"><button type="button">2별관</button></li>
                                    <li onclick="fn_gomap('B08',1);" style="left: 308px; top: 160px; z-index: 1;"><button type="button">복지동</button></li>
                                    <li onclick="fn_gomap('B09',1);" style="left: 225px; top: 195px;"><button type="button">상하수도과</button></li>
                                    <li onclick="fn_gomap('B04',1);" style="left: 355px; top: 313px;"><button type="button">3별관</button></li>
                                    <li onclick="fn_gomap('B05',1);" style="left: 530px; top: 370px;"><button type="button">4별관</button></li>
                                    <li onclick="fn_gomap('B06',1);" style="left: 860px; top: 510px;"><button type="button">5별관</button></li>
                                    <li onclick="fn_gomap('B07',1);" style="left: 985px; top: 608px;"><button type="button">5별관 부속동</button></li>
                                    <li onclick="fn_gomap('B10',1);" style="left: 460px; top: 285px;"><button type="button">6별관</button></li>
                                </ul>
                            </div>
                            <div style="display:none;" id="office_map_li05" >
                               <ul class="building_name">
                                    <li onclick="fn_gomap('B01',1);" style="left: 838px; top: 275px;"><button type="button">본관</button></li>
                                    <li onclick="fn_gomap('B02',1);" style="left: 560px; top: 170px;"><button type="button">1별관</button></li>
                                    <li onclick="fn_gomap('B03',1);" style="left: 375px; top: 175px;"><button type="button">2별관</button></li>
                                    <li onclick="fn_gomap('B08',1);" style="left: 383px; top: 135px; z-index: 1;"><button type="button">복지동</button></li>
                                    <li onclick="fn_gomap('B09',1);" style="left: 285px; top: 165px;"><button type="button">상하수도과</button></li>
                                    <li onclick="fn_gomap('B04',1);" style="left: 345px; top: 285px;"><button type="button">3별관</button></li>
                                    <li onclick="fn_gomap('B05',1);" style="left: 495px; top: 355px;"><button type="button">4별관</button></li>
                                    <li onclick="fn_gomap('B06',1);" style="left: 745px; top: 515px;"><button type="button">5별관</button></li>
                                    <li onclick="fn_gomap('B07',1);" style="left: 830px; top: 630px;"><button type="button">5별관 부속동</button></li>
                                    <li onclick="fn_gomap('B10',1);" style="left: 440px; top: 268px;"><button type="button">6별관</button></li>
                                </ul>
                            </div>
                            <div style="display:none;" id="office_map_li06" >
                               <ul class="building_name">
                                    <li onclick="fn_gomap('B01',1);" style="left: 832px; top: 283px;"><button type="button">본관</button></li>
                                    <li onclick="fn_gomap('B02',1);" style="left: 600px; top: 165px;"><button type="button">1별관</button></li>
                                    <li onclick="fn_gomap('B03',1);" style="left: 425px; top: 156px;"><button type="button">2별관</button></li>
                                    <li onclick="fn_gomap('B08',1);" style="left: 455px; top: 118px; z-index: 1;"><button type="button">복지동</button></li>
                                    <li onclick="fn_gomap('B09',1);" style="left: 360px; top: 145px; z-index: 1;"><button type="button">상하수도과</button></li>
                                    <li onclick="fn_gomap('B04',1);" style="left: 350px; top: 260px;"><button type="button">3별관</button></li>
                                    <li onclick="fn_gomap('B05',1);" style="left: 460px; top: 335px;"><button type="button">4별관</button></li>
                                    <li onclick="fn_gomap('B06',1);" style="left: 625px; top: 510px;"><button type="button">5별관</button></li>
                                    <li onclick="fn_gomap('B07',1);" style="left: 660px; top: 630px;"><button type="button">5별관 부속동</button></li>
                                    <li onclick="fn_gomap('B10',1);" style="left: 425px; top: 248px;"><button type="button">6별관</button></li>
                                </ul>
                            </div>
                            <div style="display:none;" id="office_map_li07" >
                               <ul class="building_name">
                                    <li onclick="fn_gomap('B01',1);" style="left: 823px; top: 290px;"><button type="button">본관</button></li>
                                    <li onclick="fn_gomap('B02',1);" style="left: 640px; top: 155px;"><button type="button">1별관</button></li>
                                    <li onclick="fn_gomap('B03',1);" style="left: 480px; top: 141px;"><button type="button">2별관</button></li>
                                    <li onclick="fn_gomap('B08',1);" style="left: 535px; top: 108px;"><button type="button">복지동</button></li>
                                    <li onclick="fn_gomap('B09',1);" style="left: 425px; top: 125px; z-index: 1;"><button type="button">상하수도과</button></li>
                                    <li onclick="fn_gomap('B04',1);" style="left: 350px; top: 226px;"><button type="button">3별관</button></li>
                                    <li onclick="fn_gomap('B05',1);" style="left: 445px; top: 315px;"><button type="button">4별관</button></li>
                                    <li onclick="fn_gomap('B06',1);" style="left: 515px; top: 500px;"><button type="button">5별관</button></li>
                                    <li onclick="fn_gomap('B07',1);" style="left: 500px; top: 618px;"><button type="button">5별관 부속동</button></li>
                                    <li onclick="fn_gomap('B10',1);" style="left: 425px; top: 228px;"><button type="button">6별관</button></li>
                                </ul>
                            </div>
                            <div style="display:none;" id="office_map_li08" >
                               <ul class="building_name">
                                    <li onclick="fn_gomap('B01',1);" style="left: 812px; top: 298px;"><button type="button">본관</button></li>
                                    <li onclick="fn_gomap('B02',1);" style="left: 685px; top: 155px;"><button type="button">1별관</button></li>
                                    <li onclick="fn_gomap('B03',1);" style="left: 545px; top: 130px;"><button type="button">2별관</button></li>
                                    <li onclick="fn_gomap('B08',1);" style="left: 610px; top: 100px; z-index: 1;"><button type="button">복지동</button></li>
                                    <li onclick="fn_gomap('B09',1);" style="left: 500px; top: 110px; z-index: 1;"><button type="button">상하수도과</button></li>
                                    <li onclick="fn_gomap('B04',1);" style="left: 373px; top: 200px;"><button type="button">3별관</button></li>
                                    <li onclick="fn_gomap('B05',1);" style="left: 435px; top: 295px;"><button type="button">4별관</button></li>
                                    <li onclick="fn_gomap('B06',1);" style="left: 415px; top: 475px;"><button type="button">5별관</button></li>
                                    <li onclick="fn_gomap('B07',1);" style="left: 350px; top: 585px;"><button type="button">5별관 부속동</button></li>
                                    <li onclick="fn_gomap('B10',1);" style="left: 425px; top: 208px;"><button type="button">6별관</button></li>
                                </ul>
                            </div>
                            <div style="display:none;" id="office_map_li09" >
                               <ul class="building_name">
                                    <li onclick="fn_gomap('B01',1);" style="left: 797px; top: 303px;"><button type="button">본관</button></li>
                                    <li onclick="fn_gomap('B02',1);" style="left: 730px; top: 155px;"><button type="button">1별관</button></li>
                                    <li onclick="fn_gomap('B03',1);" style="left: 612px; top: 120px;"><button type="button">2별관</button></li>
                                    <li onclick="fn_gomap('B08',1);" style="left: 695px; top: 100px;"><button type="button">복지동</button></li>
                                    <li onclick="fn_gomap('B09',1);" style="left: 580px; top: 100px; z-index: 1"><button type="button">상하수도과</button></li>
                                    <li onclick="fn_gomap('B04',1);" style="left: 405px; top: 180px;"><button type="button">3별관</button></li>
                                    <li onclick="fn_gomap('B05',1);" style="left: 440px; top: 275px;"><button type="button">4별관</button></li>
                                    <li onclick="fn_gomap('B06',1);" style="left: 330px; top: 440px;"><button type="button">5별관</button></li>
                                    <li onclick="fn_gomap('B07',1);" style="left: 228px; top: 545px;"><button type="button">5별관 부속동</button></li>
                                    <li onclick="fn_gomap('B10',1);" style="left: 440px; top: 188px;"><button type="button">6별관</button></li>
                                </ul>
                            </div>
                            <div style="display:none;" id="office_map_li10" >
                               <ul class="building_name">
                                    <li onclick="fn_gomap('B01',1);" style="left: 780px; top: 308px;"><button type="button">본관</button></li>
                                    <li onclick="fn_gomap('B02',1);" style="left: 767px; top: 155px;"><button type="button">1별관</button></li>
                                    <li onclick="fn_gomap('B03',1);" style="left: 678px; top: 118px;"><button type="button">2별관</button></li>
                                    <li onclick="fn_gomap('B08',1);" style="left: 770px; top: 98px; z-index: 1"><button type="button">복지동</button></li>
                                    <li onclick="fn_gomap('B09',1);" style="left: 655px; top: 95px; z-index: 1"><button type="button">상하수도과</button></li>
                                    <li onclick="fn_gomap('B04',1);" style="left: 448px; top: 163px;"><button type="button">3별관</button></li>
                                    <li onclick="fn_gomap('B05',1);" style="left: 445px; top: 255px;"><button type="button">4별관</button></li>
                                    <li onclick="fn_gomap('B06',1);" style="left: 270px; top: 405px;"><button type="button">5별관</button></li>
                                    <li onclick="fn_gomap('B07',1);" style="left: 133px; top: 500px;"><button type="button">5별관 부속동</button></li>
                                    <li onclick="fn_gomap('B10',1);" style="left: 460px; top: 175px;"><button type="button">6별관</button></li>
                                    <li onclick="fn_gomap('B10',1);" style="left: 460px; top: 175px;"><button type="button">6별관</button></li>
                                </ul>
                            </div>
                            <div style="display:none;" id="office_map_li11" >
                               <ul class="building_name">
                                    <li onclick="fn_gomap('B01',1);" style="left: 760px; top: 310px;"><button type="button">본관</button></li>
                                    <li onclick="fn_gomap('B02',1);" style="left: 800px; top: 155px;"><button type="button">1별관</button></li>
                                    <li onclick="fn_gomap('B03',1);" style="left: 745px; top: 115px; z-index: 2;"><button type="button">2별관</button></li>
                                    <li onclick="fn_gomap('B08',1);" style="left: 850px; top: 100px; z-index: 1"><button type="button">복지동</button></li>
                                    <li onclick="fn_gomap('B09',1);" style="left: 735px; top: 95px; z-index: 1"><button type="button">상하수도과</button></li>
                                    <li onclick="fn_gomap('B04',1);" style="left: 490px; top: 150px;"><button type="button">3별관</button></li>
                                    <li onclick="fn_gomap('B05',1);" style="left: 465px; top: 240px;"><button type="button">4별관</button></li>
                                    <li onclick="fn_gomap('B06',1);" style="left: 225px; top: 370px;"><button type="button">5별관</button></li>
                                    <li onclick="fn_gomap('B07',1);" style="left: 70px; top: 445px;"><button type="button">5별관 부속동</button></li>
                                    <li onclick="fn_gomap('B10',1);" style="left: 490px; top: 158px;"><button type="button">6별관</button></li>
                                </ul>
                            </div>
                            <div style="display:none;" id="office_map_li12" >
                               <ul class="building_name">
                                    <li onclick="fn_gomap('B01',1);" style="left: 740px; top: 315px;"><button type="button">본관</button></li>
                                    <li onclick="fn_gomap('B02',1);" style="left: 850px; top: 165px;"><button type="button">1별관</button></li>
                                    <li onclick="fn_gomap('B03',1);" style="left: 810px; top: 120px; z-index: 2;"><button type="button">2별관</button></li>
                                    <li onclick="fn_gomap('B08',1);" style="left: 920px; top: 115px; z-index: 1"><button type="button">복지동</button></li>
                                    <li onclick="fn_gomap('B09',1);" style="left: 810px; top: 100px; z-index: 1"><button type="button">상하수도과</button></li>
                                    <li onclick="fn_gomap('B04',1);" style="left: 535px; top: 140px;"><button type="button">3별관</button></li>
                                    <li onclick="fn_gomap('B05',1);" style="left: 485px; top: 222px;"><button type="button">4별관</button></li>
                                    <li onclick="fn_gomap('B06',1);" style="left: 200px; top: 333px;"><button type="button">5별관</button></li>
                                    <li onclick="fn_gomap('B07',1);" style="left: 35px; top: 393px;"><button type="button">5별관 부속동</button></li>
                                    <li onclick="fn_gomap('B10',1);" style="left: 525px; top: 145px;"><button type="button">6별관</button></li>
                                </ul>
                            </div>
							<div style="display:none;" id="office_map_li13" >
                               <ul class="building_name">
                                    <li onclick="fn_gomap('B01',1);" style="left: 720px; top: 315px;"><button type="button">본관</button></li>
                                    <li onclick="fn_gomap('B02',1);" style="left: 895px; top: 170px;"><button type="button">1별관</button></li>
                                    <li onclick="fn_gomap('B03',1);" style="left: 875px; top: 130px;; z-index: 2;"><button type="button">2별관</button></li>
                                    <li onclick="fn_gomap('B08',1);" style="left: 1000px; top: 128px; z-index: 1;"><button type="button">복지동</button></li>
                                    <li onclick="fn_gomap('B09',1);" style="left: 885px; top: 110px; z-index: 1;"><button type="button">상하수도과</button></li>
                                    <li onclick="fn_gomap('B04',1);" style="left: 590px; top: 135px;"><button type="button">3별관</button></li>
                                    <li onclick="fn_gomap('B05',1);" style="left: 518px; top: 210px;"><button type="button">4별관</button></li>
                                    <li onclick="fn_gomap('B06',1);" style="left: 185px; top: 300px;"><button type="button">5별관</button></li>
                                    <li onclick="fn_gomap('B07',1);" style="left: 18px; top: 345px;"><button type="button">5별관 부속동</button></li>
                                    <li onclick="fn_gomap('B10',1);" style="left: 560px; top: 135px;"><button type="button">6별관</button></li>
                                </ul>
                            </div>
							<div style="display:none;" id="office_map_li14" >
                               <ul class="building_name">
                                    <li onclick="fn_gomap('B01',1);" style="left: 698px; top: 315px;"><button type="button">본관</button></li>
                                    <li onclick="fn_gomap('B02',1);" style="left: 925px; top: 180px;"><button type="button">1별관</button></li>
                                    <li onclick="fn_gomap('B03',1);" style="left: 935px; top: 142px; z-index: 2;"><button type="button">2별관</button></li>
                                    <li onclick="fn_gomap('B08',1);" style="left: 1075px; top: 146px; z-index: 1;"><button type="button">복지동</button></li>
                                    <li onclick="fn_gomap('B09',1);" style="left: 965px; top: 125px; z-index: 1;"><button type="button">상하수도과</button></li>
                                    <li onclick="fn_gomap('B04',1);" style="left: 645px; top: 130px;"><button type="button">3별관</button></li>
                                    <li onclick="fn_gomap('B05',1);" style="left: 550px; top: 200px;"><button type="button">4별관</button></li>
                                    <li onclick="fn_gomap('B06',1);" style="left: 190px; top: 265px;"><button type="button">5별관</button></li>
                                    <li onclick="fn_gomap('B07',1);" style="left: 30px; top: 295px;"><button type="button">5별관 부속동</button></li>
                                    <li onclick="fn_gomap('B10',1);" style="left: 605px; top: 130px;"><button type="button">6별관</button></li>
                                </ul>
                            </div>
							<div style="display:none;" id="office_map_li15" >
                               <ul class="building_name">
                                    <li onclick="fn_gomap('B01',1);" style="left: 675px; top: 313px;"><button type="button">본관</button></li>
                                    <li onclick="fn_gomap('B02',1);" style="left: 950px; top: 195px;"><button type="button">1별관</button></li>
                                    <li onclick="fn_gomap('B03',1);" style="left: 995px; top: 156px; z-index: 2"><button type="button">2별관</button></li>
                                    <li onclick="fn_gomap('B08',1);" style="left: 1135px; top: 166px; z-index: 1"><button type="button">복지동</button></li>
                                    <li onclick="fn_gomap('B09',1);" style="left: 1035px; top: 138px; z-index: 1"><button type="button">상하수도과</button></li>
                                    <li onclick="fn_gomap('B04',1);" style="left: 690px; top: 130px;"><button type="button">3별관</button></li>
                                    <li onclick="fn_gomap('B05',1);" style="left: 585px; top: 190px;"><button type="button">4별관</button></li>
                                    <li onclick="fn_gomap('B06',1);" style="left: 215px; top: 230px;"><button type="button">5별관</button></li>
                                    <li onclick="fn_gomap('B07',1);" style="left: 55px; top: 252px;"><button type="button">5별관 부속동</button></li>
                                    <li onclick="fn_gomap('B10',1);" style="left: 645px; top: 125px;"><button type="button">6별관</button></li>
                                 </ul>
                            </div>
							<div style="display:none;" id="office_map_li16" >
                               <ul class="building_name">
                                    <li onclick="fn_gomap('B01',1);" style="left: 658px; top: 308px;"><button type="button">본관</button></li>
                                    <li onclick="fn_gomap('B02',1);" style="left: 980px; top: 215px;"><button type="button">1별관</button></li>
                                    <li onclick="fn_gomap('B03',1);" style="left: 1045px; top: 173px; z-index: 2"><button type="button">2별관</button></li>
                                    <li onclick="fn_gomap('B08',1);" style="left: 1195px; top: 195px; z-index: 1"><button type="button">복지동</button></li>
                                    <li onclick="fn_gomap('B09',1);" style="left: 1100px; top: 160px; z-index: 1"><button type="button">상하수도과</button></li>
                                    <li onclick="fn_gomap('B04',1);" style="left: 735px; top: 130px;"><button type="button">3별관</button></li>
                                    <li onclick="fn_gomap('B05',1);" style="left: 620px; top: 182px;"><button type="button">4별관</button></li>
                                    <li onclick="fn_gomap('B06',1);" style="left: 250px; top: 202px;"><button type="button">5별관</button></li>
                                    <li onclick="fn_gomap('B07',1);" style="left: 100px; top: 212px;"><button type="button">5별관 부속동</button></li>
                                    <li onclick="fn_gomap('B10',1);" style="left: 690px; top: 120px;"><button type="button">6별관</button></li>
                                </ul>
                            </div>
							<div style="display:none;" id="office_map_li17" >
                               <ul class="building_name">
                                    <li onclick="fn_gomap('B01',1);" style="left: 642px; top: 303px;"><button type="button">본관</button></li>
                                    <li onclick="fn_gomap('B02',1);" style="left: 995px; top: 230px;"><button type="button">1별관</button></li>
                                    <li onclick="fn_gomap('B03',1);" style="left: 1090px; top: 195px; z-index: 2"><button type="button">2별관</button></li>
                                    <li onclick="fn_gomap('B08',1);" style="left: 1245px; top: 225px; z-index: 1"><button type="button">복지동</button></li>
                                    <li onclick="fn_gomap('B09',1);" style="left: 1160px; top: 185px; z-index: 1"><button type="button">상하수도과</button></li>
                                    <li onclick="fn_gomap('B04',1);" style="left: 800px; top: 135px;"><button type="button">3별관</button></li>
                                    <li onclick="fn_gomap('B05',1);" style="left: 660px; top: 180px;"><button type="button">4별관</button></li>
                                    <li onclick="fn_gomap('B06',1);" style="left: 290px; top: 178px;"><button type="button">5별관</button></li>
                                    <li onclick="fn_gomap('B07',1);" style="left: 150px; top: 178px;"><button type="button">5별관 부속동</button></li>
                                    <li onclick="fn_gomap('B10',1);" style="left: 735px; top: 120px;"><button type="button">6별관</button></li>
                                </ul>
                            </div>
							<div style="display:none;" id="office_map_li18" >
                               <ul class="building_name">
                                    <li onclick="fn_gomap('B01',1);" style="left: 628px; top: 298px;"><button type="button">본관</button></li>
                                    <li onclick="fn_gomap('B02',1);" style="left: 1000px; top: 250px;"><button type="button">1별관</button></li>
                                    <li onclick="fn_gomap('B03',1);" style="left: 1132px; top: 222px; z-index: 2"><button type="button">2별관</button></li>
                                    <li onclick="fn_gomap('B08',1);" style="left: 1285px; top: 260px; z-index: 1"><button type="button">복지동</button></li>
                                    <li onclick="fn_gomap('B09',1);" style="left: 1205px; top: 215px; z-index: 1"><button type="button">상하수도과</button></li>
                                    <li onclick="fn_gomap('B04',1);" style="left: 850px; top: 140px;"><button type="button">3별관</button></li>
                                    <li onclick="fn_gomap('B05',1);" style="left: 710px; top: 178px;"><button type="button">4별관</button></li>
                                    <li onclick="fn_gomap('B06',1);" style="left: 345px; top: 152px;"><button type="button">5별관</button></li>
                                    <li onclick="fn_gomap('B07',1);" style="left: 222px; top: 148px;"><button type="button">5별관 부속동</button></li>
                                    <li onclick="fn_gomap('B10',1);" style="left: 780px; top: 120px;"><button type="button">6별관</button></li>
                                </ul>
                            </div>
							<div style="display:none;" id="office_map_li19" >
                               <ul class="building_name">
                                    <li onclick="fn_gomap('B01',1);" style="left: 618px; top: 290px;"><button type="button">본관</button></li>
                                    <li onclick="fn_gomap('B02',1);" style="left: 995px; top: 265px;"><button type="button">1별관</button></li>
                                    <li onclick="fn_gomap('B03',1);" style="left: 1160px; top: 248px; z-index: 2"><button type="button">2별관</button></li>
                                    <li onclick="fn_gomap('B08',1);" style="left: 1310px; top: 300px; z-index: 1"><button type="button">복지동</button></li>
                                    <li onclick="fn_gomap('B09',1);" style="left: 1250px; top: 250px; z-index: 1"><button type="button">상하수도과</button></li>
                                    <li onclick="fn_gomap('B04',1);" style="left: 900px; top: 150px;"><button type="button">3별관</button></li>
                                    <li onclick="fn_gomap('B05',1);" style="left: 745px; top: 177px;"><button type="button">4별관</button></li>
                                    <li onclick="fn_gomap('B06',1);" style="left: 410px; top: 133px;"><button type="button">5별관</button></li>
                                    <li onclick="fn_gomap('B07',1);" style="left: 300px; top: 123px;"><button type="button">5별관 부속동</button></li>
                                    <li onclick="fn_gomap('B10',1);" style="left: 825px; top: 125px;"><button type="button">6별관</button></li>
                                </ul>
                            </div>
							<div style="display:none;" id="office_map_li20" >
                               <ul class="building_name">
                                    <li onclick="fn_gomap('B01',1);" style="left: 610px; top: 283px;"><button type="button">본관</button></li>
                                    <li onclick="fn_gomap('B02',1);" style="left: 1000px; top: 285px;"><button type="button">1별관</button></li>
                                    <li onclick="fn_gomap('B03',1);" style="left: 1177px; top: 277px; z-index: 2"><button type="button">2별관</button></li>
                                    <li onclick="fn_gomap('B08',1);" style="left: 1322px; top: 345px; z-index: 1"><button type="button">복지동</button></li>
                                    <li onclick="fn_gomap('B09',1);" style="left: 1285px; top: 288px; z-index: 1"><button type="button">상하수도과</button></li>
                                    <li onclick="fn_gomap('B04',1);" style="left: 945px; top: 160px;"><button type="button">3별관</button></li>
                                    <li onclick="fn_gomap('B05',1);" style="left: 785px; top: 180px;"><button type="button">4별관</button></li>
                                    <li onclick="fn_gomap('B06',1);" style="left: 480px; top: 118px;"><button type="button">5별관</button></li>
                                    <li onclick="fn_gomap('B07',1);" style="left: 365px; top: 102px;"><button type="button">5별관 부속동</button></li>
                                    <li onclick="fn_gomap('B10',1);" style="left: 865px; top: 135px;"><button type="button">6별관</button></li>
                                </ul>
                            </div>
							<div style="display:none;" id="office_map_li21" >
                               <ul class="building_name">
                                    <li onclick="fn_gomap('B01',1);" style="left: 605px; top: 275px;"><button type="button">본관</button></li>
                                    <li onclick="fn_gomap('B02',1);" style="left: 980px; top: 303px;"><button type="button">1별관</button></li>
                                    <li onclick="fn_gomap('B03',1);" style="left: 1185px; top: 310px; z-index: 2"><button type="button">2별관</button></li>
                                    <li onclick="fn_gomap('B08',1);" style="left: 1315px; top: 385px; z-index: 1"><button type="button">복지동</button></li>
                                    <li onclick="fn_gomap('B09',1);" style="left: 1300px; top: 330px; z-index: 1"><button type="button">상하수도과</button></li>
                                    <li onclick="fn_gomap('B04',1);" style="left: 990px; top: 175px;"><button type="button">3별관</button></li>
                                    <li onclick="fn_gomap('B05',1);" style="left: 825px; top: 185px;"><button type="button">4별관</button></li>
                                    <li onclick="fn_gomap('B06',1);" style="left: 540px; top: 105px;"><button type="button">5별관</button></li>
                                    <li onclick="fn_gomap('B07',1);" style="left: 454px; top: 88px; z-index: 1"><button type="button">5별관 부속동</button></li>
                                    <li onclick="fn_gomap('B10',1);" style="left: 905px; top: 145px;"><button type="button">6별관</button></li>
                                </ul>
                            </div>
							<div style="display:none;" id="office_map_li22" >
                               <ul class="building_name">
                                    <li onclick="fn_gomap('B01',1);" style="left: 605px; top: 268px;"><button type="button">본관</button></li>
                                    <li onclick="fn_gomap('B02',1);" style="left: 960px; top: 325px;"><button type="button">1별관</button></li>
                                    <li onclick="fn_gomap('B03',1);" style="left: 1172px; top: 343px; z-index: 2"><button type="button">2별관</button></li>
                                    <li onclick="fn_gomap('B08',1);" style="left: 1285px; top: 433px; z-index: 1"><button type="button">복지동</button></li>
                                    <li onclick="fn_gomap('B09',1);" style="left: 1295px; top: 370px; z-index: 1"><button type="button">상하수도과</button></li>
                                    <li onclick="fn_gomap('B04',1);" style="left: 1025px; top: 190px;"><button type="button">3별관</button></li>
                                    <li onclick="fn_gomap('B05',1);" style="left: 870px; top: 193px;"><button type="button">4별관</button></li>
                                    <li onclick="fn_gomap('B06',1);" style="left: 620px; top: 100px;"><button type="button">5별관</button></li>
                                    <li onclick="fn_gomap('B07',1);" style="left: 540px; top: 77px;"><button type="button">5별관 부속동</button></li>
                                    <li onclick="fn_gomap('B10',1);" style="left: 940px; top: 155px;"><button type="button">6별관</button></li>
                                </ul>
                            </div>
							<div style="display:none;" id="office_map_li23" >
                               <ul class="building_name">
                                    <li onclick="fn_gomap('B01',1);" style="left: 608px; top: 260px;"><button type="button">본관</button></li>
                                    <li onclick="fn_gomap('B02',1);" style="left: 920px; top: 333px;"><button type="button">1별관</button></li>
                                    <li onclick="fn_gomap('B03',1);" style="left: 1145px; top: 375px; z-index: 2"><button type="button">2별관</button></li>
                                    <li onclick="fn_gomap('B08',1);" style="left: 1225px; top: 480px; z-index: 1"><button type="button">복지동</button></li>
                                    <li onclick="fn_gomap('B09',1);" style="left: 1270px; top: 415px; z-index: 1"><button type="button">상하수도과</button></li>
                                    <li onclick="fn_gomap('B04',1);" style="left: 1055px; top: 210px;"><button type="button">3별관</button></li>
                                    <li onclick="fn_gomap('B05',1);" style="left: 910px; top: 205px;"><button type="button">4별관</button></li>
                                    <li onclick="fn_gomap('B06',1);" style="left: 690px; top: 95px;"><button type="button">5별관</button></li>
                                    <li onclick="fn_gomap('B07',1);" style="left: 630px; top: 70px; z-index: 1"><button type="button">5별관 부속동</button></li>
                                    <li onclick="fn_gomap('B10',1);" style="left: 970px; top: 170px;"><button type="button">6별관</button></li>
                                </ul>
                            </div>
							<div style="display:none;" id="office_map_li24" >
                               <ul class="building_name">
                                    <li onclick="fn_gomap('B01',1);" style="left: 612px; top: 252px;"><button type="button">본관</button></li>
                                    <li onclick="fn_gomap('B02',1);" style="left: 880px; top: 355px;"><button type="button">1별관</button></li>
                                    <li onclick="fn_gomap('B03',1);" style="left: 1105px; top: 405px; z-index: 2"><button type="button">2별관</button></li>
                                    <li onclick="fn_gomap('B08',1);" style="left: 1145px; top: 520px; z-index: 1"><button type="button">복지동</button></li>
                                    <li onclick="fn_gomap('B09',1);" style="left: 1220px; top: 460px; z-index: 1"><button type="button">상하수도과</button></li>
                                    <li onclick="fn_gomap('B04',1);" style="left: 1080px; top: 235px;"><button type="button">3별관</button></li>
                                    <li onclick="fn_gomap('B05',1);" style="left: 940px; top: 218px;"><button type="button">4별관</button></li>
                                    <li onclick="fn_gomap('B06',1);" style="left: 767px; top: 98px;"><button type="button">5별관</button></li>
                                    <li onclick="fn_gomap('B07',1);" style="left: 712px; top: 68px; z-index: 1"><button type="button">5별관 부속동</button></li>
                                    <li onclick="fn_gomap('B10',1);" style="left: 995px; top: 185px;"><button type="button">6별관</button></li>
                                </ul>
                            </div>
							<div style="display:none;" id="office_map_li25" >
                               <ul class="building_name">
                                    <li onclick="fn_gomap('B01',1);" style="left: 620px; top: 245px;"><button type="button">본관</button></li>
                                    <li onclick="fn_gomap('B02',1);" style="left: 830px; top: 360px;"><button type="button">1별관</button></li>
                                    <li onclick="fn_gomap('B03',1);" style="left: 1040px; top: 436px; z-index: 2"><button type="button">2별관</button></li>
                                    <li onclick="fn_gomap('B08',1);" style="left: 1045px; top: 555px; z-index: 1"><button type="button">복지동</button></li>
                                    <li onclick="fn_gomap('B09',1);" style="left: 1150px; top: 500px; z-index: 1"><button type="button">상하수도과</button></li>
                                    <li onclick="fn_gomap('B04',1);" style="left: 1090px; top: 258px;"><button type="button">3별관</button></li>
                                    <li onclick="fn_gomap('B05',1);" style="left: 965px; top: 232px;"><button type="button">4별관</button></li>
                                    <li onclick="fn_gomap('B06',1);" style="left: 840px; top: 100px;"><button type="button">5별관</button></li>
                                    <li onclick="fn_gomap('B07',1);" style="left: 800px; top: 70px; z-index: 1"><button type="button">5별관 부속동</button></li>
                                    <li onclick="fn_gomap('B10',1);" style="left: 1015px; top: 200px;"><button type="button">6별관</button></li>
                                </ul>
                            </div>
							<div style="display:none;" id="office_map_li26" >
                               <ul class="building_name">
                                    <li onclick="fn_gomap('B01',1);" style="left: 633px; top: 240px;"><button type="button">본관</button></li>
                                    <li onclick="fn_gomap('B02',1);" style="left: 770px; top: 365px;"><button type="button">1별관</button></li>
                                    <li onclick="fn_gomap('B03',1);" style="left: 970px; top: 460px; z-index: 2"><button type="button">2별관</button></li>
                                    <li onclick="fn_gomap('B08',1);" style="left: 925px; top: 580px; z-index: 1"><button type="button">복지동</button></li>
                                    <li onclick="fn_gomap('B09',1);" style="left: 1055px; top: 530px; z-index: 1"><button type="button">상하수도과</button></li>
                                    <li onclick="fn_gomap('B04',1);" style="left: 1090px; top: 285px;"><button type="button">3별관</button></li>
                                    <li onclick="fn_gomap('B05',1);" style="left: 975px; top: 230px;"><button type="button">4별관</button></li>
                                    <li onclick="fn_gomap('B06',1);" style="left: 905px; top: 105px;"><button type="button">5별관</button></li>
                                    <li onclick="fn_gomap('B07',1);" style="left: 885px; top: 80px; z-index: 1"><button type="button">5별관 부속동</button></li>
                                    <li onclick="fn_gomap('B10',1);" style="left: 1025px; top: 220px;"><button type="button">6별관</button></li>
                                </ul>
                            </div>
							<div style="display:none;" id="office_map_li27" >
                               <ul class="building_name">
                                    <li onclick="fn_gomap('B01',1);" style="left: 645px; top: 235px;"><button type="button">본관</button></li>
                                    <li onclick="fn_gomap('B02',1);" style="left: 715px; top: 365px;"><button type="button">1별관</button></li>
                                    <li onclick="fn_gomap('B03',1);" style="left: 890px; top: 477px; z-index: 2"><button type="button">2별관</button></li>
                                    <li onclick="fn_gomap('B08',1);" style="left: 785px; top: 595px; z-index: 1"><button type="button">복지동</button></li>
                                    <li onclick="fn_gomap('B09',1);" style="left: 945px; top: 565px; z-index: 1"><button type="button">상하수도과</button></li>
                                    <li onclick="fn_gomap('B04',1);" style="left: 1080px; top: 310px;"><button type="button">3별관</button></li>
                                    <li onclick="fn_gomap('B05',1);" style="left: 995px; top: 235px;"><button type="button">4별관</button></li>
                                    <li onclick="fn_gomap('B06',1);" style="left: 975px; top: 120px;"><button type="button">5별관</button></li>
                                    <li onclick="fn_gomap('B07',1);" style="left: 970px; top: 88px; z-index: 1"><button type="button">5별관 부속동</button></li>
                                    <li onclick="fn_gomap('B10',1);" style="left: 1025px; top: 240px;"><button type="button">6별관</button></li>
                                </ul>
                            </div>
							<div style="display:none;" id="office_map_li28" >
                               <ul class="building_name">
                                    <li onclick="fn_gomap('B01',1);" style="left: 662px; top: 230px;"><button type="button">본관</button></li>
                                    <li onclick="fn_gomap('B02',1);" style="left: 655px; top: 365px;"><button type="button">1별관</button></li>
                                    <li onclick="fn_gomap('B03',1);" style="left: 785px; top: 490px; z-index: 2"><button type="button">2별관</button></li>
                                    <li onclick="fn_gomap('B08',1);" style="left: 650px; top: 595px; z-index: 1"><button type="button">복지동</button></li>
                                    <li onclick="fn_gomap('B09',1);" style="left: 815px; top: 580px; z-index: 1"><button type="button">상하수도과</button></li>
                                    <li onclick="fn_gomap('B04',1);" style="left: 1055px; top: 335px;"><button type="button">3별관</button></li>
                                    <li onclick="fn_gomap('B05',1);" style="left: 1010px; top: 252px;"><button type="button">4별관</button></li>
                                    <li onclick="fn_gomap('B06',1);" style="left: 1040px; top: 135px;"><button type="button">5별관</button></li>
                                    <li onclick="fn_gomap('B07',1);" style="left: 1052px; top: 102px; z-index: 1"><button type="button">5별관 부속동</button></li>
                                    <li onclick="fn_gomap('B10',1);" style="left: 1020px; top: 260px;"><button type="button">6별관</button></li>
                                </ul>
                            </div>
							<div style="display:none;" id="office_map_li29" >
                               <ul class="building_name">
                                    <li onclick="fn_gomap('B01',1);" style="left: 680px; top: 225px;"><button type="button">본관</button></li>
                                    <li onclick="fn_gomap('B02',1);" style="left: 600px; top: 355px;"><button type="button">1별관</button></li>
                                    <li onclick="fn_gomap('B03',1);" style="left: 695px; top: 492px; z-index: 2"><button type="button">2별관</button></li>
                                    <li onclick="fn_gomap('B08',1);" style="left: 510px; top: 590px; z-index: 1"><button type="button">복지동</button></li>
                                    <li onclick="fn_gomap('B09',1);" style="left: 675px; top: 590px; z-index: 1"><button type="button">상하수도과</button></li>
                                    <li onclick="fn_gomap('B04',1);" style="left: 1022px; top: 360px;"><button type="button">3별관</button></li>
                                    <li onclick="fn_gomap('B05',1);" style="left: 1005px; top: 270px;"><button type="button">4별관</button></li>
                                    <li onclick="fn_gomap('B06',1);" style="left: 1100px; top: 155px;"><button type="button">5별관</button></li>
                                    <li onclick="fn_gomap('B07',1);" style="left: 1133px; top: 122px; z-index: 1"><button type="button">5별관 부속동</button></li>
                                    <li onclick="fn_gomap('B10',1);" style="left: 1005px; top: 280px;"><button type="button">6별관</button></li>
                                </ul>
                            </div>
							<div style="display:none;" id="office_map_li30" >
                               <ul class="building_name">
                                    <li onclick="fn_gomap('B01',1);" style="left: 698px; top: 223px;"><button type="button">본관</button></li>
                                    <li onclick="fn_gomap('B02',1);" style="left: 550px; top: 350px;"><button type="button">1별관</button></li>
                                    <li onclick="fn_gomap('B03',1);" style="left: 600px; top: 488px; z-index: 2"><button type="button">2별관</button></li>
                                    <li onclick="fn_gomap('B08',1);" style="left: 390px; top: 560px; z-index: 1"><button type="button">복지동</button></li>
                                    <li onclick="fn_gomap('B09',1);" style="left: 540px; top: 578px; z-index: 1"><button type="button">상하수도과</button></li>
                                    <li onclick="fn_gomap('B04',1);" style="left: 975px; top: 380px;"><button type="button">3별관</button></li>
                                    <li onclick="fn_gomap('B05',1);" style="left: 1010px; top: 305px;"><button type="button">4별관</button></li>
                                    <li onclick="fn_gomap('B06',1);" style="left: 1155px; top: 180px;"><button type="button">5별관</button></li>
                                    <li onclick="fn_gomap('B07',1);" style="left: 1208px; top: 150px; z-index: 1"><button type="button">5별관 부속동</button></li>
                                    <li onclick="fn_gomap('B10',1);" style="left: 975px; top: 298px;"><button type="button">6별관</button></li>
                                </ul>
                            </div>
							<div style="display:none;" id="office_map_li31" >
                               <ul class="building_name">
                                    <li onclick="fn_gomap('B01',1);" style="left: 718px; top: 223px;"><button type="button">본관</button></li>
                                    <li onclick="fn_gomap('B02',1);" style="left: 510px; top: 330px;"><button type="button">1별관</button></li>
                                    <li onclick="fn_gomap('B03',1);" style="left: 500px; top: 472px; z-index: 2"><button type="button">2별관</button></li>
                                    <li onclick="fn_gomap('B08',1);" style="left: 285px; top: 525px; z-index: 1"><button type="button">복지동</button></li>
                                    <li onclick="fn_gomap('B09',1);" style="left: 415px; top: 555px; z-index: 1"><button type="button">상하수도과</button></li>
                                    <li onclick="fn_gomap('B04',1);" style="left: 910px; top: 400px;"><button type="button">3별관</button></li>
                                    <li onclick="fn_gomap('B05',1);" style="left: 1002px; top: 338px;"><button type="button">4별관</button></li>
                                    <li onclick="fn_gomap('B06',1);" style="left: 1198px; top: 210px;"><button type="button">5별관</button></li>
                                    <li onclick="fn_gomap('B07',1);" style="left: 1274px; top: 184px; z-index: 1"><button type="button">5별관 부속동</button></li>
                                    <li onclick="fn_gomap('B10',1);" style="left: 935px; top: 315px;"><button type="button">6별관</button></li>
                                </ul>
                            </div>
							<div style="display:none;" id="office_map_li32" >
                               <ul class="building_name">
                                    <li onclick="fn_gomap('B01',1);" style="left: 737px; top: 225px;"><button type="button">본관</button></li>
                                    <li onclick="fn_gomap('B02',1);" style="left: 475px; top: 315px;"><button type="button">1별관</button></li>
                                    <li onclick="fn_gomap('B03',1);" style="left: 415px; top: 450px; z-index: 2"><button type="button">2별관</button></li>
                                    <li onclick="fn_gomap('B08',1);" style="left: 200px; top: 485px; z-index: 1"><button type="button">복지동</button></li>
                                    <li onclick="fn_gomap('B09',1);" style="left: 310px; top: 528px; z-index: 1"><button type="button">상하수도과</button></li>
                                    <li onclick="fn_gomap('B04',1);" style="left: 838px; top: 414px;"><button type="button">3별관</button></li>
                                    <li onclick="fn_gomap('B05',1);" style="left: 950px; top: 358px;"><button type="button">4별관</button></li>
                                    <li onclick="fn_gomap('B06',1);" style="left: 1235px; top: 240px;"><button type="button">5별관</button></li>
                                    <li onclick="fn_gomap('B07',1);" style="left: 1326px; top: 222px; z-index: 1"><button type="button">5별관 부속동</button></li>
                                    <li onclick="fn_gomap('B10',1);" style="left: 885px; top: 330px;"><button type="button">6별관</button></li>
                                </ul>
                            </div>
							<div style="display:none;" id="office_map_li33" >
                               <ul class="building_name">
                                    <li onclick="fn_gomap('B01',1);" style="left: 755px; top: 225px;"><button type="button">본관</button></li>
                                    <li onclick="fn_gomap('B02',1);" style="left: 445px; top: 298px;"><button type="button">1별관</button></li>
                                    <li onclick="fn_gomap('B03',1);" style="left: 350px; top: 425px; z-index: 2"><button type="button">2별관</button></li>
                                    <li onclick="fn_gomap('B08',1);" style="left: 145px; top: 440px; z-index: 1"><button type="button">복지동</button></li>
                                    <li onclick="fn_gomap('B09',1);" style="left: 215px; top: 490px; z-index: 1"><button type="button">상하수도과</button></li>
                                    <li onclick="fn_gomap('B04',1);" style="left: 765px; top: 420px;"><button type="button">3별관</button></li>
                                    <li onclick="fn_gomap('B05',1);" style="left: 905px; top: 373px;"><button type="button">4별관</button></li>
                                    <li onclick="fn_gomap('B06',1);" style="left: 1250px; top: 275px;"><button type="button">5별관</button></li>
                                    <li onclick="fn_gomap('B07',1);" style="left: 1370px; top: 270px; z-index: 1"><button type="button">5별관 부속동</button></li>
                                    <li onclick="fn_gomap('B10',1);" style="left: 825px; top: 340px;"><button type="button">6별관</button></li>
                                </ul>
                            </div>
							<div style="display:none;" id="office_map_li34" >
                               <ul class="building_name">
                                    <li onclick="fn_gomap('B01',1);" style="left: 773px; top: 228px;"><button type="button">본관</button></li>
                                    <li onclick="fn_gomap('B02',1);" style="left: 430px; top: 280px;"><button type="button">1별관</button></li>
                                    <li onclick="fn_gomap('B03',1);" style="left: 300px; top: 393px; z-index: 2"><button type="button">2별관</button></li>
                                    <li onclick="fn_gomap('B08',1);" style="left: 110px; top: 395px; z-index: 1"><button type="button">복지동</button></li>
                                    <li onclick="fn_gomap('B09',1);" style="left: 155px; top: 443px; z-index: 1"><button type="button">상하수도과</button></li>
                                    <li onclick="fn_gomap('B04',1);" style="left: 685px; top: 420px;"><button type="button">3별관</button></li>
                                    <li onclick="fn_gomap('B05',1);" style="left: 865px; top: 388px;"><button type="button">4별관</button></li>
                                    <li onclick="fn_gomap('B06',1);" style="left: 1250px;; top: 318px;"><button type="button">5별관</button></li>
                                    <li onclick="fn_gomap('B07',1);" style="left: 1385px; top: 318px; z-index: 1"><button type="button">5별관 부속동</button></li>
                                    <li onclick="fn_gomap('B10',1);" style="left: 765px; top: 350px;"><button type="button">6별관</button></li>
                                </ul>
                            </div>
							<div style="display:none;" id="office_map_li35" >
                               <ul class="building_name">
                                    <li onclick="fn_gomap('B01',1);" style="left: 790px; top: 232px;"><button type="button">본관</button></li>
                                    <li onclick="fn_gomap('B02',1);" style="left: 435px; top: 260px;"><button type="button">1별관</button></li>
                                    <li onclick="fn_gomap('B03',1);" style="left: 262px; top: 355px; z-index: 2"><button type="button">2별관</button></li>
                                    <li onclick="fn_gomap('B08',1);" style="left: 102px; top: 348px; z-index: 1"><button type="button">복지동</button></li>
                                    <li onclick="fn_gomap('B09',1);" style="left: 115px; top: 398px; z-index: 1"><button type="button">상하수도과</button></li>
                                    <li onclick="fn_gomap('B04',1);" style="left: 605px; top: 415px;"><button type="button">3별관</button></li>
                                    <li onclick="fn_gomap('B05',1);" style="left: 838px; top: 402px;"><button type="button">4별관</button></li>
                                    <li onclick="fn_gomap('B06',1);" style="left: 1245px;; top: 353px;"><button type="button">5별관</button></li>
                                    <li onclick="fn_gomap('B07',1);" style="left: 1390px; top: 370px; z-index: 1"><button type="button">5별관 부속동</button></li>
                                    <li onclick="fn_gomap('B10',1);" style="left: 700px; top: 350px;"><button type="button">6별관</button></li>
                                </ul>
                            </div>
							<div style="display:none;" id="office_map_li36" >
                               <ul class="building_name">
                                    <li onclick="fn_gomap('B01',1);" style="left: 806px; top: 238px;"><button type="button">본관</button></li>
                                    <li onclick="fn_gomap('B02',1);" style="left: 430px; top: 238px;"><button type="button">1별관</button></li>
                                    <li onclick="fn_gomap('B03',1);" style="left: 245px; top: 320px; z-index: 2"><button type="button">2별관</button></li>
                                    <li onclick="fn_gomap('B08',1);" style="left: 110px; top: 300px; z-index: 1"><button type="button">복지동</button></li>
                                    <li onclick="fn_gomap('B09',1);" style="left: 100px; top: 353px; z-index: 1"><button type="button">상하수도과</button></li>
                                    <li onclick="fn_gomap('B04',1);" style="left: 535px; top: 402px;"><button type="button">3별관</button></li>
                                    <li onclick="fn_gomap('B05',1);" style="left: 745px; top: 400px;"><button type="button">4별관</button></li>
                                    <li onclick="fn_gomap('B06',1);" style="left: 1200px;; top: 395px;"><button type="button">5별관</button></li>
                                    <li onclick="fn_gomap('B07',1);" style="left: 1370px;; top: 425px; z-index: 1"><button type="button">5별관 부속동</button></li>
                                    <li onclick="fn_gomap('B10',1);" style="left: 640px; top: 350px;"><button type="button">6별관</button></li>
                                </ul>
                            </div>
                        </div>
                    </div>  
                    
                    
                    
                     <!--부서정보안내 레이어팝업--> 
                     <%@ include file="/WEB-INF/jsp/user/jejusiBuilding/officePopup.jsp" %>  
                     <!--//부서정보안내 레이어팝업-->
                         
                        
                    <!--PC에서만 노출!-->    
                    <div class="building_menu">
                        <ul>
                            <li class="active"><a href="/jejusiBuilding/main.ez"><span>청사 전체보기</span></a></li>
                            <li><a href="javascript:fn_gomap('B01',1);"><span>본관</span></a></li> 
                            <li><a href="javascript:fn_gomap('B02',1);"><span>1별관</span></a></li>
                            <li><a href="javascript:fn_gomap('B03',1);"><span>2별관</span></a></li>
                            <li><a href="javascript:fn_gomap('B04',1);"><span>3별관</span></a></li>
                            <li><a href="javascript:fn_gomap('B05',1);"><span>4별관</span></a></li>
                            <li><a href="javascript:fn_gomap('B06',1);"><span>5별관</span></a></li>
                            <li><a href="javascript:fn_gomap('B07',1);"><span>5별관 부속동</span></a></li>
                            <li><a href="javascript:fn_gomap('B10',1);"><span>6별관</span></a></li>
                            <li><a href="javascript:fn_gomap('B08',1);"><span>복지동</span></a></li>
                            <li><a href="javascript:fn_gomap('B09',1);"><span>상하수도과</span></a></li>
                            <!-- <li><a href="javascript:fn_gomap('B10',1);"><span>신축건물</span></a></li> -->
                        </ul>
                    </div>
                    <!--//PC에서만 노출!-->  
                        
                    <!--모바일에서만 노출!-->   
                    <div class="building_menu_mobile">
                        <div class="cell">
                            <select id="gomap_sel" title="" onchange="fn_changeSelGomap()" >
                                <option value="main" >전체보기</option>       
                                <option value="B01" >본관</option>     
                                <option value="B02" >1별관</option>
                                <option value="B03" >2별관</option>
                                <option value="B04" >3별관</option>
                                <option value="B05" >4별관</option>
                                <option value="B06" >5별관</option>
                                <option value="B07" >5별관 부속동</option>
                                <option value="B10" >6별관</option>
                                <option value="B08" >복지동</option>
                                <option value="B09" >상하수도과</option>
                                <!-- <option value="B10" >신축건물</option> -->
                            </select>
                        </div>
                        <div class="cell">
                            <select id="gomap_floor" title="" >
                                <option value="1" >1층</option> 
                            </select>
                        </div>
                        <button type="button" class="search_btn" onclick="fn_gomapSel();" >검색</button>
                    </div>  
                    <!--//모바일에서만 노출!--> 
                    <!--//실제 컨텐츠--> 
                    </div>
                </div>
            </div>
        </section>
    </main>
    <!--//Contents 영역--> 
    
    
    
    <!--Footer 영역-->
    <footer id="footer_wrap">       
        <p>ⓒ JEJUSI. All rights reserved.</p>
    </footer>
    <!--//Footer 영역--> 
</div>
 
<script src="../../../js/comm/threesixty.js"></script>
<script>

//window.onload = init;

var timerId;

function fn_prev_shot(){

clearInterval(timerId); 

fn_360_li_add();

$("#loading_now_ul").show();
$("#loading_prev_ul").hide();


}

function fn_prev_interval_test(){

var aVal = $(".spinner").text().trim();

 console.log("1. aVal = "+ aVal);

if( aVal == "100%" ){

  console.log("2. aVal = "+ aVal);
  
  fn_prev_shot();
}

}

function fn_360_li_add(){

$(".office_map3d > li:eq(0)").append($("#office_map_li01").html());
$(".office_map3d > li:eq(1)").append($("#office_map_li02").html());
$(".office_map3d > li:eq(2)").append($("#office_map_li03").html());
$(".office_map3d > li:eq(3)").append($("#office_map_li04").html());
$(".office_map3d > li:eq(4)").append($("#office_map_li05").html());
$(".office_map3d > li:eq(5)").append($("#office_map_li06").html());
$(".office_map3d > li:eq(6)").append($("#office_map_li07").html());
$(".office_map3d > li:eq(7)").append($("#office_map_li08").html());
$(".office_map3d > li:eq(8)").append($("#office_map_li09").html());
$(".office_map3d > li:eq(9)").append($("#office_map_li10").html());
$(".office_map3d > li:eq(10)").append($("#office_map_li11").html());
$(".office_map3d > li:eq(11)").append($("#office_map_li12").html());
$(".office_map3d > li:eq(12)").append($("#office_map_li13").html());
$(".office_map3d > li:eq(13)").append($("#office_map_li14").html());
$(".office_map3d > li:eq(14)").append($("#office_map_li15").html());
$(".office_map3d > li:eq(15)").append($("#office_map_li16").html());
$(".office_map3d > li:eq(16)").append($("#office_map_li17").html());
$(".office_map3d > li:eq(17)").append($("#office_map_li18").html());
$(".office_map3d > li:eq(18)").append($("#office_map_li19").html());
$(".office_map3d > li:eq(19)").append($("#office_map_li20").html());
$(".office_map3d > li:eq(20)").append($("#office_map_li21").html());
$(".office_map3d > li:eq(21)").append($("#office_map_li22").html());
$(".office_map3d > li:eq(22)").append($("#office_map_li23").html());
$(".office_map3d > li:eq(23)").append($("#office_map_li24").html());
$(".office_map3d > li:eq(24)").append($("#office_map_li25").html());
$(".office_map3d > li:eq(25)").append($("#office_map_li26").html());
$(".office_map3d > li:eq(26)").append($("#office_map_li27").html());
$(".office_map3d > li:eq(27)").append($("#office_map_li28").html());
$(".office_map3d > li:eq(28)").append($("#office_map_li29").html());
$(".office_map3d > li:eq(29)").append($("#office_map_li30").html());
$(".office_map3d > li:eq(30)").append($("#office_map_li31").html());
$(".office_map3d > li:eq(31)").append($("#office_map_li32").html());
$(".office_map3d > li:eq(32)").append($("#office_map_li33").html());
$(".office_map3d > li:eq(33)").append($("#office_map_li34").html());
$(".office_map3d > li:eq(34)").append($("#office_map_li35").html());
$(".office_map3d > li:eq(35)").append($("#office_map_li36").html());
}

function fn_360(){

var product; 

  product1 = $('.product1').ThreeSixty({
      totalFrames: 36, // Total no. of image you have for 360 slider
      endFrame: 36, // end frame for the auto spin animation
      currentFrame: 1, // This the start frame for auto spin
      imgList: '.threesixty_images', // selector for image list
      progress: '.spinner', // selector to show the loading progress
      imagePath:'/images/kiosk/sub/office/map3d/', // path of the image assets
      filePrefix: 'map3d_', // file prefix if any
      ext: '.jpg', // extention for the assets
      height: 920,
      width: 1520,
      navigation: true,
      disableSpin: false, // Default false
      framerate: 20  //rotation speed
  } );

}   

$(document).ready(function(){
    
    fn_360();
    
    
    timerId = setInterval("fn_prev_interval_test()", 1000);

    //-- 각 이미지에 위치값 부여
    /*
    //-- 
    setTimeout(function() {
        / * 반영하기. 
            li:eq(0~35)
            $(".office_map3d li:eq(36)").html()  //-- 각 이미지 li 내용 확인
        * /
        fn_360_li_add();
    }, 500);
    */
    
    
});
    
//지도영역 ZoomIn ZoomOut

    var el = document.querySelector('.pinch-zoom');
    new PinchZoom.default(el, {
        minZoom: 2
    });
</script>   
</body>
</html>
    
 