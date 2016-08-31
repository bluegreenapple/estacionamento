//
//  EventsViewController.h
//  estacionamento
//
//  Created by rony tjioe chung on 14/07/16.
//  Copyright © 2016 pato. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EventsViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>;

@property (weak, nonatomic) IBOutlet UILabel *operadorLabel;
@property (weak, nonatomic) IBOutlet UILabel *nPhotosLabel;
@property (weak, nonatomic) IBOutlet UITableView *tv;


@end
