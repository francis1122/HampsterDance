//
//  GameSelectMenu.m
//  HampsterDance
//
//  Created by John Wilson on 11/15/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "GameSelectMenu.h"
#import "PBJTScene.h"
#import "CCSelectionMenu.h"
#import "CCMenuItemSelectionImage.h"


@implementation GameSelectMenu

-(id) init{
	if( (self=[super init] )) {
        CCLabelTTF* greatest = [CCLabelTTF labelWithString:@"Game Select Layer" fontName:PBJT_FONT1 fontSize:20];
        greatest.position = ccp(280, 249);
        ccColor3B green = {154, 255, 56};
        [greatest setColor:green];
        [self addChild:greatest];
        
        
        // CCLabelTTF *timeTrailLabel = [CCLabelTTF labelWithString:@"Time Trail" fontName:@"AppleGothic" fontSize:20];
        // CCMenuItemLabel *timeTrailerButton = [CCMenuItemLabel itemWithLabel:timeTrailLabel target:self selector:@selector(timeTrailTouched:)];
        CCSprite *sprite = [CCSprite spriteWithFile:@"PlayButton.png"];
        CCSprite *sprite2 = [CCSprite spriteWithFile:@"PlayButton.png"];
        CCSprite *sprite3 = [CCSprite spriteWithFile:@"PlayButton.png"];
        
        CCMenuItemSprite *spriteTimeTrailButton = [CCMenuItemSprite itemFromNormalSprite:sprite selectedSprite:sprite2 disabledSprite:sprite3 target:self selector:@selector(timeTrailTouched:)];
        spriteTimeTrailButton.position = ccp(220, 140);
        
        CCMenu *menu = [CCMenu menuWithItems:spriteTimeTrailButton, nil];
        menu.position = CGPointZero;
        [self addChild:menu];
        
        //yeah
        
        CCMenuItemSelectionImage *selectionImage1 = [CCMenuItemSelectionImage itemFromNormalImage:@"NormalButton.png" selectedImage:@"Icon.png" selectionImage:@"Icon-Small.png" target:nil selector:nil];
        selectionImage1.position = ccp(200, 00);
        
        CCMenuItemSelectionImage *selectionImage2 = [CCMenuItemSelectionImage itemFromNormalImage:@"HardButton.png" selectedImage:@"Icon.png" selectionImage:@"Icon-Small.png" target:nil selector:nil];
        selectionImage2.position = ccp(40, 80);
        
        CCSelectionMenu *menu3 = [CCSelectionMenu menuWithItems:selectionImage1, selectionImage2, nil];
        [self addChild:menu3];
        /*difficulty seleciton menu
        
        CCSprite *sprite4 = [CCSprite spriteWithFile:@"Icon-72.png"];
        CCSprite *sprite5 = [CCSprite spriteWithFile:@"Icon-Small.png"];
        CCSprite *sprite6 = [CCSprite spriteWithFile:@"Icon.png"];

        CCSprite *sprite7 = [CCSprite spriteWithFile:@"Icon-72.png"];
        CCSprite *sprite8 = [CCSprite spriteWithFile:@"Icon-Small.png"];
        CCSprite *sprite9 = [CCSprite spriteWithFile:@"Icon.png"];
        
        CCMenuItemSprite *test = [CCMenuItemSprite itemFromNormalSprite:sprite4 selectedSprite:sprite5 disabledSprite:sprite6 target:nil selector:nil];
        test.position = ccp(40, 80);

        CCMenuItemSprite *test2 = [CCMenuItemSprite itemFromNormalSprite:sprite7 selectedSprite:sprite8 disabledSprite:sprite9 target:nil selector:nil];
        test2.position = ccp(200, 00);
        
        
        CCMenu *menu2 = [CCMenu menuWithItems:test,test2,  nil];
        menu.position = CGPointZero;
        
        [self addChild:menu2];
         */
        
        
    }
    return self;
}

-(void)timeTrailTouched:(CCMenuItem*)sender{
    
    
    [[CCDirector sharedDirector] replaceScene:[PBJTScene node]];
}

@end
