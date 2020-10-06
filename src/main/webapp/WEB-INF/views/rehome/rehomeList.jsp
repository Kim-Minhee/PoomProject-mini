<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Rehome List</title>
</head>
<jsp:include page="../include/header.jsp"></jsp:include>

    <div id="content-wrapper" class="d-flex flex-column">

      <!-- Main Content -->
      <div id="content">

        <!-- Begin Page Content -->
        <div class="container-fluid">

          <!-- Page Heading -->
          <h1 class="h3 mb-2 text-gray-800">FAQ</h1>
          <p class="mb-4">게시물 리스트
          &nbsp;&nbsp;&nbsp;<a href="add">등록</a>
          
          </p>

          <!-- DataTales Example -->
          <div class="card shadow mb-4">

            <div class="card-body">
              <div class="table-responsive">
                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0" border="1">
                  <thead>
                    <tr>
                      <th>number</th>
                      <th>title</th>
                      <th>id_writer</th>
                      <th>작성일</th>
                      <th>수정일</th>
                    </tr>
                  </thead>
                  <tbody>
                  <tr>       
                  <c:forEach items="${rehomeList}" var="rehomeList">
                              
                      <td><a href='get?title=<c:out value="${rehomeList.mno }" />' ><c:out value="${rehomeList.mno }" /></td>
                      <td><a href='get?title=<c:out value="${rehomeList.title }" />' ><c:out value="${rehomeList.title }" /></a></td>
                      <td><c:out value="${rehomeList.id_writer }" /></td>
                      <td><fmt:formatDate pattern="yyyy-MM-dd" value="${rehomeList.cre_date_b }" /></td>
                      <td><fmt:formatDate pattern="yyyy-MM-dd" value="${rehomeList.mod_date_b }" /></td>
                    </tr>
                    </c:forEach>
                  </tbody>
                </table>
              </div>
            </div>
          </div>

        </div>
        <!-- /.container-fluid -->

      </div>
      <!-- End of Main Content -->

<jsp:include page="../include/footer.jsp"></jsp:include>