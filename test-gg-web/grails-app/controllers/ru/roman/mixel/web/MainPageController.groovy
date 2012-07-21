package ru.roman.mixel.web


import java.util.logging.Level;
import java.util.logging.Logger;

import org.apache.commons.lang.math.NumberUtils;
import org.datanucleus.store.appengine.query.StreamingQueryResult;

import ru.roman.mixel.srv.CacheService;
import ru.roman.mixel.srv.DaoService;
import ru.roman.mixel.srv.DataService
import ru.roman.mixel.dao.CatalogMenuItem;
import ru.roman.mixel.dao.Product;
import ru.roman.mixel.dao.MainMenu;

import ru.roman.mixel.util.*;


/**
 * {@code MainPageController} Основной контроллер приложения
 * 
 * @author Churganov Roman 
 *
 */
class MainPageController {
	private final Logger log = Logger.getLogger(this.class.getName());
	
	/** @see {@link CacheService} */
	CacheService cacheService
	/** @see {@link DaoService} */
	DaoService daoService
	/** @see {@link DataService} */
	DataService dataService; 
	
	
	/**
	 *  Берем список основного меню или каталога
	 * 
	 * @return {@link java.lang.Object}
	 */
	List findCatalogItemsList() {
		return dataService.findAllCached(Mixel.Keys.MAIN_MENU_ITEMS, 
						"select c from CatalogMenuItem c order by c.id", null);
	}
	
	
	/** первая страница сайта */
	def index = {
		def catalogItemsList = findCatalogItemsList();
		model:[catalogItemsList:catalogItemsList]
		}

	def search = {}


	/** Динамическая страница подгружаемая из AppStore */
	def dynSimple = {

		//DaoUtils.listAll(MainMenu);
		def menu = daoService.findFirst("select m from MainMenu m where m.page=?1", params.page)
		model:[text:menu?.text, header:menu?.header]
	}
	
	def productions = {}
	
	/** страница каталога */
	def catalog = {
		//println "!!!!!!!!!!!!!!!!!!!!!!!!!!: " + request.getHeader("URL")
		
		def catalogItemsList = findCatalogItemsList();
		
		def products = null;
		def activeItem = null;
		def activeSubItem = null;
		def activeSubSubItem = null;
		def additionalLoad = null;
		
		if (params.catItem && NumberUtils.isDigits(params.catItem)) {
			activeItem = Integer.valueOf(params.catItem)			
			products = daoService.findAll("select p from Product p where p.menuId=?1 order by p.id", activeItem)
			def tmpItem
			for (item in catalogItemsList) { 
				if (item.id == activeItem && item.parent != 0) {
					activeItem = item.parent
					activeSubItem = item.id
					for (subItem in catalogItemsList) {
						if (subItem.id == activeItem  && subItem.parent != 0) {
							activeItem = subItem.parent
							activeSubItem = subItem.id
							activeSubSubItem = item.id
							break
						}
					}
					break
				}
			}
			if (products.isEmpty()) {
				additionalLoad = "$activeItem,$activeSubItem,$activeSubSubItem";
			}
		} 	
		
		
		model:[catalogItemsList:catalogItemsList, products:products, additionalLoad:additionalLoad,
			activeItem:activeItem, activeSubItem:activeSubItem, activeSubSubItem:activeSubSubItem]
		}
	

	def empty = {}

	/** переход к административной консоли */
	def grailsConsole = {}
	
	/** Очистка кэша */
	def clearCache = { 
		cacheService.clearAll();
		render "done."
	}
}
