//
//  TrackVO.m
//  HampsterDance
//
//  Created by John Wilson on 11/12/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "TrackVO.h"
#import "NoteVO.h"

@implementation TrackVO

@synthesize noteArray;

- (id)init
{
    self = [super init];
    if (self) {

        // Initialization code here.

    }
    return self;
}

-(id)initWithDictionary:(NSDictionary*) dictionary{
    self = [super init];
    if(self){
        self.noteArray = [[[NSMutableArray alloc] init] autorelease];
        NSArray *notesArray = [dictionary objectForKey:@"notes"];
        NSInteger ID = 0;
        for(NSDictionary *note in notesArray){
            NoteVO *noteVO = [[[NoteVO alloc] initWithDictionary:note] autorelease];
            noteVO.ID = ID;
            ID++;
            [self.noteArray addObject:noteVO];
        }
    }
    
    return self;
}

@end
