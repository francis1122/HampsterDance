//
//  PBJTPauseLayer.h
//  HampsterDance
//
//  Created by John Wilson on 11/7/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"

@interface PBJTPauseLayer : CCLayer {
    CCLabelTTF *pauseLabel;
    
    CCMenu *resumeButton;
    CCMenu *restartButton;
    CCMenu *quitButton;
}
@property (nonatomic, retain) CCMenu *resumeButton, *restartButton, *quitButton;
@property (nonatomic, retain) CCLabelTTF *pauseLabel;


-(void)resumeButtonTouched:(CCMenuItem*)sender;
-(void)restartButtonTouched:(CCMenuItem*)sender;
-(void)quitButtonTouched:(CCMenuItem*)sender;
@end
