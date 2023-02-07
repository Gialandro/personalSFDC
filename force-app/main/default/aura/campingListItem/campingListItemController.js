({
	packItem : function(component, event, helper) {
        var cmp = component.get("v.item", true);
        cmp.Packed__c = true;
        component.set("v.item", cmp);
        var bt = event.getSource();
        bt.set("v.disabled", true);
	}
})