//
//  EventCell.m
//  Burger King Brasil
//
//  Created by rony tjioe chung on 15/09/13.
//  Copyright (c) 2013 iTeller. All rights reserved.
//

#import "EventCell.h"

@implementation EventCell

+ (NSString *)reuseIdentifier
{
    return NSStringFromClass(self);
}

- (NSString *)reuseIdentifier
{
    return [[self class] reuseIdentifier];
}

+ (EventCell *)cell
{
    NSString *nibName = [self reuseIdentifier];
//    if (is_iPad) {
//        nibName = [nibName stringByAppendingString:@"iPad"];
//    }
    return [[[NSBundle mainBundle] loadNibNamed:nibName owner:self options:nil] objectAtIndex:0];
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}


@end
