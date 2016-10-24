//
//  ConnectionController.h
//  CryptOfTheStructdancer
//
//  Created by Leonardo Cascianelli on 27/12/15.
//  Copyright © 2015 Leonardo Cascianelli. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SerialRecvDataDelegate.h"

@class SerialReceiver;

@interface ConnectionController : NSObject <SerialRecvDataDelegate>
@property (nonatomic,strong) SerialReceiver* serialReceiver;
- (void)handleReceivedData:(NSData *)recv;
- (void)openConnection;
@end
