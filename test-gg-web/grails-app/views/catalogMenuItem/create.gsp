

<%@ page import="ru.roman.mixel.dao.CatalogMenuItem" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'catalogMenuItem.label', default: 'CatalogMenuItem')}" />
        <title><g:message default="Create" code="default.create.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/grailsConsole')}"><g:message default="Home" code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="list" action="list"><g:message default="List" code="default.list.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message default="Create" code="default.create.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${catalogMenuItemInstance}">
            <div class="errors">
                <g:renderErrors bean="${catalogMenuItemInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form action="save" >
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="code"><g:message code="catalogMenuItem.code.label" default="Code" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: catalogMenuItemInstance, field: 'code', 'errors')}">
                                    <g:textField style="width:1000px;" name="code" value="${catalogMenuItemInstance?.code}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="name"><g:message code="catalogMenuItem.name.label" default="Name" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: catalogMenuItemInstance, field: 'name', 'errors')}">
                                    <g:textField style="width:1000px;" name="name" value="${catalogMenuItemInstance?.name}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="parent"><g:message code="catalogMenuItem.parent.label" default="Parent" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: catalogMenuItemInstance, field: 'parent', 'errors')}">
                                    <g:textField style="width:1000px;" name="parent" value="${fieldValue(bean: catalogMenuItemInstance, field: 'parent')}" />
                                </td>
                            </tr>
                        
                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                    <span class="button"><g:submitButton name="create" class="save" value="${message(code: 'default.button.create.label', default: 'Create')}" /></span>
                </div>
            </g:form>
        </div>
    </body>
</html>
