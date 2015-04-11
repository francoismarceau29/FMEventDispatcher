//
//  FMEventDispatcher.m
//
//  Created by Frank Marceau on 2015-02-25.
//  Copyright (c) 2015 Frank Marceau. All rights reserved.
//

#import "FMEventDispatcher.h"

@interface FMEventDispatcher()
@property (nonatomic, retain) NSMutableArray *observers;
@end

@implementation FMEventDispatcher

+ (FMEventDispatcher *)sharedDispatcher {
    static FMEventDispatcher *sharedDispatcher = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedDispatcher = [[self alloc] init];
    });
    return sharedDispatcher;
}

- (instancetype)init {
    self = [super init];
    if (self) {
        _observers = [NSMutableArray array];
    }
    
    return self;
}

- (void)addEventObserver:(id)observer {
    NSParameterAssert(observer);
    [self.observers addObject:observer];
}

- (void)removeEventObserver:(id)observer {
    NSParameterAssert(observer);
    if ([self.observers containsObject:observer]) {
        [self.observers removeObject:observer];
    }
}

- (void)dispatchEvent:(NSString *)event {
    [self dispatchEvent:event objects:nil];
}

- (void)dispatchEvent:(NSString *)event objects:(NSArray *)objects {
    NSParameterAssert(event);
    NSAssert([objects count] <= 2, @"FMEventObserver currently only support up to 2 parameters per events");
    const char* eventChar = [event UTF8String];
    SEL eventSelector = sel_registerName(eventChar);

    for (id observer in self.observers) {
        if ([observer respondsToSelector:eventSelector]) {
            [self sendEvent:eventSelector observer:observer objects:objects];
        }
    }
}

- (void)sendEvent:(SEL)event observer:(id)observer objects:(NSArray *)objects {
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Warc-performSelector-leaks"
    dispatch_async(dispatch_get_main_queue(), ^{
        if (!objects) {
            [observer performSelector:event];
        } else if ([objects count] == 1) {
            [observer performSelector:event withObject:objects[0]];
        } else if ([objects count] == 2) {
            [observer performSelector:event withObject:objects[0] withObject:objects[1]];
        }
    });
#pragma clang diagnostic pop
}

@end
