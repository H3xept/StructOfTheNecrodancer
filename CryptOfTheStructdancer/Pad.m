//
//  Pad.m
//  CryptOfTheStructdancer
//
//  Created by Leonardo Cascianelli on 27/12/15.
//  Copyright © 2015 Leonardo Cascianelli. All rights reserved.
//

#import "Pad.h"

@implementation Pad
- (instancetype)initWithEventRef:(CGEventRef)eventRef
{
	self = [super init];
	self.event = eventRef;
	return self;
}
@end
