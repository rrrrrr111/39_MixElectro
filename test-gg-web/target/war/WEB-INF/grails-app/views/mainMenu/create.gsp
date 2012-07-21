

<%@ page import="ru.roman.mixel.dao.MainMenu" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'mainMenu.label', default: 'MainMenu')}" />
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
            <g:hasErrors bean="${mainMenuInstance}">
            <div class="errors">
                <g:renderErrors bean="${mainMenuInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form action="save" >
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="header"><g:message code="mainMenu.header.label" default="Header" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: mainMenuInstance, field: 'header', 'errors')}">
                                    <g:textField style="width:1000px;" name="header" value="${mainMenuInstance?.header}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="page"><g:message code="mainMenu.page.label" default="Page" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: mainMenuInstance, field: 'page', 'errors')}">
                                    <g:textField style="width:1000px;" name="page" value="${mainMenuInstance?.page}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="text"><g:message code="mainMenu.text.label" default="Text" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: mainMenuInstance, field: 'text', 'errors')}">
                                    <g:textField style="width:1000px;" name="text" value="${mainMenuInstance?.text}" />
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
