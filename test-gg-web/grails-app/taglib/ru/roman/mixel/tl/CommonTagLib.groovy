package ru.roman.mixel.tl

import java.util.logging.Level;
import java.util.logging.Logger;

import ru.roman.mixel.dao.MainMenu;
import ru.roman.mixel.srv.CacheService;
import ru.roman.mixel.srv.DaoService;
import ru.roman.mixel.srv.DataService;
import ru.roman.mixel.util.Mixel;

/**
 * {@code CommonTagLib} Библиотека тегов общего назначения 
 * 
 * @author Churganov Roman 11.02.2012
 *
 */
class CommonTagLib {
	private final Logger log = Logger.getLogger(this.class.getName());
	
	/** @see {@link CacheService} */
	CacheService cacheService;
	/** @see {@link DaoService} */
	DaoService daoService;
	/** @see {@link DataService} */
	DataService dataService;
	
	
	/** подгрузка из БД/кэша некоторых данных */
	def cachedData = { attribs ->
		def dataId = attribs['dataId']
		MainMenu page = dataService.findFirstCached("$dataId", 
								"select m from MainMenu m where m.page=?1", dataId);
		//log.info("$page.text.value value in teg 'cachedData'");  // бросает NullPointerException
		
		if (page) {
			out << page.text.value
		} else {
			out << "";
		}
	}
	
	
	
	
}
