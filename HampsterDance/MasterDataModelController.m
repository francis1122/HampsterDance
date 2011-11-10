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


-(NSArray*)jsonParserCatalog:(NSString*)jString{
	SBJsonParser *parser = [[[SBJsonParser alloc] init] autorelease];
    NSMutableArray *result = [[[NSMutableArray alloc] init] autorelease];
	NSDictionary *fullDic = [parser objectWithString:jString error:nil];
    NSArray *notesArray = [fullDic objectForKey:@"notes"];
    NSInteger ID = 0;
    for(NSDictionary *note in notesArray){
        NoteVO *noteVO = [[NoteVO alloc] initWithDictionary:note];
        noteVO.ID = ID;
        ID++;
        [result addObject:noteVO];
    }

    return result;
}

@end
