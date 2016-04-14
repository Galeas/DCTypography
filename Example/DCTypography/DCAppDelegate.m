//
//  DCAppDelegate.m
//  DCTypography
//
//  Created by Evgeniy Branitsky on 04/14/2016.
//  Copyright (c) 2016 Evgeniy Branitsky. All rights reserved.
//

#import "DCAppDelegate.h"

#import <DCTypography.h>

@implementation DCAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.
    
    DCTypographyStyle *style = [DCTypographyStyle styleWithName:@"style"];
    [style setFont:[UIFont fontWithName:@"Menlo-Regular" size:24]];
    [style setForegroundColor:[UIColor redColor]];
    [style setBackgroundColor:[UIColor yellowColor]];
    [style setTrackingValue:10 fromPhotoshop:NO];
    [style setLinespacing:24];
    [style setAlignment:NSTextAlignmentCenter];
    [DCTypography addStyle:style];
    
    DCTypographyStyle *style1 = [DCTypographyStyle styleWithName:@"style1"];
    [style1 setFont:[UIFont systemFontOfSize:10 weight:UIFontWeightBlack]];
    [style1 setForegroundColor:[UIColor blueColor]];
    [style1 setBackgroundColor:[UIColor greenColor]];
    [DCTypography addStyle:style1];
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
