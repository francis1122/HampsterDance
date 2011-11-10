//
//  NoteVO.m
//  HampsterDance
//
//  Created by John Wilson on 11/8/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "NoteVO.h"

@implementation NoteVO

@synthesize ID, note, time;

- (id)init
{
    self = [super init];
    if (self) {
        self.note = -1;
        self.ID = -1;
        self.time = 0.00;
        // Initialization code here.
    }
    
    return self;
}

-(id)initWithDictionary:(NSDictionary*) dictionary{
    self = [super init];
    if(self){
        self.note = [[dictionary objectForKey:@"note"] intValue];
        self.time = [[dictionary objectForKey:@"time"] floatValue];
    }
    
    return self;
}

@end
