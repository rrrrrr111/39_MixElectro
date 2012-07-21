package ru.roman.mixel.dao.security



import ru.roman.mixel.srv.DaoService;

class AppRoleController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]
	DaoService daoService
	
    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [appRoleInstanceList: AppRole.list(params), appRoleInstanceTotal: AppRole.count()]
    }

    def create = {
		def appRoleInstance = new AppRole()
		appRoleInstance.properties = params
		[appRoleInstance: appRoleInstance]
    }

    def save = {
        def appRoleInstance = new AppRole(params)
        if (daoService.executeInTransaction {appRoleInstance.save(flush: true)}) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'appRole.label', default: 'AppRole'), appRoleInstance.id])}"
            redirect(action: "show", id: appRoleInstance.id)
        }
        else {
            render(view: "create", model: [appRoleInstance: appRoleInstance])
        }
    }

    def show = {
        def appRoleInstance = AppRole.get(params.id)
        if (!appRoleInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'appRole.label', default: 'AppRole'), params.id])}"
            redirect(action: "list")
        }
        else {
            [appRoleInstance: appRoleInstance]
        }
    }

    def edit = {
        def appRoleInstance = AppRole.get(params.id)
        if (!appRoleInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'appRole.label', default: 'AppRole'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [appRoleInstance: appRoleInstance]
        }
    }

    def update = {
        def appRoleInstance = AppRole.get(params.id)
        if (appRoleInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (appRoleInstance.version > version) {
                    
                    appRoleInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'appRole.label', default: 'AppRole')] as Object[], "Another user has updated this AppRole while you were editing")
                    render(view: "edit", model: [appRoleInstance: appRoleInstance])
                    return
                }
            }
            appRoleInstance.properties = params
            if (!appRoleInstance.hasErrors() && daoService.executeInTransaction {appRoleInstance.save(flush: true)}) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'appRole.label', default: 'AppRole'), appRoleInstance.id])}"
                redirect(action: "show", id: appRoleInstance.id)
            }
            else {
                render(view: "edit", model: [appRoleInstance: appRoleInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'appRole.label', default: 'AppRole'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def appRoleInstance = AppRole.get(params.id)
        if (appRoleInstance) {
            try {
                daoService.executeInTransaction {appRoleInstance.delete(flush: true)}
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'appRole.label', default: 'AppRole'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'appRole.label', default: 'AppRole'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'appRole.label', default: 'AppRole'), params.id])}"
            redirect(action: "list")
        }
    }
}
