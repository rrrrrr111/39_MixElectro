<%@ page contentType="text/html;charset=utf-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>
<head>
<meta name="layout" content="mixel" />
</head>
<body>
	<g:render template="/layouts/mixel/headMenu" />
	<div class="column1" style="width:960px;">
		<h1>${header}</h1>
		${text?.value}
	</div>
	<div width="600px" class="column2">
</body>
</html>