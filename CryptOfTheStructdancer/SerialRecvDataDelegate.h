//
//  SerialRecvDataDelegate.h
//  CryptOfTheStructdancer
//
//  Created by Leonardo Cascianelli on 27/12/15.
//  Copyright © 2015 Leonardo Cascianelli. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol SerialRecvDataDelegate <NSObject>
@required
- (void)handleReceivedData:(NSData *)recv;
@end
