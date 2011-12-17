//
//  NSObject+Swizzle.h
//  socializeiostitanium
//
//  Created by Nathaniel Griswold on 12/16/11.
//  Copyright (c) 2011 Nathaniel Griswold. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (Swizzle)
+ (void)swizzleSelector:(SEL)oldSel withSelector:(SEL)newSel;
@end
