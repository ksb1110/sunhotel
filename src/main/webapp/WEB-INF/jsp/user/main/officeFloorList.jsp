 <%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
 
              
                        
                      
                         <div style="display:none;" alt="층 시설정보 리스트" >
                             <c:forEach items="${OF}" var="item" varStatus="status">   
                                 <c:set var="seq" value="${item.facilityCode}"   />                                             
                                 <c:set var="elevatorCnt" value="${item.elevatorCnt}" />            
                                 <c:set var="floorUpCnt" value="${item.floorUpCnt}" />            
                                 <c:set var="floorImgPath" value="${item.floorImgPath}" />        
                                                                             
                                     <input type="text" id="${seq}_buildingName" value="${item.buildingName}"> 
                                     <input type="text" id="${seq}_facilityGubun" value="${item.facilityGubun}">  
                                     <input type="text" id="${seq}_facilityCode" value="${item.facilityCode}" class="item_facilityCode" >  
                                     <input type="text" id="${seq}_facilityName" value="${fn:replace(item.facilityName, '_', '')}"> 
                                     <input type="text" id="${seq}_facilityImgPath" value="${item.facilityImgPath}">
                                     <input type="text" id="${seq}_floorCode" value="${item.floorCode}">  
                                     <input type="text" id="${seq}_floorName" value="${item.floorName}"> 
                                     <input type="text" id="${seq}_floorImgPath" value="${item.floorImgPath}">                                     
                                     <input type="text" id="${seq}_inOutGubun" value="${item.inOutGubun}">  
                                     <input type="text" id="${seq}_pointX" value="${item.pointX}">  
                                     <input type="text" id="${seq}_pointY" value="${item.pointY}">  
                                     <input type="text" id="${seq}_useYn" value="${item.useYn}">  
                                     <input type="text" id="${seq}_infoType" value="${item.infoType}">  
                                     <input type="text" id="${seq}_floorUpCnt" value="${item.floorUpCnt}">  
                                     <input type="text" id="${seq}_floorDownCnt" value="${item.floorDownCnt}">  
                                     <input type="text" id="${seq}_entranceCnt" value="${item.entranceCnt}">  
                                     <input type="text" id="${seq}_elevatorCnt" value="${item.elevatorCnt}">  
                                     <input type="text" id="${seq}_departCode" value="${item.departCode}"> 
                                     <input type="text" id="${seq}_departName" value="${item.departName}">
                                     <input type="text" id="${seq}_gukCode" value="${item.gukCode}"> 
                                     <input type="text" id="${seq}_gukName" value="${item.gukName}">
                                     <input type="text" id="${seq}_mobileUrl" value="${item.mobileUrl}__ga=${kioskFcCode}__fcg=${item.facilityGubun}">
                                     <input type="text" id="${seq}_kioskFcCode" value="${kioskFcCode}"> 
                                     <input type="text" id="${seq}_codeName" value="${item.codeName}">
                                     
                                     <input type="text" id="${seq}_refFlag" value="${item.refFlag}"> 
                                     <input type="text" id="${seq}_refFacilityCode" value="${item.refFacilityCode}">  
                                      
                             </c:forEach>
                         </div>  