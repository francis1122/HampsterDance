//
//  HampsterDanceUILayer.h
//  HampsterDance
//
//  Created by John Wilson on 11/2/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"

@interface PBJTUILayer : CCLayer {
 
    CCLabelTTF *scoreLabel;
    
    CCMenu *pauseButton;
}
@property (nonatomic, retain) CCMenu *pauseButton;
@property (nonatomic, retain) CCLabelTTF *scoreLabel;



-(void)pauseButtonTouched:(CCMenuItem*)sender;

@end
