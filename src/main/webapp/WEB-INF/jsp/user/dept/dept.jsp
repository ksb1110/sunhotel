<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>


<%@ include file="/WEB-INF/jsp/common/header.jsp" %>

<%
pageContext.setAttribute("CR", "\r");
pageContext.setAttribute("LF", "\n");
pageContext.setAttribute("CRLF", "\r\n");
pageContext.setAttribute("SP", "&nbsp;");
pageContext.setAttribute("BR", "<br/>");
%> 


<title>부서바로찾기  - 제주시 스마트청사 안내</title> 
 

</head>
<body>

<div id="wrap">
    <!--Side 영역-->
    <div id="side_wrap">
    
    <%@ include file="/WEB-INF/jsp/common/pageHeader.jsp" %>
    
      
<script language="javascript">


function fn_layerPop(seq){
	
	var deptCode = $("#"+seq+"_deptCode").val();
    var facility_code =  $("#"+seq+"_facilityCode").val(); 
	
	if( deptCode == "1001001003000" || deptCode == "1001001004000" || deptCode == "1001001005000" ){
		 
	            switch(deptCode){
	                case "1001001003000": 
	                    var dept_nm = "제주보건소";
	                    var dept_position = "<dt>제주보건소：</dt><dd>제주특별자치도 제주시 연삼로 264<br>(우) 63219 (지번) 도남동 567-1</dd>";
	                    var dept_img = "<img src=\"../../../images/kiosk/sub/search/healthCenter_jeju_img.jpg\" alt=\"제주보건소\" >";
	                break;
	                case "1001001005000": 
	                    var dept_nm = "동부보건소";
	                    var dept_position = "<dt>동부보건소：</dt><dd>제주특별자치도 제주시 구좌읍 김녕로14길 6<br>(우) 63357 (지번) 구좌읍 김녕리 1696</dd>";
	                    var dept_img = "<img src=\"../../../images/kiosk/sub/search/healthCenter_ejeju_img.jpg\" alt=\"동부보건소\">";
	                break;
	                case "1001001004000": 
	                    var dept_nm = "서부보건소";
	                    var dept_position = "<dt>서부보건소：</dt><dd>제주특별자치도 제주시 한림읍 강구로5<br>(우) 63028 (지번) 한림읍 한림리 966-1</dd>";
	                    var dept_img = "<img src=\"../../../images/kiosk/sub/search/healthCenter_wjeju_img.jpg\" alt=\"서부보건소\">";
	                break;
                    default:
	            }   
	          
	            $("#pop_name03").html(dept_nm);         
	            $("#pop_position03").html(dept_position);
	            $("#popup_photo03").html(dept_img);
	            
	            layer_popup('.location_popup2');

	            //--TTS 적용 - 문구설정
	            var tts_str = $("#popup_header03").text();
		
	}else{
        //-- layer setting
        $("#pop_name").html($("#"+seq+"_userNm").val());
     
        $("#pop_position").html( $("#"+seq+"_buildingName").val() +" "+  $("#"+seq+"_facilityName").val() +" "+  $("#"+seq+"_floorName").val() );
        
        //-- QR code
        fn_ajaxMakeQr('${kioskCode}', $("#"+seq+"_mobileUrl").val());
        
        //-- pathFinder Bind
        var facility_code =  $("#"+seq+"_facilityCode").val(); 
        var facility_gubun =  $("#"+seq+"_facilityGubun").val(); 
        fn_goPathFinder('${kioskFcCode}', facility_code,facility_gubun);
        
        layer_popup('.location_popup');

        //--TTS 적용 - 문구설정
        var tts_str = $("#popup_header").text();
	}
	
	//--TTS 적용
	//var tts_str = $("#popup_header").text();
	tts_str = $.trim(tts_str);
	console.log(" TTS_STR : " + tts_str);
	fn_ajaxTTS("${kioskCode}_"+facility_code,tts_str);
		
}


