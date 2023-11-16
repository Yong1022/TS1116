<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="root" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html lang="en">
<head>
<title>학생 정보</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
   href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
   src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script
   src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<style>
   .search_div {
      margin: 10px 0px 50px 0px;
   }
   #ins_btn{
      margin-bottom: 30px;
   }
   .insert_form{
      margin-bottom: 30px;
   }

</style>
</head>
<body>

   <div class="container">
      <h2>학생 정보</h2>
      
      <div class="search_div">
      <form class="form-inline" action="${root }/board/searching" method="post">
         <div class="form-group">
            <input type="text" class="form-control" id="namesearch" name="keyword" placeholder="이름 검색">
         </div>
         <button type="submit" class="btn btn-default search">검색</button>
      </form>
      </div>
      
      
      <div class="insert_btn">
         <button id="ins_btn" class="btn btn-default" type="button">등록하기</button>
      </div>
      <div class="insert_form">
         <form class="form-inline" action="${root }/board/insert" method="post">
            <div class="form-group">
               <label for="name">이름:</label>
               <input type="text" class="form-control" id="name" name="name">
            </div>
            <div class="form-group">
               <label for="school">학교:</label>
               <input type="text" class="form-control" id="school" name="school">
            </div>
            <div class="form-group">
               <label for="dept">전공:</label>
               <input type="text" class="form-control" id="dept" name="dept">
            </div>
            <div class="form-group">
               <label for="location">지역:</label>
               <input type="text" class="form-control" id="location" name="location">
            </div>
            <button type="submit" class="btn btn-default">등록</button>
            <button id="not_insert" type="button" class="btn btn-default">취소</button>
         </form>
      </div>
      
      
      <div class="fr1">
         <table class="table">
         <thead>
            <tr>
               <th>번호</th>
               <th>이름</th>
            </tr>
         </thead>
         <tbody>
            <c:forEach items="${li }" var="li">
               <tr>
                  <td>${li.idx }</td>
                  <td>
                     <a class="name" href="${root }/board/read?idx=${li.idx }">${li.name }</a>
                  </td>
            </c:forEach>
         </tbody>
      </table>
      </div>
         

           <div class="fr2">
           <form action="${root }/board/modify?idx=${info.idx}" method="post">
         <table class="table table-striped">
         <thead>
            <tr>
               <th>번호</th>
               <th>이름</th>
               <th>학교</th>
               <th>전공</th>
               <th>지역</th>
            </tr>
            
            <tr>
               <td>${info.idx}</td>
               <td><input type="text" class="form-control" name="name" readonly="readonly" value="${info.name}"</td>
               <td><input type="text" class="form-control" name="school" value="${info.school}"</td>
               <td><input type="text" class="form-control" name="dept" value="${info.dept}"</td>
               <td><input type="text" class="form-control" name="location" value="${info.location}"</td>
            </tr>
            
            <tr>
               <td colspan="5">         
                  <button type="submit" class="btn btn-primary">수정</button>
                  <a class="btn btn-danger" href="${root}/board/remove?idx=${info.idx}">삭제</a>
               </td>
            </tr>
         </thead>
         </table>
         </form>
         </div>
        </div>
            
<script>
$('.insert_form').hide();
   $(function(){
      $('.btn').click(function(){
         $('.insert_form').show();
         $('.insert_btn').hide();
         $('.fr2').hide();
      });
      
      $('#not_insert').click(function(){
         $('.insert_form').hide();
         $('.insert_btn').show();
         $('.fr2').hide();
      });
      $('.fr2').hide();
      $('.name').click(function(){
         $('.fr1').hide();
         $('.fr2').show();
      })
      
   });
   
</script>
</body>
</html>