
<%@ page import="ru.roman.mixel.dao.Product" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'product.label', default: 'Product')}" />
        <title><g:message default="List" code="default.list.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/grailsConsole')}"><g:message default="Home" code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message default="New" code="default.new.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message default="List" code="default.list.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="list">
                <table>
                    <thead>
                        <tr>
                        
                            <g:sortableColumn property="id" title="${message(code: 'product.id.label', default: 'Id')}" />
                        
                            <g:sortableColumn property="menuId" title="${message(code: 'product.menuId.label', default: 'Menu Id')}" />
                        
                            <g:sortableColumn property="name" title="${message(code: 'product.name.label', default: 'Name')}" />
                        
                            <g:sortableColumn property="partnerCode" title="${message(code: 'product.partnerCode.label', default: 'Partner Code')}" />
                        
                            <g:sortableColumn property="prise" title="${message(code: 'product.prise.label', default: 'Prise')}" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${productInstanceList}" status="i" var="productInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="edit" id="${productInstance.id}">${fieldValue(bean: productInstance, field: "id")}</g:link></td>
                        
                            <td>${fieldValue(bean: productInstance, field: "menuId")}</td>
                        
                            <td>${fieldValue(bean: productInstance, field: "name")}</td>
                        
                            <td>${fieldValue(bean: productInstance, field: "partnerCode")}</td>
                        
                            <td>${fieldValue(bean: productInstance, field: "prise")}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${productInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
