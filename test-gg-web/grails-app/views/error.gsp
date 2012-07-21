<html>
  <head>
  	  <meta name="layout" content="mixel" />
  </head>

  <body>
  	<div style="align:center;">
	<g:render template="/layouts/mixel/headMenu" />	
	<g:render template="/layouts/mixel/headCorusel" />
	</div>		
  	<div class="column1" style="width:960px;">
		<h1>Извините, произошла ошибка, обратитесь к менеджеру компании.</h1>
		  <div style="width:930px; margin-left:20px" class="column2">
		
		
  	<div class="message">
		<strong>Error ${request.'javax.servlet.error.status_code'}:</strong> ${request.'javax.servlet.error.message'.encodeAsHTML()}<br/>
		<strong>Servlet:</strong> ${request.'javax.servlet.error.servlet_name'}<br/>
		<strong>URI:</strong> ${request.'javax.servlet.error.request_uri'}<br/>
		<g:if test="${exception}">
	  		<strong>Exception Message:</strong> ${exception.message?.encodeAsHTML()} <br />
	  		<strong>Caused by:</strong> ${exception.cause?.message?.encodeAsHTML()} <br />
	  		<strong>Class:</strong> ${exception.className} <br />
	  		<strong>At Line:</strong> [${exception.lineNumber}] <br />
	  		<strong>Code Snippet:</strong><br />
	  		<div class="snippet">
	  			<g:each var="cs" in="${exception.codeSnippet}">
	  				${cs?.encodeAsHTML()}<br />
	  			</g:each>
	  		</div>
		</g:if>
  	</div>
	<g:if test="${exception}">
	    <h2>Stack Trace</h2>
	    <div class="stack">
	      <pre><g:each in="${exception.stackTraceLines}">${it.encodeAsHTML()}</g:each></pre>
	    </div>
	</g:if>
	</div>
	</div>
	
	<div width="600px" class="column2">
  </body>
</html>