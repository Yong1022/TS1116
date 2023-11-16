<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<html>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
	<style>
	@import url('https://fonts.googleapis.com/css?family=Edu+TAS+Beginner:300,400,500,700,900&display=swap');

        * {
            font-family: 'Edu TAS Beginner', sans-serif;
        }
        
	#student_Name{
	margin-left : 100px;
	width: 200px;
	height: 150px;
	}
	
	#student_List{
	width: 100px;
	height: 300px;
	}
	</style>
	<title>학생 정보 관리</title>
</head>
<body>
<h2>학생 정보 관리</h2>
<hr>

<div id="student_Name">
<div class="form-group">
<form class="form-inline" action="${root }/home" method="post">
    <label for="name">이름 Name</label>
    <input type="text" class="form-control" id="namekey" name="namekey">
  </div>
  <button type="submit" class="btn btn-success">Fin</button>
</div>
</form>

<div class="student_List">
	<table class="table table-hover">
    <thead>
      <tr>
        <th>번호</th>
        <th>이름</th>
      </tr>
    </thead>
    <tbody>
      <c:forEach items="${li}" var="li">
      	<tr><td>${li.studentNum}</td>
      	<td>
      	<a class="name" href="${root}/read?name=${li.name}"> <c:out value="${li.name}"/>
      	</a></td>
      	</tr>
      </c:forEach>	
    </tbody>
    </table>
</div>
<c:if test="${li == '[]'}">

<form class="form-inline" action="${root}/insert" method="post">
<table class="table table-hover">
	<thead><tr><th>검색된 사용자가 없습니다. 사용자를 등록하세요.</th></tr></thead>
	<tr><td colspan="2">이름 : <input type="text" id="name" name="name"> </td></tr>
      <tr><td colspan="2">주소 : <input type="text" id="adr" name="adr"> </td></tr>
      <tr><td colspan="2">학교 : <input type="text" id="school" name="school"> </td></tr>
      <tr><td colspan="2">전공 : <input type="text" id="major" name="major">
      <button type="submit" class="btn btn-success">확인</button> </td></tr>
</table>
</form>

</c:if>
<form action="${root}/modify" method="post">
<div class="show_info">
<table class="table table-hover">
    <thead>
      <tr>
        <th>이름</th>
        <th>주소</th>
        <th>학교</th>
        <th>전공</th>
      </tr>
    </thead>
    <tbody>
    <c:forEach items="${li2}" var="li2">
      	<tr><td> <input type="text" id="name" name="name" value="${li2.name}" readonly="readonly"/></td>
      	<td><input type="text" id="adr" name="adr" value="${li2.adr}"/></td>
      	<td><input type="text" id="school" name="school" value="${li2.school}"/></td>
      	<td><input type="text" id="major" name="major" value="${li2.major}"/></td></tr>
      	<tr><td colspan="4">
      	<button type="submit" class="btn btn-success">수정</button>
      	<a id="name" class="btn btn-success" href="${root}/delete?name=${li2.name}">삭제</a>
      	</td></tr>
    </c:forEach>
</form>
    </tbody>
    </table>
</div>
</form>
</body>
</html>
