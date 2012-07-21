package ru.roman.mixel.dao



import ru.roman.mixel.srv.DaoService;

class NewsController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]
	def static final note = "Новости";
	DaoService daoService
	
    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [newsInstanceList: News.list(params), newsInstanceTotal: News.count()]
    }

    def create = {
		def newsInstance = new News()
		newsInstance.properties = params
		[newsInstance: newsInstance]
    }

    def save = {
        def newsInstance = new News(params)
        if (daoService.executeInTransaction {newsInstance.save(flush: true)}) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'news.label', default: 'News'), newsInstance.id])}"
            redirect(action: "show", id: newsInstance.id)
        }
        else {
            render(view: "create", model: [newsInstance: newsInstance])
        }
    }

    def show = {
        def newsInstance = News.get(params.id)
        if (!newsInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'news.label', default: 'News'), params.id])}"
            redirect(action: "list")
        }
        else {
            [newsInstance: newsInstance]
        }
    }

    def edit = {
        def newsInstance = News.get(params.id)
        if (!newsInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'news.label', default: 'News'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [newsInstance: newsInstance]
        }
    }

    def update = {
        def newsInstance = News.get(params.id)
        if (newsInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (newsInstance.version > version) {
                    
                    newsInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'news.label', default: 'News')] as Object[], "Another user has updated this News while you were editing")
                    render(view: "edit", model: [newsInstance: newsInstance])
                    return
                }
            }
            newsInstance.properties = params
            if (!newsInstance.hasErrors() && daoService.executeInTransaction {newsInstance.save(flush: true)}) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'news.label', default: 'News'), newsInstance.id])}"
                redirect(action: "show", id: newsInstance.id)
            }
            else {
                render(view: "edit", model: [newsInstance: newsInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'news.label', default: 'News'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def newsInstance = News.get(params.id)
        if (newsInstance) {
            try {
                daoService.executeInTransaction {newsInstance.delete(flush: true)}
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'news.label', default: 'News'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'news.label', default: 'News'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'news.label', default: 'News'), params.id])}"
            redirect(action: "list")
        }
    }
}
