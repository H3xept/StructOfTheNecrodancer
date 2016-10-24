//
//  SerialReceiver.h
//  CryptOfTheStructdancer
//
//  Created by Leonardo Cascianelli on 27/12/15.
//  Copyright © 2015 Leonardo Cascianelli. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ORSSerialPort.h"
#import "ORSSerialPortManager.h"
#import "ORSSerialPacketDescriptor.h"

@interface SerialReceiver : NSObject <ORSSerialPortDelegate>
@property (nonatomic,strong) id delegate;

- (void)serialPort:(ORSSerialPort *)serialPort didReceivePacket:(NSData *)packetData matchingDescriptor:(ORSSerialPacketDescriptor *)descriptor;
- (void)serialPort:(ORSSerialPort *)serialPort didEncounterError:(NSError *)error;
- (void)serialPortWasOpened:(ORSSerialPort *)serialPort;
- (void)serialPortWasClosed:(ORSSerialPort *)serialPort;
- (void)serialPort:(ORSSerialPort *)serialPort requestDidTimeout:(ORSSerialRequest *)request;
- (void)handleReceivedData:(NSData*)recv;
- (instancetype)initWithSerialPort:(NSString*)serialPort baudRate:(int)baudRate;
- (instancetype)initWithSerialPort:(NSString*)serialPort baudRate:(int)baudRate ORSSerialPacketDescriptor:(ORSSerialPacketDescriptor*)packetDescriptor;
- (void)startListeningForPackets;
@end
