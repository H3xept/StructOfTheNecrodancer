//
//  main.m
//  CryptOfTheStructdancer
//
//  Created by Leonardo Cascianelli on 26/12/15.
//  Copyright © 2015 Leonardo Cascianelli. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ConnectionController.h"


int main(int argc, const char * argv[]) {
	@autoreleasepool {
		
		ConnectionController* conn = [[ConnectionController alloc] init];
		[conn openConnection];
		
		[[NSRunLoop currentRunLoop] run];
		
		
	}
	
    return 0;
}
