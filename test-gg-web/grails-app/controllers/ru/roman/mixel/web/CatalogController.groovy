package ru.roman.mixel.web

import org.apache.commons.lang.math.NumberUtils;

import ru.roman.mixel.srv.CacheService;
import ru.roman.mixel.srv.DaoService;
import ru.roman.mixel.srv.DataService;
import ru.roman.mixel.util.Mixel;
import ru.roman.mixel.dao.CatalogMenuItem;
import ru.roman.mixel.dao.Product;
import ru.roman.mixel.dao.MainMenu;
import groovy.xml.MarkupBuilder;

/**
 * <code>CatalogController</code> Контроллер AJAX вызовов для каталога
 * 
 * @author Roman Churganov 15.05.2011
 *
 */
class CatalogController {
	
	/** @see {@link CacheService} */
	CacheService cacheService
	/** @see {@link DaoService} */
	DaoService daoService
	/** @see {@link DataService} */
	DataService dataService; 

    def categoryItems = { 
		
		List products
		if (params.catItem && NumberUtils.isDigits(params.catItem)) {
			def activeItem = Integer.valueOf(params.catItem)
			products = daoService.findAll("select p from Product p where p.menuId=?1 order by p.id", activeItem)
		}
		
		//final Writer result = new StringWriter();
		//final MarkupBuilder bilder = new MarkupBuilder(new PrintWriter(result))

		if (!products.isEmpty()) {
			render (contentType:"text/html", encoding:Mixel.Consts.ENCODING) {
				table(width: "100%") {
				for (var in products) {
					tr {
							td (width:"1px"){
								div ('class':'product') {
									strong('|')
								}
							}
							td {
								div ('class':'product') {
									'span' var.name
								}
							}
							td (align:"right"){
								div ('class':'product') {
									strong('|')
								}
							}
						}
					} 
				}
			}
		} else { 
			render (contentType:"text/html", encoding:Mixel.Consts.ENCODING) {
				div {
					div('id':"emptyMess", 'class':"infoText", 'На данный момент в выбранном разделе'
						+ ' каталога отсутствует продукция,')
					div('id':"emptyMess", 'class':"infoText", 'уточните информацию у менеджера компании.')
				}
				
			}
		}
			
	}
}
