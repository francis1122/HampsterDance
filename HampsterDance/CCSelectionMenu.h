//
//  CCSelectionMenu.h
//  HampsterDance
//
//  Created by John Wilson on 12/15/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"

@class CCMenuItemSelectionImage;
@interface CCSelectionMenu : CCMenu {
 

}

+(id) menuWithItems: (CCMenuItemSelectionImage*) item, ...;

-(id) initWithItems: (CCMenuItemSelectionImage*) item vaList: (va_list) args;

@end
