<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fn"     uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt"    uri="http://java.sun.com/jsp/jstl/fmt" %>


<!--  
	관리자 > 부서관리 > 직원안내도 > 부서추가/수정 > 제목용 배치도 HTML
	
	onmouseout="outArrangeDiv();"
	onmouseover="selectArrangeDiv('oneArrangeDiv_${arrangeInfo.arrangeCode}');"
-->

<div id="oneArrangeDiv_${arrangeInfo.arrangeCode}" class="arrangeDiv" style="position:absolute;text-align:center;z-index:90;">
					
	<div class="buttonDiv" style="border-radius: 10px;position:absolute;margin-top:-85px;text-align:center;width:232px;display:none;padding:10px 20px;background:#877F7F;z-index:90;">
		<input type="text" name="arrangePointX" value="${arrangeInfo.pointX}" style="width:70px;text-align:center;padding:0;margin:0;height:29px;" maxlength="4">
		<input type="text" name="arrangePointY" value="${arrangeInfo.pointY}" style="width:70px;text-align:center;padding:0;margin:0;height:29px;" maxlength="4">
		<button type="button" class="btn sm" onclick="movePoint($(this).parent().parent(), $(this).prev().prev().val(), $(this).prev().val());">좌표이동</button>
		<br>
		<button type="button" class="btn blue sm" onclick="openUpdateArrangeFormLayerPop('${arrangeInfo.arrangeCode}');">수정</button>
		<button type="button" class="btn red sm" onclick="deleteArrange('${arrangeInfo.arrangeCode}');">삭제</button>
		<button type="button" class="btn green sm" id="oneArrangeDiv_${arrangeInfo.arrangeCode}_Header" style="cursor:move;">드래그</button>
		<button type="button" class="btn black sm" onclick="outArrangeDiv2();">닫기</button>
	</div>
	
	<div onmouseout="hideSetupBtnDiv();" onmouseover="showSetupBtnDiv('${arrangeInfo.arrangeCode}');" id="setupButtonDiv_${arrangeInfo.arrangeCode}" class="setupButtonDiv" style="display:none;position:absolute;margin-top:-30px;text-align:center;width:60px;padding:0;z-index:90;opacity:0.9;">
		<button type="button" class="btn sm" style="background:orange;width:120px;" onclick="selectArrangeDiv('oneArrangeDiv_${arrangeInfo.arrangeCode}');">설정</button>
	</div>
	
	<!-- <h1 onmouseover="selectArrangeDiv('oneArrangeDiv_${arrangeInfo.arrangeCode}');" class="org_main_title">${arrangeInfo.arrangeName}</h1> -->
	
	<h1 onmouseout="hideSetupBtnDiv();" onmouseover="showSetupBtnDiv('${arrangeInfo.arrangeCode}');" class="org_main_title">${arrangeInfo.arrangeName}</h1>
</div>

