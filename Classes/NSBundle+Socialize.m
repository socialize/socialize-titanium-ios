//
//  NSBundle+Socialize.m
//  socializeiostitanium
//
//  Created by Nathaniel Griswold on 12/16/11.
//  Copyright (c) 2011 Nathaniel Griswold. All rights reserved.
//

#import "NSBundle+Socialize.h"
#import "NSObject+Swizzle.h"
#import "ComGetsocializeTitaniumiosModule.h"

@implementation NSBundle (Socialize)

+ (NSBundle*)sz_mainBundle {
    NSLog(@"Loading socialize bundle");
    NSString *path = [NSString stringWithFormat:@"modules/%@/socialize.bundle",MODULEID];
    return [NSBundle bundleWithPath:path];
}

+ (void)load {
    NSLog(@"NSBundle loading");
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        [self swizzleSelector:@selector(mainBundle) withSelector:@selector(sz_mainBundle)];
    });
}

@end
