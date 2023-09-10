<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fn"     uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt"    uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@ include file="/WEB-INF/jsp/user/include/top.jsp" %>

<title>서식조회 - 제주 썬호텔</title>

<script>

</script>

</head>

<body>
<div id="wrap">
	
	<!-- 해당 페이지의 상위 메뉴 설정 (상위메뉴가 체크된 상태로 표시되도록) -->
	<jsp:include page="/user/header.ez" flush="false">
		<jsp:param name="admin_menu" value="main"/>
		<jsp:param name="admin_menu2" value="campaign"/>
	</jsp:include>
	
    <main id="main">
		<section class="contents-wrap">
            <h2 class="title1">서식1</h2>                    
           	
           	<form name="delete_campaign_form" id="delete_campaign_form" style="display:none;">
           	<input type="hidden" name="seq" value="">
           	</form>
           	
           	<form name="sort_campaign_form" id="sort_campaign_form" style="display:none;">
           	<input type="hidden" name="seq" value="">
           	<input type="hidden" name="sort" value="">
           	</form> 
           
		    <div class="item-col3-wrapper">
		    	
		    	<div class="col">

		    		<table class="table center">
						<colgroup>
							<col style="width:150px;">
							<col style="width:200px;">
							<col>
							<col style="width:200px;">
							<col style="width:250px;">
						</colgroup>
						<thead>
							<tr>
								<th>순서</th>
								<th>이미지</th>
								<th>제목</th>
								<th>표시여부</th>
								<th>관리툴</th>
							</tr>
						</thead>
						<tbody>
							
							<tr>
								<td>
									<select name="sort">
										<option>1</option>               	
			                        </select>
								</td>
								<td>
									
								</td>
								<td>
								
								</td>
								<td>
							
								</td>
								<td>
									<button type="button" class="btn blue sm">수정</button>
									<button type="button" class="btn red sm">삭제</button>
								</td>
							</tr>
							<tr>
								<td>
									<select name="sort">
										<option>1</option>               	
			                        </select>
								</td>
								<td>
									
								</td>
								<td>
								
								</td>
								<td>
							
								</td>
								<td>
									<button type="button" class="btn blue sm">수정</button>
									<button type="button" class="btn red sm">삭제</button>
								</td>
							</tr>
							<tr>
								<td>
									<select name="sort">
										<option>1</option>               	
			                        </select>
								</td>
								<td>
									
								</td>
								<td>
								
								</td>
								<td>
							
								</td>
								<td>
									<button type="button" class="btn blue sm">수정</button>
									<button type="button" class="btn red sm">삭제</button>
								</td>
							</tr>
							<tr>
								<td>
									<select name="sort">
										<option>1</option>               	
			                        </select>
								</td>
								<td>
									
								</td>
								<td>
								
								</td>
								<td>
							
								</td>
								<td>
									<button type="button" class="btn blue sm">수정</button>
									<button type="button" class="btn red sm">삭제</button>
								</td>
							</tr>
							<tr>
								<td>
									<select name="sort">
										<option>1</option>               	
			                        </select>
								</td>
								<td>
									
								</td>
								<td>
								
								</td>
								<td>
							
								</td>
								<td>
									<button type="button" class="btn blue sm">수정</button>
									<button type="button" class="btn red sm">삭제</button>
								</td>
							</tr>
							<tr>
								<td>
									<select name="sort">
										<option>1</option>               	
			                        </select>
								</td>
								<td>
									
								</td>
								<td>
								
								</td>
								<td>
							
								</td>
								<td>
									<button type="button" class="btn blue sm">수정</button>
									<button type="button" class="btn red sm">삭제</button>
								</td>
							</tr>
							<tr>
								<td>
									<select name="sort">
										<option>1</option>               	
			                        </select>
								</td>
								<td>
									
								</td>
								<td>
								
								</td>
								<td>
							
								</td>
								<td>
									<button type="button" class="btn blue sm">수정</button>
									<button type="button" class="btn red sm">삭제</button>
								</td>
							</tr>
							<tr>
								<td>
									<select name="sort">
										<option>1</option>               	
			                        </select>
								</td>
								<td>
									
								</td>
								<td>
								
								</td>
								<td>
							
								</td>
								<td>
									<button type="button" class="btn blue sm">수정</button>
									<button type="button" class="btn red sm">삭제</button>
								</td>
							</tr>
							<tr>
								<td>
									<select name="sort">
										<option>1</option>               	
			                        </select>
								</td>
								<td>
									
								</td>
								<td>
								
								</td>
								<td>
							
								</td>
								<td>
									<button type="button" class="btn blue sm">수정</button>
									<button type="button" class="btn red sm">삭제</button>
								</td>
							</tr>
							<tr>
								<td>
									<select name="sort">
										<option>1</option>               	
			                        </select>
								</td>
								<td>
									
								</td>
								<td>
								
								</td>
								<td>
							
								</td>
								<td>
									<button type="button" class="btn blue sm">수정</button>
									<button type="button" class="btn red sm">삭제</button>
								</td>
							</tr>
							<tr>
								<td>
									<select name="sort">
										<option>1</option>               	
			                        </select>
								</td>
								<td>
									
								</td>
								<td>
								
								</td>
								<td>
							
								</td>
								<td>
									<button type="button" class="btn blue sm">수정</button>
									<button type="button" class="btn red sm">삭제</button>
								</td>
							</tr>
							<tr>
								<td>
									<select name="sort">
										<option>1</option>               	
			                        </select>
								</td>
								<td>
									
								</td>
								<td>
								
								</td>
								<td>
							
								</td>
								<td>
									<button type="button" class="btn blue sm">수정</button>
									<button type="button" class="btn red sm">삭제</button>
								</td>
							</tr>
							<tr>
								<td>
									<select name="sort">
										<option>1</option>               	
			                        </select>
								</td>
								<td>
									
								</td>
								<td>
								
								</td>
								<td>
							
								</td>
								<td>
									<button type="button" class="btn blue sm">수정</button>
									<button type="button" class="btn red sm">삭제</button>
								</td>
							</tr>
							<tr>
								<td>
									<select name="sort">
										<option>1</option>               	
			                        </select>
								</td>
								<td>
									
								</td>
								<td>
								
								</td>
								<td>
							
								</td>
								<td>
									<button type="button" class="btn blue sm">수정</button>
									<button type="button" class="btn red sm">삭제</button>
								</td>
							</tr>
							<tr>
								<td>
									<select name="sort">
										<option>1</option>               	
			                        </select>
								</td>
								<td>
									
								</td>
								<td>
								
								</td>
								<td>
							
								</td>
								<td>
									<button type="button" class="btn blue sm">수정</button>
									<button type="button" class="btn red sm">삭제</button>
								</td>
							</tr>
							<tr>
								<td>
									<select name="sort">
										<option>1</option>               	
			                        </select>
								</td>
								<td>
									
								</td>
								<td>
								
								</td>
								<td>
							
								</td>
								<td>
									<button type="button" class="btn blue sm">수정</button>
									<button type="button" class="btn red sm">삭제</button>
								</td>
							</tr>
							<tr>
								<td>
									<select name="sort">
										<option>1</option>               	
			                        </select>
								</td>
								<td>
									
								</td>
								<td>
								
								</td>
								<td>
							
								</td>
								<td>
									<button type="button" class="btn blue sm">수정</button>
									<button type="button" class="btn red sm">삭제</button>
								</td>
							</tr>
							<tr>
								<td>
									<select name="sort">
										<option>1</option>               	
			                        </select>
								</td>
								<td>
									
								</td>
								<td>
								
								</td>
								<td>
							
								</td>
								<td>
									<button type="button" class="btn blue sm">수정</button>
									<button type="button" class="btn red sm">삭제</button>
								</td>
							</tr>
							<tr>
								<td>
									<select name="sort">
										<option>1</option>               	
			                        </select>
								</td>
								<td>
									
								</td>
								<td>
								
								</td>
								<td>
							
								</td>
								<td>
									<button type="button" class="btn blue sm">수정</button>
									<button type="button" class="btn red sm">삭제</button>
								</td>
							</tr>
							<tr>
								<td>
									<select name="sort">
										<option>1</option>               	
			                        </select>
								</td>
								<td>
									
								</td>
								<td>
								
								</td>
								<td>
							
								</td>
								<td>
									<button type="button" class="btn blue sm">수정</button>
									<button type="button" class="btn red sm">삭제</button>
								</td>
							</tr>
							<tr>
								<td>
									<select name="sort">
										<option>1</option>               	
			                        </select>
								</td>
								<td>
									
								</td>
								<td>
								
								</td>
								<td>
							
								</td>
								<td>
									<button type="button" class="btn blue sm">수정</button>
									<button type="button" class="btn red sm">삭제</button>
								</td>
							</tr>
							
						</tbody>
					</table>
					
					<div class="btn-wrap">
						<button type="button" class="btn blue">캠페인이미지등록</button>
					</div>
		    	</div>
		    	
		    </div> <!-- //item-col3-wrapper -->
            
                               
		</section> <!--//contents-wrap-->
	</main>

	<footer id="footer">
		
	</footer>
</div> <!--//wrap-->

</body>
</html>