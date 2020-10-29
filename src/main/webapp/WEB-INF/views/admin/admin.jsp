<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<jsp:include page="../include/inHead.jsp"></jsp:include>
</head>
<jsp:include page="../include/header.jsp"></jsp:include>

  <!-- Page Heading -->
          <h1 class="h3 mb-2 text-gray-800">MEMBER</h1>
          <p class="mb-4">사용자 리스트
          &nbsp;&nbsp;&nbsp;<a href="register">등록</a>
          &nbsp;&nbsp;&nbsp; 로그인 사용자 정보 :  <c:out value="${loginMember.name }" />
          &nbsp;&nbsp;&nbsp;<a href="/poom/logout">로그아웃</a>
          </p>





<!-- DataTales Example -->
          <div class="card shadow mb-4">

            <div class="card-body">
              <div class="table-responsive">
                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                  <thead>
                    <tr>
                      <th>#번호</th>
                      <th>회원타입</th>
                      <th>아이디</th>
                      <th>이메일</th>
                      <th>주소</th>
                      <th>회원가입일</th>
                      <th>회원 상세보기</th>
<!--                       <th>업체 승인버튼</th> -->
                      
                    </tr>
                  </thead>
                  <tbody>
                  <c:forEach items="${members}" var="member">
                    <tr>
                      <td><c:out value="${member.mno }" /></td>
                      <td><a href='update?mno=<c:out value="${member.mno }" />' ><c:out value="${member.type_m }" /></a></td>
                      <td><c:out value="${member.id }" /></td>
                      <td><c:out value="${member.email }" /></td>
                      <td><c:out value="${member.firstAddr }" /></td>
                      <td><fmt:formatDate pattern="yyyy-MM-dd" value="${member.cre_date_m }" /></td>
                      <td><button type="button" id="emailBtn" onclick="location.href='/poom/eachpage?mno=<c:out value="${member.mno }" />&mtp=<c:out value="${member.type_m }" />' ">회원 상세보기</button>
                      	<button type="button" id="emailBtn" onclick="location.href='/poom/delete?mno=<c:out value="${member.mno }" />&mtp=<c:out value="${member.type_m }" />' ">회원 삭제</button>
                      </td>
                    </tr>
                    </c:forEach>
                  </tbody>
                </table>
              </div>
            </div>
          </div>
          
<!--           DataTales Example -->
          <div class="card shadow mb-4">

            <div class="card-body">
              <div class="table-responsive">
                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                  <thead>
                    <tr>
                      <th>#회원번호</th>
                      <th>게시글 번호</th>
                      <th>분양글 번호</th>
                      <th>제목</th>
                      <th>가격</th>
<!--                       <th>글작성 </th> -->
                    </tr>
                  </thead>
                  <tbody>
                  <c:forEach items="${rehomes}" var="rehome">
                    <tr>
                      <td><c:out value="${rehome.mno }" /></td>
                      <td><a href='update?mno=<c:out value="${rehome.mno }" />' ><c:out value="${rehome.bno }" /></a></td>
                      <td><c:out value="${rehome.rno }" /></td>
                      <td><c:out value="${rehome.title }" /></td>
                      <td><c:out value="${rehome.cost }" /></td>
<%--                       <td><fmt:formatDate pattern="yyyy-MM-dd" value="${rehome.cre_date_m }" /></td> --%>
                    </tr>
                    </c:forEach>
                  </tbody>
                </table>
              </div>
            </div>
          </div>
<jsp:include page="../include/footer.jsp"></jsp:include>