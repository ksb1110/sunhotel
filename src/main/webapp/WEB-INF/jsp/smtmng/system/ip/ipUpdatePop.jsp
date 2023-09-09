<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fn"     uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt"    uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@ page import="java.util.Date" %>
<c:set var="today" value="<%=new Date()%>" />
<c:set var="tomorrow" value="<%=new Date(new Date().getTime() + 60*60*24*1000)%>" />



<%@ include file="/WEB-INF/jsp/smtmng/include/top.jsp" %>

<title>수정 - 접근IP설정관리 - 시스템관리 - 제주시 스마트청사안내 관리자페이지</title>

<script>
//로딩완료 후 처리되는 스크립트는 페이지 하단에 정의한다.

//수정
function updateIp() {
	 
	//숫자 정규식
	var number_re = /^[0-9]+$/;
	
	//아이피 범위
	var rangeGubun = $("input[name='rangeGubun']:checked").val();
	
	//아이피
	var startIp1 = $.trim($("input[name='startIp1']").val());
	var startIp2 = $.trim($("input[name='startIp2']").val());
	var startIp3 = $.trim($("input[name='startIp3']").val());
	var startIp4 = $.trim($("input[name='startIp4']").val());
	
	var endIp1 = $.trim($("input[name='endIp1']").val()); 
	var endIp2 = $.trim($("input[name='endIp2']").val()); 
	var endIp3 = $.trim($("input[name='endIp3']").val()); 
	var endIp4 = $.trim($("input[name='endIp4']").val()); 
	
	//단일 아이피이면
	if(rangeGubun == "A") {
		
		//시작 아이피 체크
		if(startIp1.length < 1 || startIp2.length < 1 || startIp3.length < 1 || startIp4.length < 1) {
	
			alert("아이피를 입력해주세요.");
			return false;
		}
		
		//아이피 숫자 체크
		if(!number_re.test(startIp1)) {
			
			alert("아이피를 숫자로 입력해주세요.");
			$("input[name='startIp1']").focus();
			
			return false;
		}
		
		//아이피 숫자 체크
		if(!number_re.test(startIp2)) {
			
			alert("아이피를 숫자로 입력해주세요.");
			$("input[name='startIp2']").focus();
			
			return false;
		}
		
		//아이피 숫자 체크
		if(!number_re.test(startIp3)) {
	
			alert("아이피를 숫자로 입력해주세요.");
			$("input[name='startIp3']").focus();
			
			return false;
		}

		//아이피 숫자 체크
		if(!number_re.test(startIp4)) {
	
			alert("아이피를 숫자로 입력해주세요.");
			$("input[name='startIp4']").focus();
			
			return false;
		}
	}
	//아이피대역이면
	else {
		
		//시작 아이피 체크
		if(startIp1.length < 1 || startIp2.length < 1 || startIp3.length < 1 || startIp4.length < 1) {
	
			alert("시작 아이피를 입력해주세요.");
			return false;
		}
		
		//아이피 숫자 체크
		if(!number_re.test(startIp1)) {
			
			alert("아이피를 숫자로 입력해주세요.");
			$("input[name='startIp1']").focus();
			
			return false;
		}
		
		//아이피 숫자 체크
		if(!number_re.test(startIp2)) {
			
			alert("아이피를 숫자로 입력해주세요.");
			$("input[name='startIp2']").focus();
			
			return false;
		}
		
		//아이피 숫자 체크
		if(!number_re.test(startIp3)) {
	
			alert("아이피를 숫자로 입력해주세요.");
			$("input[name='startIp3']").focus();
			
			return false;
		}

		//아이피 숫자 체크
		if(!number_re.test(startIp4)) {
	
			alert("아이피를 숫자로 입력해주세요.");
			$("input[name='startIp4']").focus();
			
			return false;
		}
		
		//끝 아이피 체크
		if(endIp1.length < 1 || endIp2.length < 1 || endIp3.length < 1 || endIp4.length < 1) {
	
			alert("끝 아이피를 입력해주세요.");
			return false;
		}	
		
		//아이피 숫자 체크
		if(!number_re.test(endIp1)) {
			
			alert("아이피를 숫자로 입력해주세요.");
			$("input[name='endIp1']").focus();
			
			return false;
		}
		
		//아이피 숫자 체크
		if(!number_re.test(endIp2)) {
			
			alert("아이피를 숫자로 입력해주세요.");
			$("input[name='endIp2']").focus();
			
			return false;
		}
		
		//아이피 숫자 체크
		if(!number_re.test(endIp3)) {
	
			alert("아이피를 숫자로 입력해주세요.");
			$("input[name='endIp3']").focus();
			
			return false;
		}

		//아이피 숫자 체크
		if(!number_re.test(endIp4)) {
	
			alert("아이피를 숫자로 입력해주세요.");
			$("input[name='endIp4']").focus();
			
			return false;
		}
		
		//시작아이피가 끝아이피보다 작은지 체크해야 한다.
		var sIpPoint = numberPad(startIp1,3) + "" + numberPad(startIp2,3) + "" + numberPad(startIp3,3) + "" + numberPad(startIp4,3);
		var eIpPoint = numberPad(endIp1,3) + "" + numberPad(endIp2,3) + "" + numberPad(endIp3,3) + "" + numberPad(endIp4,3);
		
		//시작아이피가 끝아이피보다 작으면
		if(sIpPoint > eIpPoint) {
			
			alert("시작 아이피가 끝 아아피보다 작습니다.");
			return false;
		}
	}
	
	//기간여부
	var periodFlag = $("input[name='periodFlag']:checked").val();
	
	//기간
	var startDate = $.trim($("input[name='startDate']").val());
	var endDate = $.trim($("input[name='endDate']").val());
	
	//기간설정인 경우
	if(periodFlag == "Y") {
		
		//시작날짜 체크
		if(startDate.length < 1) {
	
			alert("시작날짜를 입력해주세요.");
			return false;
		}
		
		//종료날짜 체크
		if(endDate.length < 1) {
	
			alert("종료날짜를 입력해주세요.");
			return false;
		}
	}
	
	
	// confirm.mod=수정하시겠습니까?
	if(confirm("<spring:message code='confirm.mod'/>")){
		
		var parameters = new FormData($('#update_form')[0]);
		
		$.ajax({
			type:"post", 
			dataType:"json",
			//enctype:"multipart/form-data",
			contentType:false,
			processData:false,
			async:false,
			url:"<c:url value='/smtmng/system/ip/ipUpdate.ezax'/>",
			data:parameters ,
			success:function(data) {
				
				if(data.result == "${Constant.FLAG_N}") {
					
					alert(data.errorMessage);
				} 
				else {
					
					opener.location.reload();
					self.close();
				}
			}
		});
	}
}
	
