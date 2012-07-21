

<%@ page import="ru.roman.mixel.dao.Product" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'product.label', default: 'Product')}" />
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
            <g:hasErrors bean="${productInstance}">
            <div class="errors">
                <g:renderErrors bean="${productInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form action="save" >
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="menuId"><g:message code="product.menuId.label" default="Menu Id" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: productInstance, field: 'menuId', 'errors')}">
                                    <g:textField style="width:1000px;" name="menuId" value="${fieldValue(bean: productInstance, field: 'menuId')}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="name"><g:message code="product.name.label" default="Name" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: productInstance, field: 'name', 'errors')}">
                                    <g:textField style="width:1000px;" name="name" value="${productInstance?.name}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="partnerCode"><g:message code="product.partnerCode.label" default="Partner Code" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: productInstance, field: 'partnerCode', 'errors')}">
                                    <g:textField style="width:1000px;" name="partnerCode" value="${productInstance?.partnerCode}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="prise"><g:message code="product.prise.label" default="Prise" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: productInstance, field: 'prise', 'errors')}">
                                    <g:textField style="width:1000px;" name="prise" value="${productInstance?.prise}" />
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
