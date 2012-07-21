<html>
    <head>
        <meta name="layout" content="main" />
    </head>
    <body>
        <div id="nav">
            <div class="homePagePanel">
                <div class="panelTop"></div>
                <div class="panelBody">
                    <h1>Application Status</h1>
                    <ul>
                        <li>GAE App version: <g:meta name="app.version"></g:meta></li>
                        <li>Release version: <g:meta name="app.release.version"></g:meta></li>
                        <li>Grails version: <g:meta name="app.grails.version"></g:meta></li>
                        <li>Groovy version: ${org.codehaus.groovy.runtime.InvokerHelper.getVersion()}</li>
                        <li>JVM version: ${System.getProperty('java.version')}</li>
                        <li>Controllers: ${grailsApplication.controllerClasses.size()}</li>
                        <li>Domains: ${grailsApplication.domainClasses.size()}</li>
                        <li>Services: ${grailsApplication.serviceClasses.size()}</li>
                        <li>Tag Libraries: ${grailsApplication.tagLibClasses.size()}</li>
                    </ul>
                    <h1>Installed Plugins</h1>
                    <ul>
                        <g:set var="pluginManager"
                               value="${applicationContext.getBean('pluginManager')}"></g:set>

                        <g:each var="plugin" in="${pluginManager.allPlugins}">
                            <li>${plugin.name} - ${plugin.version}</li>
                        </g:each>

                    </ul>
                </div>
                <div class="panelBtm"></div>
            </div>
        </div>
        <div id="pageBody">
            <h1>Application information:</h1>
            <p>
            <g:link url="/static/jquery-ui-widgets.html" >Available JQuery UI widgets</g:link>
            </p>

            <div id="controllerList" class="dialog">
                <h2>Available Controllers:</h2>
                <ul>
                    <g:each var="c" in="${grailsApplication.controllerClasses.grep{!it.fullName.contains('dao')}
                    			.sort { it.fullName }}">
                        <li class="controller"><g:link controller="${c.logicalPropertyName}">${c.fullName}</g:link></li>
                    </g:each>
                </ul>
                <br/>
                <h2>Available Domain Controllers:</h2>
                <ul>
                	<table style="border:none;">
                    <g:each var="c" in="${grailsApplication.controllerClasses.grep{it.fullName.contains('dao')}
                    			.sort { it.fullName } }">
                    	<tr><td>
                		<li class="controller"><strong>${c.fullName}</strong></li>
                		</td>
                		<td>
                		<g:link controller="${c.logicalPropertyName}">/${c.logicalPropertyName}</g:link>		
                		</td>
                		<td>
                			<strong>${c.name}</strong>
                		</td>
                		<td></td>
                		</tr>
                    </g:each>
                    </table>
                </ul>
                <h2>Systems tasks:</h2>
                <ul>
                	<li>
                		<g:link controller="mainPage" action="clearCache">Clear caches</g:link>	
                	</li>
                	<li>
                		<g:link controller="appEngineReload" action="index">Reload Engine</g:link>
                	</li>
                </ul>
            </div>
        </div>
    </body>
</html>
