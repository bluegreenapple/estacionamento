//
//  RecordsManager.m
//  template
//
//  Created by Rony Chung on 06/06/13.
//
//

#import "RecordsManager.h"

// records add
#define k_email @"email"
#define k_idCliente @"email"
#define k_senha @"senha"
#define k_senhaPanico @"senhaPanico"
#define k_pGateType @"pGateType"
#define k_vGateType @"vGateType"

@implementation RecordsManager

// records add
@synthesize senhas;
@synthesize curUser, nPhotos;

static RecordsManager *_recordsManager = nil;
+(RecordsManager*) sharedInstance
{
    if (!_recordsManager)
    {
        _recordsManager = [[RecordsManager alloc] init];
        [_recordsManager load];
    }
    
    return _recordsManager;
}

-(void)reset
{
    // records add
    senhas = @[
               @"3758",//usuario 0 (admin)
               @"7835",//usuario 1
               @"9827",//usuario 2
               @"3790",//usuario 3
               @"7289",//usuario 4
               @"1208",//usuario 5
               @"3221",//usuario 6
               @"9076",//usuario 7
               @"0958",//usuario 8
               @"3286",//usuario 9
               @"4972",//usuario 10
               ];
    curUser = 0;//admin
    nPhotos = 0;
}

-(void) load
{
    [self reset];
    
    NSFileManager *fileManager = [[NSFileManager alloc] init];
    if ([fileManager fileExistsAtPath:[[self filePath] path]])
    {
        NSMutableDictionary *dic = [NSMutableDictionary dictionaryWithContentsOfURL:[self filePath]];
        
        // records add
        if (dic[k_senhas])         {senhas        = dic[k_senhas];}
    }
}

-(void) save
{
    NSMutableDictionary *dic = [[NSMutableDictionary alloc]init];
    
    // records add
    [dic setValue: senhas   forKey:k_senhas];
    
    [dic writeToURL:[self filePath] atomically:YES];
}

-(NSURL *)filePath
{
    NSFileManager *fileManager = [[NSFileManager alloc] init];
    NSArray *array = [fileManager URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask];
    NSURL *path = [array objectAtIndex:0];
    path = [path URLByAppendingPathComponent:@"records.plist"];
    return path;
}

@end
