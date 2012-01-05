//
//  CCMenuItemSelectionImage.h
//  HampsterDance
//
//  Created by John Wilson on 12/15/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"

@interface CCMenuItemSelectionImage : CCMenuItemImage {
    BOOL isPermaSelect;
}

+(id) itemFromNormalImage: (NSString*)value selectedImage:(NSString*) value2;

+(id) itemFromNormalImage: (NSString*)value selectedImage:(NSString*) value2 target:(id) t selector:(SEL) s;

+(id) itemFromNormalImage: (NSString*)value selectedImage:(NSString*) value2 selectionImage: (NSString*) value3;

+(id) itemFromNormalImage: (NSString*)value selectedImage:(NSString*) value2 selectionImage: (NSString*) value3 target:(id) t selector:(SEL) s;

-(id) initFromNormalImage: (NSString*) normalI selectedImage:(NSString*)selectedI selectionImage: (NSString*) disabledI target:(id)t selector:(SEL)sel;


-(BOOL) IsPermaSelect;

-(void) setIsPermaSelect:(BOOL)enabled;

@end
