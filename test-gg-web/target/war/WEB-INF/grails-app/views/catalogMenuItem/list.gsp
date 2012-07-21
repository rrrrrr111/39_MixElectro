
<%@ page import="ru.roman.mixel.dao.CatalogMenuItem" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'catalogMenuItem.label', default: 'CatalogMenuItem')}" />
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
                        
                            <g:sortableColumn property="id" title="${message(code: 'catalogMenuItem.id.label', default: 'Id')}" />
                        
                            <g:sortableColumn property="code" title="${message(code: 'catalogMenuItem.code.label', default: 'Code')}" />
                        
                            <g:sortableColumn property="name" title="${message(code: 'catalogMenuItem.name.label', default: 'Name')}" />
                        
                            <g:sortableColumn property="parent" title="${message(code: 'catalogMenuItem.parent.label', default: 'Parent')}" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${catalogMenuItemInstanceList}" status="i" var="catalogMenuItemInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="edit" id="${catalogMenuItemInstance.id}">${fieldValue(bean: catalogMenuItemInstance, field: "id")}</g:link></td>
                        
                            <td>${fieldValue(bean: catalogMenuItemInstance, field: "code")}</td>
                        
                            <td>${fieldValue(bean: catalogMenuItemInstance, field: "name")}</td>
                        
                            <td>${fieldValue(bean: catalogMenuItemInstance, field: "parent")}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${catalogMenuItemInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
