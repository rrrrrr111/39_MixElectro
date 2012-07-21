package ru.roman.mixel.dao.security;

import java.io.Serializable;

import javax.persistence.*;
import javax.persistence.Entity;

import com.google.appengine.api.datastore.*;


/**
 * <code>AppUser</code>
 * 
 * @author Churganov Roman 26.11.2010
 * 
 */
@Entity
public class AppUser implements Serializable {

	/** идентификатор */
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	Long id;
	
	@Basic
	String email;
	
	@Basic
	String password;
	
	@Basic
	String firstName;
	
	@Basic
	boolean enabled;
	
	@Basic
	String website;
	
	@Basic
	Date registrationDate;

}
