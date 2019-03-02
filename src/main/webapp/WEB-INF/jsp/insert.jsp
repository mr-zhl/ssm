<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>修改学生</title>
    <link href="/static/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>

<div class="container">
    <h2>修改学生</h2>
    <form action="/student/update" method="post">

        <input type="hidden" name="id" required value="${s.id}">

        <div class="form-group">
            <label for="name">姓名</label>
            <input type="text" class="form-control" id="name" placeholder="请输入姓名" name="name" required value="${s.name}">
        </div>

        <div class="form-group">
            <label for="gender">性别</label>
            <select id="gender" class="form-control" name="gender">
                <option value="男" <c:if test="${s.gender == '男'}">selected</c:if>>男</option>
                <option value="女" <c:if test="${s.gender == '女'}">selected</c:if>>女</option>
                <option value="未知" <c:if test="${s.gender == '未知'}">selected</c:if>>未知</option>
            </select>
        </div>

        <div class="form-group">
            <label for="birthday">出生年月</label>
            <input type="date" class="form-control" id="birthday" placeholder="请输入出生年月" name="birthday" required value="<fmt:formatDate value="${s.birthday}" pattern="yyyy-MM-dd"/>">
        </div>

        <div class="form-group">
            <label for="high">身高</label>
            <input type="text" class="form-control" id="high" placeholder="请输入生身高" name="high" required value="${s.high}"/>
        </div>

        <button type="submit" class="btn btn-primary">修改</button>
    </form>
</div>

<script src="/static/js/jquery.min.js"></script>
<script src="/static/js/bootstrap.min.js"></script>
</body>
</html>

