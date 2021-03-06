//
//  GameOverLayer.m
//  HampsterDance
//
//  Created by John Wilson on 11/15/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "GameOverLayer.h"
#import "PBJTScene.h"
#import "ShopLayer.h"
#import "MenuLayer.h"

@implementation GameOverLayer

-(id) init{
	if( (self=[super init] )) {
        CCLabelTTF* greatest = [CCLabelTTF labelWithString:@"GameOver" fontName:PBJT_FONT1 fontSize:20];
        greatest.position = ccp(280, 249);
        ccColor3B green = {154, 255, 56};
        [greatest setColor:green];
        [self addChild:greatest];
        
        //RETRY BUTTON
        
        
        // CCLabelTTF *timeTrailLabel = [CCLabelTTF labelWithString:@"Time Trail" fontName:@"AppleGothic" fontSize:20];
        // CCMenuItemLabel *timeTrailerButton = [CCMenuItemLabel itemWithLabel:timeTrailLabel target:self selector:@selector(timeTrailTouched:)];
        CCSprite *sprite = [CCSprite spriteWithFile:@"RetryButton.png"];
        CCSprite *sprite2 = [CCSprite spriteWithFile:@"RetryButton.png"];
        CCSprite *sprite3 = [CCSprite spriteWithFile:@"RetryButton.png"];

        CCSprite *sprite4 = [CCSprite spriteWithFile:@"MenuButton.png"];
        CCSprite *sprite5 = [CCSprite spriteWithFile:@"MenuButton.png"];
        CCSprite *sprite6 = [CCSprite spriteWithFile:@"MenuButton.png"];

        
        CCMenuItemSprite *retryButton = [CCMenuItemSprite itemFromNormalSprite:sprite selectedSprite:sprite2 disabledSprite:sprite3 target:self selector:@selector(retryButtonTouched:)];
        retryButton.position = ccp(40, 260);

        CCMenuItemSprite *menuButton = [CCMenuItemSprite itemFromNormalSprite:sprite4 selectedSprite:sprite5 disabledSprite:sprite6 target:self selector:@selector(menuButtonTouched:)];
        menuButton.position = ccp(170, 140);
        
        CCMenu *menu = [CCMenu menuWithItems:retryButton, menuButton, nil];
        menu.position = CGPointZero;
        [self addChild:menu];
        
    }
    return self;
}

-(void)retryButtonTouched:(CCMenuItem*)sender{
    [[CCDirector sharedDirector] replaceScene:[PBJTScene node]];
    
}

-(void)menuButtonTouched:(CCMenuItem*)sender{
    [[CCDirector sharedDirector] replaceScene:[MenuLayer node]];    
    
}


    

@end
