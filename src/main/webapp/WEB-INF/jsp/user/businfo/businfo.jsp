<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>


<%@ include file="/WEB-INF/jsp/common/header.jsp" %>


<title>메인페이지 - 제주시 스마트청사 안내</title> 
 

    
<script language="javascript"> 

function fn_businfo(sst){
	
	var img_src_x = "/images/kiosk/icon/bus_station_icon.png";
	var img_src_o = "/images/kiosk/icon/bus_station_icon_ani.png";	
	
	$(".bus_stt_btn > img").attr("src",img_src_x);
	$("#"+sst+" > img").attr("src",img_src_o);
	 
	fn_Station(sst);
    
}

function fn_Station(sst){
   	
	var ttl = $("#"+sst).val();
	var title_html = "<strong>"+ ttl +"</strong><p>[ "+ sst +" ]</p>";
	$("#nowRouteTitle").html(title_html);
	
	$(".bus_stt_btn").removeClass("onBusid");
    $("#"+sst).addClass("onBusid");
	
	fn_ajaxBIT(sst,"");
}

function fn_changeBusNum(){
    var sst = $(".onBusid").attr("id");
    var rnm = $("#bit_rnm").val();
    
    fn_ajaxBIT(sst,rnm);
}

//-- 정류소번호, 버스번호
function fn_ajaxBIT(sst,rnm){
    
	//console.log("fn_ajaxBIT >>> "+ sst +" , "+ rnm );
	
	//-- 버스목록 새로 추가
    var li = "<li></li>"; 
    

    //-- option all remove
    $("#bit_rnm option").remove();
    $('#bit_rnm').append('<option value="" selected>전체보기</option>'); 
    $("#station_bus_li li").remove();
    $("#station_bus_li").append("<li class='bus_message'><img src='/images/kiosk/icon/bus_loading_icon.png' alt=''><p>정보를 불러오고 있습니다.</p></li>");  
    
	//-- ajax call  
    $.ajax({
        type: 'POST',
        url: "${pageContext.request.contextPath}/api/ajaxBusInfo.ez?sst="+sst+"&rnm="+rnm,
        success: function(data) {  
            
            //-- option all remove
            $("#bit_rnm option").remove();
            //-- add
            $('#bit_rnm').append('<option value="" selected>전체보기</option>'); 
            var busNumArr = [];
            for(var i=0; i < data.busNumList.length;i++){
            	busNumArr.push(data.busNumList[i].rnm);
            }            
            //--combo 버스 중복 제거
            busNumArr = remove_duplicates_es6(busNumArr);
            busNumArr.sort(); //-- 정렬
            
            for(var i=0; i < busNumArr.length;i++){
                $('#bit_rnm').append('<option value="'+busNumArr[i]+'" >'+busNumArr[i]+'</option>'); 
            }
            //-- 선택된 노선번호가 있으면 로드 후 해당 번호 선택
            if(rnm != "" ){
            	$('#bit_rnm').val(rnm).attr("selected","selected");
            }

            
            //-- 기존 버스 목록 삭제
            $("#station_bus_li li").remove();
            var bitServiceList =  data.bitServiceList;
            //console.log(bitServiceList);
            for(var i=0; i < bitServiceList.length;i++){
                for(var j=0; j < bitServiceList.length;j++){
                	if( j+1 == bitServiceList.length ) break;
                    
                	//-- 0이면 도착정보가 없음으로 제일 뒤로 보내야한다.
                    if( bitServiceList[j]["predictTravelMin"] == 0) bitServiceList[j]["predictTravelMin"] = 1000;                	
                	if( bitServiceList[j+1]["predictTravelMin"] == 0) bitServiceList[j+1]["predictTravelMin"] = 1000;
                	
                	if( Number(bitServiceList[j]["predictTravelMin"]) > Number(bitServiceList[j+1]["predictTravelMin"])){
                		temp = bitServiceList[j];
                		bitServiceList[j] = bitServiceList[j+1];
                		bitServiceList[j+1] = temp;
                	}
                }
            }
            //console.log(bitServiceList);
            
            for(var i=0; i < bitServiceList.length;i++){
            	routeColor          = bitServiceList[i].routeColor; /* routeColor 0 default(적갈색) 1 적갈색 2 파란색 3 녹색 4 빨간색 5 주황색 6 보라색 7 노란색 */
            	routeNum          = bitServiceList[i].routeNum;
            	routeSubNm       = bitServiceList[i].routeSubNm;
            	lowPlate            = bitServiceList[i].lowPlate;
            	predictTravelMin = bitServiceList[i].predictTravelMin;
            	remainStation    = bitServiceList[i].remainStation;
            	dstStationId      = bitServiceList[i].dstStationId; //-- 종점(정류소번호)
                dstStationNm      = bitServiceList[i].dstStationNm; //-- 종점(정류소번호)
            	orgtStationId     = bitServiceList[i].orgtStationId; //-- 기점(정류소번호)
            	orgtStationNm     = bitServiceList[i].orgtStationNm; //-- 기점(정류소번호)
                
            	if( predictTravelMin == 1000 ) predictTravelMin = 0;
                routeColor = routeNum.substr( 0, 1);
                if( routeNum.substr( 0, 1) == "3" && routeNum.length == 4){
                	routeColor ="5"
                }
            	
                switch (routeColor) {
                    case "1" : routeColor = "red";   break;
                    case "2" : routeColor = "blue";   break; 
                    case "3" : routeColor = "blue";   break;
                    case "4" : routeColor = "green"; break; 
                    case "5" : routeColor = "yellow"; break; 
                    default  : routeColor = "blue";   break;  
            	}
            	
                li ="<li><p><strong class='bus_color "+routeColor+"'><em>"+ routeNum+"</em> <span class='bus_name'>["+routeSubNm+"]</span> ";
                if(lowPlate == 1){
                    li +="<span class='low_bus'>저상버스</span> ";
                }
                li +="</strong> ";
                if( predictTravelMin == 0 ){
                //if( predictTravelMin == 0 && remainStation == 0 ){
                    li +="<span class='bus_time' style='color:#25282b;' >도착정보 없음</span>";                  
                }else{
                    li +="<span class='bus_time'>"+predictTravelMin+"분 후 ("+remainStation+" 전)</span>";        
                }
                // li +="<p class='bus_line'>"+orgtStationId+" <img src='/images/kiosk/icon/arrow2_right.png' alt=''> "+dstStationId+"</p>";
                li +="</p><p class='bus_line'>"+orgtStationNm+" <img src='/images/kiosk/icon/arrow2_right.png' alt=''> "+dstStationNm+"</p></li>";
                
                //$("#station_bus_li").append(li);         
                //-- 선택된 노선번호가 있으면 로드 후 해당 번호 선택
                if(rnm != "" ){   
                    if(routeNum == rnm){
                        $("#station_bus_li").append(li);
                    }
                }else{
                    //모두 노출
                    $("#station_bus_li").append(li);
                }            
                
            }
            
              
        },
        error: function(){
            console.log("error~"+ data);
                
        }
    });
    <%/* li ='<li><p><strong class="bus_color blue"><em>342</em> <span class="bus_name">[함덕(신사동)]</span> <span class="low_bus">저상버스</span></strong> <span class="bus_time">0분 후 (1 전)</span></p>';
     li +='<p class="bus_line">제주대학교 <img src="/images/kiosk/icon/arrow2_right.png" alt=""> 신사동(종점)</p></li>';  */  %>
	
}

