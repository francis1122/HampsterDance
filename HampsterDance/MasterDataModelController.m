//
//  MasterDataModelController.m
//  HampsterDance
//
//  Created by John Wilson on 11/8/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "MasterDataModelController.h"
#import "JSON.h"
#import "NoteVO.h"
#import "TrackVO.h"

static MasterDataModelController *sharedInstance = nil;

@implementation MasterDataModelController


+ (id)sharedInstance{ 
    @synchronized(self){
        if(sharedInstance == nil)
            sharedInstance = [[[self class] alloc] init];
    }
    return sharedInstance;
}


- (id)init
{
    self = [super init];
    if (self) {
        // Initialization code here.
    }
    
    return self;
}


-(TrackVO*)jsonParserCatalog:(NSString*)jString{
    NSString *testJsonFilePath = [[NSBundle mainBundle] pathForResource:jString ofType:@"json"];  
    NSString *fileContents = [NSString stringWithContentsOfFile:testJsonFilePath encoding:NSUTF8StringEncoding error:nil];
    
	SBJSON *parser = [[[SBJSON alloc] init] autorelease];
	NSDictionary *fullDic =  [parser objectWithString:fileContents error:nil];
    if(fullDic == nil){
        NSLog(@"cannot parse track file %@", jString);
    }
    TrackVO *track = [[[TrackVO alloc] initWithDictionary:fullDic] autorelease];

    return track;
}

@end
