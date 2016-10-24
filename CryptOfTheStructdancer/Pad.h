//
//  Pad.h
//  CryptOfTheStructdancer
//
//  Created by Leonardo Cascianelli on 27/12/15.
//  Copyright © 2015 Leonardo Cascianelli. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Pad : NSObject
@property (nonatomic) CGEventRef event;
- (instancetype)initWithEventRef:(CGEventRef)eventRef;
@end
