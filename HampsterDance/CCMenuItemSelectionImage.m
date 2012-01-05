//
//  CCMenuItemSelectionImage.m
//  HampsterDance
//
//  Created by John Wilson on 12/15/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "CCMenuItemSelectionImage.h"


@implementation CCMenuItemSelectionImage


#pragma mark -
#pragma mark CCMenuItemImage



+(id) itemFromNormalImage: (NSString*)value selectedImage:(NSString*) value2
{
	return [self itemFromNormalImage:value selectedImage:value2 disabledImage: nil target:nil selector:nil];
}

+(id) itemFromNormalImage: (NSString*)value selectedImage:(NSString*) value2 target:(id) t selector:(SEL) s
{
	return [self itemFromNormalImage:value selectedImage:value2 selectionImage: nil target:t selector:s];
}

+(id) itemFromNormalImage: (NSString*)value selectedImage:(NSString*) value2 selectionImage: (NSString*) value3
{
	return [[[self alloc] initFromNormalImage:value selectedImage:value2 selectionImage:value3 target:nil selector:nil] autorelease];
}

+(id) itemFromNormalImage: (NSString*)value selectedImage:(NSString*) value2 selectionImage: (NSString*) value3 target:(id) t selector:(SEL) s
{
	return [[[self alloc] initFromNormalImage:value selectedImage:value2 selectionImage:value3 target:t selector:s] autorelease];
}

-(id) initFromNormalImage: (NSString*) normalI selectedImage:(NSString*)selectedI selectionImage: (NSString*) disabledI target:(id)t selector:(SEL)sel
{
	CCNode<CCRGBAProtocol> *normalImage = [CCSprite spriteWithFile:normalI];
	CCNode<CCRGBAProtocol> *selectedImage = nil;
	CCNode<CCRGBAProtocol> *disabledImage = nil;
    
    isPermaSelect = NO;
	if( selectedI )
		selectedImage = [CCSprite spriteWithFile:selectedI]; 
	if(disabledI)
		disabledImage = [CCSprite spriteWithFile:disabledI];
    
	return [self initFromNormalSprite:normalImage selectedSprite:selectedImage disabledSprite:disabledImage target:t selector:sel];
}

-(void) selected
{
	isSelected_ = YES;
    
    if(isPermaSelect){
        if( selectedImage_ ) {
            [normalImage_ setVisible:NO];
            [selectedImage_ setVisible:NO];
            [disabledImage_ setVisible:YES];
            
        } 
    }else{
        if( selectedImage_ ) {
            [normalImage_ setVisible:NO];
            [selectedImage_ setVisible:YES];
            [disabledImage_ setVisible:NO];
            
        } else { // there is not selected image
            
            [normalImage_ setVisible:YES];
            [selectedImage_ setVisible:NO];
            [disabledImage_ setVisible:NO];		
        }  
    }
}

-(void) unselected
{
	isSelected_ = NO;
    
    if(isPermaSelect){
        [normalImage_ setVisible:NO];
        [selectedImage_ setVisible:NO];
        [disabledImage_ setVisible:YES];
    }else{
        [normalImage_ setVisible:YES];
        [selectedImage_ setVisible:NO];
        [disabledImage_ setVisible:NO];        
    }
}

-(BOOL) IsPermaSelect{
    return isPermaSelect;
}

-(void) setIsPermaSelect:(BOOL)enabled
{
//	[super setIsEnabled:enabled];
    
    isPermaSelect = enabled;
	if( isPermaSelect ) {
		if( disabledImage_ ) {
			[normalImage_ setVisible:NO];
			[selectedImage_ setVisible:NO];
			[disabledImage_ setVisible:YES];		
		} else {
			[normalImage_ setVisible:YES];
			[selectedImage_ setVisible:NO];
			[disabledImage_ setVisible:NO];
		}
        
	} else {
        [normalImage_ setVisible:YES];
        [selectedImage_ setVisible:NO];
        [disabledImage_ setVisible:NO];
	}
}



@end
