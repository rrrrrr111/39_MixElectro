/** картинка типа загрузка в каталоге */
var mixel_jstpl_loading = "<div class='loadingCatalog'><img src='/images/stl/large-loading.gif' border=0></div>";
var mixel_jstpl_empty = "";

/**
 * При загрузке страницы
 */
$(function() {
	init();
	if ($('#radioset').length) {
		$('#radioset').buttonset();		
		$('#dialog_link, ul#icons li').hover(
				function() { $(this).addClass('ui-state-hover'); }, 
				function() { $(this).removeClass('ui-state-hover'); }
			);
	}	
	// строка поиска
	if ($('#search').length) {
		$('#search').textCheck({
			text : 'Поиск по сайту и каталогу'
		});
	}
	// добавить в избранное
	if ($('#add_favorite').length) {
		$('#add_favorite').click(
			function() {
				var title_htm = document.title;
				var url_this = document.location;
				try {
					window.external.AddFavorite(url_this, title_htm);
				} catch (e) {
					try {
						window.sidebar.addPanel(title_htm, url_this, '');
					} catch (e) {
						if (typeof (opera) == "object") {
							this.rel = "sidebar";
							this.title = title_htm;
							this.url = url_this;
							return true;
						} else {
							alert('Нажмите Ctrl-D чтобы добавить страницу в закладки');
						}
					}
				}
				return false;
			});
	}
	// запуск верхней карусели
	if ($('#listcorusel').length) {
		var img_corusel = $('#corusel img');
		var div_img = $('#corusel div');
		var width_corusel = 980;
		var str_li = '';
		var page = 1;
		var curr_page = -1;
		for ( var i = 1; i <= img_corusel.length; i++) {
			str_li += '<li>' + i + '</li>';
		}
		$('#listcorusel').append(str_li);
		var li = $('#listcorusel li');
		li.eq(0).addClass('curr');
		function run_corusel() {
			if (curr_page == -1) {
				if (page == img_corusel.length) {
					page = 0;
				}
			} else {
				page = curr_page;
			}
			div_img.stop().animate({
				marginLeft : -1 * page * width_corusel
			}, 600);
			setTimeout(function() {
				li.removeClass('curr');
				li.eq(page).addClass('curr');
				page++;
			}, 400);
		}
		var loop_corusel = setInterval(run_corusel, 30000);
		li.bind('click', function() {
			clearInterval(loop_corusel);
			curr_page = li.index($(this));
			run_corusel();
			curr_page = -1;
			loop_corusel = setInterval(run_corusel, 30000);
		});
	}
	// запуск нижней карусели
	if ($('.brands').length) {
		var brands = $('.brands');
		var brands_ul = brands.find('ul');
		var brands_link = brands_ul.find('li');
		var width_brands = brands.width();
		var ind_clone = 0;
		var uoter_w_b = 0;
		var save_app_str = brands_ul.html();
		var app_str = '';
		setTimeout(function() {
			brands_link.each(function() {
				uoter_w_b += $(this).outerWidth(true);
			});
			var _duration = uoter_w_b * 45; 
			var _k = 1;
			while (uoter_w_b * ind_clone <= width_brands * 3) {
				app_str += save_app_str;
				ind_clone++;
			}
			brands_ul.html(app_str);
			brands_link = brands_ul.find('li');
			var anim = function() {
				brands_ul.animate({
					marginLeft : -1 * (uoter_w_b + 23)
				}, {
					queue : false,
					duration : _duration * _k,
					easing : 'linear',
					complete : function() {
						brands_ul.css('margin-left', '0');
						_k = 1;
						anim();
					}
				});
			};
			anim();
			brands_link.hover(function() {
				var elem = $(this);
				elem.parent().stop();
				elem.stop().animate({
					opacity : 1
				}, 500);
			},
					function() {
						$(this).stop().animate({
							opacity : 0.3
						}, 500);
						_k = ((uoter_w_b + 23) + parseInt(brands_ul
								.css('margin-left')))
								/ (uoter_w_b + 23);
						anim();
					});
		}, 2000);
	}
});

/**
 * Загрузка продукции каталога
 * 
 * @param url
 * @param itemId
 * @param subItemId
 * @param subSubItemId
 */
