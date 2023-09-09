<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>


<%@ include file="/WEB-INF/jsp/common/header.jsp" %>


<title>부서바로찾기  - 제주시 스마트청사 안내</title> 
 

<script src="../../../js/comm/bxslider/jquery.bxslider.js"></script>
</head>
<body>

<div id="wrap">
    <!--Side 영역-->
    <div id="side_wrap">
    
    <%@ include file="/WEB-INF/jsp/common/pageHeader.jsp" %>
    
      

      
<script language="javascript">
function fn_layerPop(seq, inoutGubun, dept){

    var conName = $("#"+seq+"_conName").val();
    var conDesc = $("#"+seq+"_conDesc").val();
    var conDesc = $("#"+seq+"_conDesc").attr("date-id");
	var conImg = $("#"+seq+"_conImg").val();
    var facilityName = $("#"+seq+"_facilityName").val();
    var facilityCode = $("#"+seq+"_facilityCode").val();
    var facilityGubun = $("#"+seq+"_facilityGubun").val();
    var buildingName = $("#"+seq+"_buildingName").val();
    var floorName = $("#"+seq+"_floorName").val();
    var mobileUrl = $("#"+seq+"_mobileUrl").val();
   
    console.log("1."+conDesc);
    conDesc = nl2br(conDesc);
    console.log("2."+conDesc);
    
	if( inoutGubun == "O" ){

        var dept_nm = conName;
        //var dept_position = "<dt>"+ conName +" &nbsp;</dt><dd>"+ conDesc +"</dd>";
        var dept_position = "<dd>"+ conDesc +"</dd>";
        var dept_img = "<img src=\"../../../images/kiosk/sub/search/dept_noimg.jpg\" alt=\""+dept_nm+"\" >";
        if( $.trim(conImg) != "" ){
            var dept_img = "<img src=\""+ conImg +"\" alt=\"제주보건소\" >";
        }

        
        $("#pop_name03").html(dept_nm);         
        $("#pop_position03").html(dept_position);
        $("#popup_photo03").html(dept_img);
        
        layer_popup('.Health');

        //--TTS 적용 - 문구설정
        var tts_str = $("#popup_header03").text();
        
	}else{

        //-- layer setting
        $("#pop_name").html(facilityName);
     
        $("#pop_position").html( buildingName +" "+  floorName );
        
        //-- QR code
        fn_ajaxMakeQr('${kioskCode}', $("#"+seq+"_mobileUrl").val()); 
        
        //-- pathFinder Bind
        var facility_code =  facilityCode; 
        var facility_gubun =  facilityGubun; 
        
        fn_goPathFinder('${kioskFcCode}', facility_code, facility_gubun);
        
        layer_popup('.location_popup'); 

        //--TTS 적용 - 문구설정
        var tts_str = $("#popup_header").text();    
	}


    //--TTS 적용
    if( dept == "" ){
        dept = seq	
    } 
    //var tts_str = $("#popup_header").text();
    tts_str = $.trim(tts_str);
    console.log(" TTS_STR : " + tts_str);
    fn_ajaxTTS("${kioskCode}_"+dept,tts_str);
        
}
     

