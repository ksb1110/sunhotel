<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

<%@ page import="nextez.com.vo.SingletonData" %>

<%@ include file="/WEB-INF/jsp/common/header.jsp" %>

<title>메인페이지 - 제주시 스마트청사 안내</title> 


 
<script language="javascript">


$(document).ready(function(){
        
    
});
</script>
  
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/kiosk/main.css?v=<%=SingletonData.getInstance().getJsCssVersion()%>">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/kiosk/video-js.css">
    

<!-- 메인만 script 추가 -->
<script src="/js/comm/bxslider/jquery.bxslider.js"></script>
<script src="/js/kiosk/video.js"></script>

<style type="text/css">
/* 메인 영상 Play 버튼 */ 
.vjs-default-skin .vjs-big-play-button {
overflow: hidden;   
top: 50%; left: 50%;
width: 100px; height: 100px;
margin-top: -50px; margin-left: -50px;
background: url("/images/kiosk/main/video_play_button.png") no-repeat 0 0;
font-size: 0; transition: none;
}
.vjs-default-skin:focus .vjs-big-play-button, 
.vjs-default-skin:hover .vjs-big-play-button, 
.vjs-default-skin .vjs-big-play-button:focus {
width: 100px; height: 100px;
-webkit-border-radius: 100%;
-moz-border-radius: 100%;
border-radius: 100%;
}   
.vjs-control-bar {display: none!important;} 
.vjs-default-skin:focus .vjs-control-bar,   
.vjs-default-skin:hover .vjs-control-bar {display: block!important;}    
</style>    


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
 
 
                        <!--메인 컨텐츠-->
                        <div class="main_contents">
                        
               <c:choose>
               <c:when test="${SM.imgMovieChoice eq 'M'}" >   
                   <c:if test="${SM.movieShowFlag eq 'Y'}" >     
                            <!--메인 영상-->
                            <div class="main_video">
                            <c:set var="youtubeURL" value="${fn:replace(PM.utubeUrl, 'https://www.youtube.com/embed/', '')}"/>
                            <!-- 
                                <video data-setup="" id="example_video_1" class="video-js vjs-default-skin" controls preload="none" poster="">
                                    <source src="${PM.utubeUrl}" type="video/mp4">
                                    브라우저가 HTML5 동영상을 지원하지 않습니다.
                                </video>
                                
                                ${fn:replace(PM.utubeUrl, "https://www.youtube.com/embed/", "")}
                              --> 
                                
                                  <!-- <iframe src="https://www.youtube.com/embed/4BWhU9HQ5_k?rel=0&autoplay=1&modestbranding=1&loop=1&showinfo=0;playlist=4BWhU9HQ5_k" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe> -->
                                  
                                  
                                  <!-- 
                                  <iframe src="${PM.utubeUrl}?rel=0&autoplay=1&modestbranding=1&loop=1&showinfo=0&controls=0;playlist=${youtubeURL}" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen width=1180 height=664 title="${PM.utubeTitle}"></iframe>
                                   -->
                                  
 									<div class="player_cover"></div>
                                    <div id="player"  style="width:1180px; height:664px;" ></div> 
                                  
								    <script>
								      // 1. This code loads the IFrame Player API code asynchronously.
								      var tag = document.createElement('script');
								
								      tag.src = "https://www.youtube.com/iframe_api";
								      var firstScriptTag = document.getElementsByTagName('script')[0];
								      firstScriptTag.parentNode.insertBefore(tag, firstScriptTag);
								
								      // 2. This function creates an <iframe> (and YouTube player)
								      //    after the API code downloads.
								      var player;
								      function onYouTubeIframeAPIReady() {
								        player = new YT.Player('player', {
								          height: '100%',
								          width: '100%',
								          playerVars: {
								                playlist: '${youtubeURL}',
								                autoplay: 1,
							                    loop: 1,
							                    controls: 0,
							                    showinfo: 0,
							                    autohide: 1,
							                    modestbranding: 1,  
							                    wmode: 'opaque',
                                                mute:1,
							                    vq: 'hd1080'},
							          videoId: '${youtubeURL}',
							          events: {
							            'onReady': onPlayerReady,
							            'onStateChange': onPlayerStateChange
							          }
							        });
							      }
							
							      // 3. The API will call this function when the video player is ready.
							      function onPlayerReady(event) {
							        event.target.playVideo();
							        player.mute();
							      }
							
							      var done = false;
							      function onPlayerStateChange(e) { 
							    	  var id = '${youtubeURL}';

								      if(e.data === YT.PlayerState.ENDED){
								          player.loadVideoById(id);
								      }
							      }
							      function stopVideo() {
							        player.stopVideo();
							      }
							    </script>
    
                                  
                            </div>
                            <!--//메인 영상-->
                     </c:if>
                </c:when>
                
               <c:when test="${SM.imgMovieChoice eq 'I'}" >    
                   <c:if test="${SM.campaignShowFlag eq 'Y'}" >     
                            <!--슬라이드 배너-->
                            <!-- ${IM.nextSort } ${IM.campaignList } -->  
                            
                            <div class="sliding_banner">
                                <ul>
            
	                            <c:if test="${fn:length(IM.campaignList) > 0}">
		                            <c:forEach items="${IM.campaignList}" var="item" varStatus="status">
		                            
		                                <c:if test="${item.showFlag eq 'Y'}">
		                                    <c:if test="${not empty item.imgSavePath}">
		                                        <li><img src="${item.imgSavePath}" alt="${item.title}"  ></li>
		                                    </c:if> 
		                                </c:if>
		                            </c:forEach>
	                            </c:if>
                            
	                            <c:if test="${fn:length(IM.campaignList) == 0}">
	                            <!-- 조회된 자료가 없을 시 -->
	                                   <li>등록된 캠페인이미지가 없습니다.</li>
	                            </c:if>
                                </ul>
                            </div>
                            <!--//슬라이드 배너-->
                     </c:if>
                </c:when>
                </c:choose>
                
                   <c:if test="${SM.subtitleShowFlag eq 'Y'}" >     
                            <!--슬라이드 텍스트-->
                            <div class="sliding_notice">
                                <marquee behavior="scroll">
                                    <ul class="notice_text">
                                    
		                                <c:if test="${fn:length(ST.subtitleList) > 0}">
		                                    <c:forEach items="${ST.subtitleList}" var="item" varStatus="status">
                                                
		                                        <c:if test="${item.showFlag eq 'Y'}">
		                                            <c:if test="${ fn:substring(item.startDttm,0,16) < nowDate && fn:substring(item.endDttm,0,16) > nowDate  }">
		                                                <li>${item.subtitle}</li>
		                                            </c:if>
		                                        </c:if>
		                                    </c:forEach>
		                                </c:if>
		                            
		                                <c:if test="${fn:length(ST.subtitleList) == 0}">
		                                <!-- 조회된 자료가 없을 시 -->
		                                       <li>등록된 자막이 없습니다.</li>
		                                </c:if> 
                                    </ul>
                                </marquee>
                            </div>
                            <!--//슬라이드 텍스트-->
                     </c:if>
                            
                            
                        </div>
                        <!--//메인 컨텐츠-->
          
 
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