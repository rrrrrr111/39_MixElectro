<!DOCTYPE html>
<html>
    <head>
    	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
        <title><g:layoutTitle default="Компания «Миксэлектро»" /></title>
        <link rel="stylesheet" href="${resource(dir:'css',file:'gg_main.css')}" type="text/css"/>
        <link rel="shortcut icon" href="${resource(dir:'images',file:'favicon.ico')}" type="image/x-icon" />
        <g:layoutHead />
        <g:javascript src="custom.js" />
    </head>
   <body onLoad="init()">
        <div id="loading">
			<img src="${resource(dir:'images/stl',file:'large-loading.gif')}" border=0>
		</div>
        <div id="grailsLogo" style="margin-left:30px"> 
        	<a href="/">
        	<img height="80px" src="${resource(dir:'images/cust',file:'logo1.gif')}" alt="Grails" border="0" />
        	</a>
        </div>
        <g:layoutBody />
    </body>
</html>