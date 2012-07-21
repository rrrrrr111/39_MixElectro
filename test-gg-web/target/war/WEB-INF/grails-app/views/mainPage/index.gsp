<%@ page contentType="text/html;charset=utf-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>
<head>
<meta name="layout" content="mixel" />
</head>
<body>

	<div style="align:center;">
	<g:render template="/layouts/mixel/headMenu" />	
	<g:render template="/layouts/mixel/headCorusel" />
	</div>		
	
		<div style="width:180px; margin-left:20px" class="column1">
			<h1>Спецпредложения</h1>
			<div class="pict" style="margin-left:10px">
				<a href="${createLink(action:'empty')}"><img 
					src="/images/cust/spec1.gif"
					alt="Монтажникам">
				</a> 
				<a href="${createLink(action:'empty')}"><img
					src="/images/cust/spec2.gif" 
					alt="Предприятиям инфраструктуры">
				</a> 
				<a href="${createLink(action:'empty')}"><img 
					src="/images/cust/spec3.gif"
					alt="Промышленным предприятиям">
				</a> 
				<a href="${createLink(action:'empty')}"><img
					src="/images/cust/spec4.gif" 
					alt="Частным лицам">
				</a>
			</div>
		</div>

		<div class="column2">
			<div class="catalog">
				<h1>Каталог электротехники</h1>
				<br/><br/>
				<table class="cat">
					
				<g:set var="counter" value="${0}" />					
				<g:each in="${catalogItemsList}" var="item">
				<g:if test="${item.name && item.parent == 0}">
					<g:if test="${1 == ++counter % 2}">
						<tr>
						<g:render template="catalogItem" var="item" bean="${item}"/>
					</g:if>
					<g:else>
						<g:render template="catalogItem" var="item" bean="${item}"/>
						</tr>
					</g:else>
				</g:if>
				</g:each>
				<g:if test="${1 != counter % 2}">
					</tr>
				</g:if>
				</table>
				
				<br/>
				<div style="float:left; margin-left:150px;">
					<a href="${createLink(action:'catalog')}">
						<img src="/images/cust/fullCat.gif">
					</a>
				</div>	
				<div class="allcat">
					<a class="catLink" href="${createLink(action:'catalog')}">
						<strong>Весь каталог продукции</strong>
					</a>&nbsp;&rarr;
				</div>
				<br/><br/>
			</div>
			<div class="notDisplay"><!-- реклама от Google (AdSence)-->
				<script type="text/javascript"><!--
					google_ad_client = "ca-pub-0072185587610564";
					/* Компания Миксэлектро */
					google_ad_slot = "4221520486";
					google_ad_width = 728;
					google_ad_height = 90;
					//-->
				</script>
				<script type="text/javascript"
					src="http://pagead2.googlesyndication.com/pagead/show_ads.js">
				</script>
			</div>
</body>
</html>