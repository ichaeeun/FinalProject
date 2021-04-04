<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*"
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<%@ taglib prefix="form"
		uri="http://www.springframework.org/tags/form"%>   
<c:set var="path" value="${pageContext.request.contextPath}"/> 
<fmt:requestEncoding value="UTF-8" /> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
var oracledb = require('oracledb');
var config = {
    user: "아이디",
    password: "비밀번호",
    connectString: "주소/xe"
}

oracledb.getConnection(config, (err, conn) =>{
    todoWork(err, conn);
});

function todoWork(err, connection) {
    if (err) {
        console.error(err.message);
        return;
    }
    connection.execute("select * from test", [], function (err, result) {
        if (err) {
            console.error(err.message);
            doRelease(connection);
            return;
        }
        console.log(result.metaData);  //테이블 스키마
        console.log(result.rows);  //데이터
        doRelease(connection);
    });
}    

function doRelease(connection) {
    connection.release(function (err) {
        if (err) {
            console.error(err.message);
        }
    });
}
</script>
</head>
<body
</body>
</html>