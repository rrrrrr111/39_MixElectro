package ru.roman.mixel.srv


import java.util.Map;
import net.sf.jsr107cache.Cache
import net.sf.jsr107cache.CacheException;
import net.sf.jsr107cache.CacheFactory;
import net.sf.jsr107cache.CacheManager;
import com.google.appengine.api.memcache.stdimpl.GCacheFactory;

import java.util.logging.Level;
import java.util.logging.Logger;

import ru.roman.mixel.util.Mixel;


/**
 * {@code CacheService} Работа с кешем
 * 
 * @author Churganov Roman 04.12.2011
 *
 */
class CacheService {
	private final Logger log = Logger.getLogger(this.class.getName());
	final static int SECONDS_IN_HOUR = 3600
	final static int SECONDS_IN_DAY = SECONDS_IN_HOUR * 24
    static transactional = true
		
	/**
	 * Получение экземпляра кеша
	 * 
	 * @return {@link Cache}
	 */
	Cache getCacheInstanse() {
		Cache cache = null;
			Map props = new HashMap();
			props.put(GCacheFactory.EXPIRATION_DELTA, SECONDS_IN_DAY);
			try {
				CacheFactory cacheFactory = CacheManager.getInstance().getCacheFactory();
				cache = cacheFactory.createCache(props);
			} catch (Throwable e) {
				log.log(Level.WARNING, "Error while instantiating cashe", e);
			}
		return cache;
	}
	
	/**
	 * Берем из кеша
	 * 
	 * @return {@link Object}
	 */
	Object getItem(String key) {
		Cache cache = getCacheInstanse();
		Object value = null;
		if (cache != null) {
			try {
				value = cache.get(key);
				log.info("$value has got from cache by key $key");
			} catch (Throwable e) {
				log.log(Level.WARNING, "Error while retriving from cashe", e); 
				return value;
			}
		}
		return value;
	}
	
	/**
	 * Кладем в кеш
	 * 
	 * @return {@link boolean}
	 */
	boolean putItem(String key, Object value) {
		Cache cache = getCacheInstanse();
		if (cache != null) {
			try {
				cache.put(key, value);
				log.info("$value has put to cashe under $key");
				return true;
			} catch (Throwable e) {
				log.log(Level.WARNING, "Error while putting to cashe", e);
				return false;
			}
		} else 
			return false;
	}
	
	/**
	 * Удаление элемента из кеша
	 * 
	 * @return {@link boolean}
	 */
	boolean remove(String key) {
		Cache cache = getCacheInstanse();
		if (cache != null) {
			try {
				if (key != null) {
					cache.remove(key);
					log.info("$key has removed from cashe");
				} 
				return true;
			} catch (Throwable e) {
				log.log(Level.WARNING, "Error while cashe clearing", e);
				return false;
			}
		} else
			return false;
	}
	
	/**
	 * Очистка кеша
	 * 
	 * @return {@link boolean}
	 */
	boolean clearAll() {
		Cache cache = getCacheInstanse();
		if (cache != null) {
			try {
				Set set = new HashSet();
				set.add Mixel.Keys.MAIN_MENU_ITEMS;
				set.add Mixel.Keys.TL_PHONE;
				
				for (def key : set) {
					if (cache.containsKey(key)) {
						cache.remove(key);
						log.info("$key has removed from cashe");
					} else {
						log.info("$key has't removed from cashe, because absent");
					}
				} 
				return true;
			} catch (Throwable e) {
				log.log(Level.WARNING, "Error while cashe clearing", e);
				return false;
			}
		} else
			return false;
	}
}
