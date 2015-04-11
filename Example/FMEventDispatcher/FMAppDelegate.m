//
//  FMAppDelegate.m
//  FMEventDispatcher
//
//  Created by CocoaPods on 02/25/2015.
//  Copyright (c) 2014 Frank Marceau. All rights reserved.
//

#import "FMAppDelegate.h"
#import "FMViewController.h"
#import <FMEventDispatcher/FMEventDispatcher.h>

@interface FMAppDelegate()
@property (nonatomic, readonly) FMEventDispatcher *eventDispatcher;
@end

@implementation FMAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    FMViewController *rootViewController = [[FMViewController alloc] init];
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window setRootViewController:rootViewController];
    [self.window makeKeyAndVisible];
    
    [self sendEvents];
    
    return YES;
}

- (void)sendEvents {
    // Dispatching event without object
    [[FMEventDispatcher sharedDispatcher] dispatchEvent:@"myFirstSelector"];
    
    // Dispatching event with one object
    [[FMEventDispatcher sharedDispatcher] dispatchEvent:@"mySecondSelector:" objects:@[self]];
    
    // Dispatching event with two objects
    [[FMEventDispatcher sharedDispatcher] dispatchEvent:@"myThirdSelector:secondObject:" objects:@[self, @"Another object"]];
    
    // Dispatching event, but FMViewController won't implement it.
    [[FMEventDispatcher sharedDispatcher] dispatchEvent:@"myFourthSelector" objects:@[self]];
}

@end
