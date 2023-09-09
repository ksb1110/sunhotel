 <%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
 
                        
                        <!--위치안내 레이어팝업-->
                        <div class="popup_area location_popup">
                            <div class="detail_popup">
                                <div class="detail">
                                    <div class="popup_header">
                                        <div class="info">
                                            <strong  id="pop_departName02" >___</strong><br>
                                            <span  id="pop_position02">_관 _ 층</span>
                                        </div>
                                    </div>
                                    <div class="popup_contents">
                                        <ul class="popup_button">
                                            <li><button type="button" class="location_search"  id="pathFinderAct02" >길찾기</button></li>
                                            <li>
                                                <div class="qrcode_wrap">
                                                    <div class="qrcode_box">
                                                        <div class="qrcode"><img src="/images/kiosk/icon/qrcode_icon.png" alt="" id="qrcode_id02" ></div>
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
                        
                        
                        <!--부서정보안내 레이어팝업(시장실, 부시장실, 국장실 일 때 사용)-->
                        <div class="popup_area org_popup org_chief">
                            <div class="detail_popup">
                                <div class="detail">
                                    <div class="popup_header">
                                        <div class="info">
                                            <h3 class="title  pop_gukName" >____국</h3>
                                            <strong class="pop_departName" >_____실</strong><br><span class="pop_position">_관 _ 층</span>
                                     	</div> 
                                    </div>
                                    <div class="popup_contents">
                                        <div class="text pop_chief_dtl" >
                                            <p>___ [___]</p>
                                            <p>064-___-____</p>
                                            <p>____ 업무총괄</p>
                                        </div>
                                        <ul class="popup_button">
                                            <li><button type="button" class="location_search  pathFinderAct" >길찾기</button></li>
                                            <li>
                                                <div class="qrcode_wrap">
                                                    <div class="qrcode_box">
                                                        <div class="qrcode"><img src="/images/kiosk/icon/qrcode_icon.png" class="qrcode_id" ></div>
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
                        <!--//부서정보안내 레이어팝업(시장실, 부시장실, 국장실 일 때 사용)-->
                        
                        
                        <!--부서정보안내 레이어팝업-->
                        <div class="popup_area org_popup org_ilban">
                            <div class="detail_popup">
                                <div class="detail">
                                    <div class="popup_header office">
                                        <div class="info">
                                            <h3 class="title pop_gukName"><!-- ____국 --></h3>
                                            <div class="info_align">
												<strong class="pop_departName"><!-- 여성가족과 --></strong><br>
												<span class="pop_position"><!-- 본관 1 층 --></span>
											</div>
											
											<!-- 
                                            <strong  class="pop_departName">_과</strong>
                                            <br><span class="pop_position">_관 _ 층</span>
                                            -->                                            
                                      	</div> 
                                        <ul class="popup_button">
                                        	
                                        	<!-- 조직도 보기 추가 -->
                                            <li><button type="button" class="org_view" onClick="showChart();">조직도 보기</button></li>
											<!-- //조직도 보기 추가 -->
											
                                            <li><button type="button" class="location_search pathFinderAct">길찾기</button></li>
                                            <li>
                                                <div class="qrcode_wrap">
                                                    <div class="qrcode_box">
                                                        <div class="qrcode" ><img src="/images/kiosk/icon/qrcode_icon.png"  class="qrcode_id" ></div>
                                                    </div>
                                                    <em>스마트폰<br>길안내 서비스</em>
                                                </div>
                                            </li>
                                        </ul>
                                    </div>
                                    
                                    <div class="popup_contents">
                                        <!--부서정보 테이블(세로 스크롤)-->
                                        <div class="table_wrap">
                                            <div id="divHeadScroll">
                                                <table id="tblHead" class="table_col">
                                                    <caption class="hidden">
                                                        <strong  class="pop_caption">____국 ____과 부서정보</strong>
                                                        <p>직위, 성명, 전화번호, 담당업무로 구분되어 해당 정보를 나타냅니다.</p>
                                                    </caption>
                                                    <colgroup>
                                                        <col style="width: 190px">
                                                        <col style="width: 90px">
                                                        <col style="width: 120px">
                                                        <col style="width: 330px">
                                                        <col style="width: 50px"> <!--스크롤두께고정-->
                                                    </colgroup>
                                                    <thead>
                                                        <tr>
                                                            <th scope="col">직위</th>
                                                            <th scope="col">성명</th>
                                                            <th scope="col">전화번호</th>
                                                            <th scope="col">담당업무</th>
                                                            <th scope="col" class="bg_color1 pad0"></th>
                                                        </tr>
                                                    </thead>
                                                </table>
                                            </div>
                                            <div id="divBodyScroll">
                                                <table id="tblBody" class="table_col">
                                                    <colgroup>
                                                        <col style="width: 180px">
                                                        <col style="width: 90px">
                                                        <col style="width: 120px">
                                                        <col style="width: 350px">
                                                    </colgroup>
                                                    <tbody id="pop_employeeList" >
                                                        <tr>
                                                            <td class="align_center">____과장</td>
                                                            <td class="align_center">___</td>
                                                            <td class="align_center">000-000-0000</td>
                                                            <td>____ 관한 사항</td>
                                                        </tr>
                                                    </tbody>
                                                </table>
                                            </div>
                                        </div>
                                        <!--//부서정보 테이블(세로 스크롤)-->
                                    </div>
                                    <span class="close"><button type="button">닫기</button></span>
                                </div>
                            </div>
                        </div>
                        <!--//부서정보안내 레이어팝업-->
                        
                        <!--조직도 보기 추가 레이어팝업-->
						<div class="orgChart_popup">
							<div class="detail_popup">
								<div class="detail">
									<div class="popup_contents">
										
										<!-- 조직도 영역 div -->
										<!-- <div class="orgChart_info">
											조직도 영역 div
										</div> -->
										<!-- //조직도 영역 div -->
										
										<!-- 조직도 영역 iframe -->
										<iframe class="orgChart_info" src="about:blank"></iframe>
										<!-- //조직도 영역 iframe -->
										
									</div>
									<span class="orgClose"><button type="button">닫 기</button></span>
								</div>
							</div>
						</div>
						<!--//조직도 보기 추가 레이어팝업-->