function loadCategoryItems(itemId, subItemId, subSubItemId) {
	
	var contextTeg = $("#categoryItems"); 
	contextTeg.html(mixel_jstpl_loading);
	var activeItem = changeActiveCatalogItem(itemId, subItemId, subSubItemId);
	
	$.ajax({
		  url: "/catalog/categoryItems?catItem=" + activeItem,
		  type: "POST",
		  dataType: "html",
		  context: contextTeg,
		  statusCode: {
			  404: function() {
				  contextTeg.html(mixel_jstpl_empty);
				  $('#errMessageBox').dialog('open');
			  },
			  500: function() {
				  contextTeg.html(mixel_jstpl_empty);
				  $('#errMessageBox').dialog('open');
			  }
		  },
		  success: function(data, textStatus, jqXHR){
			  // deb('Load was performed.');
			 //$.when(mixel_show_defered, mixel_hide_defered).done(function() {
				  
			  //Deferred});
			  contextTeg.html(data);
		  }
		});	
}

/**
 * Фиксация выбранного пункта меню в каталоге, если у пункта есть подпункты,
 * выбирается первый подпункт
 * 
 * @param url
 * @param itemId
 * @param subItemId
 * @param subSubItemId
 */
function changeActiveCatalogItem(itemId, subItemId, subSubItemId) {
	
	// убираем все красные стили
	var historySet = '';
	$('.colorRed').removeClass('colorRed');
	$('.staticSubItem').removeClass('staticSubItem').addClass('dynSubItem');
	$('.staticSubSubItem').removeClass('staticSubSubItem').addClass('dynSubSubItem');

	// инициируем параметры
	var levelMenu3 = checkUndef(subSubItemId);
	var levelMenu2 = checkUndef(subItemId);
	var levelMenu1 = checkUndef(itemId);	
	var redFlag = false;
	var activeItem = 0;
	
	if (levelMenu3){										// если вызвано для пункта 3 уровня
		var elem = $('#' + subSubItemId);					// ищем элемент
		elem.find('.subSubItemText').addClass('colorRed');  // ставим на него красный цвет
		redFlag = true;
		historySet = '/' + subSubItemId;					// накапливаем индикатор URL
		activeItem = subSubItemId;
	}
	if (levelMenu2) {										// если вызвано для пункта 2 или 3 уровня
		var elem = $('#' + subItemId);						// ищем элемент
		elem.find('.dynSubSubItem').queue(function () {		// ставим в очедь чтобы изменение класса происходило по завершению анимации
			show($(this)).removeClass('dynSubSubItem').addClass('staticSubSubItem'); // отображаем статичными его подпункты
			$(this).dequeue();
		});
		if (!redFlag){										// если еще никому не ставили красный, тоесть выбран именно этот пункт
			var subItemText = elem.find('.subItemText');
			subItemText.addClass('colorRed');				// ставим на него красный цвет
			redFlag = true;
			activeItem = subItemId;
			var subSubItems = elem.find('.subSubItem'); 	// ищем элементы уровня 3
			if (subSubItems.size() > 0) {					// если есть дочерние пункты меню уровня 3
				subItemText.removeClass('colorRed');		// убираем красный цвет c меню второго уровня
				var subSubItem = $(subSubItems.get(0));		// ищем первый дочерний
				subSubItem.find('.subSubItemText').addClass('colorRed');
				activeItem = subSubItem.attr("id");			// меняем активный элемент
			}
		}		
		historySet = '/' + subItemId + historySet;			// накапливаем индикатор URL
	}
	if (levelMenu1) {										// если вызвано для пункта 1, 2 или 3 уровня
		var elem = $('#' + itemId);							// ищем элемент
		var subItems = elem.find('.subItem');				// ищем подпункты	
		subItems.queue(function () {						// ставим в очедь чтобы изменение класса происходило по завершению анимации
			show($(this)).removeClass('dynSubItem').addClass('staticSubItem'); // отображаем статичными его подпункты
			$(this).dequeue();
		});
		if (!redFlag) {										// если еще никому не ставили красный, тоесть выбран именно этот пункт
			var itemText = elem.find('.itemText'); 
			itemText.addClass('colorRed');					// ставим на него красный цвет
			activeItem = itemId;
			if (subItems.size() > 0) {						// если есть дочерние пункты меню уровня 2
				itemText.removeClass('colorRed');			// убираем с него красный цвет
				var subItem = $(subItems.get(0));			// ищем первый дочерний
				var subItemText = subItem.find('.subItemText');
				subItemText.addClass('colorRed');			// ставим красный цвет на первый дочерний
				var subItemCont = $(elem.find('.subItemCont').get(0));// ищем контейнер под элементов
				activeItem = subItemCont.attr("id");		// меняем активный элемент
				var subSubItems = subItemCont.find('.subSubItem'); // ищем элементы уровня 3
				if (subSubItems.size() > 0) {				// если есть дочерние пункты меню уровня 3
					subItemCont.find('.dynSubSubItem').queue(function () {	// ставим в очедь чтобы изменение класса происходило по завершению анимации
						show($(this)).removeClass('dynSubSubItem').addClass('staticSubSubItem'); // отображаем статичными его подпункты
						$(this).dequeue();
					});
					subItemText.removeClass('colorRed');	// убираем красный цвет c меню второго уровня
					var subSubItem = $(subSubItems.get(0));	// ищем первый дочерний
					subSubItem.find('.subSubItemText').addClass('colorRed');
					activeItem = subSubItem.attr("id");		// меняем активный элемент
				}
			} 	
		}
		historySet = 'item' + itemId + historySet;			// накапливаем URL фрагмент
	}
	
	// скрываем не нужные оставшиеся видимыми динамические пункты меню
	hide($('.dynSubItem'));
	hide($('.dynSubSubItem'));
	
	// добавляем URL фрагмент
	window.location.hash = (historySet);
	return activeItem;
}

