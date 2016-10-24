//
//  KeypressSimulator.h
//  CryptOfTheStructdancer
//
//  Created by Leonardo Cascianelli on 27/12/15.
//  Copyright © 2015 Leonardo Cascianelli. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "enum.h"

@interface KeypressSimulator : NSObject
+ (instancetype)sharedInstance;
- (void)handleRawInput:(const char*)string;
- (void)simulateKeypress:(kArrowsDirection)arrowDirection;
@end
