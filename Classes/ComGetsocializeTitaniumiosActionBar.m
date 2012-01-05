//
//  ComGetsocializeTitaniumiosView.m
//  socializeiostitanium
//
//  Created by Nathaniel Griswold on 12/16/11.
//  Copyright (c) 2011 Nathaniel Griswold. All rights reserved.
//

#import "ComGetsocializeTitaniumiosActionBar.h"
#import <Socialize/Socialize.h>

#import "ComGetsocializeTitaniumiosActionBar.h"
#import "TiUtils.h"
#import "TiUIiPhoneNavigationGroup.h"

@interface TiUIiPhoneNavigationGroup ()
-(UINavigationController*)controller;
@end

@implementation ComGetsocializeTitaniumiosActionBar
@synthesize actionBar = actionBar_;
@synthesize presentModalInViewController = presentModalInViewController_;
@synthesize entityKey = entityKey_;

-(void)dealloc
{
    RELEASE_TO_NIL(actionBar_);
    RELEASE_TO_NIL(presentModalInViewController_);
    RELEASE_TO_NIL(entityKey_);

    [super dealloc];
}

- (void)reloadActionBar {
    NSBundle *bundle = [NSBundle mainBundle];
    NSLog(@"Bundle is %@", bundle);
    NSAssert(self.entityKey != nil && self.presentModalInViewController != nil, @"Both entity key and modal presentation target are required");

    if (self.actionBar != nil) {
        [self.actionBar.view removeFromSuperview];
    }
    
    NSLog(@"Readding action bar!");
    self.actionBar = [[[SocializeActionBar alloc] initWithEntityKey:self.entityKey presentModalInController:self.presentModalInViewController] autorelease];
    self.actionBar.noAutoLayout = YES;
    self.actionBar.view.frame = CGRectMake(0, 0, 320, 44);
    [self addSubview:self.actionBar.view];
}

- (void)tryLoadActionBar {
    if (self.entityKey != nil && self.presentModalInViewController != nil) {
        [self reloadActionBar];
    }
}

-(void)frameSizeChanged:(CGRect)frame bounds:(CGRect)bounds
{
    [TiUtils setView:self.actionBar.view positionRect:bounds];
}

- (void)setEntityKey_:(id)arg {
    NSString *key = arg;
    self.entityKey = key;
    NSLog(@"Setting key to %@", key);
    [self tryLoadActionBar];
}

- (void)setModalController_:(id)arg {
    UINavigationController *nav = [(TiUIiPhoneNavigationGroup*)arg controller];
    self.presentModalInViewController = nav;
    
    [self tryLoadActionBar];
}

@end
