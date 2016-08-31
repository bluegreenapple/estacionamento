//
//  ReceiptsManager.m
//  estacionamento
//
//  Created by rony tjioe chung on 14/07/16.
//  Copyright © 2016 pato. All rights reserved.
//

#import "ReceiptsManager.h"
#import <MagicalRecord/MagicalRecord.h>
#import "Event.h"
#import "Event+CoreDataProperties.h"
#import "DateHelper.h"

@implementation ReceiptsManager

@synthesize pictureSumList;

static ReceiptsManager *_receiptsManager = nil;

+(ReceiptsManager*) sharedInstance
{
    if (!_receiptsManager)
    {
        _receiptsManager = [[ReceiptsManager alloc] init];
//        [_receiptsManager load];
    }
    
    return _receiptsManager;
}



-(void) saveEventWithDate:(NSDate*)aDate eventType:(NSString*)aEventType operador:(int)aOperador
{
    // Get the local context
    NSManagedObjectContext *localContext = [NSManagedObjectContext MR_defaultContext];
    
    // Create a new Event in the current thread context
    Event *event   = [Event MR_createEntityInContext:localContext];
    event.date = aDate;
    event.eventType  = aEventType;
    event.operador   = [NSNumber numberWithInt:aOperador];
    
    // Save the modification in the local context
    // With MagicalRecords 2.0.8 or newer you should use the MR_saveNestedContexts
    [localContext MR_saveToPersistentStoreAndWait];
//    NSLog(@"Saved Event: %@",event);
}

-(void) updateEventSumsWithDate:(NSDate*)aDate;
{
    NSPredicate *datePredicate = [DateHelper predicateForDate:aDate];
    NSPredicate *pictureEventPredicate = [NSPredicate predicateWithFormat:@"eventType == %@",eventType_Picture];
    
    
    //count number of pics for each operador during the day
    pictureSumList = [NSMutableArray array];
    for (int i = 1; i<=n_users; i++)
    {
        NSPredicate *operadorPredicate = [NSPredicate predicateWithFormat:@"operador == %i",i];
        NSPredicate *predicate = [NSCompoundPredicate andPredicateWithSubpredicates:@[datePredicate, pictureEventPredicate, operadorPredicate]];
        
        NSNumber *nPhotos = [Event MR_numberOfEntitiesWithPredicate:predicate];
        [pictureSumList addObject:nPhotos];
    }
    NSLog(@"picSumList: %@",pictureSumList);
    
    
}

- (id)init
{
    if (self = [super init])
    {
        
    }
    return self;
}

@end
