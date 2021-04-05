<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import ="java.util.*"
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>  
<c:set var="path" value="${pageContext.request.contextPath}"/> 
<fmt:requestEncoding value="UTF-8" /> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Gantt</title>
<link rel="stylesheet" href="${path}/a00_com/bootstrap.min.css" >
<link rel="stylesheet" href="${path}/a00_com/jquery-ui.css" >
<script src="${path}/a00_com/jquery.min.js"></script>
<script src="${path}/a00_com/popper.min.js"></script>
<script src="${path}/a00_com/bootstrap.min.js"></script>
<script src="${path}/a00_com/jquery-ui.js"></script>
<script type="text/javascript">
<%--
 
 
--%>
/*
   $(document).ready(function(){
      $.ajax({
         type:"get",
         url:"${path}/main.do?method=data",
         dataType:"json",
         success:function(data){
            //console.log(data.gantt);
            var re = {data:data.gantt};
            console.log(re);
            gantt.config.date_format = "%Y-%m-%d %H:%i:%s";
            gantt.init("gantt_here");
            gantt.load(re);
         },
         error:function(err){
            console.log(err);
         }
      });
   });
   */
</script>
<script src="${path}/Admin/dist/assets/js/dhtmlxgantt.js?v=7.0.13"></script>
<link rel="stylesheet" href="${path}/Admin/dist/assets/css/dhtmlxgantt.css?v=7.0.13">
<style>
   html, body {
      padding: 0px;
      margin: 0px;
      height: 100%;
   }
</style>
</head>
<body>
   <div>
      <table>
      <c:forEach var="g" items="${gantt}">
         <tr><th>1</th><td>${g.id}</td>   
            <th>2</th><td>${g.start_date}</td>
            <th>3</th><td>${g.duration}</td>   
            <th>4</th><td>${g.text}</td>      
            <th>5</th><td>${g.progress}</td>   
            <th>6</th><td>${g.sortorder}</td>   
            <th>7</th><td>${g.parent}</td>   
            <th>8</th><td>${g.open}</tr>
      </c:forEach>
      </table>
   </div>
   <div id="gantt_here" style='width:100%; height:100%;'></div>
   <script>
      gantt.config.date_format = "%Y-%m-%d %H:%i:%s";
      gantt.init("gantt_here");
      gantt.load("${path}/Admin/dist/assets/data/data.json", "json");
      //gantt.load("${gantt}", "json");
   </script>
</body>
</html>