function fn_layerPop_next(dept){
	 
    
    if(dept != "" ){
    	
    	 
	    	if( dept == "health01" || dept == "health02" || dept == "health03"  || dept == "parking_popup" ){
	    	    
	    		switch(dept){
	    	        case "health01": 
	    	            var dept_nm = "제주보건소";
	    	            var dept_position = "<dt>제주보건소：</dt><dd>제주특별자치도 제주시 연삼로 264<br>(우) 63219 (지번) 도남동 567-1</dd>";
	    	            var dept_img = "<img src=\"../../../images/kiosk/sub/search/healthCenter_jeju_img.jpg\" alt=\"제주보건소\" >";
	    	        break;
	                case "health02": 
	                    var dept_nm = "동부보건소";
	                    var dept_position = "<dt>동부보건소：</dt><dd>제주특별자치도 제주시 구좌읍 김녕로14길 6<br>(우) 63357 (지번) 구좌읍 김녕리 1696</dd>";
	                    var dept_img = "<img src=\"../../../images/kiosk/sub/search/healthCenter_ejeju_img.jpg\" alt=\"동부보건소\">";
	                break;
	                case "health03": 
	                    var dept_nm = "서부보건소";
	                    var dept_position = "<dt>서부보건소：</dt><dd>제주특별자치도 제주시 한림읍 강구로5<br>(우) 63028 (지번) 한림읍 한림리 966-1</dd>";
	                    var dept_img = "<img src=\"../../../images/kiosk/sub/search/healthCenter_wjeju_img.jpg\" alt=\"서부보건소\">";
	                break;
                    case "parking_popup": 
                        var dept_nm = "주차지도팀";
                        var dept_position = "<dd>제주특별자치도 제주시 서광로2길 24<br>(제주 종합경기장내 자동차등록사업소 옆)</dd>";
                        var dept_img = "<img src=\"../../../images/kiosk/sub/search/traffic_img.jpg\" alt=\"주차지도팀\">";
                        //var dept_position = "<dd>제주특별자치도 제주시 광양9길 10<br>(우) 63208 (지번) 이도이동 1176-1</dd>";
                        //var dept_img = "<img src=\"../../../images/kiosk/sub/search/dept_noimg.jpg\" alt=\"이미지 준비중입니다.\">";
                    break;
	    	        default:
	    	    
	    	    } 	 
                
	          
	            $("#pop_name03").html(dept_nm);         
	            $("#pop_position03").html(dept_position);
	            $("#popup_photo03").html(dept_img);
	    		
	    		layer_popup('.Health');

                //--TTS 적용 - 문구설정
                var tts_str = $("#popup_header03").text();
	    		
	    	}else{
	            //-- layer setting
	            $("#pop_name").html($("#"+dept+"_facilityName").val());
	         
	            $("#pop_position").html( $("#"+dept+"_buildingName").val() +" "+  $("#"+dept+"_floorName").val() );
	            
	            //-- QR code
	            fn_ajaxMakeQr('${kioskCode}', $("#"+dept+"_mobileUrl").val()); 
	            
	            //-- pathFinder Bind
	            var facility_code =  $("#"+dept+"_facilityCode").val(); 
	            var facility_gubun =  $("#"+dept+"_facilityGubun").val(); 
	            
	            fn_goPathFinder('${kioskFcCode}', facility_code, facility_gubun);
	            
	            layer_popup('.location_popup'); 

	            //--TTS 적용 - 문구설정
	            var tts_str = $("#popup_header").text();   		
	    	}
	    	

	        //--TTS 적용
	        //var tts_str = $("#popup_header").text();
	        tts_str = $.trim(tts_str);
	        console.log(" TTS_STR : " + tts_str);
	        fn_ajaxTTS("${kioskCode}_"+dept,tts_str);
	            
    	
    }else{
        
    	//alert("부서코드 입력이 필요합니다.");
    	alert("준비중인 부서정보 입니다.");
    	
    } 
    
}
 

