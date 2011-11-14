//
//  HampsterDanceGameLayer.m
//  HampsterDance
//
//  Created by John Wilson on 11/2/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "PBJTGameLayer.h"
#import "PBJTScene.h"
#import "MasterDataModelController.h"
#import "TrackVO.h"
#import "NoteVO.h"
#import "NoteGameObject.h"

@implementation PBJTGameLayer

@synthesize songTime, track;
@synthesize banana = _banana;
@synthesize moveAction = _moveAction;
@synthesize walkAction = _walkAction;

-(id)init{
    if( (self=[super init])) {
        
        self.isTouchEnabled = YES;
        
        CCLabelTTF* greatest = [CCLabelTTF labelWithString:@"IT'S PEANUT BUTTER JELLY TIME" fontName:SUPERSLOTCAR_FONT_1 fontSize:34];
        greatest.position = ccp(200, 39);
        ccColor3B yellow = {224, 225, 0};
        [greatest setColor:yellow];
        [self addChild:greatest];
        
        
        _gameNotesArray = [[NSMutableArray alloc] init];
        
        //get the trackVO
        self.track = [[MasterDataModelController sharedInstance] jsonParserCatalog:@"test"];
        _spawnNoteIndex = 0;
        _playNoteIndex = 0;
        _zeroNotePlayed = NO;
        _firstNotePlayed = NO;
        _secondNotePlayed = NO;
        _thirdNotePlayed = NO;
        _missed = NO;

        _moveDirection = 0;
        
        
        //noteDistanceToTravel/noteSpeed
        _notePreSpawnTime = 350.0/NOTESPEED;
        _noteDestroyTime = 80.0/NOTESPEED;
        _noteHitTime = 30.0/NOTESPEED;
        
        
        [self setupBananaAnimation];
        
        
    }
    return self;
}

-(void)setupBananaAnimation{
    [[CCSpriteFrameCache sharedSpriteFrameCache] addSpriteFramesWithFile:
     @"BananaSpriteSheet_default.plist"];
    CCSpriteBatchNode *spriteSheet = [CCSpriteBatchNode batchNodeWithFile:@"BananaSpriteSheet_default.png"];
    [self addChild:spriteSheet];
    NSMutableArray *walkAnimFrames = [NSMutableArray array];
    for(int i = 1; i <= 8; ++i) {
        [walkAnimFrames addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName: [NSString stringWithFormat:@"banana%d.png", i]]];
    }
    CCAnimation *walkAnim = [CCAnimation animationWithFrames:walkAnimFrames delay:0.1f];
    CGSize winSize = [CCDirector sharedDirector].winSize;
    self.banana = [CCSprite spriteWithSpriteFrameName:@"banana1.png"]; 
    self.banana.scale = 4.5;
    _banana.position = ccp(winSize.width/2, winSize.height/2);
    self.walkAction = [CCRepeatForever actionWithAction: [CCAnimate actionWithAnimation:walkAnim restoreOriginalFrame:NO]];
    [_banana runAction:_walkAction];
    [spriteSheet addChild:_banana];
    
    _animateWaitTime = [NSTimer scheduledTimerWithTimeInterval:5 target:self selector:@selector(translateBanana:) userInfo:nil repeats:YES];
    
}

-(void)dealloc{
    [_gameNotesArray release];
    [super dealloc];
    
}



#pragma -
#pragma gameLoop

-(void) gameLoop:(ccTime) dt{
    self.songTime += dt;
    if(_missed) 
        [_animateWaitTime invalidate];
    else if(![_animateWaitTime isValid]) 
        _animateWaitTime = [NSTimer scheduledTimerWithTimeInterval:6 target:self selector:@selector(translateBanana:) userInfo:nil repeats:YES];
    [self spawnNotes];
    [self updateGameObjects:dt];
    
}

-(void)translateBanana:(ccTime)dt{
    switch (_moveDirection) {
        case 0:
            [_banana runAction: [CCMoveBy actionWithDuration:1.75 position:ccp(-160,0)]];
            _moveDirection = 1;
            break;
        case 1:
            [_banana runAction: [CCMoveBy actionWithDuration:3 position:ccp(320,0)]];
            _moveDirection = 2;
            break;
        case 2:
            [_banana runAction: [CCMoveBy actionWithDuration:1.75 position:ccp(-160,85)]];
            _moveDirection = 3;
            break;
        case 3:
            [_banana runAction: [CCMoveBy actionWithDuration:1 position:ccp(0,-85)]];
            _moveDirection = 0;
            break;
            
        default:
            break;
            
    }
}

