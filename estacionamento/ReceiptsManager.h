//
//  ReceiptsManager.h
//  estacionamento
//
//  Created by rony tjioe chung on 14/07/16.
//  Copyright © 2016 pato. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Config.h"

#define rem [ReceiptsManager sharedInstance]

@interface ReceiptsManager : NSObject
{
    NSMutableArray *pictureSumList;
}

@property NSArray *pictureSumList;

+(ReceiptsManager*) sharedInstance;
-(void) saveEventWithDate:(NSDate*)aDate eventType:(NSString*)aEventType operador:(int)aOperador;
-(void) updateEventSumsWithDate:(NSDate*)aDate;


@end
