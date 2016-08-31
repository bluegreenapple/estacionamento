//
//  OperadorViewController.h
//  estacionamento
//
//  Created by rony tjioe chung on 14/07/16.
//  Copyright © 2016 pato. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JPSVolumeButtonHandler/JPSVolumeButtonHandler.h"

@interface OperadorViewController : UIViewController
{
    IBOutlet UIView *vi_ok;
}
@property (strong, nonatomic) JPSVolumeButtonHandler  *volumeHandler;
@end
