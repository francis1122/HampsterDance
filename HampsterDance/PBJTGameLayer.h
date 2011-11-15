//
//  HampsterDanceGameLayer.h
//  HampsterDance
//
//  Created by John Wilson on 11/2/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"


@class TrackVO;
@interface PBJTGameLayer : CCLayer {
    float songTime;
    TrackVO *track;
    
    // the time before the note is supposed to get played when it spawns.
    float _notePreSpawnTime;
    // how long the note lives for after it was supposed to be played
    float _noteDestroyTime;
    //the time range that the player can hit the note from when its supposed to be played
    float _noteHitTime;
    
    //gameObjects
    NSMutableArray *_gameNotesArray;
    
    //spawn notes variables
    int _spawnNoteIndex;
    
    //playNote variables
    int _playNoteIndex;
    BOOL _zeroNotePlayed;
    BOOL _firstNotePlayed;
    BOOL _secondNotePlayed;
    BOOL _thirdNotePlayed;
    
    CCSprite *banana;
    CCAction *_walkAction;
    CCAction *_moveAction;
    BOOL _moving;
    BOOL _missed;
    
    NSTimer *_animateWaitTime;
    int _moveDirection;

}


@property float songTime;
@property (nonatomic, retain) TrackVO *track;
@property (nonatomic, retain) CCSprite *banana;
@property (nonatomic, retain) CCAction *walkAction;
@property (nonatomic, retain) CCAction *moveAction;

-(void) gameLoop:(ccTime) dt;
-(void) updateGameObjects:(ccTime) dt;
-(void)spawnNotes;


-(void) resetNotesPlayed;


-(int)noteHit:(CGPoint) touch;
-(void)checkNoteHit:(int)note;
-(int) scoreEvaluator:(float)noteTime WithSongTime:(float)_songTime;
-(BOOL) checkIfNoteHasBeenPlayed:(int)note;
-(void)setupBananaAnimation;

@end
