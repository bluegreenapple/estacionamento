//
//  EventCell.h
//  Burger King Brasil
//
//  Created by rony tjioe chung on 15/09/13.
//  Copyright (c) 2013 iTeller. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EventCell : UITableViewCell

+ (EventCell *)cell;


@property IBOutlet UILabel *lb_operador;
@property IBOutlet UILabel *lb_nPhotos;


@end
