<%@ page contentType="text/html;charset=UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta name="layout" content="main" />
<title>примеры -  грувки</title>
</head>
<body>
	<div class="body">

		<cite>привет</cite>
	</div>
																<%-- установка переменной --%>
	<g:set var="now" value="${new Date()}" />
																<%-- установка переменной --%>
	<g:set var="myHTML">
   		Some re-usable code on: ${now}
	</g:set>
																<%-- ветвление --%>
	<g:if test="${session.role == 'admin'}">
		<%-- show administrative functions --%>
	</g:if>
	<g:else>
		<%-- show basic functions --%>
	</g:else>
																<%-- циклы --%>
	<g:each in="${[1,2,3]}" var="num">
		<p>
			Number ${num}
		</p>
	</g:each>
	
	<g:set var="num" value="${1}" />
	<g:while test="${num < 5 }">
		<p>
			Number ${num++}
		</p>
	</g:while>
																<%-- фильтрация --%>
	Stephen King's Books:
	<g:findAll in="${books}" expr="it.author == 'Stephen King'">
    	<p>Title: ${it.title}</p>
	</g:findAll>
	
	<g:grep in="${books}" filter="String.class">
     	<p>Title: ${it.title}</p>
	</g:grep>
	
	<g:grep in="${num}" filter="~/.*?Groovy.*?/">
     	<p>Title: ${it}</p>
	</g:grep>
	
	<br/><br/>																<%-- ссылки --%>
	
	LINK 1 : <g:link action="show" id="1">Book 1</g:link>		<br/>
	LINK 2 : <g:link action="show" id="${1}">${2}</g:link>  <br/> 
	LINK 3 : <g:link controller="book">Book Home</g:link> <br/>
	LINK 4 : <g:link controller="book" action="list">Book List</g:link> <br/>
	LINK 5 : <g:link url="[action:'list',controller:'book']">Book List</g:link>  <br/>
	LINK 6 : <g:link action="list" params="[sort:'title',order:'asc',author:3]">
				Book List
			 </g:link>
			 
			 
																			<%-- формы --%>
	<br/><br/>								
	<g:form name="myForm" url="[controller:'book',action:'list']">
		<g:textField style="width:1000px;" name="myField" value="${num}" />
		<g:checkBox name="myField" value="${num}" />
		<g:radio name="myField" value="${num}" />
		<g:hiddenField name="myField" value="${num}" />
		<g:select name="myField" value="${num}" from="${['M', 'T', 'F']}"/>
		<g:actionSubmit style="background:green;" value="update label" action="update" />
		<g:actionSubmit value="insert label" action="insert" />
	</g:form>
	
		
																			<%-- вызовы методов внутри GSP и контролеров и библиотек тегов--%>
	<img src="${createLinkTo(dir:'images', file:'logo.jpg')}" /><br/>
	def imageLocation = createLinkTo(dir:"images", file:"logo.jpg")<br/>
	def imageLocation = g.createLinkTo(dir:"images", file:"logo.jpg")<br/>
	
	
	
	<br/><br/>
	
																			<%--шаблоны --%>
																			
	<g:render template="someTemplate" model="[var:1, book:2]" />																	
	<g:render template="someTemplate" var="book" collection="${bookList}" />																	
																			
																			
																			
																			
																			
																			
																			
																			
																			
																			
																			
																			
																			
																			
																			
																			
																				
	
	

</body>
</html>