//
//  ConnectionController.m
//  CryptOfTheStructdancer
//
//  Created by Leonardo Cascianelli on 27/12/15.
//  Copyright © 2015 Leonardo Cascianelli. All rights reserved.
//

#import "ConnectionController.h"
#import "SerialReceiver.h"
#import "KeypressSimulator.h"
#import "enum.h"

@interface ConnectionController()
- (kArrowsDirection)parseData:(NSString *)recvString;
@end

@implementation ConnectionController

- (instancetype)init
{
	self = [super init];
	self.serialReceiver = [[SerialReceiver alloc] initWithSerialPort:@"/dev/tty.usbmodem1d121" baudRate:9600];
	self.serialReceiver.delegate = self;
	return self;
}

- (void)openConnection
{
	[self.serialReceiver startListeningForPackets];
}

- (void)handleReceivedData:(NSData *)recv
{
	NSString* recvString = [NSString stringWithFormat:@"%s",recv.bytes];
	[self parseData:recvString];
}

- (kArrowsDirection)parseData:(NSString *)recvString
{
	NSString* fStep = [NSString stringWithFormat:@"%@",[recvString substringFromIndex:1]];
	const char* rawString = [[NSString stringWithFormat:@"%@",[fStep substringToIndex:recvString.length-2]] UTF8String];
	[[KeypressSimulator sharedInstance] handleRawInput:rawString];
	return 0;
}

@end
