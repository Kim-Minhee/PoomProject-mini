<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script src="https://code.jquery.com/jquery-3.5.1.js" integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc=" crossorigin="anonymous"></script>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Rehome List</title>
<jsp:include page="../include/inHead.jsp"></jsp:include>

<style>

img {
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
          <section class="jumbotron text-center" style='background: linear-gradient(to top, lavender, white);'>
         <div class="container">
            <h1>
               <font color='skyblue' size='20px'>POOM</font>
            </h1>
          
                  <p>
				       <button type="button" class="btn btn-sm btn-outline-secondary" onclick="location.href='add'">신규 등록</button>
                  </p>
         </div>
      </section>

          </p>

<div class="service-area section-padding30">
			<div class="container">

				<div class="row">					
					<c:forEach items="${rehomeList}" var="rehomeList">
						<c:if test="${rehomeList.stmt_sale ne 1}">
						<div class="col-md-4" >
                        <div class="single-cat text-center mb-30">
							<div align='center'>
								<img src="/resources/img/rehome/${rehomeList.img_r1 }" onerror="this.src='/resources/img/none.png'" width="350" height="350" onclick="location.href='read?bno=${rehomeList.bno}&mno=${rehomeList.mno}'"/>
								</div>
								<div class="card-body">
									<p>
										<strong><c:out value="${rehomeList.title}" /></strong><br />
										종 : <strong><c:out value="${rehomeList.cateName}" /></strong><br />
										나이 : <strong><c:out value="${rehomeList.age}" /></strong>개월<br /> 
										분양가 : <strong><c:out value="${rehomeList.cost}" /></strong> 원
									</p>
									<div class="d-flex justify-content-between align-items-center">
										<div class="cat-cap">
											<button type="button" class="btn btn-sm btn-outline-secondary" onclick="location.href='read?bno=${rehomeList.bno}&mno=${rehomeList.mno}'">보기</button>	
										</div>
										<small class="text-muted"><fmt:formatDate pattern="yyyy-MM-dd" value="${rehomeList.mod_date_b}" /></small>
									</div>
								</div>
							</div>
						
						</div>
                    		<tr>
						</c:if>
                    </c:forEach>
					
					
				</div>
			</div>
		</div>


</div>

<jsp:include page="../include/footer.jsp"></jsp:include>