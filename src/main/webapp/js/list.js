$(function(){
	page(1);
})
function page(pn){
	$.ajax({
		url:"${APP_PATH}/LibraryMessages/listAll",
		type:"get",
		data:"pn="+pn,
		success:function(data){
			console.log(data);
		}
	})
	
}