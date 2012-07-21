
<%@ page import="ru.roman.mixel.dao.MainMenu" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'mainMenu.label', default: 'MainMenu')}" />
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
                        
                            <g:sortableColumn property="id" title="${message(code: 'mainMenu.id.label', default: 'Id')}" />
                        
                            <g:sortableColumn property="header" title="${message(code: 'mainMenu.header.label', default: 'Header')}" />
                        
                            <g:sortableColumn property="page" title="${message(code: 'mainMenu.page.label', default: 'Page')}" />
                        
                            <g:sortableColumn property="text" title="${message(code: 'mainMenu.text.label', default: 'Text')}" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${mainMenuInstanceList}" status="i" var="mainMenuInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="edit" id="${mainMenuInstance.id}">${fieldValue(bean: mainMenuInstance, field: "id")}</g:link></td>
                        
                            <td>${fieldValue(bean: mainMenuInstance, field: "header")}</td>
                        
                            <td>${fieldValue(bean: mainMenuInstance, field: "page")}</td>
                        
                            <td>${fieldValue(bean: mainMenuInstance, field: "text")}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${mainMenuInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