//범위구분 변경
function changeRangeGubun() {
	
	//아이피 범위
	var rangeGubun = $("input[name='rangeGubun']:checked").val();
	
	//단일 아이피이면
	if(rangeGubun == "A") {
		
		//끝 아이피 숨김 처리
		$("#endIpSpan").hide();
		
		//끝 아이피 값 초기화
		$("input[name='endIp1']").val("");
		$("input[name='endIp2']").val("");
		$("input[name='endIp3']").val("");
		$("input[name='endIp4']").val("");
	}
	//범위 아이피이면
	else {
		
		//끝 아이피 보임 처리
		$("#endIpSpan").show();
	}
}

//기간구분 변경
function changePeriodFlag() {
	
	//기간여부
	var periodFlag = $("input[name='periodFlag']:checked").val();
	
	//기간으로 설정이면
	if(periodFlag == "Y") {
		
		
		//시작날짜 활성화
		$("input[name='startDate']").datepicker("option", "disabled", false);
		
		//종료날짜 활성화
		$("input[name='endDate']").datepicker("option", "disabled", false);		
	}
	//제한기간 없음 설정이면
	else if(periodFlag == "N") {
		
		//시작날짜 값 초기화
		$("input[name='startDate']").val("");
		
		//종료날짜 값 초기화
		$("input[name='endDate']").val("");
		
		//시작날짜 활성화
		$("input[name='startDate']").datepicker("option", "disabled", true);
		
		//종료날짜 활성화
		$("input[name='endDate']").datepicker("option", "disabled", true);	
	}
}

