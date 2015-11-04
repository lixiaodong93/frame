//
//  AppDelegate.m
//  01AVAudioPlayerDemo
//
//  Created by yaojinyuan on 15-1-13.
//  Copyright (c) 2015年 福诺学院. All rights reserved.
//

#import "AppDelegate.h"
#import "RootViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    
    self.window.rootViewController = [[[RootViewController alloc] initWithNibName:@"RootViewController" bundle:nil] autorelease];
    
    count = 1;
    
    
    
    
    return YES;
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    
    
    
   taskId = [application beginBackgroundTaskWithExpirationHandler:^{
       
       [application endBackgroundTask:taskId];
        
    }];
    [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(timeAction:) userInfo:nil repeats:YES];

    
}
- (void)timeAction:(NSTimer *)timer
{
    count++;
    NSLog(@"count =%d",count);
    
    if (count%500 == 0) {
        
       UIApplication *application = [UIApplication sharedApplication];
        [application endBackgroundTask:taskId];
        
        taskId = [application beginBackgroundTaskWithExpirationHandler:^{
            
        }];
        
    }
    
    
}


@end
