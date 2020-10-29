<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>소통</title>
<jsp:include page="../include/inHead.jsp"></jsp:include>

<style>
img {
  border-radius: 50%;
  cursor: pointer;
}
</style>

</head>
<jsp:include page="../include/header.jsp"></jsp:include>

    <div id="content-wrapper" class="d-flex flex-column">

      <!-- Main Content -->
      <div id="content">

        <!-- Begin Page Content -->
        <div class="container-fluid">

          <!-- Page Heading -->

          <p class="mb-4">
          <section class="jumbotron text-center" style='background-color: #151515;'>
         <div class="container">
            <h1>
               <font color='white'>POOM</font>
            </h1>
          
                  <p>
				       <button type="button" class="btn btn-sm btn-outline-secondary" onclick="location.href='add'">신규 등록</button>
                  </p>
         </div>
      </section>

          </p>

<div class="album py-5 bg-light">
			<div class="container">

				<div class="row">					
					<c:forEach items="${communityList}" var="communityList">
						<div class="col-md-4">
							<div class="card mb-4 shadow-sm" style="border-radius: 10%;" >
							<div align='center'>
								<c:choose>
								<c:when test="${not empty communityList.img_c1}">
									<img src="/resources/img/community/${communityList.img_c1}" onerror="this.src='/resources/img/none.png'" width="250" height="250" style="margin-top: 10px;" onclick="location.href='read?bno=${communityList.bno}&mno=${communityList.mno}'"/>
								</c:when>
								<c:otherwise>
									<img src="/resources/img/none.png" onerror="this.src='/resources/img/none.png'" width="250" height="250" style="margin-top: 10px;" onclick="location.href='read?bno=${communityList.bno}&mno=${communityList.mno}'"/>
								</c:otherwise>
								</c:choose>
								</div>
								<div class="card-body">
									<p class="card-text">
										<strong><c:out value="${communityList.title}" /></strong><br />
										글쓴이 : <c:out value="${communityList.id_writer}" /><br />
									</p>
									<div class="d-flex justify-content-between align-items-center">
										<div class="btn-group">
											<button type="button" class="btn btn-sm btn-outline-secondary" onclick="location.href='read?bno=${communityList.bno}&mno=${communityList.mno}'">보기</button>
	
										</div>
										<small class="text-muted"><fmt:formatDate pattern="yyyy-MM-dd" value="${communityList.mod_date_b}" /></small>
									</div>
								</div>
							</div>
						
						</div>
                    		<tr>
                    </c:forEach>
					
					
				</div>
			</div>
		</div>




<!-- <table border="1"> -->
<!-- <tr> -->
<!-- <th>글번호</th> -->
<!-- <th>제목</th> -->
<!-- <th>작성자</th> -->
<!-- <th>작성일</th> -->
<!-- <th>조회수</th> -->
<!-- <th>추천수</th> -->
<!-- </tr> -->
<%-- <c:forEach items="${communityList}" var="communityList"> --%>

<!-- <tr> -->
<%-- <td><c:out value="${communityList.bno}" /></td> --%>
<%-- <td><a href='read?bno=<c:out value="${communityList.bno }" />&mno=${communityList.mno}'><c:out value="${communityList.title }" /></a></td> --%>
<%-- <td><c:out value="${communityList.id_writer }" /></td> --%>
<%-- <td><small class="text-muted"><fmt:formatDate pattern="yyyy-MM-dd" value="${communityList.mod_date_b }" /></small></td> --%>
<%-- <td><c:out value="${communityList.viewCnt }" /></td> --%>
<%-- <td><c:out value="${communityList.likeCnt }" /></td><br> --%>
<!-- </tr> -->
<%-- </c:forEach> --%>
<!-- </table> -->
<!-- <a href="add">글쓰기</a> -->
<jsp:include page="../include/footer.jsp"></jsp:include>