//숫자앞에 0 붙이기
function numberPad(n, width) {
	
    n = n + '';
    return n.length >= width ? n : new Array(width - n.length + 1).join('0') + n;
}
</script>

</head>
<body>	

<div class="win-popup">
   
    <div class="title-wrapper side">
        <div class="l-area">
            <h3 class="title2">접근IP 수정</h3>
        </div>
        <div class="r-area">
            <div class="necessary-area">
                <img class="necessary" src="${pageContext.request.contextPath}/images/admin/icon/temp/red_check.png" alt="체크">
                필수입력
            </div>
        </div>
    </div> <!--//title-wrapper-->
    
    <form name="update_form" id="update_form" method="post" autocomplete="off" onsubmit="updateIp();return false;">
    
    <input type="hidden" name="seq" value="${ipVO.seq}">
		
    <div class="table-wrapper">   	
    	
        <table class="table-row th-left">
            <colgroup>
                <col style="width: 20%">
                <col style="width: 30%">
                <col style="width: 20%">
                <col style="width: 30%">
            </colgroup>
            <tbody>
                <tr>
                    <th>허용구분</th>
                    <td colspan="3">
                        <label><input type="radio" name="limitGubun" value="A" <c:if test="${ipVO.limitGubun == 'A'}">checked</c:if>> 허용아이피</label>
                        &nbsp;&nbsp;&nbsp;
                        <label><input type="radio" name="limitGubun" value="B" <c:if test="${ipVO.limitGubun == 'B'}">checked</c:if>> 차단아이피</label>
                    </td>
                </tr>
                <tr>
                    <th>
                    	<div class="necessary-area">                            
                            범위구분
                        </div>                    	
                    </th>
                    <td colspan="3">
                        <label><input type="radio" name="rangeGubun" value="A" onclick="changeRangeGubun();" <c:if test="${ipVO.rangeGubun == 'A'}">checked</c:if>> 단일아이피</label>
                        &nbsp;&nbsp;&nbsp;
                        <label><input type="radio" name="rangeGubun" value="B" onclick="changeRangeGubun();" <c:if test="${ipVO.rangeGubun == 'B'}">checked</c:if>> 아이피대역</label>
                    </td>
                </tr>
                <tr>
                    <th>
                    	<div class="necessary-area">
                            <img class="necessary" src="${pageContext.request.contextPath}/images/admin/icon/temp/red_check.png" alt="체크">
                            아이피
                        </div>                    	
                    </th>
                    <td colspan="3">                    	
                        <input type="text" class="width10" name="startIp1" maxlength="3" style="text-align:center;" value="${ipVO.startIpPoint1}">
                        .                        
                        <input type="text" class="width10" name="startIp2" maxlength="3" style="text-align:center;" value="${ipVO.startIpPoint2}">
                        .
                        <input type="text" class="width10" name="startIp3" maxlength="3" style="text-align:center;" value="${ipVO.startIpPoint3}">
                        .
                        <input type="text" class="width10" name="startIp4" maxlength="3" style="text-align:center;" value="${ipVO.startIpPoint4}">
                        
                        <span id="endIpSpan" style="display:none;">
                        
	                        &nbsp;&nbsp;&nbsp;~&nbsp;&nbsp;&nbsp;
	                        
	                        <input type="text" class="width10" name="endIp1" maxlength="3" style="text-align:center;" value="${ipVO.endIpPoint1}">
	                        .
	                        <input type="text" class="width10" name="endIp2" maxlength="3" style="text-align:center;" value="${ipVO.endIpPoint2}">
	                        .
	                        <input type="text" class="width10" name="endIp3" maxlength="3" style="text-align:center;" value="${ipVO.endIpPoint3}">
	                        .
	                        <input type="text" class="width10" name="endIp4" maxlength="3" style="text-align:center;" value="${ipVO.endIpPoint4}">
                        
                        </span>
                    </td>
                </tr>
                <tr>
                    <th>
                    	<div class="necessary-area">                            
                            기간구분
                        </div>                    	
                    </th>
                    <td colspan="3">
                        <label><input type="radio" name="periodFlag" value="Y" onclick="changePeriodFlag();" <c:if test="${ipVO.periodFlag == 'Y'}">checked</c:if>> 기간으로 설정</label>
                        &nbsp;&nbsp;&nbsp;
                        <label><input type="radio" name="periodFlag" value="N" onclick="changePeriodFlag();" <c:if test="${ipVO.periodFlag == 'N'}">checked</c:if>> 제한기간 없음</label>
                    </td>
                </tr>
                <tr>
                    <th>
                    	<div class="necessary-area">
                            <img class="necessary" src="${pageContext.request.contextPath}/images/admin/icon/temp/red_check.png" alt="체크">
                            접근기간
                        </div> 
                    </th>
                    <td colspan="3">
                    	<span class="date-wrap">
                        	<input type="text" class="width100 datepicker" name="startDate" value="${ipVO.startDate}" readonly>
                        </span>
                        
                         &nbsp;&nbsp;&nbsp;~&nbsp;&nbsp;&nbsp;
                         
                    	<span class="date-wrap">
                        	<input type="text" class="width100 datepicker" name="endDate" value="${ipVO.endDate}" readonly>
                        </span>
                    </td>
            	</tr>
                <tr>
                    <th>적용여부</th>
                    <td colspan="3">
                        <label><input type="radio" name="useFlag" value="Y" <c:if test="${ipVO.useFlag == 'Y'}">checked</c:if>> 적용</label>
                        &nbsp;&nbsp;&nbsp;
                        <label><input type="radio" name="useFlag" value="N" <c:if test="${ipVO.useFlag == 'N'}">checked</c:if>> 미적용</label>
                    </td>
                </tr>
            </tbody>
        </table>
                
    </div> <!--//table-wrapper-->
    
    <div class="btn-wrap center">
        <button type="submit" class="btn blue">수정</button>
        <button type="button" class="btn" onclick="self.close();">닫기</button>
    </div>
	
		<!-- 
			$.ajax 로 폼을 전송할 때에는 폼 마지막 데이터가 라디오버튼이나 체크박스이면 ie10/11에서 파싱 문제가 발생함
			마지막은 다른 데이터로 변경하면 됨.
		-->
   		<input type="hidden" name="parsingPrevent" value="">
   		
	</form>
    
</div> <!--//win-popup-->

<script>
$(function(){
	
	//시작일
    $("input[name='startDate']").datepicker({
    	showOn: "both",
        buttonImage: "/images/comm/jquery/calendar.gif",
        buttonImageOnly: true,
    	onSelect: function(selectedDate) {     
    		$("input[name='endDate']").datepicker("option","minDate", selectedDate)
		}
    });
	
  	//종료일
	$("input[name='endDate']").datepicker({
		showOn: "both",
        buttonImage: "/images/comm/jquery/calendar.gif",
        buttonImageOnly: true,
		onSelect: function(selectedDate) {     
			$("input[name='startDate']").datepicker("option","maxDate", selectedDate)
		}
	});
  	
  	//범위구분 실행
	changeRangeGubun();
  	
  	//기간구분 실행
	changePeriodFlag();
})
</script>
</body>
</html>