function nl2br (str, is_xhtml) {
    if (typeof str === 'undefined' || str === null) {
        return '';
    }
    var breakTag = (is_xhtml || typeof is_xhtml === 'undefined') ? '<br />' : '<br>';
    return (str + '').replace(/([^>\r\n]?)(\r\n|\n\r|\r|\n)/g, '$1' + breakTag + '$2');
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
                    
                        <div class="search_detail"> 
							
                                <c:set var="searchWord" value="${SH.searchWord}" />
                                 
								<div class="detail_header">
									<div class="text">
										<p>
                                        <c:if test="${fn:length(SL) > 0}">
	                                        <c:if test="${fn:length(searchWord) > 0}">  
												<em>‘${searchWord}’</em>의 검색 결과 입니다. [총 <strong>${fn:length(SL)}</strong>건]											
	                                        </c:if>       
                                        </c:if>                                 
                                        <c:if test="${fn:length(searchWord) == 0}">  
                                                   검색어를 입력해주세요~                                          
                                        </c:if>
										</p>
									</div>
								</div>
							<div class="detail_contents">
                                <!--검색 결과 테이블(세로 스크롤)-->
                                <div class="table_wrap">
                                    <div id="divHeadScroll">
                                        <table id="tblHead" class="table_col">
                                            <caption class="hidden">
                                                <strong>직원ㆍ업무ㆍ부서 검색 결과</strong>
                                                <p>부서, 성명, 전화번호, 담당업무, 위치안내로 구분되어 해당 정보를 나타냅니다.</p>
                                            </caption>
                                            <colgroup>
                                                <col style="width: 270px">
                                                <col style="width: 170px">
                                                <col style="width: 260px">
                                                <col style="width: 540px">
                                                <col style="width: 230px">
                                                <col style="width: 50px"> <!--스크롤두께고정-->
                                            </colgroup>
                                            <thead>
                                                <tr>
                                                    <th scope="col">부서</th>
                                                    <th scope="col">성명</th>
                                                    <th scope="col">전화번호</th>
                                                    <th scope="col">담당업무</th>
                                                    <th scope="col">위치안내</th>
                                                    <th scope="col" class="bg_color1 pad0"></th>
                                                </tr>
                                            </thead>
                                        </table>
                                    </div>
                                    <div id="divBodyScroll">
                                        <table id="tblBody" class="table_col"> 
                                            <colgroup>
                                                <col style="width: 270px">
                                                <col style="width: 170px">
                                                <col style="width: 260px">
                                                <col style="width: 540px">
                                                <col style="width: 247px">
                                            </colgroup>
                                            <tbody> 
                                                 
                                                <c:if test="${fn:length(SL) > 0}"> 
                                           
                                                    <c:forEach items="${SL}" var="item" varStatus="status">     
                                                        <c:set var="departName" value="${item.departName}" /> 
                                                        <c:set var="teamName" value="${item.teamName}" />
                                                        <c:set var="usernm" value="${item.name}" />
                                                        <c:set var="job" value="${item.job}" /> 
														                                                        
														<!-- jstl로 변환처리 -->
														<c:set var="job" value="${fn:replace(job,CRLF, BR)}" />
														<c:set var="job" value="${fn:replace(job,CR, BR)}" />
														<c:set var="job" value="${fn:replace(job,CR, BR)}" />
														<c:set var="job" value="${fn:replace(job,' ',SP)}" /> 
  

                                                        <c:set var="userTel" value="${item.tel}" /> 
                                                        <c:set var="seq" value="${item.employeeSeq}" />  
                                                        <c:set var="replaceWord" value="<span class=\"font_color05\">${searchWord}</span>" />
                                                        <c:set var="searchWord" value="${SH.searchWord}" />
                                                        <c:set var="departName" value="${fn:replace(departName, searchWord, replaceWord)}" />
                                                        <c:set var="teamName" value="${fn:replace(teamName, searchWord, replaceWord)}" />
                                                        <c:set var="usernm" value="${fn:replace(usernm, searchWord, replaceWord)}" />
                                                         
                                                        <c:set var="job" value="${fn:replace(job, searchWord, replaceWord)}" />
                                                        <c:set var="userTel" value="${fn:replace(userTel, searchWord, replaceWord)}" />
                                                        
                                                        
                                                         
	                                                <tr>
	                                                    <td class="align_center">
	                                                        ${departName}
	                                                        ${teamName }
	                                                        <c:if test="${item.position eq '과장' || item.position eq '팀장'  }">
	                                                            <br>(${teamName } ${item.position} )
	                                                        </c:if>
	                                                    </td>
	                                                    <td class="align_center">${usernm}</td>
	                                                    <td class="align_center">${userTel}</td>
	                                                    <td class="nl2br_td">${job}</td>
	                                                    <td class="align_center">
	                                                        
	                                                        <c:if test="${item.gukCode ne 'ETC' && item.routeFlag eq 'Y' }" >
		                                                        <!--버튼 클릭시 위치안내 레이어팝업 열림-->
		                                                        <button type="button" class="location_btn" onclick="fn_layerPop('${item.employeeSeq}');" >
		                                                        <span class="icon"><img src="/images/kiosk/icon/location_icon1.png" alt=""></span><span class="text">위치안내</span>
		                                                        </button>
	                                                        </c:if>
                                                            
                                                            <input type="hidden" id="${seq}_deptName" value="${item.departName}">
                                                            <input type="hidden" id="${seq}_deptCode" value="${item.departCode}"> 
                                                            <input type="hidden" id="${seq}_teamCode" value="${item.teamName}"> 
                                                            <input type="hidden" id="${seq}_teamCode" value="${item.teamCode}"> 
	                                                        <input type="hidden" id="${seq}_itemSeq" value="${item.employeeSeq}">
                                                            <input type="hidden" id="${seq}_facilityCode" value="${item.facilityCode}">
                                                            <input type="hidden" id="${seq}_facilityGubun" value="${item.facilityGubun}">
                                                            <input type="hidden" id="${seq}_mobileUrl" value="${item.mobileUrl}__ga=${kioskFcCode}__fcg=${item.facilityGubun}">
                                                            
                                                            <input type="hidden" id="${seq}_buildingName" value="${item.buildingName}">
                                                            <input type="hidden" id="${seq}_facilityName" value="${fn:replace(item.facilityName, '_', '')}">
                                                            <input type="hidden" id="${seq}_floorName" value="${item.floorName}"> 
    
	                                                        <input type="hidden" id="${seq}_userId" value="${item.userId}">
                                                            <input type="hidden" id="${seq}_userNm" value="${item.name}">
                                                            
                                                            <input type="hidden" id="${seq}_gukCode" value="${item.gukCode}">  
                                                            <input type="hidden" id="${seq}_routeFlag" value="${item.routeFlag}">  
	                                                         
	                                                    </td>
	                                                </tr>
                                                      
                                                    </c:forEach>
                                                     
                                                </c:if>

                                                <c:if test="${fn:length(SL) == 0}">
                                                    <!-- 조회된 자료가 없을 시 -->
                                                    <tr>
                                                        <td class="align_center" colspan="5"  style="height: 300px;">검색된 부서가 없습니다.</td>
                                                    </tr>
                                                </c:if>
                                                
                                                <!-- 
												<tr>
                                                    <td class="align_center"><span class="font_color05">노인</span>장애인과<br>(<span class="font_color05">노인</span>장애인과장)</td>
                                                    <td class="align_center">강성우</td>
                                                    <td class="align_center">064-728-2490</td>
                                                    <td><span class="font_color05">노인</span>장애인과 업무 전반에 관한 사항</td>
                                                    <td class="align_center"> 
                                                        <button type="button" class="location_btn" onclick="layer_popup('.location_popup');"><span class="icon"><img src="../../../images/kiosk/icon/location_icon1.png" alt=""></span><span class="text">위치안내</span></button>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="align_center"><span class="font_color05">노인</span>장애인과<br>(<span class="font_color05">노인</span>복지팀장)</td>
                                                    <td class="align_center">송명아</td>
                                                    <td class="align_center">064-728-2491</td>
                                                    <td>
										                                                        ○<span class="font_color05">노인</span>복지업무 전반<br>
										                                                        ○<span class="font_color05">노인</span>복지시책 추진<br>
										                                                        ○<span class="font_color05">노인</span>복지업무 제도개선
                                                    </td>
                                                    <td class="align_center"> 
                                                        <button type="button" class="location_btn" onclick="layer_popup('.location_popup');"><span class="icon"><img src="../../../images/kiosk/icon/location_icon1.png" alt=""></span><span class="text">위치안내</span></button>
                                                    </td>
                                                </tr>
                                                -->
                                                
                                                
                                           
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                                <!--//검색 결과 테이블(세로 스크롤)-->

                                <!--위치안내 레이어팝업-->
                                <div class="popup_area location_popup">
                                
                                    <div class="detail_popup">
                                        <div class="detail">
                                            <div class="popup_header" id="popup_header" >
                                                검색하신 <strong id="pop_name" >___</strong> 담당은 <br>
                                                <strong id="pop_position">__ _층 ____과</strong>에서 근무 중입니다. 
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
                                <div class="popup_area location_popup2">
                                    <div class="detail_popup">
                                        <div class="detail">
                                            <div class="popup_header" id="popup_header03" >
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

<%@ include file="/WEB-INF/jsp/common/footer.jsp" %>  