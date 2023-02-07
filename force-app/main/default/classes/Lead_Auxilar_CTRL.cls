public with sharing class Lead_Auxilar_CTRL {
	public Double intTotal{get; set;}
	public List<Lead> ListLead{get; set;}
	public Lead candidato{get; set;}
	public Carro__c carritos{get; set;}
	
	public Lead_Auxilar_CTRL(ApexPages.StandardController controller) {
		this.candidato= (Lead)controller.getRecord();
		intTotal= candidato.Cal1__c + candidato.Cal2__c;
		system.debug('~~~ Carrito: ' + carritos);
	}
}