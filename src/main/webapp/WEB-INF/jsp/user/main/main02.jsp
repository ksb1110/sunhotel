<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

<%@ include file="/WEB-INF/jsp/common/header.jsp" %>


<title>메인페이지 - 제주시 스마트청사 안내</title> 
 
 
<link rel="stylesheet" href="../../../css/kiosk/threesixty.css">

</head>
<body>

<div id="wrap">
    
    
    <!--Contents 영역-->
    <main id="main_wrap">
        <section id="container_wrap">


  

<script language="javascript">

//-- bc 건물, fc 층
function fn_gomap(bc,fc){
    
    //alert(bc +", "+ fc);
    location.href="/office.ez?bc="+bc+"&fc="+fc;
    
}

$(document).ready(function(){
       
    
});
</script>

<%/** 현재위치 */ %>
<c:set var="ani_location" value="<li class=' ${kioskCode }'><span class='current_location'><img src='/images/kiosk/icon/ani_location.png' alt='현재위치'></span></li>"/>
    
    
    
            
            <%/* home btn, search area - content_top_wrap */%>
            <%@ include file="/WEB-INF/jsp/common/pageSearch.jsp" %>
            
            
            <div class="content_area">          
                <div class="container">
                    <div id="contents"> 
                    <!--실제 컨텐츠-->               
                        <!--<h2 class="title1"><span>청사</span> <span class="inline">전체보기</span></h2> 전체보기 페이지에서만ㅠ타이틀 없음 --> 
                        [ ${kioskName}, ${kioskCode } ] 키오스크 위치 테스트 중. 
                        <div class="office_info_area">
                            <!--
                            <div class="office_map"><img src="/images/kiosk/sub/office/map_full_view_3d.png" alt=""></div>
                             
                            <span class="current_location" style="left:${kioskCodeX}px; top:${kioskCodeY}px;" onclick="fn_gomap('${kioskCodeB}','${kioskCodeF}');" ><img src="/images/kiosk/icon/ani_location.png" alt="현재위치"></span>  
                            -->
                              
                            <div class="threesixty product1">
                                <div class="spinner">
                                    <span>0%</span>
                                </div>
                                <ul class="office_map3d threesixty_images"></ul>
                            </div> 
                            
                            
                            <div style="display:none;" id="office_map_li01" >
                                <ul class="building_name">
                                    <li onclick="fn_gomap('B01',1);" style="left: 828px; top: 204px;"><button type="button">본관</button></li>
                                    <li onclick="fn_gomap('B02',1);" style="left: 450px; top: 190px;"><button type="button">1별관</button></li>
                                    <li onclick="fn_gomap('B03',1);" style="left: 245px; top: 245px;"><button type="button">2별관</button></li>
                                    <li onclick="fn_gomap('B08',1);" style="left: 145px; top: 215px;"><button type="button">복지동</button></li>
                                    <li onclick="fn_gomap('B09',1);" style="left: 120px; top: 270px;"><button type="button">상하수도과</button></li>
                                    <li onclick="fn_gomap('B04',1);" style="left: 475px; top: 320px;"><button type="button">3별관</button></li>
                                    <li onclick="fn_gomap('B05',1);" style="left: 680px; top: 330px;"><button type="button">4별관</button></li>
                                    <li onclick="fn_gomap('B06',1);" style="left: 1135px; top: 375px;"><button type="button">5별관</button></li>
                                    <li onclick="fn_gomap('B07',1);" style="left: 1320px; top: 420px;"><button type="button">5별관 부속동</button></li>
                                    <!-- <li style="left: 1046px; top: 190px;"><span class="current_location"><img src="../../../images/kiosk/icon/ani_location.png" alt="현재위치"></span></li>-->
                                    ${ani_location}
                                </ul>
                            </div>
                            <div style="display:none;" id="office_map_li02" >
                               <ul class="building_name">
                               		<li onclick="fn_gomap('B01',1);" style="left: 840px; top: 210px;"><button type="button">본관</button></li>
                                    <li onclick="fn_gomap('B02',1);" style="left: 465px; top: 165px;"><button type="button">1별관</button></li>
                                    <li onclick="fn_gomap('B03',1);" style="left: 268px; top: 210px;"><button type="button">2별관</button></li>
                                    <li onclick="fn_gomap('B08',1);" style="left: 190px; top: 175px;"><button type="button">복지동</button></li>
                                    <li onclick="fn_gomap('B09',1);" style="left: 140px; top: 225px;"><button type="button">상하수도과</button></li>
                                    <li onclick="fn_gomap('B04',1);" style="left: 450px; top: 295px;"><button type="button">3별관</button></li>
                                    <li onclick="fn_gomap('B05',1);" style="left: 645px; top: 325px;"><button type="button">4별관</button></li>
                                    <li onclick="fn_gomap('B06',1);" style="left: 1070px; top: 405px;"><button type="button">5별관</button></li>
                                    <li onclick="fn_gomap('B07',1);" style="left: 1255px; top: 475px;"><button type="button">5별관 부속동</button></li>
                                    <!-- <li style="left: 1063px; top: 217px;"><span class="current_location"><img src="../../../images/kiosk/icon/ani_location.png" alt="현재위치"></span></li>-->
                                    ${ani_location}
                                </ul>
                            </div>
                            <div style="display:none;" id="office_map_li03" >
                               <ul class="building_name">
                                    <li onclick="fn_gomap('B01',1);" style="left: 848px; top: 218px;"><button type="button">본관</button></li>
                                    <li onclick="fn_gomap('B02',1);" style="left: 490px; top: 140px;"><button type="button">1별관</button></li>
                                    <li onclick="fn_gomap('B03',1);" style="left: 300px; top: 175px;"><button type="button">2별관</button></li>
                                    <li onclick="fn_gomap('B08',1);" style="left: 255px; top: 135px;"><button type="button">복지동</button></li>
                                    <li onclick="fn_gomap('B09',1);" style="left: 185px; top: 180px;"><button type="button">상하수도과</button></li>
                                    <li onclick="fn_gomap('B04',1);" style="left: 420px; top: 280px;"><button type="button">3별관</button></li>
                                    <li onclick="fn_gomap('B05',1);" style="left: 605px; top: 315px;"><button type="button">4별관</button></li>
                                    <li onclick="fn_gomap('B06',1);" style="left: 1020px; top: 435px;"><button type="button">5별관</button></li>
                                    <li onclick="fn_gomap('B07',1);" style="left: 1155px; top: 520px;"><button type="button">5별관 부속동</button></li>
                                    <!-- <li style="left: 1070px; top: 242px;"><span class="current_location"><img src="../../../images/kiosk/icon/ani_location.png" alt="현재위치"></span></li>-->
                                    ${ani_location}
                                </ul>
                            </div>
                            <div style="display:none;" id="office_map_li04" >
                               <ul class="building_name">
                                    <li onclick="fn_gomap('B01',1);" style="left: 850px; top: 227px;"><button type="button">본관</button></li>
                                    <li onclick="fn_gomap('B02',1);" style="left: 525px; top: 125px;"><button type="button">1별관</button></li>
                                    <li onclick="fn_gomap('B03',1);" style="left: 340px; top: 150px;"><button type="button">2별관</button></li>
                                    <li onclick="fn_gomap('B08',1);" style="left: 395px; top: 118px;"><button type="button">복지동</button></li>
                                    <li onclick="fn_gomap('B09',1);" style="left: 235px; top: 150px;"><button type="button">상하수도과</button></li>
                                    <li onclick="fn_gomap('B04',1);" style="left: 410px; top: 250px;"><button type="button">3별관</button></li>
                                    <li onclick="fn_gomap('B05',1);" style="left: 590px; top: 320px;"><button type="button">4별관</button></li>
                                    <li onclick="fn_gomap('B06',1);" style="left: 905px; top: 455px;"><button type="button">5별관</button></li>
                                    <li onclick="fn_gomap('B07',1);" style="left: 1030px; top: 560px;"><button type="button">5별관 부속동</button></li>
                                    <!-- <li style="left: 1065px; top: 270px;"><span class="current_location"><img src="../../../images/kiosk/icon/ani_location.png" alt="현재위치"></span></li>-->
                                    ${ani_location}
                                </ul>
                            </div>
                            <div style="display:none;" id="office_map_li05" >
                               <ul class="building_name">
                                    <li onclick="fn_gomap('B01',1);" style="left: 848px; top: 235px;"><button type="button">본관</button></li>
                                    <li onclick="fn_gomap('B02',1);" style="left: 560px; top: 110px;"><button type="button">1별관</button></li>
                                    <li onclick="fn_gomap('B03',1);" style="left: 288px; top: 125px;"><button type="button">2별관</button></li>
                                    <li onclick="fn_gomap('B08',1);" style="left: 465px; top: 95px;"><button type="button">복지동</button></li>
                                    <li onclick="fn_gomap('B09',1);" style="left: 310px; top: 115px;"><button type="button">상하수도과</button></li>
                                    <li onclick="fn_gomap('B04',1);" style="left: 400px; top: 220px;"><button type="button">3별관</button></li>
                                    <li onclick="fn_gomap('B05',1);" style="left: 550px; top: 305px;"><button type="button">4별관</button></li>
                                    <li onclick="fn_gomap('B06',1);" style="left: 795px; top: 465px;"><button type="button">5별관</button></li>
                                    <li onclick="fn_gomap('B07',1);" style="left: 880px; top: 580px;"><button type="button">5별관 부속동</button></li>
                                    <!-- <li style="left: 1047px; top: 297px;"><span class="current_location"><img src="../../../images/kiosk/icon/ani_location.png" alt="현재위치"></span></li>-->
                                    ${ani_location}
                                </ul>
                            </div>
                            <div style="display:none;" id="office_map_li06" >
                               <ul class="building_name">
                                    <li onclick="fn_gomap('B01',1);" style="left: 845px; top: 245px;"><button type="button">본관</button></li>
                                    <li onclick="fn_gomap('B02',1);" style="left: 600px; top: 105px;"><button type="button">1별관</button></li>
                                    <li onclick="fn_gomap('B03',1);" style="left: 435px; top: 105px;"><button type="button">2별관</button></li>
                                    <li onclick="fn_gomap('B08',1);" style="left: 465px; top: 75px;"><button type="button">복지동</button></li>
                                    <li onclick="fn_gomap('B09',1);" style="left: 370px; top: 95px;"><button type="button">상하수도과</button></li>
                                    <li onclick="fn_gomap('B04',1);" style="left: 405px; top: 195px;"><button type="button">3별관</button></li>
                                    <li onclick="fn_gomap('B05',1);" style="left: 525px; top: 275px;"><button type="button">4별관</button></li>
                                    <li onclick="fn_gomap('B06',1);" style="left: 675px; top: 440px;"><button type="button">5별관</button></li>
                                    <li onclick="fn_gomap('B07',1);" style="left: 710px; top: 555px;"><button type="button">5별관 부속동</button></li>
                                    <!-- <li style="left: 1020px; top: 322px;"><span class="current_location"><img src="../../../images/kiosk/icon/ani_location.png" alt="현재위치"></span></li>-->
                                    ${ani_location}
                                </ul>
                            </div>
							<div style="display:none;" id="office_map_li07" >
                               <ul class="building_name">
                                    <li onclick="fn_gomap('B01',1);" style="left: 845px; top: 240px;"><button type="button">본관</button></li>
                                    <li onclick="fn_gomap('B02',1);" style="left: 640px; top: 95px;"><button type="button">1별관</button></li>
                                    <li onclick="fn_gomap('B03',1);" style="left: 495px; top: 90px;"><button type="button">2별관</button></li>
                                    <li onclick="fn_gomap('B08',1);" style="left: 530px; top: 60px;"><button type="button">복지동</button></li>
                                    <li onclick="fn_gomap('B09',1);" style="left: 435px; top: 75px;"><button type="button">상하수도과</button></li>
                                    <li onclick="fn_gomap('B04',1);" style="left: 420px; top: 170px;"><button type="button">3별관</button></li>
                                    <li onclick="fn_gomap('B05',1);" style="left: 510px; top: 260px;"><button type="button">4별관</button></li>
                                    <li onclick="fn_gomap('B06',1);" style="left: 575px; top: 430px;"><button type="button">5별관</button></li>
                                    <li onclick="fn_gomap('B07',1);" style="left: 570px; top: 545px;"><button type="button">5별관 부속동</button></li>
                                    <!-- <li style="left: 980px; top: 345px;"><span class="current_location"><img src="../../../images/kiosk/icon/ani_location.png" alt="현재위치"></span></li>-->
                                    ${ani_location}
                                </ul>
                            </div>
							<div style="display:none;" id="office_map_li08" >
                               <ul class="building_name">
                                    <li onclick="fn_gomap('B01',1);" style="left: 803px; top: 247px;"><button type="button">본관</button></li>
                                    <li onclick="fn_gomap('B02',1);" style="left: 685px; top: 95px;"><button type="button">1별관</button></li>
                                    <li onclick="fn_gomap('B03',1);" style="left: 555px; top: 77px;"><button type="button">2별관</button></li>
                                    <li onclick="fn_gomap('B08',1);" style="left: 610px; top: 55px;"><button type="button">복지동</button></li>
                                    <li onclick="fn_gomap('B09',1);" style="left: 520px; top: 55px; z-index: 1"><button type="button">상하수도과</button></li>
                                    <li onclick="fn_gomap('B04',1);" style="left: 445px; top: 140px;"><button type="button">3별관</button></li>
                                    <li onclick="fn_gomap('B05',1);" style="left: 500px; top: 245px;"><button type="button">4별관</button></li>
                                    <li onclick="fn_gomap('B06',1);" style="left: 490px; top: 410px;"><button type="button">5별관</button></li>
                                    <li onclick="fn_gomap('B07',1);" style="left: 435px; top: 525px;"><button type="button">5별관 부속동</button></li>
                                    <!-- <li style="left: 925px; top: 365px;"><span class="current_location"><img src="../../../images/kiosk/icon/ani_location.png" alt="현재위치"></span></li>-->
                                    ${ani_location}
                                </ul>
                            </div>
							<div style="display:none;" id="office_map_li09" >
                               <ul class="building_name">
                                    <li onclick="fn_gomap('B01',1);" style="left: 790px; top: 253px;"><button type="button">본관</button></li>
                                    <li onclick="fn_gomap('B02',1);" style="left: 730px; top: 95px;"><button type="button">1별관</button></li>
                                    <li onclick="fn_gomap('B03',1);" style="left: 612px; top: 68px;"><button type="button">2별관</button></li>
                                    <li onclick="fn_gomap('B08',1);" style="left: 675px; top: 55px;"><button type="button">복지동</button></li>
                                    <li onclick="fn_gomap('B09',1);" style="left: 600px; top: 55px; z-index: 1"><button type="button">상하수도과</button></li>
                                    <li onclick="fn_gomap('B04',1);" style="left: 480px; top: 125px;"><button type="button">3별관</button></li>
                                    <li onclick="fn_gomap('B05',1);" style="left: 495px; top: 215px;"><button type="button">4별관</button></li>
                                    <li onclick="fn_gomap('B06',1);" style="left: 413px; top: 388px;"><button type="button">5별관</button></li>
                                    <li onclick="fn_gomap('B07',1);" style="left: 320px; top: 492px;"><button type="button">5별관 부속동</button></li>
                                    <!-- <li style="left: 868px; top: 378px;"><span class="current_location"><img src="../../../images/kiosk/icon/ani_location.png" alt="현재위치"></span></li>-->
                                    ${ani_location}
                                </ul>
                            </div>
							<div style="display:none;" id="office_map_li10" >
                               <ul class="building_name">
                                    <li onclick="fn_gomap('B01',1);" style="left: 783px; top: 270px;"><button type="button">본관</button></li>
                                    <li onclick="fn_gomap('B02',1);" style="left: 780px; top: 95px;"><button type="button">1별관</button></li>
                                    <li onclick="fn_gomap('B03',1);" style="left: 685px; top: 65px;"><button type="button">2별관</button></li>
                                    <li onclick="fn_gomap('B08',1);" style="left: 737px; top: 55px; z-index: 1"><button type="button">복지동</button></li>
                                    <li onclick="fn_gomap('B09',1);" style="left: 663px; top: 55px; z-index: 1"><button type="button">상하수도과</button></li>
                                    <li onclick="fn_gomap('B04',1);" style="left: 508px; top: 113px;"><button type="button">3별관</button></li>
                                    <li onclick="fn_gomap('B05',1);" style="left: 505px; top: 197px;"><button type="button">4별관</button></li>
                                    <li onclick="fn_gomap('B06',1);" style="left: 350px; top: 360px;"><button type="button">5별관</button></li>
                                    <li onclick="fn_gomap('B07',1);" style="left: 228px; top: 450px;"><button type="button">5별관 부속동</button></li>
                                    <!-- <li style="left: 800px; top: 388px;"><span class="current_location"><img src="../../../images/kiosk/icon/ani_location.png" alt="현재위치"></span></li>-->
                                    ${ani_location}
                                </ul>
                            </div>
							<div style="display:none;" id="office_map_li11" >
                               <ul class="building_name">
                                    <li onclick="fn_gomap('B01',1);" style="left: 765px; top: 270px;"><button type="button">본관</button></li>
                                    <li onclick="fn_gomap('B02',1);" style="left: 815px; top: 100px;"><button type="button">1별관</button></li>
                                    <li onclick="fn_gomap('B03',1);" style="left: 750px; top: 65px;"><button type="button">2별관</button></li>
                                    <li onclick="fn_gomap('B08',1);" style="left: 832px; top: 55px; z-index: 1"><button type="button">복지동</button></li>
                                    <li onclick="fn_gomap('B09',1);" style="left: 740px; top: 55px; z-index: 1"><button type="button">상하수도과</button></li>
                                    <li onclick="fn_gomap('B04',1);" style="left: 555px; top: 105px;"><button type="button">3별관</button></li>
                                    <li onclick="fn_gomap('B05',1);" style="left: 520px; top: 180px;"><button type="button">4별관</button></li>
                                    <li onclick="fn_gomap('B06',1);" style="left: 305px; top: 325px;"><button type="button">5별관</button></li>
                                    <li onclick="fn_gomap('B07',1);" style="left: 158px; top: 405px;"><button type="button">5별관 부속동</button></li>
                                    <!-- <li style="left: 735px; top: 390px;"><span class="current_location"><img src="../../../images/kiosk/icon/ani_location.png" alt="현재위치"></span></li>-->
                                    ${ani_location}
                                </ul>
                            </div>
							<div style="display:none;" id="office_map_li12" >
                               <ul class="building_name">
                                    <li onclick="fn_gomap('B01',1);" style="left: 745px; top: 270px;"><button type="button">본관</button></li>
                                    <li onclick="fn_gomap('B02',1);" style="left: 855px; top: 105px;"><button type="button">1별관</button></li>
                                    <li onclick="fn_gomap('B03',1);" style="left: 810px; top: 70px;"><button type="button">2별관</button></li>
                                    <li onclick="fn_gomap('B08',1);" style="left: 910px; top: 55px; z-index: 1"><button type="button">복지동</button></li>
                                    <li onclick="fn_gomap('B09',1);" style="left: 810px; top: 55px; z-index: 1"><button type="button">상하수도과</button></li>
                                    <li onclick="fn_gomap('B04',1);" style="left: 595px; top: 98px;"><button type="button">3별관</button></li>
                                    <li onclick="fn_gomap('B05',1);" style="left: 540px; top: 175px;"><button type="button">4별관</button></li>
                                    <li onclick="fn_gomap('B06',1);" style="left: 280px; top: 290px;"><button type="button">5별관</button></li>
                                    <li onclick="fn_gomap('B07',1);" style="left: 115px; top: 355px;"><button type="button">5별관 부속동</button></li>
                                    <!-- <li style="left: 662px; top: 395px;"><span class="current_location"><img src="../../../images/kiosk/icon/ani_location.png" alt="현재위치"></span></li>-->
                                    ${ani_location}
                                </ul>
                            </div>
							<div style="display:none;" id="office_map_li13" >
                               <ul class="building_name">
                                    <li onclick="fn_gomap('B01',1);" style="left: 725px; top: 275px;"><button type="button">본관</button></li>
                                    <li onclick="fn_gomap('B02',1);" style="left: 890px; top: 115px;"><button type="button">1별관</button></li>
                                    <li onclick="fn_gomap('B03',1);" style="left: 875px; top: 80px;"><button type="button">2별관</button></li>
                                    <li onclick="fn_gomap('B08',1);" style="left: 985px; top: 70px; z-index: 1"><button type="button">복지동</button></li>
                                    <li onclick="fn_gomap('B09',1);" style="left: 885px; top: 55px; z-index: 1"><button type="button">상하수도과</button></li>
                                    <li onclick="fn_gomap('B04',1);" style="left: 640px; top: 95px;"><button type="button">3별관</button></li>
                                    <li onclick="fn_gomap('B05',1);" style="left: 570px; top: 165px;"><button type="button">4별관</button></li>
                                    <li onclick="fn_gomap('B06',1);" style="left: 275px; top: 255px;"><button type="button">5별관</button></li>
                                    <li onclick="fn_gomap('B07',1);" style="left: 90px; top: 310px;"><button type="button">5별관 부속동</button></li>
                                    <!-- <li style="left: 585px; top: 385px;"><span class="current_location"><img src="../../../images/kiosk/icon/ani_location.png" alt="현재위치"></span></li>-->
                                    ${ani_location}
                                </ul>
                            </div>
							<div style="display:none;" id="office_map_li14" >
                               <ul class="building_name">
                                    <li onclick="fn_gomap('B01',1);" style="left: 695px; top: 265px;"><button type="button">본관</button></li>
                                    <li onclick="fn_gomap('B02',1);" style="left: 945px; top: 125px;"><button type="button">1별관</button></li>
                                    <li onclick="fn_gomap('B03',1);" style="left: 920px; top: 90px; z-index: 2"><button type="button">2별관</button></li>
                                    <li onclick="fn_gomap('B08',1);" style="left: 1040px; top: 90px; z-index: 1"><button type="button">복지동</button></li>
                                    <li onclick="fn_gomap('B09',1);" style="left: 950px; top: 70px; z-index: 1"><button type="button">상하수도과</button></li>
                                    <li onclick="fn_gomap('B04',1);" style="left: 685px; top: 95px;"><button type="button">3별관</button></li>
                                    <li onclick="fn_gomap('B05',1);" style="left: 595px; top: 155px;"><button type="button">4별관</button></li>
                                    <li onclick="fn_gomap('B06',1);" style="left: 270px; top: 225px;"><button type="button">5별관</button></li>
                                    <li onclick="fn_gomap('B07',1);" style="left: 90px; top: 265px;"><button type="button">5별관 부속동</button></li>
                                    <!-- <li style="left: 510px; top: 380px;"><span class="current_location"><img src="../../../images/kiosk/icon/ani_location.png" alt="현재위치"></span></li>-->
                                    ${ani_location}
                                </ul>
                            </div>
							<div style="display:none;" id="office_map_li15" >
                               <ul class="building_name">
                                    <li onclick="fn_gomap('B01',1);" style="left: 675px; top: 265px;"><button type="button">본관</button></li>
                                    <li onclick="fn_gomap('B02',1);" style="left: 965px; top: 160px;"><button type="button">1별관</button></li>
                                    <li onclick="fn_gomap('B03',1);" style="left: 995px; top: 105px; z-index: 2"><button type="button">2별관</button></li>
                                    <li onclick="fn_gomap('B08',1);" style="left: 1125px; top: 115px; z-index: 1"><button type="button">복지동</button></li>
                                    <li onclick="fn_gomap('B09',1);" style="left: 1035px; top: 85px; z-index: 1"><button type="button">상하수도과</button></li>
                                    <li onclick="fn_gomap('B04',1);" style="left: 730px; top: 90px;"><button type="button">3별관</button></li>
                                    <li onclick="fn_gomap('B05',1);" style="left: 625px; top: 150px;"><button type="button">4별관</button></li>
                                    <li onclick="fn_gomap('B06',1);" style="left: 280px; top: 195px;"><button type="button">5별관</button></li>
                                    <li onclick="fn_gomap('B07',1);" style="left: 110px; top: 220px;"><button type="button">5별관 부속동</button></li>
                                    <!-- <li style="left: 460px; top: 350px;"><span class="current_location"><img src="../../../images/kiosk/icon/ani_location.png" alt="현재위치"></span></li> -->
                                    ${ani_location}
                                </ul>
                            </div>
							<div style="display:none;" id="office_map_li16" >
                               <ul class="building_name">
                                    <li onclick="fn_gomap('B01',1);" style="left: 655px; top: 258px;"><button type="button">본관</button></li>
                                    <li onclick="fn_gomap('B02',1);" style="left: 980px; top: 170px;"><button type="button">1별관</button></li>
                                    <li onclick="fn_gomap('B03',1);" style="left: 1045px; top: 135px; z-index: 2"><button type="button">2별관</button></li>
                                    <li onclick="fn_gomap('B08',1);" style="left: 1185px; top: 150px; z-index: 1"><button type="button">복지동</button></li>
                                    <li onclick="fn_gomap('B09',1);" style="left: 1100px; top: 115px; z-index: 1"><button type="button">상하수도과</button></li>
                                    <li onclick="fn_gomap('B04',1);" style="left: 775px; top: 95px;"><button type="button">3별관</button></li>
                                    <li onclick="fn_gomap('B05',1);" style="left: 660px; top: 145px;"><button type="button">4별관</button></li>
                                    <li onclick="fn_gomap('B06',1);" style="left: 310px; top: 165px;"><button type="button">5별관</button></li>
                                    <li onclick="fn_gomap('B07',1);" style="left: 145px; top: 180px;"><button type="button">5별관 부속동</button></li>
                                    <!-- <li style="left: 413px; top: 328px;"><span class="current_location"><img src="../../../images/kiosk/icon/ani_location.png" alt="현재위치"></span></li> -->
                                    ${ani_location}
                                </ul>
                            </div>
							<div style="display:none;" id="office_map_li17" >
                               <ul class="building_name">
                                    <li onclick="fn_gomap('B01',1);" style="left: 650px; top: 267px;"><button type="button">본관</button></li>
                                    <li onclick="fn_gomap('B02',1);" style="left: 1005px; top: 190px;"><button type="button">1별관</button></li>
                                    <li onclick="fn_gomap('B03',1);" style="left: 1110px; top: 158px; z-index: 2"><button type="button">2별관</button></li>
                                    <li onclick="fn_gomap('B08',1);" style="left: 1255px; top: 185px; z-index: 1"><button type="button">복지동</button></li>
                                    <li onclick="fn_gomap('B09',1);" style="left: 1173px; top: 145px; z-index: 1"><button type="button">상하수도과</button></li>
                                    <li onclick="fn_gomap('B04',1);" style="left: 820px; top: 100px;"><button type="button">3별관</button></li>
                                    <li onclick="fn_gomap('B05',1);" style="left: 690px; top: 145px;"><button type="button">4별관</button></li>
                                    <li onclick="fn_gomap('B06',1);" style="left: 340px; top: 140px;"><button type="button">5별관</button></li>
                                    <li onclick="fn_gomap('B07',1);" style="left: 195px; top: 145px;"><button type="button">5별관 부속동</button></li>
                                    <!-- <li style="left: 375px; top: 300px;"><span class="current_location"><img src="../../../images/kiosk/icon/ani_location.png" alt="현재위치"></span></li> -->
                                    ${ani_location}
                                </ul>
                            </div>
							<div style="display:none;" id="office_map_li18" >
                               <ul class="building_name">
                                    <li onclick="fn_gomap('B01',1);" style="left: 635px; top: 260px;"><button type="button">본관</button></li>
                                    <li onclick="fn_gomap('B02',1);" style="left: 1008px; top: 210px;"><button type="button">1별관</button></li>
                                    <li onclick="fn_gomap('B03',1);" style="left: 1145px; top: 180px; z-index: 2"><button type="button">2별관</button></li>
                                    <li onclick="fn_gomap('B08',1);" style="left: 1290px; top: 220px; z-index: 1"><button type="button">복지동</button></li>
                                    <li onclick="fn_gomap('B09',1);" style="left: 1220px; top: 175px; z-index: 1"><button type="button">상하수도과</button></li>
                                    <li onclick="fn_gomap('B04',1);" style="left: 855px; top: 110px;"><button type="button">3별관</button></li>
                                    <li onclick="fn_gomap('B05',1);" style="left: 720px; top: 145px;"><button type="button">4별관</button></li>
                                    <li onclick="fn_gomap('B06',1);" style="left: 390px; top: 120px;"><button type="button">5별관</button></li>
                                    <li onclick="fn_gomap('B07',1);" style="left: 245px; top: 115px;"><button type="button">5별관 부속동</button></li>
                                    <!-- <li style="left: 345px; top: 275px;"><span class="current_location"><img src="../../../images/kiosk/icon/ani_location.png" alt="현재위치"></span></li> -->
                                    ${ani_location}
                                </ul>
                            </div>
							<div style="display:none;" id="office_map_li19" >
                               <ul class="building_name">
                                    <li onclick="fn_gomap('B01',1);" style="left: 618px; top: 240px;"><button type="button">본관</button></li>
                                    <li onclick="fn_gomap('B02',1);" style="left: 1028px; top: 225px;"><button type="button">1별관</button></li>
                                    <li onclick="fn_gomap('B03',1);" style="left: 1175px; top: 200px; z-index: 2"><button type="button">2별관</button></li>
                                    <li onclick="fn_gomap('B08',1);" style="left: 1310px; top: 255px; z-index: 1"><button type="button">복지동</button></li>
                                    <li onclick="fn_gomap('B09',1);" style="left: 1265px; top: 210px; z-index: 1"><button type="button">상하수도과</button></li>
                                    <li onclick="fn_gomap('B04',1);" style="left: 895px; top: 120px;"><button type="button">3별관</button></li>
                                    <li onclick="fn_gomap('B05',1);" style="left: 760px; top: 145px;"><button type="button">4별관</button></li>
                                    <li onclick="fn_gomap('B06',1);" style="left: 430px; top: 100px;"><button type="button">5별관</button></li>
                                    <li onclick="fn_gomap('B07',1);" style="left: 310px; top: 90px;"><button type="button">5별관 부속동</button></li>
                                    <!-- <li style="left: 340px; top: 244px;"><span class="current_location"><img src="../../../images/kiosk/icon/ani_location.png" alt="현재위치"></span></li> -->
                                    ${ani_location}
                                </ul>
                            </div>
							<div style="display:none;" id="office_map_li20" >
                               <ul class="building_name">
                                    <li onclick="fn_gomap('B01',1);" style="left: 610px; top: 233px;"><button type="button">본관</button></li>
                                    <li onclick="fn_gomap('B02',1);" style="left: 1020px; top: 240px;"><button type="button">1별관</button></li>
                                    <li onclick="fn_gomap('B03',1);" style="left: 1190px; top: 235px; z-index: 2"><button type="button">2별관</button></li>
                                    <li onclick="fn_gomap('B08',1);" style="left: 1340px; top: 310px; z-index: 1"><button type="button">복지동</button></li>
                                    <li onclick="fn_gomap('B09',1);" style="left: 1295px; top: 250px; z-index: 1"><button type="button">상하수도과</button></li>
                                    <li onclick="fn_gomap('B04',1);" style="left: 935px; top: 133px;"><button type="button">3별관</button></li>
                                    <li onclick="fn_gomap('B05',1);" style="left: 785px; top: 150px;"><button type="button">4별관</button></li>
                                    <li onclick="fn_gomap('B06',1);" style="left: 485px; top: 85px;"><button type="button">5별관</button></li>
                                    <li onclick="fn_gomap('B07',1);" style="left: 365px; top: 70px;"><button type="button">5별관 부속동</button></li>
                                    <!-- <li style="left: 340px; top: 213px;"><span class="current_location"><img src="../../../images/kiosk/icon/ani_location.png" alt="현재위치"></span></li> -->
                                    ${ani_location}
                                </ul>
                            </div>
							<div style="display:none;" id="office_map_li21" >
                               <ul class="building_name">
                                    <li onclick="fn_gomap('B01',1);" style="left: 608px; top: 225px;"><button type="button">본관</button></li>
                                    <li onclick="fn_gomap('B02',1);" style="left: 1000px; top: 265px;"><button type="button">1별관</button></li>
                                    <li onclick="fn_gomap('B03',1);" style="left: 1200px; top: 275px; z-index: 2"><button type="button">2별관</button></li>
                                    <li onclick="fn_gomap('B08',1);" style="left: 1325px; top: 355px; z-index: 1"><button type="button">복지동</button></li>
                                    <li onclick="fn_gomap('B09',1);" style="left: 1315px; top: 300px; z-index: 1"><button type="button">상하수도과</button></li>
                                    <li onclick="fn_gomap('B04',1);" style="left: 965px; top: 143px;"><button type="button">3별관</button></li>
                                    <li onclick="fn_gomap('B05',1);" style="left: 810px; top: 152px;"><button type="button">4별관</button></li>
                                    <li onclick="fn_gomap('B06',1);" style="left: 540px; top: 75px;"><button type="button">5별관</button></li>
                                    <li onclick="fn_gomap('B07',1);" style="left: 440px; top: 55px;"><button type="button">5별관 부속동</button></li>
                                    <!-- <li style="left: 345px; top: 185px;"><span class="current_location"><img src="../../../images/kiosk/icon/ani_location.png" alt="현재위치"></span></li> -->
                                    ${ani_location}
                                </ul>
                            </div>
							<div style="display:none;" id="office_map_li22" >
                               <ul class="building_name">
                                    <li onclick="fn_gomap('B01',1);" style="left: 610px; top: 228px;"><button type="button">본관</button></li>
                                    <li onclick="fn_gomap('B02',1);" style="left: 980px; top: 290px;"><button type="button">1별관</button></li>
                                    <li onclick="fn_gomap('B03',1);" style="left: 1195px; top: 310px; z-index: 2"><button type="button">2별관</button></li>
                                    <li onclick="fn_gomap('B08',1);" style="left: 1300px; top: 410px; z-index: 1"><button type="button">복지동</button></li>
                                    <li onclick="fn_gomap('B09',1);" style="left: 1315px; top: 335px; z-index: 1"><button type="button">상하수도과</button></li>
                                    <li onclick="fn_gomap('B04',1);" style="left: 985px; top: 160px;"><button type="button">3별관</button></li>
                                    <li onclick="fn_gomap('B05',1);" style="left: 840px; top: 160px;"><button type="button">4별관</button></li>
                                    <li onclick="fn_gomap('B06',1);" style="left: 605px; top: 65px;"><button type="button">5별관</button></li>
                                    <li onclick="fn_gomap('B07',1);" style="left: 515px; top: 40px;"><button type="button">5별관 부속동</button></li>
                                    <!-- <li style="left: 380px; top: 160px;"><span class="current_location"><img src="../../../images/kiosk/icon/ani_location.png" alt="현재위치"></span></li> -->
                                    ${ani_location}
                                </ul>
                            </div>
							<div style="display:none;" id="office_map_li23" >
                               <ul class="building_name">
                                    <li onclick="fn_gomap('B01',1);" style="left: 608px; top: 210px;"><button type="button">본관</button></li>
                                    <li onclick="fn_gomap('B02',1);" style="left: 945px; top: 310px;"><button type="button">1별관</button></li>
                                    <li onclick="fn_gomap('B03',1);" style="left: 1170px; top: 345px; z-index: 2"><button type="button">2별관</button></li>
                                    <li onclick="fn_gomap('B08',1);" style="left: 1245px; top: 460px; z-index: 1"><button type="button">복지동</button></li>
                                    <li onclick="fn_gomap('B09',1);" style="left: 1280px; top: 390px; z-index: 1"><button type="button">상하수도과</button></li>
                                    <li onclick="fn_gomap('B04',1);" style="left: 1005px; top: 185px;"><button type="button">3별관</button></li>
                                    <li onclick="fn_gomap('B05',1);" style="left: 865px; top: 170px;"><button type="button">4별관</button></li>
                                    <li onclick="fn_gomap('B06',1);" style="left: 670px; top: 60px;"><button type="button">5별관</button></li>
                                    <li onclick="fn_gomap('B07',1);" style="left: 590px; top: 30px;"><button type="button">5별관 부속동</button></li>
                                    <!-- <li style="left: 408px; top: 142px;"><span class="current_location"><img src="../../../images/kiosk/icon/ani_location.png" alt="현재위치"></span></li> -->
                                    ${ani_location}
                                </ul>
                            </div>
							<div style="display:none;" id="office_map_li24" >
                               <ul class="building_name">
                                    <li onclick="fn_gomap('B01',1);" style="left: 624px; top: 252px;"><button type="button">본관</button></li>
                                    <li onclick="fn_gomap('B02',1);" style="left: 900px; top: 330px;"><button type="button">1별관</button></li>
                                    <li onclick="fn_gomap('B03',1);" style="left: 1125px; top: 380px; z-index: 2"><button type="button">2별관</button></li>
                                    <li onclick="fn_gomap('B08',1);" style="left: 1145px; top: 495px; z-index: 1"><button type="button">복지동</button></li>
                                    <li onclick="fn_gomap('B09',1);" style="left: 1245px; top: 445px; z-index: 1"><button type="button">상하수도과</button></li>
                                    <li onclick="fn_gomap('B04',1);" style="left: 1020px; top: 200px;"><button type="button">3별관</button></li>
                                    <li onclick="fn_gomap('B05',1);" style="left: 880px; top: 175px;"><button type="button">4별관</button></li>
                                    <li onclick="fn_gomap('B06',1);" style="left: 730px; top: 65px;"><button type="button">5별관</button></li>
                                    <li onclick="fn_gomap('B07',1);" style="left: 670px; top: 28px;"><button type="button">5별관 부속동</button></li>
                                    <!-- <li style="left: 450px; top: 118px;"><span class="current_location"><img src="../../../images/kiosk/icon/ani_location.png" alt="현재위치"></span></li> -->
                                    ${ani_location}
                                </ul>
                            </div>
							<div style="display:none;" id="office_map_li25" >
                               <ul class="building_name">
                                    <li onclick="fn_gomap('B01',1);" style="left: 625px; top: 205px;"><button type="button">본관</button></li>
                                    <li onclick="fn_gomap('B02',1);" style="left: 850px; top: 330px;"><button type="button">1별관</button></li>
                                    <li onclick="fn_gomap('B03',1);" style="left: 1060px; top: 410px; z-index: 2"><button type="button">2별관</button></li>
                                    <li onclick="fn_gomap('B08',1);" style="left: 1055px; top: 550px; z-index: 1"><button type="button">복지동</button></li>
                                    <li onclick="fn_gomap('B09',1);" style="left: 1160px; top: 485px; z-index: 1"><button type="button">상하수도과</button></li>
                                    <li onclick="fn_gomap('B04',1);" style="left: 1050px; top: 230px;"><button type="button">3별관</button></li>
                                    <li onclick="fn_gomap('B05',1);" style="left: 920px; top: 190px;"><button type="button">4별관</button></li>
                                    <li onclick="fn_gomap('B06',1);" style="left: 820px; top: 65px;"><button type="button">5별관</button></li>
                                    <li onclick="fn_gomap('B07',1);" style="left: 760px; top: 20px;"><button type="button">5별관 부속동</button></li>
                                    <!-- <li style="left: 502px; top: 102px;"><span class="current_location"><img src="../../../images/kiosk/icon/ani_location.png" alt="현재위치"></span></li> -->
                                    ${ani_location}
                                </ul>
                            </div>
							<div style="display:none;" id="office_map_li26" >
                               <ul class="building_name">
                                    <li onclick="fn_gomap('B01',1);" style="left: 638px; top: 200px;"><button type="button">본관</button></li>
                                    <li onclick="fn_gomap('B02',1);" style="left: 790px; top: 340px;"><button type="button">1별관</button></li>
                                    <li onclick="fn_gomap('B03',1);" style="left: 980px; top: 440px; z-index: 2"><button type="button">2별관</button></li>
                                    <li onclick="fn_gomap('B08',1);" style="left: 930px; top: 575px; z-index: 1"><button type="button">복지동</button></li>
                                    <li onclick="fn_gomap('B09',1);" style="left: 1070px; top: 525px; z-index: 1"><button type="button">상하수도과</button></li>
                                    <li onclick="fn_gomap('B04',1);" style="left: 1042px; top: 260px;"><button type="button">3별관</button></li>
                                    <li onclick="fn_gomap('B05',1);" style="left: 918px; top: 210px;"><button type="button">4별관</button></li>
                                    <li onclick="fn_gomap('B06',1);" style="left: 880px; top: 75px;"><button type="button">5별관</button></li>
                                    <li onclick="fn_gomap('B07',1);" style="left: 848px; top: 27px; z-index: 1"><button type="button">5별관 부속동</button></li>
                                    <!-- <li style="left: 552px; top: 88px;"><span class="current_location"><img src="../../../images/kiosk/icon/ani_location.png" alt="현재위치"></span></li> -->
                                    ${ani_location}
                                </ul>
                            </div>
							<div style="display:none;" id="office_map_li27" >
                               <ul class="building_name">
                                    <li onclick="fn_gomap('B01',1);" style="left: 645px; top: 185px;"><button type="button">본관</button></li>
                                    <li onclick="fn_gomap('B02',1);" style="left: 715px; top: 320px;"><button type="button">1별관</button></li>
                                    <li onclick="fn_gomap('B03',1);" style="left: 900px; top: 455px; z-index: 2"><button type="button">2별관</button></li>
                                    <li onclick="fn_gomap('B08',1);" style="left: 790px; top: 590px; z-index: 1"><button type="button">복지동</button></li>
                                    <li onclick="fn_gomap('B09',1);" style="left: 960px; top: 555px; z-index: 1"><button type="button">상하수도과</button></li>
                                    <li onclick="fn_gomap('B04',1);" style="left: 1025px; top: 295px;"><button type="button">3별관</button></li>
                                    <li onclick="fn_gomap('B05',1);" style="left: 938px; top: 208px;"><button type="button">4별관</button></li>
                                    <li onclick="fn_gomap('B06',1);" style="left: 955px; top: 85px;"><button type="button">5별관</button></li>
                                    <li onclick="fn_gomap('B07',1);" style="left: 940px; top: 40px; z-index: 1"><button type="button">5별관 부속동</button></li>
                                    <!-- <li style="left: 608px; top: 95px;"><span class="current_location"><img src="../../../images/kiosk/icon/ani_location.png" alt="현재위치"></span></li> -->
                                    ${ani_location}
                                </ul>
                            </div>
							<div style="display:none;" id="office_map_li28" >
                               <ul class="building_name">
                                    <li onclick="fn_gomap('B01',1);" style="left: 669px; top: 185px;"><button type="button">본관</button></li>
                                    <li onclick="fn_gomap('B02',1);" style="left: 655px; top: 325px;"><button type="button">1별관</button></li>
                                    <li onclick="fn_gomap('B03',1);" style="left: 785px; top: 470px; z-index: 2"><button type="button">2별관</button></li>
                                    <li onclick="fn_gomap('B08',1);" style="left: 650px; top: 580px; z-index: 1"><button type="button">복지동</button></li>
                                    <li onclick="fn_gomap('B09',1);" style="left: 820px; top: 565px; z-index: 1"><button type="button">상하수도과</button></li>
                                    <li onclick="fn_gomap('B04',1);" style="left: 990px; top: 300px;"><button type="button">3별관</button></li>
                                    <li onclick="fn_gomap('B05',1);" style="left: 950px; top: 217px;"><button type="button">4별관</button></li>
                                    <li onclick="fn_gomap('B06',1);" style="left: 995px; top: 90px;"><button type="button">5별관</button></li>
                                    <li onclick="fn_gomap('B07',1);" style="left: 1015px; top: 45px; z-index: 1"><button type="button">5별관 부속동</button></li>
                                    <!-- <li style="left: 665px; top: 90px;"><span class="current_location"><img src="../../../images/kiosk/icon/ani_location.png" alt="현재위치"></span></li> -->
                                    ${ani_location}
                                </ul>
                            </div>
							<div style="display:none;" id="office_map_li29" >
                               <ul class="building_name">
                                    <li onclick="fn_gomap('B01',1);" style="left: 687px; top: 183px;"><button type="button">본관</button></li>
                                    <li onclick="fn_gomap('B02',1);" style="left: 600px; top: 315px;"><button type="button">1별관</button></li>
                                    <li onclick="fn_gomap('B03',1);" style="left: 695px; top: 470px; z-index: 2"><button type="button">2별관</button></li>
                                    <li onclick="fn_gomap('B08',1);" style="left: 510px; top: 590px; z-index: 1"><button type="button">복지동</button></li>
                                    <li onclick="fn_gomap('B09',1);" style="left: 675px; top: 590px; z-index: 1"><button type="button">상하수도과</button></li>
                                    <li onclick="fn_gomap('B04',1);" style="left: 955px; top: 320px;"><button type="button">3별관</button></li>
                                    <li onclick="fn_gomap('B05',1);" style="left: 945px; top: 230px;"><button type="button">4별관</button></li>
                                    <li onclick="fn_gomap('B06',1);" style="left: 1060px; top: 115px;"><button type="button">5별관</button></li>
                                    <li onclick="fn_gomap('B07',1);" style="left: 1095px; top: 70px; z-index: 1"><button type="button">5별관 부속동</button></li>
                                    <!-- <li style="left: 705px; top: 90px;"><span class="current_location"><img src="../../../images/kiosk/icon/ani_location.png" alt="현재위치"></span></li> -->
                                    ${ani_location}
                                </ul>
                            </div>
							<div style="display:none;" id="office_map_li30" >
                               <ul class="building_name">
                                    <li onclick="fn_gomap('B01',1);" style="left: 707px; top: 180px;"><button type="button">본관</button></li>
                                    <li onclick="fn_gomap('B02',1);" style="left: 550px; top: 305px;"><button type="button">1별관</button></li>
                                    <li onclick="fn_gomap('B03',1);" style="left: 600px; top: 468px; z-index: 2"><button type="button">2별관</button></li>
                                    <li onclick="fn_gomap('B08',1);" style="left: 395px; top: 555px; z-index: 1"><button type="button">복지동</button></li>
                                    <li onclick="fn_gomap('B09',1);" style="left: 540px; top: 570px; z-index: 1"><button type="button">상하수도과</button></li>
                                    <li onclick="fn_gomap('B04',1);" style="left: 920px; top: 350px;"><button type="button">3별관</button></li>
                                    <li onclick="fn_gomap('B05',1);" style="left: 970px; top: 260px;"><button type="button">4별관</button></li>
                                    <li onclick="fn_gomap('B06',1);" style="left: 1110px; top: 130px;"><button type="button">5별관</button></li>
                                    <li onclick="fn_gomap('B07',1);" style="left: 1170px; top: 93px; z-index: 1"><button type="button">5별관 부속동</button></li>
                                    <!-- <li style="left: 755px; top: 95px;"><span class="current_location"><img src="../../../images/kiosk/icon/ani_location.png" alt="현재위치"></span></li> -->
                                    ${ani_location}
                                </ul>
                            </div>
							<div style="display:none;" id="office_map_li31" >
                               <ul class="building_name">
                                    <li onclick="fn_gomap('B01',1);" style="left: 727px; top: 180px;"><button type="button">본관</button></li>
                                    <li onclick="fn_gomap('B02',1);" style="left: 510px; top: 290px;"><button type="button">1별관</button></li>
                                    <li onclick="fn_gomap('B03',1);" style="left: 500px; top: 450px; z-index: 2"><button type="button">2별관</button></li>
                                    <li onclick="fn_gomap('B08',1);" style="left: 270px; top: 520px; z-index: 1"><button type="button">복지동</button></li>
                                    <li onclick="fn_gomap('B09',1);" style="left: 415px; top: 545px; z-index: 1"><button type="button">상하수도과</button></li>
                                    <li onclick="fn_gomap('B04',1);" style="left: 845px; top: 360px;"><button type="button">3별관</button></li>
                                    <li onclick="fn_gomap('B05',1);" style="left: 945px; top: 290px;"><button type="button">4별관</button></li>
                                    <li onclick="fn_gomap('B06',1);" style="left: 1165px; top: 150px;"><button type="button">5별관</button></li>
                                    <li onclick="fn_gomap('B07',1);" style="left: 1240px; top: 122px; z-index: 1"><button type="button">5별관 부속동</button></li>
                                    <!-- <li style="left: 810px; top: 98px;"><span class="current_location"><img src="../../../images/kiosk/icon/ani_location.png" alt="현재위치"></span></li> -->
                                    ${ani_location}
                                </ul>
                            </div>
							<div style="display:none;" id="office_map_li32" >
                               <ul class="building_name">
                                    <li onclick="fn_gomap('B01',1);" style="left: 730px; top: 175px;"><button type="button">본관</button></li>
                                    <li onclick="fn_gomap('B02',1);" style="left: 475px; top: 268px;"><button type="button">1별관</button></li>
                                    <li onclick="fn_gomap('B03',1);" style="left: 415px; top: 428px; z-index: 2"><button type="button">2별관</button></li>
                                    <li onclick="fn_gomap('B08',1);" style="left: 190px; top: 470px; z-index: 1"><button type="button">복지동</button></li>
                                    <li onclick="fn_gomap('B09',1);" style="left: 310px; top: 510px; z-index: 1"><button type="button">상하수도과</button></li>
                                    <li onclick="fn_gomap('B04',1);" style="left: 785px; top: 370px;"><button type="button">3별관</button></li>
                                    <li onclick="fn_gomap('B05',1);" style="left: 925px; top: 305px;"><button type="button">4별관</button></li>
                                    <li onclick="fn_gomap('B06',1);" style="left: 1200px; top: 190px;"><button type="button">5별관</button></li>
                                    <li onclick="fn_gomap('B07',1);" style="left: 1300px; top: 160px; z-index: 1"><button type="button">5별관 부속동</button></li>
                                    <!-- <li style="left: 858px; top: 105px;"><span class="current_location"><img src="../../../images/kiosk/icon/ani_location.png" alt="현재위치"></span></li> -->
                                    ${ani_location}
                                </ul>
                            </div>
							<div style="display:none;" id="office_map_li33" >
                               <ul class="building_name">
                                    <li onclick="fn_gomap('B01',1);" style="left: 766px; top: 182px;"><button type="button">본관</button></li>
                                    <li onclick="fn_gomap('B02',1);" style="left: 445px; top: 260px;"><button type="button">1별관</button></li>
                                    <li onclick="fn_gomap('B03',1);" style="left: 332px; top: 392px; z-index: 2"><button type="button">2별관</button></li>
                                    <li onclick="fn_gomap('B08',1);" style="left: 135px; top: 415px; z-index: 1"><button type="button">복지동</button></li>
                                    <li onclick="fn_gomap('B09',1);" style="left: 205px; top: 470px; z-index: 1"><button type="button">상하수도과</button></li>
                                    <li onclick="fn_gomap('B04',1);" style="left: 705px; top: 370px;"><button type="button">3별관</button></li>
                                    <li onclick="fn_gomap('B05',1);" style="left: 895px; top: 320px;"><button type="button">4별관</button></li>
                                    <li onclick="fn_gomap('B06',1);" style="left: 1210px; top: 225px;"><button type="button">5별관</button></li>
                                    <li onclick="fn_gomap('B07',1);" style="left: 1340px; top: 210px; z-index: 1"><button type="button">5별관 부속동</button></li>
                                    <!-- <li style="left: 910px; top: 116px;"><span class="current_location"><img src="../../../images/kiosk/icon/ani_location.png" alt="현재위치"></span></li> -->
                                    ${ani_location}
                                </ul>
                            </div>
							<div style="display:none;" id="office_map_li34" >
                               <ul class="building_name">
                                    <li onclick="fn_gomap('B01',1);" style="left: 785px; top: 185px;"><button type="button">본관</button></li>
                                    <li onclick="fn_gomap('B02',1);" style="left: 440px; top: 230px;"><button type="button">1별관</button></li>
                                    <li onclick="fn_gomap('B03',1);" style="left: 290px; top: 360px; z-index: 2"><button type="button">2별관</button></li>
                                    <li onclick="fn_gomap('B08',1);" style="left: 110px; top: 365px; z-index: 1"><button type="button">복지동</button></li>
                                    <li onclick="fn_gomap('B09',1);" style="left: 145px; top: 418px; z-index: 1"><button type="button">상하수도과</button></li>
                                    <li onclick="fn_gomap('B04',1);" style="left: 640px; top: 360px;"><button type="button">3별관</button></li>
                                    <li onclick="fn_gomap('B05',1);" style="left: 860px; top: 330px;"><button type="button">4별관</button></li>
                                    <li onclick="fn_gomap('B06',1);" style="left: 1220px;; top: 260px;"><button type="button">5별관</button></li>
                                    <li onclick="fn_gomap('B07',1);" style="left: 1370px; top: 255px; z-index: 1"><button type="button">5별관 부속동</button></li>
                                    <!-- <li style="left: 950px; top: 128px;"><span class="current_location"><img src="../../../images/kiosk/icon/ani_location.png" alt="현재위치"></span></li> -->
                                    ${ani_location}
                                </ul>
                            </div>
							<div style="display:none;" id="office_map_li35" >
                               <ul class="building_name">
                                    <li onclick="fn_gomap('B01',1);" style="left: 800px; top: 190px;"><button type="button">본관</button></li>
                                    <li onclick="fn_gomap('B02',1);" style="left: 440px; top: 230px;"><button type="button">1별관</button></li>
                                    <li onclick="fn_gomap('B03',1);" style="left: 255px; top: 325px; z-index: 2"><button type="button">2별관</button></li>
                                    <li onclick="fn_gomap('B08',1);" style="left: 102px; top: 320px; z-index: 1"><button type="button">복지동</button></li>
                                    <li onclick="fn_gomap('B09',1);" style="left: 115px; top: 370px; z-index: 1"><button type="button">상하수도과</button></li>
                                    <li onclick="fn_gomap('B04',1);" style="left: 585px; top: 355px;"><button type="button">3별관</button></li>
                                    <li onclick="fn_gomap('B05',1);" style="left: 798px; top: 322px;"><button type="button">4별관</button></li>
                                    <li onclick="fn_gomap('B06',1);" style="left: 1210px;; top: 300px;"><button type="button">5별관</button></li>
                                    <li onclick="fn_gomap('B07',1);" style="left: 1370px; top: 310px; z-index: 1"><button type="button">5별관 부속동</button></li>
                                    <!-- <li style="left: 988px; top: 145px;"><span class="current_location"><img src="../../../images/kiosk/icon/ani_location.png" alt="현재위치"></span></li> -->
                                    ${ani_location}
                                </ul>
                            </div>
							<div style="display:none;" id="office_map_li36" >
                               <ul class="building_name">
                                    <li onclick="fn_gomap('B01',1);" style="left: 815px; top: 195px;"><button type="button">본관</button></li>
                                    <li onclick="fn_gomap('B02',1);" style="left: 435px; top: 188px;"><button type="button">1별관</button></li>
                                    <li onclick="fn_gomap('B03',1);" style="left: 245px; top: 280px; z-index: 2"><button type="button">2별관</button></li>
                                    <li onclick="fn_gomap('B08',1);" style="left: 135px; top: 265px; z-index: 1"><button type="button">복지동</button></li>
                                    <li onclick="fn_gomap('B09',1);" style="left: 100px; top: 320px; z-index: 1"><button type="button">상하수도과</button></li>
                                    <li onclick="fn_gomap('B04',1);" style="left: 535px; top: 320px;"><button type="button">3별관</button></li>
                                    <li onclick="fn_gomap('B05',1);" style="left: 775px; top: 345px;"><button type="button">4별관</button></li>
                                    <li onclick="fn_gomap('B06',1);" style="left: 1185px;; top: 340px;"><button type="button">5별관</button></li>
                                    <li onclick="fn_gomap('B07',1);" style="left: 1350px; top: 368px; z-index: 1"><button type="button">5별관 부속동</button></li>
                                    <!-- <li style="left: 1020px; top: 165px;"><span class="current_location"><img src="../../../images/kiosk/icon/ani_location.png" alt="현재위치"></span></li> -->
                                    ${ani_location}
                                </ul>
                            </div>
                            
                        </div>
                        <div class="building_menu">
                            <ul>
                                <li class="active"><a href="/main.ez"><span>청사 전체보기</span></a></li>
                                <li><a href="javascript:fn_gomap('B01',1);"><span>본관</span></a>
                                    <!--
                                    <div class="depth">
                                        <ul>
                                            <li class="active"><a href="javascript:fn_gomap('B01',1);">1층</a></li>
                                            <li><a href="javascript:fn_gomap('B01',2);">2층</a></li>
                                        </ul>
                                    </div> -->
                                </li>
                                <li><a href="javascript:fn_gomap('B02',1);"><span>1별관</span></a></li>
                                <li><a href="javascript:fn_gomap('B03',1);"><span>2별관</span></a></li>
                                <li><a href="javascript:fn_gomap('B04',1);"><span>3별관</span></a></li>
                                <li><a href="javascript:fn_gomap('B05',1);"><span>4별관</span></a></li>
                                <li><a href="javascript:fn_gomap('B06',1);"><span>5별관</span></a></li>
                                <li><a href="javascript:fn_gomap('B07',1);"><span>5별관 부속동</span></a></li>
                                <li><a href="javascript:fn_gomap('B08',1);"><span>복지동</span></a></li>
                                <li><a href="javascript:fn_gomap('B09',1);"><span>상하수도과</span></a></li>
                                <li><a href="javascript:fn_gomap('B10',1);"><span>신축건물</span></a></li>
                            </ul>
                        </div>
                        
                        
                        
<script src="../../../js/comm/threesixty.js"></script>
<script>
    window.onload = init;

    var product;
    function init(){

        product1 = $('.product1').ThreeSixty({
            totalFrames: 36, // Total no. of image you have for 360 slider
            endFrame: 36, // end frame for the auto spin animation
            currentFrame: 1, // This the start frame for auto spin
            imgList: '.threesixty_images', // selector for image list
            progress: '.spinner', // selector to show the loading progress
            imagePath:'../../../images/kiosk/sub/office/map3d/', // path of the image assets
            filePrefix: 'map3d_', // file prefix if any
            ext: '.jpg', // extention for the assets
            height: 920,
            width: 1520,
            navigation: true,
            disableSpin: false // Default false
        });
        

        setTimeout(function() {
            /* 반영하기. 
                li:eq(0~35)
                $(".office_map3d li:eq(36)").html()  //-- 각 이미지 li 내용 확인
            */
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
        }, 500);
        
        
    }
</script>   



                        <!--//실제 컨텐츠--> 
                    </div>
                </div>
            </div>
        </section>
    </main>
    <!--//Contents 영역--> 
      
      
</div>
</body>
</html> 

<%@ include file="/WEB-INF/jsp/common/footer.jsp" %>  