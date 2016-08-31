//
//  RecordsManager.h
//  template
//
//  Created by Rony Chung on 06/06/13.
//
//

#import <Foundation/Foundation.h>
#import "Config.h"

//in appdelegate:
//[rm save] in will resign active
//[rm load] in did finish launching
//[retrieveParseConfiguration:(NSDictionary *)launchOptions] in did finish launching after load

#define rm [RecordsManager sharedInstance]

@interface RecordsManager : NSObject
{
    // records add
    NSArray *senhas;
    int curUser;
    int nPhotos;
}

// records add
@property NSArray *senhas;
@property int curUser, nPhotos;

+(RecordsManager*) sharedInstance;
-(void)load;
-(void)save;
-(void)reset;

@end
