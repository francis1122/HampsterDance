//
//  NoteGameObject.m
//  HampsterDance
//
//  Created by John Wilson on 11/12/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "NoteGameObject.h"
#import "NoteVO.h"

@implementation NoteGameObject

@synthesize noteVO;

-(id)initWithNoteVO:(NoteVO*) _noteVO{
    
//    [CCSprite spriteWithFile:];
    self = [super initWithFile:@"Banana.png"];
    if(self){
        self.noteVO = _noteVO;
        //positionBased on note
        self.position = ccp((480/4 * (1+_noteVO.note)) - (480/8), 400);
    }
    
    return self;
}

@end
