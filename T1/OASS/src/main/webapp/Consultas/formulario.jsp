<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Gerenciamento de Consultas</title>
</head>
<body>
    <fmt:bundle basename="messages">
        <div align="center">
            <h1><fmt:message key="header.consultationManagement"/></h1>
            <h2>
                <a href="lista"><fmt:message key="link.consultationList"/></a>
            </h2>
        </div>
        <div align="center">
            <c:choose>
                <c:when test="${consulta != null}">
                    <form action="atualizacao" method="post">
                        <input type="hidden" name="id" value="${consulta.id}"/>
                        <%@include file="campos.jsp"%>
                    </form>
                </c:when>
                <c:otherwise>
                    <form action="insercao" method="post">
                        <%@include file="campos.jsp"%>
                    </form>
                </c:otherwise>
            </c:choose>
        </div>
        <c:if test="${!empty requestScope.mensagens}">
            <ul class="erro">
                <c:forEach items="${requestScope.mensagens}" var="mensagem">
                    <li>${mensagem}</li>
                </c:forEach>
            </ul>
        </c:if>
    </fmt:bundle>
</body>
</html>
