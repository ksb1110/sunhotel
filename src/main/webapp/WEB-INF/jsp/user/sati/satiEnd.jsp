<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>


<%@ include file="/WEB-INF/jsp/common/header.jsp" %>


<title>만족도조사  - 제주시 스마트청사 안내</title> 


 
    
<script language="javascript">
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
                    
            
<c:set var="totAvg"  value="${resultVO.totAvg}" />
<%-- <fmt:formatNumber  var="totAvg" value="${totAvg}" type="number" pattern="0.00"  /> --%>
<fmt:parseNumber var="totAvg" value="${totAvg}"/>
                       
                        <div class="evaluate_detail">
                            <div class="detail_header">
                                <div class="question">
                                    <p class="font_color00">참여해 주셔서 감사합니다.</p>
                                </div>
                            </div>
                            <div class="detail_contents">
                                <div class="evaluate_check_box confirm">
                                    <div class="user_info">
                                        <div class="info_detail">
                                            <dl>
                                                <dt>현재점수</dt>
                                                <dd>
                                                    <em><span class="font_color05">${totAvg}</span> 점</em> <span class="font_color01">[<em class="font_color00">${resultVO.totCnt} 명</em> 참여]</span>
                                                </dd>
                                            </dl>
                                        </div>
                                    </div> 
                                    
                                    <ul> 
                                     <c:choose>
                                         <c:when test = "${totAvg > 0 and totAvg < 2 }">
                                        <li class="smile1" ><input type="radio" name="point" id="smile1" checked ><label for="smile1"><span></span><em>별로에요</em></label></li>
                                         </c:when>
                                         <c:when test = "${totAvg > 1.9 and totAvg < 3.0 }">
                                        <li class="smile2" ><input type="radio" name="point" id="smile2" checked ><label for="smile2"><span></span><em>그저그래요</em></label></li>
                                         </c:when>
                                         <c:when test = "${totAvg > 2.9 and totAvg < 4.0 }">
                                        <li class="smile3" ><input type="radio" name="point" id="smile3" checked ><label for="smile3"><span></span><em>괜찮아요</em></label></li>
                                         </c:when>
                                         <c:when test = "${totAvg > 3.9 and totAvg < 5.0 }">
                                        <li class="smile4" ><input type="radio" name="point" id="smile4" checked ><label for="smile4"><span></span><em>좋아요</em></label></li>
                                         </c:when>
                                         <c:when test = "${ totAvg eq 5.0 }">
                                        <li class="smile5" ><input type="radio" name="point" id="smile5" checked ><label for="smile5"><span></span><em>매우 좋아요</em></label></li>
                                         </c:when>
                                         <c:otherwise>
                                        <li class="smile3" ><input type="radio" name="point" id="smile3" checked ><label for="smile3"><span></span><em>괜찮아요</em></label></li>
                                         </c:otherwise>
                                      </c:choose>  
                                    </ul>   
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