//
//  EventsViewController.m
//  estacionamento
//
//  Created by rony tjioe chung on 14/07/16.
//  Copyright © 2016 pato. All rights reserved.
//

#import "EventsViewController.h"
#import "EventCell.h"
#import "ReceiptsManager.h"

@interface EventsViewController ()

@end

@implementation EventsViewController
//***************************************************************************
#pragma mark IBActions

#pragma mark -

//***************************************************************************

#pragma mark Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    // Return the number of rows in the section.
    // Usually the number of items in your array (the one that holds your list)
    return [rem.pictureSumList count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    //Where we configure the cell in each row
    
    static NSString *CellIdentifier = @"Cell";
    EventCell *cell;
    
    cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == nil)
    {
        cell = [EventCell cell];
    }
    
    // Configure the cell... setting the text of our cell's label
    int n = [rem.pictureSumList[indexPath.row] intValue];
    [cell.lb_operador setText:[NSString stringWithFormat:@"%i",(int)indexPath.row+1]];
    [cell.lb_nPhotos setText:[NSString stringWithFormat:@"%i", n]];

    return cell;
}

#pragma mark -

//***************************************************************************
#pragma mark View
-(void)updateView
{
    [self.tv reloadData];
//    [lb_price setText:[NSString stringWithFormat:@"%@",[com priceStr]]];
}

#pragma mark -

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