/**
 * Проверка наличия корректного URL фрагмента
 * @returns {Boolean}
 */
function isCatalogFragmentPresent() {
	if (checkUndef(window.location.hash) && window.location.hash.search("^\\#item[\\d\\/]+") == 0) {
		return true;		
	} else {
		return false;	
	}
}

/**
 * Переход в нужный пункт меню приналичии URL фрагмента
 */
function loadCategoryItemsFromUrlFragment() {
	var fragment = window.location.hash;
	var numbers = fragment.substring(5).split("/");
	if (numbers.length == 1) {
		loadCategoryItems(numbers[0]);
	} else if (numbers.length == 2) {
		loadCategoryItems(numbers[0],numbers[1]);
	} else if (numbers.length == 3) {
		loadCategoryItems(numbers[0],numbers[1],numbers[2]);
	} else {
		$('#errMessageBox').dialog('open');
	}
}

/**
 * @param varab - объект анимации
 * @param callBack - функция выполняемая по завершению анимации
 * @returns varab
 */
function hide(varab, callBack) {
	return varab.animate({opacity: "hide"}, "slow", callBack);
	//varab.animate({ height: "0px" }, {queue:false, duration:"slow"} );
}

/**
 * @param varab - объект анимации
 * @param callBack - функция выполняемая по завершению анимации
 * @returns varab
 */
function show(varab, callBack) {
	return varab.animate({opacity: "show"}, "slow", callBack);
	//varab.animate({ height: "80px" }, {queue:false, duration:"slow"} );
}

/**
 * Проверка на пустоту
 * 
 * @param varab
 * @returns {Boolean}
 */
function checkUndef(varab) {
	return (typeof(varab) != 'undefined' && varab != null);
}

/**
 * Функция для корректной отрисовки страницы по мере загрузки 
 */
function init() {
	var ld=(document.all);
	var ns4=document.layers;
	var ns6=document.getElementById&&!document.all;
	var ie4=document.all;
	if (ns4)
		ld=document.loading;
	else if (ns6)
		ld=document.getElementById("loading").style;
	else if (ie4)
		ld=document.all.loading.style;
	if (ns4) {
		ld.visibility = "hidden";
	} else if (ns6 || ie4)
		ld.display = "none";
}

function deb(mess) {
	window.alert("Отладка:" + mess);
}
