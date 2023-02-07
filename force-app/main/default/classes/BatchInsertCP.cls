global class BatchInsertCP implements Database.Batchable<sObject> {
    global final String query;

    global BatchInsertCP(String qu) {
        query = qu;
    }

    global Database.QueryLocator start(Database.BatchableContext BC) {
        return Database.getQueryLocator(query);
    }

    global void execute(Database.BatchableContext BC, List<sObject> scope) {
        /*List<CodigoPostal__c> lstCP = (List<CodigoPostal__c>) scope;
        List<CPostalNuevo__c> addLst = new List<CPostalNuevo__c> ();
        List<CodigoPostal__c> lstDel = new List<CodigoPostal__c>();
        // System.debug('~~~ lst: ' + lstCP);
        for(CodigoPostal__c iterator: lstCP)
        {
            CPostalNuevo__c item = new CPostalNuevo__c ();
            item.Name = iterator.Name;
            addLst.add(item);
            lstDel.add(iterator);
            // delete iterator;
        }
        insert addLst;
        delete lstDel;*/
        // System.debug('~~~ add:' + addLst + ' Del:' + lstDel);
    }

    global void finish(Database.BatchableContext BC) {
        System.debug('~~~ End Batch');
    }
}