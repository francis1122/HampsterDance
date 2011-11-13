//
//  HampsterDanceScene.m
//  HampsterDance
//
//  Created by John Wilson on 11/2/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "PBJTScene.h"
#import "PBJTUILayer.h"
#import "PBJTGameLayer.h"
#import "PBJTPauseLayer.h"
#import "MenuLayer.h"
#import "MasterDataModelController.h"

static PBJTScene* pbjtSharedScene;

@implementation PBJTScene

@synthesize gameLayer, uiLayer, score, isSongStarted, isGamePaused, pauseLayer;

+(PBJTScene*) sharedScene{
    NSAssert(pbjtSharedScene != nil, @"pbjtSharedScene not available!");
    return pbjtSharedScene;
}

-(id) init{
	
	if( (self=[super init])) {
        pbjtSharedScene = self;
        self.score = 0;
        self.gameLayer = nil;
        self.uiLayer = nil;
        self.isGamePaused = NO;
        
        self.gameLayer = [PBJTGameLayer node];
        self.uiLayer = [PBJTUILayer node];
        self.pauseLayer = [PBJTPauseLayer node];
        
        [self addChild:self.gameLayer];
        [self addChild:self.uiLayer];
        
		[self schedule: @selector(gameLoop:)];
    }
	return self;
}

-(void)dealloc{
    pbjtSharedScene = nil;
	[super dealloc];
}

-(void) setScore:(NSInteger)_score{
    if(self.uiLayer){
        [self.uiLayer.scoreLabel setString:[NSString stringWithFormat:@"Score: %d", _score]];
    }
    score = _score;
}

-(void) gameLoop:(ccTime) dt{
    
    
    //check if the game is paused
    if(!self.isGamePaused){
        if(self.gameLayer){
            [self.gameLayer gameLoop:dt];
        }
    }
}


#pragma mark - TransitionS

-(void) transitionToMainMenu{
    
    [[CCDirector sharedDirector] replaceScene:[MenuLayer node]];
    
}

-(void) pauseGame{
    self.isGamePaused = YES;
    [self addChild: self.pauseLayer];
}

-(void) unPauseGame{
    self.isGamePaused = NO;
    [self removeChild:self.pauseLayer cleanup:NO];
}

@end
