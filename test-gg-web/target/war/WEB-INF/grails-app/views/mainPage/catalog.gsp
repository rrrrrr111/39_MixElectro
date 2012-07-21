<%@ page contentType="text/html;charset=utf-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>
<head>
<meta name="layout" content="mixel" />
</head>
<body>
<g:javascript>
$(document).ready(function(){
	// активируем динамику на пунктах меню каталога
	$(".catItemCont").hover(
		function(){
			show($(this).find(".dynSubItem"));
		},
		function(){
			hide($(this).find(".dynSubItem"));
		});
	$(".subItemCont").hover(
		function(){
			show($(this).find(".dynSubSubItem"));
		},
		function(){
			hide($(this).find(".dynSubSubItem"));
		});
	if (isCatalogFragmentPresent()) {  // делаем дополнительную подгрузку данных пунка, если указан URL фрагмент
		loadCategoryItemsFromUrlFragment();
	} else {  // делаем дополнительную подгрузку данных пункта, если был параметр в URL
		<g:if test="${additionalLoad}">
		loadCategoryItems(${additionalLoad});
		</g:if>
	}
});
</g:javascript>
	<g:render template="/layouts/mixel/headMenu" />
	<div class="column1" style="width: 960px;">
		<h1>Каталог продукции</h1>
		<table>
			<tr>
				<td>
					<div class="column1" style="width: 300px;min-height: 800px;">
						<br/>
						<table style="margin-left: 10px; border-spacing: 0px; ">
						<g:each in="${catalogItemsList}" var="item">
							<g:if test="${item.parent == 0}">
							<tr id="${item.id}" class="catItemCont">
								<td>
									<g:link url="javascript:loadCategoryItems('${item.id}')">
										<img src="/images/cat/${item.code}.gif" alt="">
									</g:link>
								</td>
								<td>
									<div class="catItem">
									<g:link class="itemLink"
										url="javascript:loadCategoryItems('${item.id}')">
										<g:if test="${activeItem == item.id && !activeSubItem}">
											<strong class="itemText colorRed">${item.name}</strong>
										</g:if>
										<g:else>
											<strong class="itemText">${item.name}</strong>
										</g:else>
									</g:link>
									</div>
									
									<%-- под меню --%>	
									<g:each in="${catalogItemsList}" var="subItem">
										<g:if test="${subItem.parent == item.id}">
											<div id="${subItem.id}" class="subItemCont">
											<g:if test="${activeItem == item.id}">
											<div class="subItem staticSubItem">
											</g:if>	
											<g:else>
											<div class="subItem dynSubItem">
											</g:else>
											<ul>
												<li>
													<g:link class="itemLink"
														url="javascript:loadCategoryItems('${item.id}','${subItem.id}')">
															<g:if test="${activeSubItem == subItem.id && !activeSubSubItem}">
																<text class="subItemText colorRed">${subItem.name}</text>
															</g:if> 
															<g:else>
																<text class="subItemText">${subItem.name}</text>
															</g:else>
													</g:link>
												</li>
											</ul>
											</div>
											<%-- под под меню --%>
											
												<g:each in="${catalogItemsList}" var="subSubItem">
												<g:if test="${subSubItem.parent == subItem.id}">
													<g:if test="${activeSubItem == subItem.id}">
													<div id="${subSubItem.id}" class="subSubItem staticSubSubItem">
													</g:if>
													<g:else>
													<div id="${subSubItem.id}" class="subSubItem dynSubSubItem">
													</g:else>
													<ul>
														<li>
															<g:link class="itemLink"
																url="javascript:loadCategoryItems('${item.id}','${subItem.id}','${subSubItem.id}')">
																<g:if test="${activeSubSubItem == subSubItem.id}">
																	<text class="subSubItemText colorRed">${subSubItem.name}</text>
																</g:if> 
																<g:else>
																	<text class="subSubItemText">${subSubItem.name}</text>
																</g:else>
															</g:link>
														</li>
													</ul>
													</div>
												</g:if>
												</g:each>
												</div>
										</g:if>
									</g:each>
								</td>
							</tr>
							</g:if>
						</g:each>
						</table>
					</div>
				</td>
				<td>
					<div class="column2" style="width: 650px;">
						<div id="categoryItems">
						<table width="100%">
						<g:each in="${products}" var="product">
							<tr>
								<td width="1px">	
									<div class="product">
										<strong>|</strong>
									</div>
								</td>
								<td>	
									<div class="product">
										${product.name}
									</div>
								</td>
								<td align="right">	
									<div class="product">
										<strong>|</strong>
									</div>
								</td>
							</tr>
						</g:each>
						</table>
						</div>
					</div>
				</td>
			</tr>
		</table>
	</div>
	<br/>
	<br/>

	<div width="600px" class="column2">
		<div id="errMessageBox" title="Сообщение об ошибке">
		<p>
			<div class="ui-widget">
				<div class="ui-state-error ui-corner-all" style="padding: 0 .7em;">
					<p>
						<span class="ui-icon ui-icon-alert" style="float: left; margin-right: .3em;"></span>
						<strong>Произошла ошибка при обработке запроса, обратитесь к менеджеру компании.</strong>
					</p>
				</div>
			</div>
		</p>
	</div>
	<script type="text/javascript">
    // Dialog
    $('#errMessageBox').dialog({
            autoOpen: false,
            width: 600,
            buttons: {
                    "Закрыть": function() {
                            $(this).dialog("close");
                    }
            }
    });
	</script>	
</body>
</html>