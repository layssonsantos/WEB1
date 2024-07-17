<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<script>
    function showFields() {
        var papel = document.getElementById("papel").value;
        document.getElementById("clienteFields").style.display = papel === "CLIENTE" || papel === "AMBOS" ? "block" : "none";
        document.getElementById("profissionalFields").style.display = papel === "PROFISSIONAL" || papel === "AMBOS" ? "block" : "none";
    }
</script>

<table border="1">
    <caption>
        <c:choose>
            <c:when test="${usuario != null}">
                Edição
            </c:when>
            <c:otherwise>
                Cadastro
            </c:otherwise>
        </c:choose>
    </caption>
    <c:if test="${usuario != null}">
        <input type="hidden" name="id" value="${usuario.id}" />
    </c:if>
    <tr>
        <td><label for="nome">Nome:</label></td>
        <td><input type="text" id="nome" name="nome" required value="${usuario.nome}" /></td>
    </tr>
    <tr>
        <td><label for="email">Email:</label></td>
        <td><input type="email" id="email" name="email" required value="${usuario.email}" /></td>
    </tr>
    <tr>
        <td><label for="senha">Senha:</label></td>
        <td><input type="password" id="senha" name="senha" required value="${usuario.senha}" /></td>
    </tr>
    <tr>
        <td><label for="cpf">CPF:</label></td>
        <td><input type="text" id="cpf" name="cpf" required value="${usuario.cpf}" /></td>
    </tr>
    <tr>
        <td><label for="papel">Papel:</label></td>
        <td>
            <select id="papel" name="papel" onchange="showFields()">
                <option value="ADMIN" ${usuario.papel=='ADMIN' ? 'selected' : '' }>ADMIN</option>
                <option value="CLIENTE" ${usuario.papel=='CLIENTE' ? 'selected' : '' }>CLIENTE</option>
                <option value="PROFISSIONAL" ${usuario.papel=='PROFISSIONAL' ? 'selected' : '' }>PROFISSIONAL</option>
                <option value="AMBOS" ${usuario.papel=='AMBOS' ? 'selected' : '' }>CLIENTE e PROFISSIONAL</option>
            </select>
        </td>
    </tr>
</table>

<fieldset id="clienteFields" style="display:none">
    <legend>Informações do Cliente</legend>
    <table border="1">
        <tr>
            <td><label for="telefone">Telefone:</label></td>
            <td><input type="text" id="telefone" name="telefone" value="${cliente.telefone}" /></td>
        </tr>
        <tr>
            <td><label for="sexo">Sexo:</label></td>
            <td>
                <select id="sexo" name="sexo">
                    <option value="M" ${cliente.sexo=='M' ? 'selected' : '' }>Masculino</option>
                    <option value="F" ${cliente.sexo=='F' ? 'selected' : '' }>Feminino</option>
                </select>
            </td>
        </tr>
        <tr>
            <td><label for="dataDeNascimento">Data de Nascimento:</label></td>
            <td>
                <c:set var="formattedDate">
                    <fmt:formatDate value="${cliente.dataDeNascimento}" pattern="yyyy-MM-dd" />
                </c:set>
                <input type="date" id="dataDeNascimento" name="dataDeNascimento" value="${formattedDate}" />
            </td>
        </tr>
    </table>
</fieldset>

<fieldset id="profissionalFields" style="display:none">
    <legend>Informações do Profissional</legend>
    <table border="1">
        <tr>
            <td><label for="especialidade">Especialidade:</label></td>
            <td><input type="text" id="especialidade" name="especialidade" value="${profissional.especialidade}" /></td>
        </tr>
    </table>
</fieldset>

<table border="1">
    <tr>
        <td colspan="2" align="center"><input type="submit" value="Salvar" /></td>
    </tr>
</table>

<script>
    // Inicializar a exibição correta dos campos com base no papel atual
    document.addEventListener("DOMContentLoaded", function () {
        showFields();
    });
</script>
