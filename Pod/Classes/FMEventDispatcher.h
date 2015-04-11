//
//  FMEventDispatcher.h
//
//  Created by Frank Marceau on 2015-02-25.
//  Copyright (c) 2015 Frank Marceau. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FMEventDispatcher : NSObject

+ (FMEventDispatcher *)sharedDispatcher;

- (void)addEventObserver:(id)observer;
- (void)removeEventObserver:(id)observer;

- (void)dispatchEvent:(NSString *)event;
- (void)dispatchEvent:(NSString *)event objects:(NSArray *)objects;

@end
