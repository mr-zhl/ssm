<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<head>
    <title>主页</title>
</head>
<!-- Bootstrap -->
<link href="../../static/css/bootstrap.min.css" rel="stylesheet">
<body style="background: lightskyblue">
<div class="container">
    <%--添加学生--%>
    <h2 class="text-center">添加学生</h2>
    <form class="form-inline" action="/student/add" method="post">


        <div class="form-group">
            <label for="name">姓名</label>
            <input type="text" class="form-control" id="name" placeholder="请输入姓名" name="name" required>
        </div>

        <div class="form-group">
            <label for="gender">性别</label>
            <select id="gender" class="form-control" name="gender">
                <option value="男">男</option>
                <option value="女">女</option>
                <option value="未知" selected>未知</option>
            </select>
        </div>

        <div class="form-group">
            <label for="birthday">出生年月</label>
            <input type="date" class="form-control" id="birthday" placeholder="请输入出生年月" name="birthday" required>
        </div>

        <div class="form-group">
            <label for="high">身高</label>
            <input type="text" class="form-control" id="high" placeholder="请输入身高" name="high" required>
        </div>

        <button type="submit" class="btn btn-primary">添加</button>
    </form>
    <%--错误信息处理--%>
    <c:if test="${massage!=null}">
        <div class="alert alert-danger col-sm-4 col-xs-offset-3 text-center" role="alert">信息:${requestScope.massage}
        </div></c:if>
    <%--学生表格--%>
    <table border="2px" class="table table-striped form-inline">
        <caption class="text-center" style="font-size: 25px" > 学生管理系统</caption>
        <tr>
            <th>学号</th>
            <th>姓名</th>
            <th>性别</th>
            <th>生日</th>
            <th>身高</th>
            <th>编辑</th>
            <th>删除</th>
        </tr>
        <c:forEach items="${pageInfo.list}" var="s">
            <tr>
                <td>${s.id}</td>
                <td>${s.name}</td>
                <td>${s.gender}</td>
                <td>
                    <fmt:formatDate value="${s.birthday}" pattern="yyyy-MM-dd"/>
                </td>
                <td>${s.high}</td>
                <td><a class="btn btn-primary btn-sm" href="/student/toUpdate?id=${s.id}" role="button">编辑</a>
                </td>
                <td>
                    <a class="btn btn-danger btn-sm" href="/student/toindex?id=${s.id}" role="button">删除</a>
                </td>
            </tr>
        </c:forEach>
    </table>
    <%--分页处理--%>
    <nav aria-label="Page navigation" class="text-center">
        <ul class="pagination">
            <li>
                <a <c:if
                        test="${!pageInfo.isFirstPage}"> href="${pageContext.request.contextPath}/student/index?page=${pageInfo.prePage}"</c:if>
                        aria-label="Previous">
                    <span aria-hidden="true">&laquo;</span>
                </a>
            </li>
            <c:forEach items="${pageInfo.navigatepageNums}" var="i">
                <li><a href="${pageContext.request.contextPath}/student/index?page=${i}">${i}</a></li>
            </c:forEach>
            <li>
                <a <c:if
                        test="${!pageInfo.isLastPage}"> href="${pageContext.request.contextPath}/student/index?page=${pageInfo.nextPage}"</c:if>
                        aria-label="Next">
                    <span aria-hidden="true">&raquo;</span>
                </a>
            </li>
        </ul>
    </nav>
</div>
<script src="../../static/js/jquery.min.js"></script>
<script src="../../static/js/bootstrap.min.js"></script>
</body>
</html>
