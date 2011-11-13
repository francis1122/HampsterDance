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
    
    float _notePreSpawnTime;
    float _noteDestroyTime;
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
}


@property float songTime;
@property (nonatomic, retain) TrackVO *track;

-(void) gameLoop:(ccTime) dt;
-(void) updateGameObjects:(ccTime) dt;
-(void)spawnNotes;


-(void) resetNotesPlayed;

-(int)noteHit:(CGPoint) touch;
-(void)checkNoteHit:(int)note;
-(BOOL) checkIfNoteHasBeenPlayed:(int)note;

@end
