trigger AccountTrigger on Account (before insert, before update, before delete, after insert) {
    AccountTriggerImplimentation ati = new AccountTriggerImplimentation();
    
    if(trigger.isBefore && trigger.isInsert){
		ati.beforeInsert(trigger.new);
    }
    
    if(trigger.isAfter && trigger.isInsert){
		ati.afterInsert(trigger.new);
    }
    
    if(trigger.isBefore && trigger.isUpdate){
     	ati.beforeUpdate(trigger.new, trigger.newmap);
    }
}