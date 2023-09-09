<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fn"     uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt"    uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@ include file="/WEB-INF/jsp/smtmng/include/top.jsp" %>

<title>문자발송테스트 - 시스템관리 - 제주시 스마트청사안내 관리자페이지</title>

<script>
//로딩완료 후 처리되는 스크립트는 페이지 하단에 정의한다.

/**
 * 문자발송
 */
function sendSms(){
	
    if($("#userId").val() == ""){
        alert("UMS 로그인아이디를 입력하세요.");
        $("#userId").focus();
        return;
    }
    
    if($("#scheduleType").val() == ""){
        alert("스케쥴 타입구분을 입력하세요");
        $("#scheduleType").focus();
        return;
    }
    
    if($("#msgContent").val() == ""){
        alert("메시지내용을 입력하세요");
        $("#msgContent").focus();
        return;
    }
    
    if($("#callingNum").val() == ""){
        alert("회신번호를 입력하세요");
        $("#callingNum").focus();
        return;
    }
    
    if($("#phoneNum").val() == ""){
        alert("수신번호를 입력하세요");
        $("#phoneNum").focus();
        return;
    }
	
    //var parameters = $("#frm").serialize();
    var parameters = new FormData($('#frm')[0]);
    
    //$("#frm").ajaxSubmit({
    $.ajax({
    	
    	type:"post", 
		dataType:"json",
		
		//enctype:"multipart/form-data",
		contentType:false,
		processData:false,
		
		async:false,
		url:"<c:url value='/smtmng/system/sms/smsSend.ezax'/>",
		data:parameters ,
		success:function(data){
			if(data.result == "${Constant.FLAG_N}"){
				alert(data.errorMessage);
			} else {
				alert("문자 테이블 저장에 성공하였습니다");
				//적용되었습니다.
				document.location.reload();
			}
		}
    });
}
</script>

</head>

<body>
<div id="wrap">
	
	<!-- 해당 페이지의 상위 메뉴 설정 (상위메뉴가 체크된 상태로 표시되도록) -->
	<jsp:include page="/smtmng/header.ez" flush="false">
		<jsp:param name="admin_menu" value="system"/>
		<jsp:param name="admin_menu2" value="sms"/>
	</jsp:include>
	
    <main id="main">
		<section class="contents-wrap">
            <h2 class="title1">문자발송테스트</h2>                    
           	
           	<form id="frm" name="frm" onSubmit="return false;" method="post" action="${pageContext.request.contextPath}/smtmng/system/sms/smsSend.ezax">
            	
                <div class="int-box">
                    <label>* UMS 로그인아이디 (USER ID)</label>
                    <input id="userId" name="userId" type="text" value="JEJUSI" >
                </div>
                <div class="int-box">
                    <label>* 스케쥴 타입구분(0:즉시, 1:예약) (SCHEDULE_TYPE)</label>
                    <input id="scheduleType" name="scheduleType" type="text" value="0" >
                </div>
                <div class="int-box">
                    <label>제목 (TITLE)</label>
                    <input id="title" name="title" type="text" value="[외부전송]sms" >
                </div>
                <div class="int-box">
                    <label>* 메시지내용 (MSG_CONTENTS)</label>
                    <textarea id="msgContent" name="msgContent" style="width:100%;"></textarea>
                </div>
                <div class="int-box">
                    <label>* 회신번호 (CALLING_NUM)</label>
                    <input id="callingNum" name="callingNum" type="text" value="064-728-2303" >
                </div>
                <div class="int-box">
                    <label>수신자 (TGT_NM)</label>
                    <input name="tgtNm" type="text" value="홍길동" >
                </div>
                <div class="int-box">
                    <label>* 수신번호 (PHONE_NUM)</label>
                    <input id="phoneNum" name="phoneNum" type="text" value="010-5140-5931" >
                </div>
                <div class="login-btn"><button type="button" onclick="javascript:sendSms();">문자발송</button></div>
            </form>
            
                               
		</section> <!--//contents-wrap-->
	</main>

	<footer id="footer">
		
	</footer>
</div> <!--//wrap-->

</body>
</html>