<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>


<%@ include file="/WEB-INF/jsp/common/header.jsp" %>


<title>만족도조사  - 제주시 스마트청사 안내</title> 


 
    
<script language="javascript">

function fn_validate_sati(){
	  
    if($("input:radio[name=point]").is(":checked") == false) {
        //alert("만족도를 선택해주세요.");
        modal_alert_txt("만족도를 선택해주세요.","2");
        return false;
    }
    /*
    if($("input:radio[name=gender]").is(":checked") == false) {
        alert("성별을 선택해주세요.");
        return false;
    }
    if($("input:radio[name=ageGroup]").is(":checked") == false) {
        alert("연령대를 선택해주세요.");
        return false;
    }
    */
     
    //if(confirm("만족도 점수를 주시겠습니까?")){
    	$('#insert_form').submit();
    //}else{
    //    return false;
    //}
	
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
                    
                       
                        <div class="evaluate_detail">
                            <div class="detail_header">
                                <div class="question">
                                    <h2>제주시청 청사안내 키오스크 <em>당신의 만족도 점수는요?</em></h2>
                                </div>
                                <div class="text">
                                    <p>아래 <span class="font_color00">버튼을 터치하여 만족도 조사에 참여</span>해 주세요.</p>
                                    <p>여러분의 <span class="font_color00">평가를 통해 더 나은 서비스를 제공</span>하고자 만족도 조사를 실시하고 있습니다.</p>
                                </div>
                            </div>
                            
                            <form  name="insert_form" id="insert_form" method="post" action="/satiIns.ez" >
                            <div class="detail_contents">
                                <div class="evaluate_check_box">
                                    <ul>
                                        <li class="smile1"><input type="radio" name="point" id="smile1" value="1" ><label for="smile1"><span></span><em>별로에요</em></label></li>
                                        <li class="smile2"><input type="radio" name="point" id="smile2" value="2" ><label for="smile2"><span></span><em>그저그래요</em></label></li>
                                        <li class="smile3"><input type="radio" name="point" id="smile3" value="3" ><label for="smile3"><span></span><em>괜찮아요</em></label></li>
                                        <li class="smile4"><input type="radio" name="point" id="smile4" value="4" ><label for="smile4"><span></span><em>좋아요</em></label></li>
                                        <li class="smile5"><input type="radio" name="point" id="smile5" value="5" ><label for="smile5"><span></span><em>매우 좋아요</em></label></li>
                                    </ul>       
                                </div>  
                                
                                <div class="user_info">
                                    <div class="title">
                                        <h2>참여자<span>정보</span></h2>
                                    </div>
                                    <div class="info_detail">
                                        <dl>
                                            <dt>성별</dt>
                                            <dd>
                                                <ul>
                                                    <li><input type="radio" name="gender" id="male"   value="M" ><label for="male"><span></span><em>남 자</em></label></li>
                                                    <li><input type="radio" name="gender" id="female" value="F" ><label for="female"><span></span><em>여 자</em></label></li>
                                                </ul>
                                            </dd>
                                        </dl>
                                        <dl>
                                            <dt>연령대</dt>
                                            <dd>
                                                <ul>
                                                    <li><input type="radio" name="ageGroup" id="10s" value="10" ><label for="10s"><span></span><em>10대</em></label></li>
                                                    <li><input type="radio" name="ageGroup" id="20s" value="20" ><label for="20s"><span></span><em>20대</em></label></li>
                                                    <li><input type="radio" name="ageGroup" id="30s" value="30" ><label for="30s"><span></span><em>30대</em></label></li>
                                                    <li><input type="radio" name="ageGroup" id="40s" value="40" ><label for="40s"><span></span><em>40대</em></label></li>
                                                    <li><input type="radio" name="ageGroup" id="50s" value="50" ><label for="50s"><span></span><em>50대</em></label></li>
                                                    <li><input type="radio" name="ageGroup" id="60s" value="60" ><label for="60s"><span></span><em>60대</em></label></li>
                                                    <li><input type="radio" name="ageGroup" id="70s_over" value="70" ><label for="70s_over"><span></span><em>70대 이상</em></label></li>
                                                </ul>
                                            </dd>
                                        </dl>
                                        <div class="align_btn_center">
                                            <button type="button" class="user_submit_btn" onclick="fn_validate_sati();" >점수주기</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            
                        </form>
                        
                        
                        
                        
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