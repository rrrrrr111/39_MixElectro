package ru.roman.mixel.dao

import java.io.Serializable;

import javax.persistence.*
import com.google.appengine.api.datastore.*;

/**
 * <code>Product</code> 
 * 
 * @author Roman Churganov 30.04.2011
 *
 */
@Entity
class Product implements Serializable {

	@Transient
	def static final note = "Продукция";
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	Long id
	
	/** наименование */
	@Basic
	String name
	
	/** цена */
	@Basic
	String prise
	
	/** идентификатор компании производителя */
	@Basic
	String partnerCode
	
	/** идентификатор пункта меню */
	@Basic
	Long menuId
}
