 <%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
 
                       
                        <div class="building_menu">                            
                            <ul>
                                <li id="mn1_B00" class="mn_01" ><a href="./main.ez"><span>청사 전체보기</span></a></li>
                               
                                 <c:forEach items="${OB}" var="item" varStatus="status">  
                                         <c:set var="mn1_cls" value="" /> 
                                         <c:if test="${fn:toLowerCase(item.buildingCode) eq fn:toLowerCase(officeParam.bCode) }">                        
                                         <c:set var="mn1_cls" value="active" /> 
                                         </c:if>
                                         
                                         <li id="mn1_${item.buildingCode}"  class="mn1 ${mn1_cls}" alt="${item.elevatorCnt}" >
                                            <a href="javascript:fn_gomap('${item.buildingCode}',1);" ><span>${item.buildingName}</span></a>
                                            <div class="depth">
                                                <ul>
                                                <c:forEach var="i" begin="1" end="${item.floorUpCnt}">
                                                      <c:set var="mn2_cls" value="" /> 
                                                      <fmt:parseNumber value="${i}" var="NUM_1"/>
                                                      <fmt:parseNumber value="${officeParam.fCode}"   var="NUM_2"/> 
                                                      <!-- //${NUM_1 }//${NUM_2 }//${NUM_1 eq NUM_2 }// -->
                                                      <c:if test="${fn:toLowerCase(item.buildingCode) eq fn:toLowerCase(officeParam.bCode) }">
                                                          <c:if test="${NUM_1 eq NUM_2 }">                        
                                                              <c:set var="mn2_cls" value="active" /> 
                                                          </c:if>
                                                      </c:if>
                                                    <li id="mn2_${item.buildingCode}_${i}" class="mn2 ${mn2_cls}" ><a href="javascript:fn_gomap('${item.buildingCode}','${i}');">${i}층</a></li> 
                                                </c:forEach> 
                                                </ul>
                                            </div>                                 
                                         </li>                                                        
                         </c:forEach> 
                            </ul>
                        </div>