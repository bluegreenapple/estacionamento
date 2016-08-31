//
//  AdminViewController.m
//  estacionamento
//
//  Created by rony tjioe chung on 14/07/16.
//  Copyright © 2016 pato. All rights reserved.
//

#import "AdminViewController.h"
#import "ReceiptsManager.h"
#import "RecordsManager.h"

@interface AdminViewController ()

@end

@implementation AdminViewController

-(IBAction)unwindSegueFromEventsVieController:(UIStoryboardSegue *)segue {
    
}



- (IBAction)logout:(id)sender
{
    [rem saveEventWithDate:[NSDate date] eventType:eventType_Logout operador:rm.curUser];
}

- (IBAction)buscar:(id)sender
{
    NSDate *myDate = self.datePicker.date;
    [rem updateEventSumsWithDate:myDate];
    
    [self performSegueWithIdentifier:@"eventsSegue" sender:sender];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
