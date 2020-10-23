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
<table border="1">
<tr>
<th>글번호</th>
<th>제목</th>
<th>작성자</th>
<th>작성일</th>
<th>조회수</th>
<th>추천수</th>
</tr>
<c:forEach items="${communityList}" var="communityList">

<tr>
<td><c:out value="${communityList.bno}" /></td>
<td><a href='read?bno=<c:out value="${communityList.bno }" />'><c:out value="${communityList.title }" /></a></td>
<td><c:out value="${communityList.id_writer }" /></td>
<td><small class="text-muted"><fmt:formatDate pattern="yyyy-MM-dd" value="${communityList.mod_date_b }" /></small></td>
<td><c:out value="${communityList.viewCnt }" /></td>
<td><c:out value="${communityList.likeCnt }" /></td><br>
</tr>
</c:forEach>
</table>
<a href="add">글쓰기</a>
<jsp:include page="../include/footer.jsp"></jsp:include>