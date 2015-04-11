//
//  FMViewController.m
//  FMEventDispatcher
//
//  Created by Frank Marceau on 02/25/2015.
//  Copyright (c) 2014 Frank Marceau. All rights reserved.
//

#import "FMViewController.h"
#import <FMEventDispatcher/FMEventDispatcher.h>

@interface FMViewController ()
@end

@implementation FMViewController

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [[FMEventDispatcher sharedDispatcher] addEventObserver:self];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [[FMEventDispatcher sharedDispatcher] removeEventObserver:self];
}

//------------------------------------------------------------------------------
#pragma mark - EventDispatcher
//------------------------------------------------------------------------------
- (void)myFirstSelector {
    NSLog(@"<=== MyFirstSelector ===>");
}

- (void)mySecondSelector:(UIApplication *)application {
    NSLog(@"<=== MySecondSelector application:%@ ===>", application);
}

- (void)myThirdSelector:(UIApplication *)application secondObject:(NSString *)secondObject {
    NSLog(@"<=== MyThirdSelector application:%@ - secondObject:%@ ===>", application, secondObject);
}

@end
