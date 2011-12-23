//
//  ComGetsocializeTitaniumiosView.h
//  socializeiostitanium
//
//  Created by Nathaniel Griswold on 12/16/11.
//  Copyright (c) 2011 Nathaniel Griswold. All rights reserved.
//


#import "TiUIView.h"

@class SocializeActionBar;

@interface ComGetsocializeTitaniumiosActionBar : TiUIView

@property (nonatomic, retain) SocializeActionBar *actionBar;
@property (nonatomic, retain) UIViewController *presentModalInViewController;
@property (nonatomic, retain) NSString *entityKey;
@end