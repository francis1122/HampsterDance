//
//  MasterDataModelController.h
//  HampsterDance
//
//  Created by John Wilson on 11/8/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class TrackVO;
@interface MasterDataModelController : NSObject{
    
}

+ (id)sharedInstance;

-(TrackVO*)jsonParserCatalog:(NSString*)jString;

@end
