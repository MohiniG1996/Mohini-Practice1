/**
 * This class contains unit tests for validating the behavior of Apex classes
 * and triggers.
 *
 * Unit tests are class methods that verify whether a particular piece
 * of code is working properly. Unit test methods take no arguments,
 * commit no data to the database, and are flagged with the testMethod
 * keyword in the method definition.
 *
 * All test methods in an organization are executed whenever Apex code is deployed
 * to a production organization to confirm correctness, ensure code
 * coverage, and prevent regressions. All Apex classes are
 * required to have at least 75% code coverage in order to be deployed
 * to a production organization. In addition, all triggers must have some code coverage.
 * 
 * The @isTest class annotation indicates this class only contains test
 * methods. Classes defined with the @isTest annotation do not count against
 * the organization size limit for all Apex scripts.
 *
 * See the Apex Language Reference for more information about Testing and Code Coverage.
 */
@isTest(seeAlldata = true)
private class ActivityHistoryExtention_TestClass {
    static Customer__c testLead;
    static List<Task> ActivityHistroyTask;
    
    public static void init(){
        testLead = TestDataInitializer.createLead('VIK1989','test Activity lead','Telecaller 1');
        database.insert(testLead);
        ActivityHistroyTask = new List<Task>();
        ActivityHistroyTask.add(TestDataInitializer.creatTask(testLead.Id, '9876543210', 'Telecaller 1', '83654', 'Collection'));
        ActivityHistroyTask.add(TestDataInitializer.creatTask(testLead.Id, '9876543210', 'Telecaller 1', '87654', 'Tracing'));
        database.insert(ActivityHistroyTask);
    
    }
    
    static testMethod void myUnitTest() {
       init();
       Test.startTest();
       PageReference pg = new PageReference('/apex/ActivityHistory?id='+testLead.Id+'&renderSection1=false&renderSection2=true&renderSection3=false');
       Test.setCurrentPageReference(pg);
       ApexPages.StandardController con = new ApexPages.StandardController(testLead);
       ActivityHistoryExtention controller = new ActivityHistoryExtention(con);
       controller.renderSection1=false;
       controller.renderSection2=true;
       controller.renderSection3=false;
       system.assertNotEquals(controller.getActivityFields3(),null);
       system.assertNotEquals(controller.getActivityFields(),null);
       system.assertNotEquals(controller.getRenderSection1(),null);
       system.assertNotEquals(controller.getRenderSection2(),null);
       system.assertNotEquals(controller.getRenderSection3(),null);
       system.assertNotEquals(controller.getActivityFields4(),null);
        system.assertNotEquals(controller.getRenderSection5(),null);
       ActivityHistroyTask = new List<Task>();
       ActivityHistroyTask.add(TestDataInitializer.creatTask(testLead.Id, '9876543214', 'Telecaller 1', '87650', 'Field'));
       database.insert(ActivityHistroyTask);
       PageReference pg1 = new PageReference('/apex/ActivityHistory?id='+testLead.Id+'&renderSection1=false&renderSection4=true&renderSection3=false');
       Test.setCurrentPageReference(pg1);
       ActivityHistoryExtention controller1 = new ActivityHistoryExtention(con);
       //renderSection1=false&renderSection4=true&renderSection3=false
       controller1.renderSection1=false;
       controller1.renderSection4=true;
       controller1.renderSection3=false;
       system.assertNotEquals(controller1.getActivityFields2(),null);
       system.assertNotEquals(controller1.getActivityFields1(),null);
       system.assertNotEquals(controller1.getRenderSection1(),null);
       system.assertNotEquals(controller1.getRenderSection4(),null);
       system.assertNotEquals(controller1.getRenderSection3(),null);
       
       Test.stopTest();
    }
}