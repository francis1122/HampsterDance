//
//  NoteVO.h
//  HampsterDance
//
//  Created by John Wilson on 11/8/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NoteVO : NSObject{
    NSInteger ID;
    float time;
    NSInteger note;
}

@property NSInteger ID, note;
@property float time;

-(id)initWithDictionary:(NSDictionary*) dictionary;

@end
