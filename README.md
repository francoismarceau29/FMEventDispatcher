# FMEventDispatcher

## Installation
----
FMEventDispatcher is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

    pod "FMEventDispatcher"

## How to use it
----
Register to receive events:

    [[FMEventDispatcher sharedDispatcher] addEventObserver:self];
	
Send events:

	// Dispatching event without object
    [[FMEventDispatcher sharedDispatcher] dispatchEvent:@"myFirstSelector"];
    
    // Dispatching event with one object
    [[FMEventDispatcher sharedDispatcher] dispatchEvent:@"mySecondSelector:" objects:@[@"One object of any type"]];
    
    // Dispatching event with two objects
    [[FMEventDispatcher sharedDispatcher] dispatchEvent:@"myThirdSelector:secondObject:" objects:@[@"first object", @"Another object"]];

To receive events, simply implement the method you will be dispatching:

	- (void)myFirstSelector {
		NSLog(@"Yay, I am triggered!");
	}
	
	- (void)mySecondSelector:(NSString *)myParam {
		NSLog(@"Yay, I am triggered!");
	}
	
	- (void)myThirdSelector:(NSString *)firstParam secondObject:(NSString *)secondParam {
		NSLog(@"Yay, I am triggered!");
	}

Don't forget to remove your listener once you are done!

	[[FMEventDispatcher sharedDispatcher] removeEventObserver:self];

## License

FMEventDispatcher is available under the MIT license. See the LICENSE file for more info.


