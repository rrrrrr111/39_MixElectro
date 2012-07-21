
<%@ page import="ru.roman.mixel.dao.security.AppUser" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'appUser.label', default: 'AppUser')}" />
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
                        
                            <g:sortableColumn property="id" title="${message(code: 'appUser.id.label', default: 'Id')}" />
                        
                            <g:sortableColumn property="email" title="${message(code: 'appUser.email.label', default: 'Email')}" />
                        
                            <g:sortableColumn property="enabled" title="${message(code: 'appUser.enabled.label', default: 'Enabled')}" />
                        
                            <g:sortableColumn property="firstName" title="${message(code: 'appUser.firstName.label', default: 'First Name')}" />
                        
                            <g:sortableColumn property="password" title="${message(code: 'appUser.password.label', default: 'Password')}" />
                        
                            <g:sortableColumn property="registrationDate" title="${message(code: 'appUser.registrationDate.label', default: 'Registration Date')}" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${appUserInstanceList}" status="i" var="appUserInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="edit" id="${appUserInstance.id}">${fieldValue(bean: appUserInstance, field: "id")}</g:link></td>
                        
                            <td>${fieldValue(bean: appUserInstance, field: "email")}</td>
                        
                            <td><g:formatBoolean boolean="${appUserInstance.enabled}" /></td>
                        
                            <td>${fieldValue(bean: appUserInstance, field: "firstName")}</td>
                        
                            <td>${fieldValue(bean: appUserInstance, field: "password")}</td>
                        
                            <td><g:formatDate date="${appUserInstance.registrationDate}" /></td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${appUserInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
