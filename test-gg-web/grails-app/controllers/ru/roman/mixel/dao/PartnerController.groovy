package ru.roman.mixel.dao



import ru.roman.mixel.srv.DaoService;

class PartnerController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]
	def static final note = "Компании производители";
	DaoService daoService
	
    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [partnerInstanceList: Partner.list(params), partnerInstanceTotal: Partner.count()]
    }

    def create = {
		def partnerInstance = new Partner()
		partnerInstance.properties = params
		[partnerInstance: partnerInstance]
    }

    def save = {
        def partnerInstance = new Partner(params)
        if (daoService.executeInTransaction {partnerInstance.save(flush: true)}) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'partner.label', default: 'Partner'), partnerInstance.id])}"
            redirect(action: "show", id: partnerInstance.id)
        }
        else {
            render(view: "create", model: [partnerInstance: partnerInstance])
        }
    }

    def show = {
        def partnerInstance = Partner.get(params.id)
        if (!partnerInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'partner.label', default: 'Partner'), params.id])}"
            redirect(action: "list")
        }
        else {
            [partnerInstance: partnerInstance]
        }
    }

    def edit = {
        def partnerInstance = Partner.get(params.id)
        if (!partnerInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'partner.label', default: 'Partner'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [partnerInstance: partnerInstance]
        }
    }

    def update = {
        def partnerInstance = Partner.get(params.id)
        if (partnerInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (partnerInstance.version > version) {
                    
                    partnerInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'partner.label', default: 'Partner')] as Object[], "Another user has updated this Partner while you were editing")
                    render(view: "edit", model: [partnerInstance: partnerInstance])
                    return
                }
            }
            partnerInstance.properties = params
            if (!partnerInstance.hasErrors() && daoService.executeInTransaction {partnerInstance.save(flush: true)}) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'partner.label', default: 'Partner'), partnerInstance.id])}"
                redirect(action: "show", id: partnerInstance.id)
            }
            else {
                render(view: "edit", model: [partnerInstance: partnerInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'partner.label', default: 'Partner'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def partnerInstance = Partner.get(params.id)
        if (partnerInstance) {
            try {
                daoService.executeInTransaction {partnerInstance.delete(flush: true)}
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'partner.label', default: 'Partner'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'partner.label', default: 'Partner'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'partner.label', default: 'Partner'), params.id])}"
            redirect(action: "list")
        }
    }
}
