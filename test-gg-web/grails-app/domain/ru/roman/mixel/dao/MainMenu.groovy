package ru.roman.mixel.dao

import java.io.Serializable;

import javax.persistence.*;

import com.google.appengine.api.datastore.*;



/**
 * <code>MainMenu</code>  
 * 
 * @author Roman Churganov 10.04.2011
 *
 */
@Entity
class MainMenu implements Serializable {

	@Transient
	def static final note = "Элементы главного меню";

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	Long id
	/** параметр необходимый для перехода на страницу */
	@Basic(optional=false)
	String page
	/** заголовок */
	@Basic
	String header
	/** текст страницы */
	@Basic
	Text text

}
