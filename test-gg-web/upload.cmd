

	:: ��������� ������ ����������
	:: �������� � ���������� � ������
	:: ������ ���������� �� GAE


set SCRIPTS_HOME="C:/1_work/39_MixElectro/test-gg-web"
set JAVA_HOME=C:\Program Files\Java\jdk1.6.0_29
set GRAILS_HOME=C:/1_work/40_STS/02_grails/grails-1.3.7
set APPENGINE_HOME=C:/1_work/40_STS/01_appengine-java-sdk/appengine-java-sdk-1.6.0

cd %SCRIPTS_HOME%

	:: �������� � GAE

::call %SCRIPTS_HOME%/clean.cmd
::call %GRAILS_HOME%/bin/grails.bat set-version 3
::call %GRAILS_HOME%/bin/grails.bat app-engine package					:::: ���� �� ��������
call %APPENGINE_HOME%/bin/appcfg.cmd --email=curdes@gmail.com update ./target/war

	:: ��������� ������ ����

rem call %APPENGINE_HOME%/bin/appcfg.cmd --email=curdes@gmail.com update_cron ./target/war