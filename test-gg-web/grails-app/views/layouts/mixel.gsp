<!DOCTYPE html>
<html>
    <head>
    	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">    	
    	<meta name='yandex-verification' content='70d99cf100488845' />
    	<meta name='yandex-verification' content='6d8f5632369d184f' />
    	<meta name="google-site-verification" content="7xTZtGKi4oOV1w0eVr8L2SmCRoPI3KVsoLBj1h1Nes4" />
    	<meta name="google-site-verification" content="rwW42MgNC8hypTcWLpq4rmbnUStF2k7EMSi06NhdZ4w" />
    	<meta Name="author" Content="curdes">
    	<meta Name="copyright" Content="Компания Миксэлектро">
    	<meta Name="description" Content="поставщик электротехники">
    	<meta Name="keywords" Content="электрика, электротехника, электрооборудование, кабель, провод, светильник, розетка, пакетный переключатель">
        <title><g:layoutTitle default="Компания «Миксэлектро»" /></title>
        <link href="${resource(dir:'images',file:'favicon.ico')}" rel="shortcut icon" type="image/x-icon" />
        <link href="${resource(dir:'css/custom-theme',file:'jquery-ui-1.8.11.custom.css')}" rel="stylesheet" type="text/css">        
        <link href="${resource(dir:'css',file:'main.css')}" rel="stylesheet" type="text/css">
        <g:javascript src="jquery-1.5.1.min.js" />
        <g:javascript src="jquery-ui-1.8.11.custom.min.js" />
        <g:javascript src="jquery.textCheck.js" />
        <g:javascript src="custom.js" />
        <g:layoutHead />
    </head>
    <g:javascript>
  		var _gaq = _gaq || [];
  		_gaq.push(['_setAccount', 'UA-19504837-4']);
  		_gaq.push(['_trackPageview']);
  		(function() {
    		var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
    		ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
    		var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
  		})();    
    </g:javascript>
   <body onLoad="init()">
        <div id="loading">
			<img src="${resource(dir:'images/stl',file:'large-loading.gif')}" border=0>
		</div>
        <div class="wrapper">
			<div class="header-content">
				<div class="header">
        			<div class="content">
        				<g:render template="/layouts/mixel/head" />
        				<g:layoutBody />
        				<div class="cleaner"/></div>
        			</div>
        		</div>
        	</div>
		</div>
		<g:render template="/layouts/mixel/footerCorusel" />
		<div class="copy" style="float:left;">
			&copy;&nbsp;2011, Компания «Миксэлектро» <br> <a href="${createLink(action:'dynSimple', params:[page:'contacts'])}">Контактная
				информация</a>
		</div>
		<div style="float:left; margin-left: 100px;">
			<!-- begin of Top100 counter -->
			<script id="top100Counter" type="text/javascript" src="http://counter.rambler.ru/top100.jcn?2473672"></script>
			<noscript>
			<a href="http://top100.rambler.ru/navi/2473672/">
				<img src="http://counter.rambler.ru/top100.cnt?2473672" alt="Rambler's Top100" border="0" />
			</a>
			</noscript>
			<!-- end of Top100 counter -->
		</div>
		
		<div style="float:left; margin-left: 5px;">
			<!--Rating@Mail.ru counter-->
			<script language="javascript"><!--
				d=document;var a='';a+=';r='+escape(d.referrer);js=10;//--></script>
			<script language="javascript1.1"><!--
				a+=';j='+navigator.javaEnabled();js=11;//--></script>
			<script language="javascript1.2"><!--
				s=screen;a+=';s='+s.width+'*'+s.height;
				a+=';d='+(s.colorDepth?s.colorDepth:s.pixelDepth);js=12;//--></script>
			<script language="javascript1.3"><!--
				js=13;//--></script><script language="javascript" type="text/javascript"><!--
				d.write('<a href="http://top.mail.ru/jump?from=2042414" target="_top">'+
					'<img src="http://da.c2.bf.a1.top.mail.ru/counter?id=2042414;t=53;js='+js+
					a+';rand='+Math.random()+'" alt="Рейтинг@Mail.ru" border="0" '+
					'height="31" width="88"><\/a>');if(11<js)d.write('<'+'!-- ');//--></script>
			<noscript><a target="_top" href="http://top.mail.ru/jump?from=2042414">
			<img src="http://da.c2.bf.a1.top.mail.ru/counter?js=na;id=2042414;t=53" 
				height="31" width="88" border="0" alt="Рейтинг@Mail.ru"></a></noscript>
			<script language="javascript" type="text/javascript"><!--
				if(11<js)d.write('--'+'>');//--></script>
			<!--// Rating@Mail.ru counter-->
		</div>
		
		<div style="float:left; margin-left: 5px;">
		<!--LiveInternet counter--><script type="text/javascript"><!--
			document.write("<a href='http://www.liveinternet.ru/click' "+
					"target=_blank><img src='//counter.yadro.ru/hit?t53.13;r"+
					escape(document.referrer)+((typeof(screen)=="undefined")?"":
						";s"+screen.width+"*"+screen.height+"*"+(screen.colorDepth?
								screen.colorDepth:screen.pixelDepth))+";u"+escape(document.URL)+
								";"+Math.random()+
								"' alt='' title='LiveInternet: показано число просмотров и"+
								" посетителей за 24 часа' "+
								"border='0' width='88' height='31'><\/a>")
			//--></script><!--/LiveInternet-->
		</div>
		
		<div style="float:right;clear:right;">
			<p id="ks">
				<a href="${createLink(action:'empty')}">Создание сайта</a>&nbsp;&mdash;&nbsp;<span>CurdesLab</span>
			</p>
		</div>
    </body>
</html>