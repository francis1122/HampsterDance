//
//  NoteGameObject.h
//  HampsterDance
//
//  Created by John Wilson on 11/12/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"

@class NoteVO;
@interface NoteGameObject : CCSprite {
    NoteVO *noteVO;
}
@property (nonatomic, retain) NoteVO* noteVO;

-(id)initWithNoteVO:(NoteVO*) _noteVO;

@end
