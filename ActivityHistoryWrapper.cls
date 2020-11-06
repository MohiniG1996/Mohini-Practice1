public class ActivityHistoryWrapper {

    @AuraEnabled
    public List<ActivityHistory> collectionActivityHistory;

    @AuraEnabled
    public List<ActivityHistory> TracingActivityHistory;

    @AuraEnabled
    public List<ActivityHistory> fieldActivityHistory;

    public class ActivityDetails{

        @AuraEnabled
        public String Subject;

        @AuraEnabled
        public String callId;

        @AuraEnabled
        public String callDate;
        
        @AuraEnabled
        public String callDuration;

        @AuraEnabled
        public String callStatus;

        @AuraEnabled
        public String userAssignedTo;

        @AuraEnabled
        public String phoneNumber;

        @AuraEnabled
        public String tracingStatus;

        @AuraEnabled
        public String Description;

        @AuraEnabled
        public String LastModifiedDateTime;

        @AuraEnabled
        public String callTime;

        @AuraEnabled
        public String fieldVisitStatus;
    }
    
    



}