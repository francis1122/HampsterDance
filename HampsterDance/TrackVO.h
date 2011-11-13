//
//  TrackVO.h
//  HampsterDance
//
//  Created by John Wilson on 11/12/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TrackVO : NSObject{
    
    NSMutableArray *noteArray;
    
}

@property (nonatomic, retain) NSMutableArray *noteArray;

-(id)initWithDictionary:(NSDictionary*) dictionary;

@end
