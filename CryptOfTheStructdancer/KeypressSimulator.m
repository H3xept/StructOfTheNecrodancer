//
//  KeypressSimulator.m
//  CryptOfTheStructdancer
//
//  Created by Leonardo Cascianelli on 27/12/15.
//  Copyright © 2015 Leonardo Cascianelli. All rights reserved.
//

#define firstChar(S) *S
#define lastChar(S) *(S+strlen(S)-1)

#import "KeypressSimulator.h"
#import "Pad.h"

@interface KeypressSimulator()
@property (nonatomic,strong) NSMutableDictionary* hashTable;
@end

@implementation KeypressSimulator

+ (instancetype)sharedInstance
{
	static KeypressSimulator* privInstance = nil;
	if(!privInstance)
	{
		privInstance = [[KeypressSimulator alloc] init];
		if(!privInstance.hashTable) privInstance.hashTable = [NSMutableDictionary dictionary];
	}

	return privInstance;
}

- (void)handleRawInput:(const char *)string
{
	int num = atoi(string);
	switch(num)
	{
		case 10:
			[self simulateKeypress:kArrowsDirectionUp];
			break;
		case 11:
			[self releaseKeypress:kArrowsDirectionUp];
			break;
		case 20:
			[self simulateKeypress:kArrowsDirectionLeft];
			break;
		case 21:
			[self releaseKeypress:kArrowsDirectionLeft];
			break;
		case 30:
			[self simulateKeypress:kArrowsDirectionDown];
			break;
		case 31:
			[self releaseKeypress:kArrowsDirectionDown];
			break;
		case 40:
			[self simulateKeypress:kArrowsDirectionRight];
			break;
		case 41:
			[self releaseKeypress:kArrowsDirectionRight];
			break;
	}
	
}

- (void)simulateKeypress:(kArrowsDirection)arrowsDirection
{
	Pad* eventPad;
	CGEventRef arrDir = CGEventCreateKeyboardEvent (NULL, (CGKeyCode)arrowsDirection, true);
	CGEventPost(kCGSessionEventTap, arrDir);
	eventPad = [[Pad alloc] initWithEventRef:arrDir];
	
	[self.hashTable setObject:eventPad forKey:[NSString stringWithFormat:@"%u",arrowsDirection]];
}

- (void)releaseKeypress:(kArrowsDirection)arrowDirection
{
	CGEventRef arrDir = CGEventCreateKeyboardEvent (NULL, (CGKeyCode)arrowDirection, false);
	CGEventPost(kCGSessionEventTap, arrDir);
	Pad* eventPad = [self.hashTable objectForKey:[NSString stringWithFormat:@"%u",arrowDirection]];
	if(eventPad)
		CFRelease(eventPad.event);
}
@end
