<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>


<%@ include file="/WEB-INF/jsp/common/header.jsp" %>



<style>
.button_test {
  background-color: #f44336;
  border: none;
  color: white;
  padding: 15px 32px;
  text-align: center;
  text-decoration: none;
  display: inline-block;
  font-size: 16px;
  margin: 4px 2px;
  cursor: pointer;
}
</style>

<title>TEST - 제주시 스마트청사 안내</title> 


 
<script language="javascript">

function fn_ajaxTTS_test(){
	
	var tts_test = $("#tts_test").val();
	fn_ajaxTTS('kiosk001', tts_test);
	
}

$(document).ready(function(){
        
    
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
            
            
            <div class="content_area">          
                <div class="container">
                    <div id="contents"> 
                    <!--실제 컨텐츠-->                  


                    <br><br>        
                         <h1>text - /jsp/user/test.jsp</h1> 
                    <br><br>    
                    <a href="/htmls/kiosk/page_list.htm">page_list</a>
                    <a href=" /api/ajaxwpSelect.ez">날씨  AJAX</a>
                   
                    <br><br>   
                    <button class="button_test" type="button" onclick="fn_ajaxTTS('kiosk001','시청본관에서 출발, 일시정지 첨단로를따라127이동,우회전,첨단로를따라140m이동,좌회전,첨단로를따라174m이동,도착');" alt="">TTS Test File create Click!</button>
                    <br>
                    <input type="text" id="tts_test" value="조마루감자탕,시청본관에서 출발, 일시정지 첨단로를따라127이동,우회전,첨단로를따라140m이동,좌회전,첨단로를따라174m이동,도착" style="width:90%;">
                    <br>
                    <button class="button_test" type="button" onclick="fn_ajaxTTS_test()"; alt="">TTS 글자 다르게 테스트 Click!</button>
                    <br>
                    <button class="button_test" type="button" onclick="fn_ajaxTTSplay()"; alt="">TTS Test File Play Click!</button>
                    <br>
                    <input type="button" onClick="ttsAudio.play();" value="Reload"/>
                    <br>
                    <input type="button" onClick="ttsAudio.pause();" value="PAUSE"/> 
                    <br><br>    
                    <button class="button_test" type="button" onclick="fn_ajaxMakeQr('kiosk001','https://youtu.be/4DLRPQzutzo')"; alt="">QRCODE Test File create Click!</button>
                    <img src="" id="qrcode_id" style="display:none;">
                    <br> 
                    <br>
                    <h1>화면안</h1>
                    <br>   
                   <a href="https://preview.uxpin.com/fedb445b707ed4d01e12b32ef6d827c7e2acf1fb" target="_blank">사용자 - https://preview.uxpin.com/fedb445b707ed4d01e12b32ef6d827c7e2acf1fb</a><br><br>
                   <a href="https://preview.uxpin.com/adbc9f139158b6a0b1fbff5d21e6a8bbc635507c" target="_blank">포털 - https://preview.uxpin.com/adbc9f139158b6a0b1fbff5d21e6a8bbc635507c</a><br><br>
                   <a href="https://preview.uxpin.com/c38b9231d7bd84053eaf6e92a83d5aaef5c0559a" target="_blank">디스플레이 - https://preview.uxpin.com/c38b9231d7bd84053eaf6e92a83d5aaef5c0559a</a><br><br>
                   <a href="https://preview.uxpin.com/595049499261369d09112834e0bb4da843190dbb" target="_blank">관리자 - https://preview.uxpin.com/595049499261369d09112834e0bb4da843190dbb</a><br><br>
    
                        <!-- 
                        <div class="news_wrap">
                            <div class="news_detail_area">    
                              <div class="video"> 
                                  <iframe width="560" height="315" src="https://www.youtube.com/embed/vn6b2gj4EVc?rel=0&autoplay=1&modestbranding=1&loop=1&showinfo=0;playlist=vn6b2gj4EVc" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture;" allowfullscreen></iframe>
                              </div>
                            </div>
                        </div>
                         -->
                       

 
 
<!--  
    <div id="weather">  
    <br>
    날씨 : <a href="http://www.kma.go.kr/wid/queryDFSRSS.jsp?zone=5011054000" target="_blank">http://www.kma.go.kr/wid/queryDFSRSS.jsp?zone=5011054000</a>
    <br>  
    ${weatherInfo.time} 
    ${weatherInfo.weather}
    ${weatherInfo.temp}
      <br>  <br>
    미세먼지 : <a href="http://air.jeju.go.kr/rest/JejuAirService/getJejuAirList/?date=20190624" target="_blank">http://air.jeju.go.kr/rest/JejuAirService/getJejuAirList/?date=20190624</a> 
    <br>  
    ${airInfo.site} 
    ${airInfo.pm10}
    ${airInfo.pm10_cai}
    </div>

    <div>
    ${Constant.FLAG_N}
    </div>
  -->
 
 
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