-(void) resetNotesPlayed{
    //refresh notes played variables
    _zeroNotePlayed = NO;
    _firstNotePlayed = NO;
    _secondNotePlayed = NO;
    _thirdNotePlayed = NO;
}

-(void) updateGameObjects:(ccTime) dt{
    NSMutableArray *deleteArray = [[[NSMutableArray alloc] init] autorelease];
    for(NoteGameObject *noteGameObject in _gameNotesArray){
        noteGameObject.position = ccp(noteGameObject.position.x, noteGameObject.position.y - (dt * NOTESPEED));
        if(noteGameObject.noteVO.time + _noteDestroyTime < songTime){
            [deleteArray addObject:noteGameObject];
        }
    }
    
    for(NoteGameObject* delete in deleteArray){
        [_gameNotesArray removeObject:delete];
        [self removeChild:delete cleanup:YES];
    }
    
}

-(void)spawnNotes{
    //check 10 notes ahhead for notes that should spawn
    for(int i = _spawnNoteIndex; i < _spawnNoteIndex + 10 && i < self.track.noteArray.count; i++){
        NoteVO *note = [self.track.noteArray objectAtIndex:i];
        if((note.time - _notePreSpawnTime) < songTime){
            NoteGameObject *sprite = [[NoteGameObject alloc] initWithNoteVO:note];
            [self addChild:sprite];
            
            [_gameNotesArray addObject:sprite];
            _spawnNoteIndex++;
        }
    }
}


#pragma -
#pragma draw
-(void) draw{
    [super draw];
    //    BezierCurve *carCurve = [self.trackVO.trackPoints objectAtIndex:self.carPosition.index];
    
    //  CGPoint carSpot = [BezierCurve findPositionOnCurve:carCurve atTime:self.carPosition.time];
   // LevelModel *LM = [LevelModel sharedInstance];
    //    ccDrawCircle(LM.playerCar.position, 10,0,16,NO);
    glLineWidth(1);
    int height = 100;
    ccDrawLine(ccp(0, height), ccp(480, height));
        ccDrawLine(ccp(0, height/2), ccp(480, height/2));
    for(int i = 1; i < 5; i++){
        ccDrawLine(ccp( (480/4) * i,0 ), ccp((480/4) * i, height));
    }

}

#pragma -
#pragma touch

-(int)noteHit:(CGPoint) touch{
    if(touch.y > 220){
        for(int i = 1; i < 5; i++){
            float noteNumber = i * (480/4);
            if(touch.x < noteNumber){
                return (i - 1);
            }
        }
    }
    return -1;
}

-(void)checkNoteHit:(int)note{
    if([self checkIfNoteHasBeenPlayed:note]){
        return;
    }
    NoteGameObject* delete = nil;
    for(NoteGameObject* noteGameObject in _gameNotesArray){
        if(noteGameObject.noteVO.note == note){
            if((noteGameObject.noteVO.time - _noteHitTime) < songTime && (noteGameObject.noteVO.time + _noteHitTime) >songTime){
                
                if(note == 0){
                    _zeroNotePlayed = YES;
                }
                if(note == 1){
                    _firstNotePlayed = YES;
                }
                if(note == 2){
                    _secondNotePlayed = YES;
                }
                if(note == 3){
                    _thirdNotePlayed = YES;
                }
                
                [PBJTScene sharedScene].score += 100;
                
                delete = noteGameObject;
                break;
            }
        }
    }
    
    [_gameNotesArray removeObject:delete];
    [self removeChild:delete cleanup:YES];    
}

-(BOOL) checkIfNoteHasBeenPlayed:(int)note{
    if(note == 0){
        return _zeroNotePlayed;
    }
    if(note == 1){
        return _firstNotePlayed;
    }
    if(note == 2){
        return _secondNotePlayed;
    }
    if(note == 3){
        return _thirdNotePlayed;
    }
    NSLog(@"GameLayer::checkIfNoteHasBeenPlayed, error note isn't recognized");
    return YES;
}

-(void)ccTouchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    int count = 0;
    for(UITouch* touch in touches){
        count++;
//        UITouch *touch = [touches anyObject];
        CGPoint location = [touch locationInView: [touch view]];
        int note = [self noteHit:location];
        NSLog(@"noteTouh: %d", note);
        if(note != -1){
            [self checkNoteHit:note];
        }        
    }
    NSLog(@"touchCount: %d", count);
    [self resetNotesPlayed];
}

-(void)ccTouchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
        UITouch *touch = [touches anyObject];
        CGPoint location = [touch locationInView: [touch view]];
}

- (void)ccTouchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
        UITouch *touch = [touches anyObject];
        CGPoint location = [touch locationInView: [touch view]];
}

@end
