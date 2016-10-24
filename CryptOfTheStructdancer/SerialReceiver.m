//
//  SerialReceiver.m
//  CryptOfTheStructdancer
//
//  Created by Leonardo Cascianelli on 27/12/15.
//  Copyright © 2015 Leonardo Cascianelli. All rights reserved.
//

#define __DBG__
#import "SerialReceiver.h"
#import "dbg.h"

@interface SerialReceiver()
@property (nonatomic,strong) ORSSerialPort* serialPort;
@property (nonatomic,strong) ORSSerialPacketDescriptor* packetDescriptor;
- (void)setupPacketDescriptor:(ORSSerialPacketDescriptor*)packetDescriptor;
- (void)startListeningForPackets;
@end

@implementation SerialReceiver

- (instancetype)initWithSerialPort:(NSString *)serialPort baudRate:(int)baudRate ORSSerialPacketDescriptor:(ORSSerialPacketDescriptor *)packetDescriptor
{
	self = [super init];
	self.serialPort = [ORSSerialPort serialPortWithPath:serialPort];
	self.serialPort.baudRate = [NSNumber numberWithInt:baudRate];
	self.serialPort.delegate = self;
	[self setupPacketDescriptor:packetDescriptor];
	return self;
}

- (instancetype)initWithSerialPort:(NSString *)serialPort baudRate:(int)baudRate
{
	return [self initWithSerialPort:serialPort baudRate:baudRate ORSSerialPacketDescriptor:nil];
}

- (void)setupPacketDescriptor:(ORSSerialPacketDescriptor *)packetDescriptor
{
	if(packetDescriptor)
	{
		self.packetDescriptor = packetDescriptor;
		return;
	}
	self.packetDescriptor = [[ORSSerialPacketDescriptor alloc] initWithPrefixString:@"[" suffixString:@"]" maximumPacketLength:6 userInfo:nil];
	return;
}

- (void)handleReceivedData:(NSData *)recv
{
	if(self.delegate)
	{
		if([self.delegate respondsToSelector:@selector(handleReceivedData:)])
		[self.delegate handleReceivedData:recv];
		_info("%s\n",[[NSString stringWithFormat:@"%s",recv.bytes] UTF8String]);
		return;
	}
	fprintf(stdout,"%s\n", [[NSString stringWithFormat:@"%s",recv.bytes] UTF8String]);
}

- (void)startListeningForPackets
{
	[self.serialPort startListeningForPacketsMatchingDescriptor:self.packetDescriptor];
	[self.serialPort open];
}

- (void)serialPort:(ORSSerialPort *)serialPort didReceivePacket:(NSData *)packetData matchingDescriptor:(ORSSerialPacketDescriptor *)descriptor
{
	_info("[RECEIVING DATA]");
	if(packetData)
		[self handleReceivedData:packetData];
}

- (void)serialPort:(ORSSerialPort *)serialPort didEncounterError:(NSError *)error
{
	_err("%s",[[NSString stringWithFormat:@"%@",error] UTF8String]);
error:
	exit(-1);
}

- (void)serialPort:(ORSSerialPort *)serialPort requestDidTimeout:(ORSSerialRequest *)request
{
	_warn("Request %s for port %s timed out.",[[NSString stringWithFormat:@"%@",request] UTF8String],[[NSString stringWithFormat:@"%@",serialPort] UTF8String]);
}

- (void)serialPortWasClosed:(ORSSerialPort *)serialPort
{
	_warn("Serial port %s has been closed.",[[NSString stringWithFormat:@"%@",serialPort] UTF8String]);
}

- (void)serialPortWasOpened:(ORSSerialPort *)serialPort
{
	_warn("Serial port %s has been opened.",[[NSString stringWithFormat:@"%@",serialPort] UTF8String]);
}

- (void)serialPortWasRemovedFromSystem:(ORSSerialPort *)serialPort
{
	_warn("Serial port %s has been removed from the system.",[[NSString stringWithFormat:@"%@",serialPort] UTF8String]);
}

@end