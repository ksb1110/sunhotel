 <%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
 
                            
                <!--검색결과 - 위치안내 레이어팝업-->
                <div class="popup_area search_info_popup">
                    <div class="detail_popup">
                        <div class="detail">
                            <div class="info">
                                검색하신 <strong id="search_pop_name" >___</strong> 담당은 <br>
                                <strong  id="search_pop_path" >_관 _층 ____과</strong>에서 근무 중입니다. 
                            </div>
                            <span class="close"><button type="button">닫기</button></span>
                        </div>
                    </div>
                </div>
                <!--//검색결과 - 위치안내 레이어팝업-->
                
                
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
                             <!-- 
                             <div class="popup_contents">
                                 <ul class="popup_button">
                                     <li><button type="button" class="location_search"  id="pathFinderAct02" >길찾기</button></li>
                                     <li>
                                         <div class="qrcode_wrap">
                                             <div class="qrcode_box">
                                                 <div class="qrcode"><img src="/images/kiosk/icon/qrcode_icon.png" alt="" id="qrcode_id02" style="width:75px;height:75px;" ></div>
                                                 <p class="text">QR코드를 스캔하세요.</p>
                                             </div>
                                             <em>스마트폰<br>길안내 서비스</em>
                                         </div>
                                     </li>
                                 </ul>
                             </div>
                             -->
                             <span class="close"><button type="button">닫기</button></span>
                         </div>
                     </div>
                 </div>
                 <!--//위치안내 레이어팝업-->
                        
                       
                  
                                
                                
                                <!--위치안내(외부 부서일 때) 레이어팝업-->
                                <div class="popup_area location_popup2">
                                    <div class="detail_popup">
                                        <div class="detail">
                                            <div class="popup_header">
                                                <strong   id="pop_name03" >__보건소</strong> 의 위치입니다.<br>
                                                <dl class="dl_text" id="pop_position03" >
                                                    <dt>제주보건소：</dt>
                                                    <dd>제주특별자치도 제주시 연삼로 264<br>
                                                    (우) 63219 (지번) 도남동 567-1</dd>
                                                    <!-- 동부보건소, 서부보건소 주소
                                                    <dt>동부보건소：</dt>
                                                    <dd>제주특별자치도 제주시 구좌읍 김녕로14길 6<br>
                                                    (우) 63357 (지번) 구좌읍 김녕리 1696</dd>
                                                    <dt>서부보건소：</dt>
                                                    <dd>제주특별자치도 제주시 한람읍 강구로5<br>
                                                    (우) 63028 (지번) 한림읍 한림리 966-1</dd>-->
                                                </dl>
                                            </div>
                                            <div class="popup_contents">
                                                <div class="popup_photo" id="popup_photo03" >
                                                    <img src="../../../images/kiosk/sub/search/healthCenter_jeju_img.jpg" alt="제주보건소" >
                                                    <!--동부보건소, 서부보건소 이미지
                                                    <img src="../../../images/kiosk/sub/search/healthCenter_ejeju_img.jpg" alt="동부보건소">
                                                    <img src="../../../images/kiosk/sub/search/healthCenter_wjeju_img.jpg" alt="서부보건소">-->
                                                </div>
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
                                            <strong class="pop_departName" >_____실</strong><br><span class="pop_position">_관 _ 층</span></div> 
                                    </div>
                                    <div class="popup_contents">
                                        <div class="text pop_chief_dtl" >
                                            <p>___ [___]</p>
                                            <p>064-___-____</p>
                                            <p>____ 업무총괄</p>
                                        </div>
                                        
                                        <!-- 
                                        <ul class="popup_button">
                                            <li><button type="button" class="location_search  pathFinderAct" >길찾기</button></li>
                                            <li>
                                                <div class="qrcode_wrap">
                                                    <div class="qrcode_box">
                                                        <div class="qrcode"><img src="/images/kiosk/icon/qrcode_icon.png"   class="qrcode_id" ></div>
                                                    </div>
                                                    <em>스마트폰<br>길안내 서비스</em>
                                                </div>
                                            </li>
                                        </ul>
                                        -->   
                                    </div>
                                    <span class="close"><button type="button">닫기</button></span>
                                </div>
                            </div>
                        </div>
                        <!--//부서정보안내 레이어팝업(시장실, 부시장실, 국장실 일 때 사용)-->
                        
                        <!--부서정보안내 레이어팝업-->
                        <div class="popup_area org_popup  org_ilban">
                            <div class="detail_popup">
                                <div class="detail">
                                    <div class="popup_header">
                                        <div class="info">
                                            <h3 class="title pop_gukName" >____국</h3>
                                            <strong  class="pop_departName" >_과</strong>
                                            <br><span  class="pop_position">_관 _ 층</span></div> 
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
                                                        <col style="width: 363px">
                                                        <col style="width: 17px"> <!--스크롤두께고정-->
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
                                                        <col style="width: 353px">
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
                        
                        
                        


                <!--검색결과 레이어팝업-->
                <div class="popup_area search_detail_popup">
                    <div class="detail_popup">
                        <div class="detail">
                            <div class="popup_contents">
                                
                                <!-- 
                                <div class="search_area">
                                    <div class="container">
                                        <input type="text" placeholder="터치 하고 직원ㆍ업무ㆍ부서 검색" value="노인"><button type="button" class="search_btn">검색</button>
                                    </div>
                                </div>
                                 -->
                                 
                                <div class="search_detail">
                                    <div class="detail_header">
                                        <div class="text">
                                            <p><em id="dept_searchword" >___</em>의 검색 결과 입니다. [총 <strong id="dept_cnt" >__</strong>건]</p>
                                        </div>  
                                    </div>

                                    <!--검색결과 테이블(세로 스크롤)-->
                                    <div class="table_wrap">
                                        <div id="divHeadScroll">
                                            <table id="tblHead" class="table_col">
                                                <caption class="hidden">
                                                    <strong>직원ㆍ업무ㆍ부서 검색 결과</strong>
                                                    <p>부서, 성명, 전화번호, 담당업무, 위치안내로 구분되어 해당 정보를 나타냅니다.</p>
                                                </caption>
                                                <colgroup>
                                                    <col style="width: 270px">
                                                    <col style="width: 170px">
                                                    <col style="width: 260px">
                                                    <col style="width: 540px">
                                                    <col style="width: 263px">
                                                    <col style="width: 17px"> <!--스크롤두께고정-->
                                                </colgroup>
                                                <thead>
                                                    <tr>
                                                        <th scope="col">부서</th>
                                                        <th scope="col">성명</th>
                                                        <th scope="col">전화번호</th>
                                                        <th scope="col">담당업무</th>
                                                        <th scope="col">위치안내</th>
                                                        <th scope="col" class="bg_color1 pad0"></th>
                                                    </tr>
                                                </thead>
                                            </table>
                                        </div>
                                        <div id="divBodyScroll">
                                            <table id="tblBody" class="table_col">
                                                <colgroup>
                                                    <col style="width: 200px">
                                                    <col style="width: 133px">
                                                    <col style="width: 194px">
                                                    <col style="width: auto">
                                                    <col style="width: 192px">
                                                </colgroup>
                                                <tbody  id="pop_deptEmployeeList"  >
                                                    <tr>
                                                        <td class="align_center"><span class="font_color05">노인</span>장애인과<br>(<span class="font_color05">노인</span>장애인과장)</td>
                                                        <td class="align_center">강성우</td>
                                                        <td class="align_center">064-728-2490</td>
                                                        <td><span class="font_color05">노인</span>장애인과 업무 전반에 관한 사항</td>
                                                        <td class="align_center">
                                                            <!--버튼 클릭시 위치안내 레이어팝업 열림-->
                                                            <button type="button" class="location_btn" onclick="layer_popup('.search_info_popup');$('.search_detail_popup').hide();$('.opacityBg').hide();return false;"><span class="icon"><img src="../../../images/kiosk/icon/location_icon1.png" alt=""></span><span class="text">위치안내</span></button>
                                                        </td>
                                                    </tr>
                                                </tbody>
                                            </table>
                                            <div  id="pop_deptEmployeeListInput" style="display:none;"  >
                                            </div>
                                        </div>
                                        <!--//검색결과 테이블(세로 스크롤)-->
                                    </div>
                                </div>
                            </div>
                            <span class="close"><button type="button">닫기</button></span>
                        </div>
                    </div>
                </div>
                <!--//검색결과 레이어팝업-->                        
                        
                        
                         