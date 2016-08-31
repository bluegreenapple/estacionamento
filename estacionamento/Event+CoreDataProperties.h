//
//  Event+CoreDataProperties.h
//  
//
//  Created by rony tjioe chung on 14/07/16.
//
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "Event.h"

NS_ASSUME_NONNULL_BEGIN

@interface Event (CoreDataProperties)

@property (nullable, nonatomic, retain) NSDate *date;
@property (nullable, nonatomic, retain) NSString *eventType;
@property (nullable, nonatomic, retain) NSNumber *operador;

@end

NS_ASSUME_NONNULL_END
