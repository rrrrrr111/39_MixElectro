<span class="logo"> <a href="/"> <img
		src="/images/cust/logo1.gif" height="80px"
		alt="Миксэлектро. Ваш Поставщик Электротехники" class="png">
</a>
</span>
<div class="infoBoldText headerPhone">
	<g:cachedData dataId="tl-phone"/>
</div>

<div class="nav">
	<ul>
		<li><a href="${createLink(action:'index')}"><img
				src="/images/stl/nav_home.gif" alt="" title="Главная"> </a></li>
		<li><a
			href="${createLink(action:'dynSimple', params:[page:'siteMap'])}"><img
				src="/images/stl/nav_map.gif" alt="" title="Карта сайта"> </a></li>
		<li><a href="mailto:info@mixelektro.ru"><img
				src="/images/stl/nav_mail.gif" alt="" title="Обратная связь">
		</a></li>
		<li><a href="index.html#" id="add_favorite"><img
				src="/images/stl/nav_list.gif" alt=""
				title="Добавить сайт Миксэлектро в избранное"> </a></li>

	</ul>
</div>
<div class="search" style="margin-top: 30px;">
	<form action="${createLink(action:'search')}" method="post"
		name="f_search" id="f_search">
		<div>
			<table>
				<tr>
					<td><input type="text" name="q" id="search"
						value="Поиск по сайту и каталогу"></td>
					<td width="25px"><a href="${createLink(action:'search')}">
							<ul style="margin-top: 2px; margin-left: -38px" id="icons"
								class="ui-widget ui-helper-clearfix">
								<li style="height: 19px;" class="ui-state-default ui-corner-all"
									title="Поиск"><span
									style="margin-top: -17px; margin-left: 3px"
									class="ui-icon ui-icon-search"></span></li>
							</ul>
					</a></td>
				</tr>
			</table>
		</div>
	</form>
</div>