
var FileObject = new Object();

FileObject.options = {
		max : 1,
		relatId : '',
		objName : 'ezFile',
		imgYn	: false
}

FileObject.initFile = function(targetObj, options){
	var opt = $.extend({}, FileObject.options, options)
	
	var parameters = "maxFile=" + opt.max;
	parameters += "&objName=" + opt.objName;
	parameters += "&fileImgYn="; 
	parameters += opt.imgYn?"Y":"N";
	parameters += "&relatId=" + opt.relatId;
	
	console.log(parameters);
	
	
	$.ajax({
		type:"post", 
		// dataType:"json",
		async:false,
		url:"/cm/fileForm.ezax",
		data:parameters ,
		success:function(data){
			targetObj.html(data);
		}
	});
}

/**
 * 파일 Row 추가
 */
FileObject.addRow = function(objName){
	var wrapObj = $("#" + objName + "_wrap");
	
	wrapObj.children().find("dd[name=fileInput]").append(fileHtml);
}

FileObject.delFileInput = function(obj){
	$(obj).parent().parent().remove();
}

FileObject.delFileList = function(obj, fileId, objName){
	var temp = $("#" + objName + "_wrap").children().find("input[name=delFileId").val();
	
	if (temp != null && temp != ""){
        temp = temp + ",";
    }
    
	$("#" + objName + "_wrap").children().find("input[name=delFileId").val(temp + fileId);
	
	$(obj).parent().parent().remove();
	
	$("input[name=" + objName + "]").removeAttr("disabled");
}

FileObject.layerImg = function(imgPath){
	
	if($('#layerImg').length == 0){
		FileObject.layerImgInit();
	}
	
	$('#layerImg').attr('src', imgPath);
    layer_popup('#targetID');

//    $("#layerImg").load(function(){
//        $(".content-wrap").css("width",this.naturalWidth + 40);
//    });
}

FileObject.layerImgInit = function(){
	
	var imgPopup = '<div id="targetID" class="layer-popup">' +
						'<div class="content-wrap">' +
							'<div class="content">' +
								'<div class="head">' +
									'<h3 class="title">이미지보기</h3>' +
									'<button type="button" class="close"><img src="/images/admin/btn/close.png" alt="닫기"></button>' +
								'</div>' +
							'<div class="main">' +
								'<img id="layerImg" src="" style="max-width: 100%; height: auto;">' +
							'</div>' +
						'</div>' +
					'</div>';
	
	$("#wrap").append(imgPopup);
}