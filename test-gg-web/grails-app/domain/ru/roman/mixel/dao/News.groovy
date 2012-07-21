package ru.roman.mixel.dao

import java.io.Serializable;

import javax.persistence.*;
import com.google.appengine.api.datastore.*;

/**
 * <code>News</code> Сущность новость
 * 
 * @author Roman Churganov 30.04.2011
 *
 */
@Entity
class News implements Serializable {

	@Transient
	def static final note = "Новости";

	/**  */
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	Long id
	/** Текст новости */
	@Basic
	Text text
	

}
