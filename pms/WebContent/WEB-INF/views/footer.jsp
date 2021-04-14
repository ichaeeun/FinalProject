<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import ="java.util.*"
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<%@ taglib prefix="form"	uri="http://www.springframework.org/tags/form" %>  
<c:set var="path" value="${pageContext.request.contextPath}"/> 
<fmt:requestEncoding value="UTF-8" /> 
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
 footer{ z-index: 999999; }
.chatting { position: fixed; bottom: 80px; right: 50px; border-radius: 100%; cursor:pointer; background: white; width: 78px; text-align: center; box-shadow: 5px 5px 5px rgb(0, 0, 0, 0.1); transition:0.5s; }
.chatting:hover { box-shadow: 5px 5px 10px rgb(0, 0, 0, 0.3);  }
.ri-discuss-fill:before {  font-size: 50px; }
</style>
</head>
	<body>
	<footer class="footer">
        <div class="container-fluid">
            <div class="row">
                <div class="col-md-6">
                    <script>document.write(new Date().getFullYear())</script> &copy; Minton theme by <a href="">Coderthemes</a> 
                </div>
                <div class="col-md-6">
                    <div class="text-md-end footer-links d-none d-sm-block">
                        <a href="javascript:void(0);">About Us</a>
                        <a href="javascript:void(0);">Help</a>
                        <a href="javascript:void(0);">Contact Us</a>
                    </div>
                </div>
                <div class="chatting" onclick="location.href='${path}/chatting.do'">
                 <i class="ri-discuss-fill"></i>
                </div>
            </div>
        </div>
    </footer>

	</body>
</html>