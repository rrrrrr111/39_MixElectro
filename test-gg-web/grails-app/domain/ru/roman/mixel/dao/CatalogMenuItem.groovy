package ru.roman.mixel.dao

import javax.persistence.*;
import com.google.appengine.api.datastore.*;

/**
 * <code>CatalogMenuItem</code>
 * 
 * @author Roman Churganov 30.04.2011
 *
 */
@Entity
class CatalogMenuItem implements Serializable {

	@Transient
	def static final note = "Пункты меню каталога";

	/** идентификатор */
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	Long id
	
	/** код, имя картинки или еще что-то */
	@Basic
	String code
	
	/** родительский пункт меню */
	@Basic
	Long parent
	
	/** название пункта */
	@Basic
	String name
}
