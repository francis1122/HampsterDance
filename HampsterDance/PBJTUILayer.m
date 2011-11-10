//
//  HampsterDanceUILayer.m
//  HampsterDance
//
//  Created by John Wilson on 11/2/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "PBJTUILayer.h"
#import "PBJTScene.h"

@implementation PBJTUILayer

@synthesize scoreLabel, pauseButton;

-(id)init{
    if( (self=[super init])) {
        
        self.isTouchEnabled = YES;
        
        
        //score label
        self.scoreLabel = [CCLabelTTF labelWithString:@"Score: 0" fontName:SUPERSLOTCAR_FONT_1 fontSize:20];
        self.scoreLabel.position = ccp(400, 300);
        ccColor3B yellow = {224, 225, 0};
        [self.scoreLabel setColor:yellow];
        [self addChild:self.scoreLabel];
        
        //pause button
        CCSprite *sprite10 = [CCSprite spriteWithFile:@"Icon-72.png"];
        CCSprite *sprite11 = [CCSprite spriteWithFile:@"Icon-72.png"];
        CCSprite *sprite12 = [CCSprite spriteWithFile:@"Icon-72.png"];
        CCMenuItemSprite *raceBeginButton = [CCMenuItemSprite itemFromNormalSprite:sprite10 selectedSprite:sprite11 disabledSprite:sprite12 target:self selector:@selector(pauseButtonTouched:)];
        raceBeginButton.position = ccp(20, 300);
        raceBeginButton.tag = 0;
        
        
        
        self.pauseButton = [CCMenu menuWithItems:raceBeginButton,  nil];
        self.pauseButton.position = CGPointZero;
        
        
        [self addChild:self.pauseButton];
        
        
        
    }
    return self;
}


-(void)pauseButtonTouched:(CCMenuItem*)sender{
    PBJTScene *scene = [PBJTScene sharedScene];
    if(scene.isGamePaused){
        //shoudn't get called ever
    }else{
        [scene pauseGame];
    }
}
    
    

@end
