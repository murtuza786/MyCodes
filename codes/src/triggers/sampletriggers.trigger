trigger sampletriggers on Account (before insert) {
 system.debug('--Trigger.new-------------------'+Trigger.new);
    system.debug('--Trigger.old--------------------'+Trigger.old);
    system.debug('--Trigger.newMap-----------------'+Trigger.newMap);
    system.debug('--Trigger.oldMap------------------'+Trigger.oldMap);
   
}