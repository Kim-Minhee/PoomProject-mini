<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <script src="https://code.jquery.com/jquery-3.5.1.js" integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc=" crossorigin="anonymous"></script>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>소통게시판 등록</title>
<jsp:include page="../include/inHead.jsp"></jsp:include>
<script src="https://cdn.ckeditor.com/ckeditor5/23.0.0/classic/ckeditor.js"></script>
</head>
<jsp:include page="../include/header.jsp"></jsp:include>
<h1>게시물등록 연습</h1>

<form action='add' role="form" method="post" enctype="multipart/form-data" autocomplete="off" id="communityAdd">
회원번호<input type="text" name="mno" value="${loginMember.mno}" readonly><br>
  회원아이디 (글쓴이)<input type="text" name="id_writer" value="${loginMember.id}" readonly><br>
  회원이메일<input type="text" name="email" value="${loginMember.email}" readonly><br>
  회원이름<input type="text" name="name" value="${loginMember.name}" readonly><br>
  
 제목<input type="text" name="title"><br>
  <label>1차 분류</label>
 <select form="communityAdd" class="category1" name="cateCodeRef" disabled>
  <option value="">전체</option>
 </select>
 <br>
 <label>2차 분류</label>
 <select form="communityAdd" class="category2" name="cateCode">
  <option value="">전체</option>
 </select>
 
 <br>
<!--   글쓴이<input type="text" name="id_writer"><br> -->
  <textarea id="cont_b" name="cont_b" rows="20" cols="100">
 
  </textarea><br>
   파일 업로드 : <input type="file" name="file" multiple="multiple"><br>
  
  <input type="submit" value="확인">
  <input type='reset' value="취소"><br>
</form>

<script>
    ClassicEditor
        .create( document.querySelector( '#cont_b' ) )
        .catch( error => {
            console.error( error );
        } );
</script>
 
<script>
// 컨트롤러에서 데이터 받기
var jsonData = JSON.parse('${category}');
console.log(jsonData);

var cate1Arr = new Array();
var cate1Obj = new Object();

// 1차 분류 셀렉트 박스에 삽입할 데이터 준비
for(var i = 0; i < jsonData.length; i++) {
 
 if(jsonData[i].lv == "1") {
  cate1Obj = new Object();  //초기화
  cate1Obj.cateCode = jsonData[i].cateCode;
  cate1Obj.cateName = jsonData[i].cateName;
  cate1Arr.push(cate1Obj);
 }
}

// 1차 분류 셀렉트 박스에 데이터 삽입
var cate1Select = $("select.category1")

for(var i = 0; i < cate1Arr.length; i++) {
	if ( i==1 ) {
		cate1Select.append("<option selected value='" + cate1Arr[i].cateCode + "'>"
			      + cate1Arr[i].cateName + "</option>");
	} else {
		cate1Select.append("<option value='" + cate1Arr[i].cateCode + "'>"
			      + cate1Arr[i].cateName + "</option>");
	}
  
}



$(document).ready( function(){

 var cate2Arr = new Array();
 var cate2Obj = new Object();
 
 // 2차 분류 셀렉트 박스에 삽입할 데이터 준비
 for(var i = 0; i < jsonData.length; i++) {
  
  if(jsonData[i].lv == "2") {
   cate2Obj = new Object();  //초기화
   cate2Obj.cateCode = jsonData[i].cateCode;
   cate2Obj.cateName = jsonData[i].cateName;
   cate2Obj.cateCodeRef = jsonData[i].cateCodeRef;
   
   cate2Arr.push(cate2Obj);
  }
 }
 
 var cate2Select = $("select.category2");
 
 /*
 for(var i = 0; i < cate2Arr.length; i++) {
   cate2Select.append("<option value='" + cate2Arr[i].cateCode + "'>"
        + cate2Arr[i].cateName + "</option>");
 }
 */
 
 //cate2Select.children().remove();

 $("option:selected", this).each(function(){
  
  var selectVal = $(this).val();  
  //cate2Select.append("<option value=''>전체</option>");
  
  for(var i = 0; i < cate2Arr.length; i++) {
   if(selectVal == cate2Arr[i].cateCodeRef) {
    cate2Select.append("<option value='" + cate2Arr[i].cateCode + "'>"
         + cate2Arr[i].cateName + "</option>");
   }
  }
  
 });
 
});
</script>
<script src="/resources/se2/js/service/ckeditor.js"></script>
<jsp:include page="../include/footer.jsp"></jsp:include>