$(document).ready(function(){
       
    
});
</script>





    <%@ include file="/WEB-INF/jsp/common/pageFooter.jsp" %>
    
    </div>
    <!--//Side 영역-->
    
    <!--Contents 영역-->
    <main id="main_wrap">
        <section id="container_wrap">
            
            <%/* home btn, search area - content_top_wrap */%>
            <%@ include file="/WEB-INF/jsp/common/pageSearch.jsp" %>
            
            
            <div class="content_area">          
                <div class="container">
                    <div id="contents"> 
                    <!--실제 컨텐츠-->    
                     
                     
                     
                         <div style="display:none;" >
                         <c:forEach items="${SL}" var="item" varStatus="status">   
                             <c:set var="seq" value="${item.conSeq}" />              
                                 
                                 <input type="text" id="${seq}_findSeq" value="${item.findSeq}">
                                 <input type="text" id="${seq}_findGubun" value="${item.findGubun}">
                                 <input type="text" id="${seq}_findIconImg" value="${item.findIconImg}">
                                 <input type="text" id="${seq}_findTitle" value="${item.findTitle}">
                                 <input type="text" id="${seq}_conSeq" value="${item.conSeq}">
                                 <input type="text" id="${seq}_conInOutGubun" value="${item.conInOutGubun}">
                                 <input type="text" id="${seq}_conName" value="${item.conName}">
                                 <input type="text" id="${seq}_conDesc" value="${item.conDesc}" date-id="${item.conDesc}">
                                 <input type="text" id="${seq}_conImg" value="${item.conImg}">
                                 <input type="text" id="${seq}_conSort" value="${item.conSort}"> 
                                 <input type="text" id="${seq}_subLeftPos" value="${item.subLeftPos}"> 
                                 
                                 <input type="text" id="${seq}_facilityCode" value="${item.facilityCode}">
                                 <input type="text" id="${seq}_facilityGubun" value="${item.facilityGubun}">
                                 <input type="text" id="${seq}_mobileUrl" value="${item.mobileUrl}__ga=${kioskFcCode}__fcg=${item.facilityGubun}">                                                            
                                 <input type="text" id="${seq}_buildingName" value="${item.buildingName}">
                                 <input type="text" id="${seq}_facilityName" value="${fn:replace(item.facilityName, '_', '')}">
                                 <input type="text" id="${seq}_floorName" value="${item.floorName}">  
                         </c:forEach>
                         </div>
                           
                                           
                                           
                                           
                                           
                                           
                                           
                                                
                                                
                                                
                        <div class="department_search">
                            <div class="header_detail">
                                <h2><img src="../../../images/kiosk/icon/title_icon1.png" alt=""> 생활밀접분야</h2>   
                            </div>
                            <div class="detail_contents">
                             
                                <!--생활밀접분야 버튼-->
                                <div class="department_button_area">
                                    <div class="sliding_dept">
                                    
                                        <div class="department_button">
                                            <ul>
                                              
		                                        <c:forEach items="${SL}" var="item" varStatus="status">   
		                                            <c:set var="seq" value="${item.conSeq}" />  
		                                            <c:set var="conName" value="${item.conName}" />  
		                                            <c:if test="${item.findGubun eq 'A' && item.findSort <= 18}" > 
                                                        <li><span><button type="button" onclick="fn_layerPop('${seq}','${item.conInOutGubun}','${item.facilityCode}');">
                                                            <span class="icon"><img src="${item.findIconImg}" alt=""></span>${item.findTitle}<em>[ ${conName} ]</em></button>
                                                            </span>
                                                        </li>                                              
		                                            </c:if>
		                                                   
                                                    <c:set var="findSort_max" value="${item.findSort}" />  
		                                        </c:forEach>  
                                            </ul>
                                        </div>  
                                        
                                        <c:if test="${findSort_max > 18 } " >
                                        <div class="department_button">
                                            <ul>
                                              
                                                <c:forEach items="${SL}" var="item" varStatus="status">   
                                                    <c:set var="seq" value="${item.conSeq}" />  
                                                    <c:set var="conName" value="${item.conName}" />  
                                                    <c:if test="${item.findGubun eq 'A' && item.findSort > 18}" > 
                                                        <li><span><button type="button" onclick="fn_layerPop('${seq}','${item.conInOutGubun}','${item.facilityCode}');">
                                                            <span class="icon"><img src="${item.findIconImg}" alt=""></span>${item.findTitle}<em>[ ${conName} ]</em></button>
                                                            </span>
                                                        </li>                                                          
                                                    </c:if>
                                                          
                                                </c:forEach>  
                                            </ul>                                            
                                        </div>
                                        </c:if>
                                        
                                    </div>          
                                    
                                </div>      
                                <!--//생활밀접분야 버튼-->
                                 
                                
                                <!--분야별 메뉴-->
                                <div class="field_menu_area">
                                    <div class="field_menu sliding_field">
                                        <ul class="menu"  id="field_menu_ul" >
                                        
                                        
                                        <c:set var="Ul_first" value="active" />
                                             
                                        <c:forEach items="${SL}" var="item" varStatus="status"> 
                                            <c:set var="findSeq"   value="${item.findSeq}" />     
                                            <c:set var="seq"         value="${item.conSeq}" />  
                                            <c:set var="conName" value="${item.conName}" />
                                            
                                            <c:set var="findSeqPre"     value="${item.findSeq}" />
                                            <c:set var="increaseNum"  value="0" />
                                            <c:if test="${ findSeqPre eq findSeqNext }" >
                                                <c:set var="increaseNum" value="1" />
                                            </c:if>
                                            
                                            <!-- 
                                            ++${findSeqPre } //${findSeqNext } //${increaseNum }++
                                             -->
                                            
                                            <c:if test="${item.findGubun eq 'B'}" >
                                                    <c:if test="${increaseNum eq 0 }" >
                                                        <li class="${Ul_first}"><a href="javascript:void(0)"><span><span class="icon"><img src="${item.findIconImg}" alt=""></span>${item.findTitle}</span></a>
                                                            <div class="depth" style="left: ${item.subLeftPos}"> 
                                                                <ul id="${findSeq}_bottom_li" >
                                                                </ul>
                                                            </div>
                                                        </li>
                                                        <c:set var="findSeqNext" value="${item.findSeq}" />
                                                        <c:set var="Ul_first" value="" />
                                                    </c:if>
                                                    
                                                    <div  class="${findSeq}_bottom_li_eq"  style="display:none;" >
                                                        <li ><button type="button" onclick="fn_layerPop('${seq}','${item.conInOutGubun}','${item.facilityCode}');" >${conName}</button></li>
                                                    </div>
                                                    
                                            </c:if>
                                                  
                                        </c:forEach> 
                                            
                                            <!-- 
                                            <li><a href="javascript:void(0)"><span><span class="icon"><img src="../../../images/kiosk/sub/search/field_menu_icon1.png" alt=""></span>국명</span></a>
                                                <div class="depth" style="left: 1370px">
                                                    <ul>
                                                        <li><button type="button" onclick="layer_popup('.healthCenter_popup');">부서명1</button></li>
                                                        <li><button type="button" onclick="layer_popup('.healthCenter_popup');">부서명2</button></li>
                                                        <li><button type="button" onclick="layer_popup('.healthCenter_popup');">부서명3</button></li>
                                                    </ul>
                                                </div>
                                            </li>
                                            -->
                                        </ul>
                                        
                                        <div class="field_controls">
                                            <span class="prev"><a href="#"></a></span> <span class="next"><a href="#"></a></span>   
                                        </div>
                                        
                                    </div>
                                </div>              
                                <!--//분야별 메뉴-->
                                                           
                                
                                
