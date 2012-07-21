package ru.roman.mixel.srv

import java.util.logging.Level;
import java.util.logging.Logger;

/**
 * {@code DataService} Поддерживает функции использующие совместно кэш и работу с БД
 * 
 * @author Churganov Roman 11.12.2011
 *
 */
class DataService {
	private final Logger log = Logger.getLogger(this.class.getName());
    static transactional = true

	/** @see {@link CacheService} */
	CacheService cacheService
	/** @see {@link DaoService} */
	DaoService daoService
	
    /**
     * Данные берутся из БД и кэшируются, далее берутся из кэша, 
     * используется обычный запрос к БД
     * 
     * @return {@link List}
     */
    List findAllCached(String key, String jqlQuery, Object...queryParams) {
		// сначала берем из кеша
		List resultList = cacheService.getItem(key);
		// берем из БД
		if(!resultList) {
			try {
				resultList = daoService.findAll(jqlQuery, queryParams);
				log.info("List has got from DB");
				cacheService.putItem(key, resultList);
			} catch (Throwable e) {
				log.log(Level.INFO, "Error while retriving list from DB", e);
			}
		} else {
			log.info("List has got from cashe");
		}
		return resultList;
    }
	
	
	/**
	* Данные берутся из БД и кэшируются, далее берутся из кэша,
	* используется запрос к БД возвращающий только первую строку
	*
	* @return {@link List}
	*/
   def findFirstCached(String key, String jqlQuery, Object...queryParams) {
	   // сначала берем из кеша
	   def data = cacheService.getItem(key);
	   // берем из БД
	   if(!data) {
		   try {
			   data = daoService.findFirst(jqlQuery, queryParams);
			   log.info("Data has got from DB");
			   cacheService.putItem(key, data);
		   } catch (Throwable e) {
			   log.log(Level.INFO, "Error while retriving data from DB", e);
		   }
	   } else {
		   log.info("Data has got from cashe");
	   }
	   return data;
   }
}
