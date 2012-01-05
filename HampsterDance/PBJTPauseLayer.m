//
//  PBJTPauseLayer.m
//  HampsterDance
//
//  Created by John Wilson on 11/7/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "PBJTPauseLayer.h"
#import "PBJTScene.h"


@implementation PBJTPauseLayer

@synthesize pauseLabel, resumeButton, restartButton, quitButton;

-(id)init{
    if( (self=[super init])) {
        
        self.isTouchEnabled = YES;
        
        
        //pause label
        self.pauseLabel = [CCLabelTTF labelWithString:@"PAUSE" fontName:PBJT_FONT1 fontSize:20];
        self.pauseLabel.position = ccp(200, 260);
        ccColor3B yellow = {224, 225, 0};
        [self.pauseLabel setColor:yellow];
        [self addChild:self.pauseLabel];
        
        //resume button
        CCSprite *sprite10 = [CCSprite spriteWithFile:@"ResumeButton.png"];
        CCSprite *sprite11 = [CCSprite spriteWithFile:@"ResumeButton.png"];
        CCSprite *sprite12 = [CCSprite spriteWithFile:@"ResumeButton.png"];
        CCMenuItemSprite *resumeButtonItem = [CCMenuItemSprite itemFromNormalSprite:sprite10 selectedSprite:sprite11 disabledSprite:sprite12 target:self selector:@selector(resumeButtonTouched:)];
        resumeButtonItem.position = ccp(120, 200);
        resumeButtonItem.tag = 0;
        
        
        self.resumeButton = [CCMenu menuWithItems:resumeButtonItem,  nil];
        self.resumeButton.position = CGPointZero;

        //RESTART button
        CCSprite *sprite13 = [CCSprite spriteWithFile:@"RetryButton.png"];
        CCSprite *sprite14 = [CCSprite spriteWithFile:@"RetryButton.png"];
        CCSprite *sprite15 = [CCSprite spriteWithFile:@"RetryButton.png"];
        CCMenuItemSprite *restartButtonItem = [CCMenuItemSprite itemFromNormalSprite:sprite13 selectedSprite:sprite14 disabledSprite:sprite15 target:self selector:@selector(restartButtonTouched:)];
        restartButtonItem.position = ccp(120, 140);
        restartButtonItem.tag = 0;
        
        self.restartButton = [CCMenu menuWithItems:restartButtonItem,  nil];
        self.restartButton.position = CGPointZero;
        
        
        //QUIT button
        CCSprite *sprite16 = [CCSprite spriteWithFile:@"QuitButton.png"];
        CCSprite *sprite17 = [CCSprite spriteWithFile:@"QuitButton.png"];
        CCSprite *sprite18 = [CCSprite spriteWithFile:@"QuitButton.png"];
        CCMenuItemSprite *quitButtonItem = [CCMenuItemSprite itemFromNormalSprite:sprite16 selectedSprite:sprite17 disabledSprite:sprite18 target:self selector:@selector(quitButtonTouched:)];
        quitButtonItem.position = ccp(120, 80);
        quitButtonItem.tag = 0;
        
        self.quitButton = [CCMenu menuWithItems:quitButtonItem,  nil];
        self.quitButton.position = CGPointZero;
        
        [self addChild:self.resumeButton];
        [self addChild:self.restartButton];
        [self addChild:self.quitButton];
        
        
        
    }
    return self;
}


-(void)resumeButtonTouched:(CCMenuItem*)sender{
    PBJTScene *scene = [PBJTScene sharedScene];
    [scene unPauseGame];
    
}

-(void)restartButtonTouched:(CCMenuItem*)sender{
    PBJTScene *scene = [PBJTScene sharedScene];
    
}

-(void)quitButtonTouched:(CCMenuItem*)sender{
    PBJTScene *scene = [PBJTScene sharedScene];
    [scene transitionToMainMenu];
}

@end
