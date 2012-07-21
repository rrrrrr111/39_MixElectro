package ru.roman.mixel.dao

import java.io.Serializable;

import javax.persistence.*;
import com.google.appengine.api.datastore.*;

/**
 * <code>Partner</code>
 * 
 * @author Roman Churganov 30.04.2011
 *
 */
@Entity
class Partner implements Serializable {

	@Transient
	def static final note = "Компании производители";
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	Long id
	@Basic
	String name
}
