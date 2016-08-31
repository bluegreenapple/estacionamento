//
//  DateHelper.m
//  estacionamento
//
//  Created by rony tjioe chung on 14/07/16.
//  Copyright © 2016 pato. All rights reserved.
//

#import "DateHelper.h"

@implementation DateHelper

static NSDateFormatter *_dateFormatter = nil;
static NSCalendar *_calendar = nil;

+(NSDateFormatter*) dateFormatter
{
    if (!_dateFormatter)
    {
        _dateFormatter = [[NSDateFormatter alloc] init];
        [_dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss Z"];
        [_dateFormatter setLocale:[[NSLocale alloc] initWithLocaleIdentifier:@"pt"]];
    }
    
    return _dateFormatter;
}

+(NSCalendar*) calendar
{
    if (!_calendar)
    {
        _calendar = [NSCalendar currentCalendar];
    }
    
    return _calendar;
}


+(NSPredicate*) predicateForDate:(NSDate*)aDate
{
    NSCalendar* calendar = [DateHelper calendar];
    NSDate *dateA = [calendar dateBySettingHour:0 minute:0 second:0 ofDate:aDate options:NSCalendarWrapComponents];
    
    NSDate *dateB = [calendar dateByAddingUnit:NSCalendarUnitDay value:1 toDate:dateA options:NSCalendarWrapComponents];
    
    NSLog(@"date A: %@",dateA);
    NSLog(@"date B: %@",dateB);

    return [NSPredicate predicateWithFormat:@"(date >= %@) AND (date < %@)", dateA, dateB];
}
@end
