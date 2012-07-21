package ru.roman.mixel.srv

import org.springframework.orm.jpa.JpaTemplate;
import org.springframework.transaction.support.TransactionCallback
import org.springframework.transaction.support.TransactionTemplate;
import com.google.appengine.api.datastore.*;

/**
 * {@code DaoService} Методы для работы с DAO cущностями
 * 
 * @author Churganov Roman 
 *
 */
class DaoService {

	JpaTemplate jpaTemplate
	TransactionTemplate transactionTemplate
	static transactional = true

	def listAll(Class ent) {
		def i = 0
		ent.list().each {
			i++
			println "$i :: $it.properties"
		}
	}

	def find(Class ent, String id) {
		jpaTemplate.find("select e from $ent.name e where e.addId=$id")
	}

	def save(ent) {
		transactionTemplate.execute( { status ->
			if(!ent.hasErrors() && ent.validate() ) {
				jpaTemplate.persist(item)
				jpaTemplate.flush()
				println "Entity saved : $ent.id"
			} else {
				status.setRollbackOnly()
				if (!ent.save())
					ent.errors.each { println it }
			}
		} as TransactionCallback )
	}

	/**
	 * Выполнение замыкания в транзакции
	 * 
	 * @return <code>java.lang.Object</code>
	 */
	def executeInTransaction(cls) {
		transactionTemplate.execute( { status ->
			cls?.call(status);
		} as TransactionCallback )
	}
	
	/**
	 * перечисление через запятую
	 * 
	 * @return <code>java.lang.Object</code>
	 */
	def getIds(def subs) {
		if (subs) {
			def res = "";
			def count
			subs.eachWithIndex {
				if (index == subs.size - 1)
					res += it 
				else 
					res += "$it,"
			}
			res
		}
	}
	
	/**
	 * Ищем первый по запросу с парамерами 
	 * 
	 * @return <code>java.lang.Object</code>
	 */
	def findFirst(String queryString, Object...values) { 
		def res = jpaTemplate.find(queryString, values);
		if (res) 
			return res.get(0);
		else
			return null;
	}
	
	/**
	* Ищем все по запросу с параметрами
	*
	* @return <code>java.lang.Object</code>
	*/
   List findAll(String queryString, Object...values) {
	   def resultList = new ArrayList();
	   def res = jpaTemplate.find(queryString, values);
	   if (res) {
			for (var in res) {
				resultList.add var
			}
	   }	 
	   return resultList;
   }
	
	def findAllEnt(Class ent){
		jpaTemplate.find("select e from $ent.name e")
	}
	
}
