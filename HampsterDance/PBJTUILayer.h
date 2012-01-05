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
    CCLabelTTF *comboLabel;
    
    CCMenu *pauseButton;
}
@property (nonatomic, retain) CCMenu *pauseButton;
@property (nonatomic, retain) CCLabelTTF *scoreLabel;
@property (nonatomic, retain) CCLabelTTF *comboLabel;



-(void)pauseButtonTouched:(CCMenuItem*)sender;

@end
