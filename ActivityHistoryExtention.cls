public class ActivityHistoryExtention {

    /*
    Related List of Collection,Traing and Field History
    
    */
    
    string currentLead;
    public Integer listSize {get;set;}
    public Integer listSizeDefault {get;set;}
    public Integer tracingListSize {get;set;}
    public Boolean renderSection2;
    public Boolean getRenderSection2(){
    return renderSection2;
    }
    public Boolean renderSection1  = true;
    public Boolean getRenderSection1(){
    return renderSection1;
    }
    public Boolean renderSection3  = true;
    public Boolean getRenderSection3(){
    return renderSection3;
    }
    public Boolean renderSection4;
    public Boolean getRenderSection4(){
    return renderSection4;
    }
    public Boolean renderSection5 = true;
    public Boolean getRenderSection5(){
        return renderSection5;
    }
    public Boolean renderSection6;
    public Boolean getRenderSection6(){
        return renderSection6;
    }

    
    List<ActivityHistory> fiveDefaultActivities = new List<ActivityHistory>();
    List<ActivityHistory> defaultActivities = new List<ActivityHistory>();
    List<ActivityHistory> fiveFieldActivities = new List<ActivityHistory>();
    List<ActivityHistory> fieldActivities = new List<ActivityHistory>();
    List<ActivityHistory> tracingFiveActivities = new List<ActivityHistory>();
    List<ActivityHistory> allTracingActivities = new List<ActivityHistory>();
   
    public ActivityHistoryExtention(ApexPages.StandardController controller) {
     currentLead = ApexPages.currentPage().getParameters().get('id');
      String rend1 = ApexPages.currentPage().getParameters().get('renderSection1');
      String rend2 = ApexPages.currentPage().getParameters().get('renderSection2');
      String rend3 = ApexPages.currentPage().getParameters().get('renderSection3');
      String rend4 = ApexPages.currentPage().getParameters().get('renderSection4');
      String rend5 = ApexPages.currentPage().getParameters().get('renderSection5');
      String rend6 = ApexPages.currentPage().getParameters().get('renderSection6');
      if(rend1 != null)
      {
      renderSection1 = Boolean.ValueOf(rend1);
      
      }
      if(rend2 != null)
      {
      renderSection2 = Boolean.ValueOf(rend2);
      
      }
      if(rend3 != null)
      {
      renderSection3 = Boolean.ValueOf(rend3);
      
      }
      if(rend4 != null)
      {
      renderSection4 = Boolean.ValueOf(rend4);
      }
      if(rend5 != null)
      {
      renderSection5 = Boolean.ValueOf(rend5);
      }
      if(rend6 != null)
      {
      renderSection6 = Boolean.ValueOf(rend6);
      }
      Customer__c leadDetails = [select(select WhatId,OwnerID,ActivityDate,Subject,Status,Phone__c,Call_Date__c,LastModifiedDate,Call_Status__c ,Assigned_To__c,Priority,Description,Duration__c,Call_Id__c,Call_Start_End_Time__c,Field_Visit_Status__c FROM ActivityHistories WHERE Activity_Type__c='Default' OR Activity_Type__c='Collection' order by CreatedDate desc)from Customer__c WHERE Id=:currentLead];
        listSizeDefault = leadDetails.ActivityHistories.size();
           for(Integer i = 0; i<leadDetails.ActivityHistories.size() ; i++){
               if(i<5){
                   fiveDefaultActivities.add(leadDetails.ActivityHistories[i]);
                   }
                   defaultActivities.add(leadDetails.ActivityHistories[i]);
               }
               

        Customer__c fieldLeadDetails = [select(select WhatId,OwnerID,ActivityDate,Subject,Status,Phone__c,Call_Date__c,Call_Status__c ,Priority,LastModifiedDate,Assigned_To__c,Description,Duration__c,Call_Id__c,Call_Start_End_Time__c,Field_Visit_Status__c FROM ActivityHistories WHERE Activity_Type__c='Field' order by CreatedDate desc)from Customer__c WHERE Id=:currentLead ];
        listSize = fieldLeadDetails.ActivityHistories.size();

           for(Integer i = 0; i<fieldLeadDetails.ActivityHistories.size() ; i++){
               if(i<5){
               fiveFieldActivities.add(fieldLeadDetails.ActivityHistories[i]);
               }
               fieldActivities.add(fieldLeadDetails.ActivityHistories[i]);
           }
           
        // Tracing Activity List 
        
        Customer__c tracingLeadDetails = [select(select WhatId,OwnerID,ActivityDate,Subject,Status,Phone__c,Call_Date__c,Call_Status__c ,Priority,LastModifiedDate,Assigned_To__c,Description,Duration__c,Call_Id__c,Call_Start_End_Time__c,Field_Visit_Status__c,Tracing_Status__c FROM ActivityHistories WHERE Activity_Type__c='Tracing' order by CreatedDate desc)from Customer__c WHERE Id=:currentLead ];
        tracingListSize = tracingLeadDetails.ActivityHistories.size();

           for(Integer i = 0; i<tracingLeadDetails.ActivityHistories.size() ; i++){
               if(i<5){
                   tracingFiveActivities.add(tracingLeadDetails.ActivityHistories[i]);
               }
                   allTracingActivities.add(tracingLeadDetails.ActivityHistories[i]);
           }  
     }
    
      
    public List<ActivityHistory> getActivityFields(){
       
       return defaultActivities;
       
      } 
      public List<ActivityHistory> getActivityFields3(){
       return fiveDefaultActivities;
      } 
      
      
      public List<ActivityHistory> getActivityFields1(){
       return fieldActivities;
       }
       public List<ActivityHistory> getActivityFields2(){
       return fiveFieldActivities;
       }
       
       public List<ActivityHistory> getActivityFields4(){
       return tracingFiveActivities;
       }
       
       public List<ActivityHistory> getActivityFields5(){
       return allTracingActivities;
       }
       
      

}