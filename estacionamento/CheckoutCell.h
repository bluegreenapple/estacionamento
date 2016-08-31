//
//  CheckoutCell.h
//  Burger King Brasil
//
//  Created by rony tjioe chung on 15/09/13.
//  Copyright (c) 2013 iTeller. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CheckoutCell : UITableViewCell

+ (CheckoutCell *)cell;


@property IBOutlet UILabel *lb_pedido;
@property IBOutlet UILabel *lb_detalhes;
@property IBOutlet UILabel *lb_quantidade;


@end
