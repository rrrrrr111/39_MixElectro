
<%@ page import="ru.roman.mixel.dao.security.AppRole" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'appRole.label', default: 'AppRole')}" />
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
                        
                            <g:sortableColumn property="id" title="${message(code: 'appRole.id.label', default: 'Id')}" />
                        
                            <g:sortableColumn property="description" title="${message(code: 'appRole.description.label', default: 'Description')}" />
                        
                            <g:sortableColumn property="name" title="${message(code: 'appRole.name.label', default: 'Name')}" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${appRoleInstanceList}" status="i" var="appRoleInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="edit" id="${appRoleInstance.id}">${fieldValue(bean: appRoleInstance, field: "id")}</g:link></td>
                        
                            <td>${fieldValue(bean: appRoleInstance, field: "description")}</td>
                        
                            <td>${fieldValue(bean: appRoleInstance, field: "name")}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${appRoleInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
