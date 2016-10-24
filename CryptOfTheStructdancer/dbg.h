//
//  dbg.h
//  CryptOfTheStructdancer
//
//  Created by Leonardo Cascianelli on 27/12/15.
//  Copyright © 2015 Leonardo Cascianelli. All rights reserved.
//

#ifndef dbg_h
#define dbg_h

#include <stdio.h>
#include <errno.h>
#include <string.h>

#ifndef __DBG__ 
#define _info(M,...)
#define _warn(M,...)
#define _err(M,...) {fprintf(stderr, "[!!] " M "\n", ##__VA_ARGS__); errno=0; goto error;}
#else
#define _info(M,...) fprintf(stderr, "[@] " M "\n", ##__VA_ARGS__)
#define _warn(M,...) fprintf(stderr, "[!?] " M "\n", ##__VA_ARGS__)
#define _err(M,...) {fprintf(stderr, "[!!] " M "\n", ##__VA_ARGS__); errno=0; goto error;}
#endif

#endif /* dbg_h */
