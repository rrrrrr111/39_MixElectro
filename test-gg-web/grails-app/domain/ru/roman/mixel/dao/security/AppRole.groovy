package ru.roman.mixel.dao.security

import java.io.Serializable;

import javax.persistence.*;
import javax.persistence.Entity;

import com.google.appengine.api.datastore.*;


/**
 * <code>AppRole</code>
 * 
 * @author Churganov Roman 26.11.2010
 *
 */
@Entity
public class AppRole implements Serializable {

	/** идентификатор */
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
    Long id;
	
	@Basic
    String name;
	
	@Basic
    String description;
	
}