<script language="javascript">

$(document).ready(function(){
       
	setTimeout(function(){ 
		 $("#field_menu_ul > li > div > ul ").each(function(index,item){
			    var find_seq_id = $(item).attr("id");
			    if( "" != $.trim(find_seq_id) ){
	                var find_seq = find_seq_id.replace("_bottom_li","");
	                //console.log(find_seq_id + " , " + find_seq);
	                //-- 각 li를  find_seq_id에 append 한다.
	                var find_seq_html = "";
	                $("."+find_seq+"_bottom_li_eq").each(function(index2,item2){
	                    //console.log($(item2).html());
	                    find_seq_html += $(item2).html();
	                });
	                $("#"+find_seq_id).html("");
	                $("#"+find_seq_id).append(find_seq_html);
			    }
			 });
	}, 100);
	
});

</script>

                           
                                <!--위치안내 레이어팝업-->
                                <div class="popup_area location_popup">
                                
                                    <div class="detail_popup">
                                        <div class="detail">
                                            <div class="popup_header"  id="popup_header" >
                                                <strong  id="pop_name" >_____과</strong> 위치는<br>
                                                <strong id="pop_position">_관 _층</strong> 입니다. 
                                            </div>
                                            <div class="popup_contents">
                                                <ul class="popup_button">
                                                    <li><button type="button" class="location_search"  id="pathFinderAct" >길찾기</button></li>
                                                    <li>
                                                        <div class="qrcode_wrap">
                                                            <div class="qrcode_box">
                                                                <div class="qrcode"><img src="/images/kiosk/icon/qrcode_icon.png" alt="" id="qrcode_id"  ></div>
                                                                <p class="text">QR코드를 스캔하세요.</p>
                                                            </div>
                                                            <em>스마트폰<br>길안내 서비스</em>
                                                        </div>
                                                    </li>
                                                </ul>
                                            </div>
                                            <span class="close"><button type="button">닫기</button></span>
                                        </div>
                                    </div>
                                    
                                </div>
                                <!--//위치안내 레이어팝업-->
                                
                                <!--위치안내(외부 부서일 때) 레이어팝업-->
                                <div class="popup_area location_popup2 Health">
                                    <div class="detail_popup">
                                        <div class="detail">
                                            <div class="popup_header"  id="popup_header03" >
                                                <strong   id="pop_name03" >__보건소</strong> 의 위치입니다.<br>
                                                <dl class="dl_text" id="pop_position03" >
                                                    <dt>제주보건소：</dt>
                                                    <dd>제주특별자치도 제주시 연삼로 264<br>
                                                    (우) 63219 (지번) 도남동 567-1</dd>
                                                    <!-- 동부보건소, 서부보건소 주소
                                                    <dt>동부보건소：</dt>
                                                    <dd>제주특별자치도 제주시 구좌읍 김녕로14길 6<br>
                                                    (우) 63357 (지번) 구좌읍 김녕리 1696</dd>
                                                    <dt>서부보건소：</dt>
                                                    <dd>제주특별자치도 제주시 한람읍 강구로5<br>
                                                    (우) 63028 (지번) 한림읍 한림리 966-1</dd>-->
                                                </dl>
                                            </div>
                                            <div class="popup_contents">
                                                <div class="popup_photo" id="popup_photo03" >
                                                    <img src="../../../images/kiosk/sub/search/healthCenter_jeju_img.jpg" alt="제주보건소" >
                                                    <!--동부보건소, 서부보건소 이미지
                                                    <img src="../../../images/kiosk/sub/search/healthCenter_ejeju_img.jpg" alt="동부보건소">
                                                    <img src="../../../images/kiosk/sub/search/healthCenter_wjeju_img.jpg" alt="서부보건소">-->
                                                </div>
                                            </div>
                                            <span class="close"><button type="button">닫기</button></span>
                                        </div>
                                    </div>
                                </div>
                                <!--//위치안내 레이어팝업-->
                                
                                <!--위치안내(외부 부서일 때) 레이어팝업 - 체육진흥과 -->
                                <div class="popup_area location_popup2 sports_popup">
                                    <div class="detail_popup">
                                        <div class="detail">
                                            <div class="popup_header">
                                                <strong>체육진흥과</strong> 의 위치입니다.<br>
                                                <dl class="dl_text">
                                                    <dd>제주특별자치도 제주시 광양9길 10<br>
                                                    (우) 63208 (지번) 이도이동 1176-1</dd>
                                                </dl>
                                            </div>
                                            <div class="popup_contents ">
                                                <div class="popup_photo">
                                                    <img src="../../../images/kiosk/sub/search/sports_img.jpg" alt="체육진흥과">
                                                </div>
                                            </div>
                                            <span class="close"><button type="button">닫기</button></span>
                                        </div>
                                    </div>
                                </div>
                                <!--//위치안내(외부 부서일 때) 레이어팝업 - 체육진흥과 -->
                                
                                <!--위치안내(외부 부서일 때) 레이어팝업 - 주차지도팀 -->
                                <div class="popup_area location_popup2 parking_popup">
                                    <div class="detail_popup">
                                        <div class="detail">
                                            <div class="popup_header">
                                                <strong>주차지도팀</strong> 의 위치입니다.<br>
                                                <dl class="dl_text">
                                                    <dd>제주특별자치도 제주시 광양9길 10<br>
                                                    (우) 63208 (지번) 이도이동 1176-1</dd>
                                                </dl>
                                            </div>
                                            <div class="popup_contents ">
                                                <div class="popup_photo">
                                                    <img src="../../../images/kiosk/sub/search/dept_noimg.jpg" alt="이미지 준비중입니다.">
                                                </div>
                                            </div>
                                            <span class="close"><button type="button">닫기</button></span>
                                        </div>
                                    </div>
                                </div>
                                <!--//위치안내(외부 부서일 때) 레이어팝업 - 주차지도팀 -->
                                
                                
                            </div>  
                        </div>  
 
 
                                                
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