//-- 배열에서 중복 제거
function remove_duplicates_es6(arr) {
    let s = new Set(arr);
    let it = s.values();
    return Array.from(it);
}
 

$(document).ready(function(){
	 
    
	//-- 최초 제주시청(아라방면) 호출
	fn_businfo("405002035");
	
	//-- 정류소 클릭시 이벤트
	$(".bus_stt_btn").click(function(){
		fn_businfo($(this).attr("id"));
	});
	
    
});
</script>



</head>
<body>

<div id="wrap">
    <!--Side 영역-->
    <div id="side_wrap">
    
    <%@ include file="/WEB-INF/jsp/common/pageHeader.jsp" %>
    

    <%@ include file="/WEB-INF/jsp/common/pageFooter.jsp" %>
    
    </div>
    <!--//Side 영역-->
    
    <!--Contents 영역-->
    <main id="main_wrap">
        <section id="container_wrap">
            
            <%/* home btn, search area - content_top_wrap */%>
            <%@ include file="/WEB-INF/jsp/common/pageSearch.jsp" %>
            
            
            <!--방위표시-->
            <div class="compass_area">
                <img src="../../../images/kiosk/sub/compass1_main.png" alt="방위표시">
            </div>
            <!--//방위표시-->
            
            
            <div class="content_area">          
                <div class="container">
                    <div id="contents"> 



                       
                        <!--실제 컨텐츠-->
                        <div class="bus_detail">
                            <div class="detail_header">
                                <div class="question">
                                    <h2>제주시청 근처 <em>버스 정류소 정보를 확인</em> 할 수 있습니다.</h2>
                                </div>
                                <div class="text">
                                    <p>아래 <span class="font_color00">지도에서 원하시는 정류소를 선택</span>하세요.</p>
                                </div>
                            </div>
                            <div class="detail_contents">
                                <div class="businfo_map">
                                    <!-- 버스정류소 코드 참고 http://bus.jeju.go.kr/search/line -->
                                    <div class="map"><img src="/images/kiosk/sub/businfo_map.png" alt="제주시청 근처 버스 정류소 정보 지도"></div>
                                    <button type="button" class="bus_station bus1 bus_stt_btn" id="405000171" value="탐라장애인 종합복지관(남)" ><img src="/images/kiosk/icon/bus_station_icon.png" alt="탐라장애인 종합복지관(남)"></button>
                                    <button type="button" class="bus_station bus2 bus_stt_btn" id="405000170" value="탐라장애인 종합복지관(북)" ><img src="/images/kiosk/icon/bus_station_icon.png" alt="탐라장애인 종합복지관(북)"></button>
                                    <button type="button" class="bus_station bus3 bus_stt_btn" id="405000169" value="광양사거리" ><img src="/images/kiosk/icon/bus_station_icon.png" alt="광양사거리"></button>
                                    <button type="button" class="bus_station bus4 bus_stt_btn" id="405000282" value="광양(서)" ><img src="/images/kiosk/icon/bus_station_icon.png" alt="광양(서) 광양-제주시청(아라방면) 방면"></button>
                                    <button type="button" class="bus_station bus5 bus_stt_btn" id="405000281" value="광양(동)" ><img src="/images/kiosk/icon/bus_station_icon.png" alt="광양(동) 광양-시민회관 방면"></button>
                                    <button type="button" class="bus_station bus6 bus_stt_btn" id="405000284" value="동광양(북)" ><img src="/images/kiosk/icon/bus_station_icon.png" alt="동광양(북) 동광양-광양사거리 방면"></button>
                                    <button type="button" class="bus_station bus7 bus_stt_btn" id="405000283" value="동광양(남)" ><img src="/images/kiosk/icon/bus_station_icon.png" alt="동광양(남) 동광양-문예회관 방면"></button>
                                    <button type="button" class="bus_station bus8 bus_stt_btn" id="405002035" value="제주시청(아라방면)" ><img src="/images/kiosk/icon/bus_station_icon.png" alt="제주시청(아라방면)"></button>
                                    <button type="button" class="bus_station bus9 bus_stt_btn" id="405002036" value="제주시청(광양방면)" ><img src="/images/kiosk/icon/bus_station_icon.png" alt="제주시청(광양방면)"></button>
                                    
                                    
                                </div>  
                                <div class="bus_station_box">
                                    <div class="bus_color_info">
                                        <ul>
                                            <li><i></i>간선</li>
                                            <li><i></i>지선</li>
                                            <li><i></i>급행</li>
                                            <li><i></i>관광지순환 / 심야</li>
                                        </ul>
                                    </div>
                                    <div class="bus_station">
                                        <div class="station_header">
                                            <div class="station_info" id="nowRouteTitle" >
                                                <strong>제주시청 (광양방면)</strong>
                                                <p>[ 405002036 ]</p>
                                            </div>
                                            <div class="station_search">
                                                <select id="bit_rnm" title="정류소를 선택하세요." onchange="fn_changeBusNum();" >
                                                    <option value="" selected>전체보기</option> 
                                                </select>
                                                <button type="button" class="search_btn" onclick="fn_changeBusNum();" >검색</button>
                                            </div>
                                        </div>
                                        <div class="bus_info">
                                            <div class="info_scroll">
                                                <ul id="station_bus_li" >
                                                    <li>
                                                        <p><strong class="bus_color blue"><em>342</em> <span class="bus_name">[함덕(신사동)]</span> <span class="low_bus">저상버스</span></strong> <span class="bus_time">0분 후 (1 전)</span></p>
                                                        <p class="bus_line">제주대학교 <img src="/images/kiosk/icon/arrow2_right.png" alt=""> 신사동(종점)</p>
                                                    </li>
                                                    <li>
                                                        <p><strong class="bus_color green"><em>441</em> <span class="bus_name">[별빛누리공원]</span></strong> <span class="bus_time">0분 후 (1 전)</span></p>
                                                        <p class="bus_line">별빛누리공원/난타공연장 <img src="/images/kiosk/icon/arrow2_right.png" alt=""> 별빛누리공원/난타공연장</p>
                                                    </li>
                                                    <li>
                                                        <p><strong class="bus_color blue"><em>281</em> <span class="bus_name">[제주버스터미널]</span></strong> <span class="bus_time">0분 후 (1 전)</span></p>
                                                        <p class="bus_line">서귀포버스터미널(가상정류소) <img src="/images/kiosk/icon/arrow2_right.png" alt=""> 제주버스터미널 <img src="/images/kiosk/icon/arrow2_right.png" alt=""> 제주버스터미널</p>
                                                    </li>
                                                    <li>
                                                        <p><strong class="bus_color blue"><em>355</em><span class="bus_name">[수산]</span></strong> <span class="bus_time">1분 후 (2 전)</span></p>
                                                        <p class="bus_line">제주대학교 <img src="/images/kiosk/icon/arrow2_right.png" alt=""> 수산리사무소앞</p>
                                                    </li>
                                                    <li>
                                                        <p><strong class="bus_color yellow"><em>432</em> <span class="bus_name">[서귀포버스터미널서귀포버스터미널]</span> <span class="low_bus">저상버스</span></strong> <span class="bus_time">11분 후 (2 전)</span></p>
                                                        <p class="bus_line">제주버스터미널 <img src="/images/kiosk/icon/arrow2_right.png" alt=""> 제주버스터미널</p>
                                                    </li>
                                                    <li>
                                                        <p><strong class="bus_color blue"><em>365</em> <span class="bus_name">[수산]</span></strong> <span class="bus_time">11분 후 (7 전)</span></p>
                                                        <p class="bus_line">제주대학교 <img src="/images/kiosk/icon/arrow2_right.png" alt=""> 제주한라대학교(종점)</p>
                                                    </li>
                                                    <li>
                                                        <p><strong class="bus_color blue"><em>281</em> <span class="bus_name">[제주버스터미널]</span></strong> <span class="bus_time">0분 후 (1 전)</span></p>
                                                        <p class="bus_line">서귀포버스터미널(가상정류소) <img src="/images/kiosk/icon/arrow2_right.png" alt=""> 제주버스터미널 <img src="/images/kiosk/icon/arrow2_right.png" alt=""> 제주버스터미널</p>
                                                    </li>
                                                    <li>
                                                        <p><strong class="bus_color red"><em>128</em> <span class="bus_name">[공항]</span> <span class="low_bus">저상버스</span></strong> <span class="bus_time">12분 후 (4 전)</span></p>
                                                        <p class="bus_line">제주버스터미널 <img src="/images/kiosk/icon/arrow2_right.png" alt=""> 제주국제공항</p>
                                                    </li>
                                                    <li>
                                                        <p><strong class="bus_color blue"><em>342</em> <span class="bus_name">[함덕(신사동)]</span></strong> <span class="bus_time">0분 후 (1 전)</span></p>
                                                        <p class="bus_line">제주대학교 <img src="/images/kiosk/icon/arrow2_right.png" alt=""> 신사동(종점)</p>
                                                    </li>
                                                    <li>
                                                        <p><strong class="bus_color green"><em>441</em> <span class="bus_name">[별빛누리공원]</span></strong> <span class="bus_time">0분 후 (1 전)</span></p>
                                                        <p class="bus_line">별빛누리공원/난타공연장 <img src="/images/kiosk/icon/arrow2_right.png" alt=""> 별빛누리공원/난타공연장</p>
                                                    </li>
                                                    <li>
                                                        <p><strong class="bus_color blue"><em>281</em> <span class="bus_name">[제주버스터미널]</span></strong> <span class="bus_time">0분 후 (1 전)</span></p>
                                                        <p class="bus_line">서귀포버스터미널(가상정류소) <img src="/images/kiosk/icon/arrow2_right.png" alt=""> 제주버스터미널 <img src="/images/kiosk/icon/arrow2_right.png" alt=""> 제주버스터미널</p>
                                                    </li>
                                                    <li>
                                                        <p><strong class="bus_color blue"><em>355</em> <span class="bus_name">[수산]</span></strong> <span class="bus_time">1분 후 (2 전)</span></p>
                                                        <p class="bus_line">제주대학교 <img src="/images/kiosk/icon/arrow2_right.png" alt=""> 수산리사무소앞</p>
                                                    </li>
                                                    <li>
                                                        <p><strong class="bus_color green"><em>432</em> <span class="bus_name">[제주버스터미널]</span></strong> <span>저상버스</span> <span class="bus_time">1분 후 (2 전)</span></p>
                                                        <p class="bus_line">제주버스터미널 <img src="/images/kiosk/icon/arrow2_right.png" alt=""> 제주버스터미널</p>
                                                    </li>
                                                    <li>
                                                        <p><strong class="bus_color blue"><em>365</em> <span class="bus_name">[수산]</span></strong> <span class="bus_time">11분 후 (7 전)</span></p>
                                                        <p class="bus_line">제주대학교 <img src="/images/kiosk/icon/arrow2_right.png" alt=""> 제주한라대학교(종점)</p>
                                                    </li>
                                                    <li>
                                                        <p><strong class="bus_color blue"><em>281</em> <span class="bus_name">[제주버스터미널]</span></strong> <span class="bus_time">0분 후 (1 전)</span></p>
                                                        <p class="bus_line">서귀포버스터미널(가상정류소) <img src="/images/kiosk/icon/arrow2_right.png" alt=""> 제주버스터미널 <img src="/images/kiosk/icon/arrow2_right.png" alt=""> 제주버스터미널</p>
                                                    </li>
                                                    <li>
                                                        <p><strong class="bus_color red"><em>128</em> <span class="bus_name">[공항]</span> <span class="low_bus">저상버스</span></strong> <span class="bus_time">12분 후 (4 전)</span></p>
                                                        <p class="bus_line">제주버스터미널 <img src="/images/kiosk/icon/arrow2_right.png" alt=""> 제주국제공항</p>
                                                    </li>
                                                </ul>
                                            </div>
                                            <div class="station_footer"></div>
                                        </div>
                                    </div>
                                </div>
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