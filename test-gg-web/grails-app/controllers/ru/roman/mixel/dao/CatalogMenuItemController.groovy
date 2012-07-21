package ru.roman.mixel.dao



import ru.roman.mixel.srv.DaoService;

class CatalogMenuItemController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]
	DaoService daoService
	
    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [catalogMenuItemInstanceList: CatalogMenuItem.list(params), catalogMenuItemInstanceTotal: CatalogMenuItem.count()]
    }

    def create = {
		def catalogMenuItemInstance = new CatalogMenuItem()
		catalogMenuItemInstance.properties = params
		[catalogMenuItemInstance: catalogMenuItemInstance]
    }

    def save = {
        def catalogMenuItemInstance = new CatalogMenuItem(params)
        if (daoService.executeInTransaction {catalogMenuItemInstance.save(flush: true)}) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'catalogMenuItem.label', default: 'CatalogMenuItem'), catalogMenuItemInstance.id])}"
            redirect(action: "show", id: catalogMenuItemInstance.id)
        }
        else {
            render(view: "create", model: [catalogMenuItemInstance: catalogMenuItemInstance])
        }
    }

    def show = {
        def catalogMenuItemInstance = CatalogMenuItem.get(params.id)
        if (!catalogMenuItemInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'catalogMenuItem.label', default: 'CatalogMenuItem'), params.id])}"
            redirect(action: "list")
        }
        else {
            [catalogMenuItemInstance: catalogMenuItemInstance]
        }
    }

    def edit = {
        def catalogMenuItemInstance = CatalogMenuItem.get(params.id)
        if (!catalogMenuItemInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'catalogMenuItem.label', default: 'CatalogMenuItem'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [catalogMenuItemInstance: catalogMenuItemInstance]
        }
    }

    def update = {
        def catalogMenuItemInstance = CatalogMenuItem.get(params.id)
        if (catalogMenuItemInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (catalogMenuItemInstance.version > version) {
                    
                    catalogMenuItemInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'catalogMenuItem.label', default: 'CatalogMenuItem')] as Object[], "Another user has updated this CatalogMenuItem while you were editing")
                    render(view: "edit", model: [catalogMenuItemInstance: catalogMenuItemInstance])
                    return
                }
            }
            catalogMenuItemInstance.properties = params
            if (!catalogMenuItemInstance.hasErrors() && daoService.executeInTransaction {catalogMenuItemInstance.save(flush: true)}) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'catalogMenuItem.label', default: 'CatalogMenuItem'), catalogMenuItemInstance.id])}"
                redirect(action: "show", id: catalogMenuItemInstance.id)
            }
            else {
                render(view: "edit", model: [catalogMenuItemInstance: catalogMenuItemInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'catalogMenuItem.label', default: 'CatalogMenuItem'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def catalogMenuItemInstance = CatalogMenuItem.get(params.id)
        if (catalogMenuItemInstance) {
            try {
                daoService.executeInTransaction {catalogMenuItemInstance.delete(flush: true)}
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'catalogMenuItem.label', default: 'CatalogMenuItem'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'catalogMenuItem.label', default: 'CatalogMenuItem'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'catalogMenuItem.label', default: 'CatalogMenuItem'), params.id])}"
            redirect(action: "list")
        }
    }
}
