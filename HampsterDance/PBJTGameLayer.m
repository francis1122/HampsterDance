//
//  HampsterDanceGameLayer.m
//  HampsterDance
//
//  Created by John Wilson on 11/2/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "PBJTGameLayer.h"
#import "PBJTScene.h"


@implementation PBJTGameLayer

-(id)init{
    if( (self=[super init])) {
        
        self.isTouchEnabled = YES;
        
        CCLabelTTF* greatest = [CCLabelTTF labelWithString:@"IT'S PEANUT BUTTER JELLY TIME" fontName:SUPERSLOTCAR_FONT_1 fontSize:34];
        greatest.position = ccp(200, 39);
        ccColor3B yellow = {224, 225, 0};
        [greatest setColor:yellow];
        [self addChild:greatest];
    }
    return self;
}




#pragma -
#pragma gameLoop

-(void) gameLoop:(ccTime) dt{
    [PBJTScene sharedScene].score += dt * 1000;
    
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
    /*    if( LM.trackVO != NULL){
     if( ![LM.trackVO isParsing] ){
     for(BezierCurve *curve in LM.trackVO.trackPoints){
     
     ccDrawCubicBezier(curve.start, curve.control1, curve.control2, curve.end, 32);   
     }
     }
     }
     */
    /*    CGPoint previous = [[outline objectAtIndex:0] CGPointValue];
     for(NSValue *point in outline){
     
     ccDrawLine(previous, [point CGPointValue]);
     previous = [point CGPointValue];
     
     }*/
    glLineWidth(4);
   // ccDrawPoly([LM.trackVO getTrackOutline], LM.trackVO.outlineCount , NO);
}

#pragma -
#pragma touch



-(void)ccTouchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
        UITouch *touch = [touches anyObject];
        CGPoint location = [touch locationInView: [touch view]];
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
