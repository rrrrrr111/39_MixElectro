

	:: 
	:: 
	:: 

set SCRIPTS_HOME="C:/1_work/39_MixElectro/test-gg-web"
set GRAILS_HOME=C:/1_work/40_STS/02_grails/grails-1.3.7
set APPENGINE_HOME=C:/1_work/40_STS/01_appengine-java-sdk/appengine-java-sdk-1.6.0

cd %SCRIPTS_HOME%

call %SCRIPTS_HOME%/killJava.cmd
call %GRAILS_HOME%/bin/grails.bat run-app
