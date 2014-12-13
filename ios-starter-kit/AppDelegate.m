//
//  AppDelegate.m
//  ios-starter-kit
//
//  Created by mm on 12/13/14.
//  Copyright (c) 2014 Pirate. All rights reserved.
//

#import "AppDelegate.h"
#import "CocoaLumberjack/CocoaLumberjack.h"
#import "loggerFormatter.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {

    // Get app document directory
    [self applicationDocumentsDirectory];
    // Config logger - CocoaLumberjack
    // Log levels: LOG_LEVEL_OFF < LOG_LEVEL_ERROR < LOG_LEVEL_WARN < LOG_LEVEL_INFO < LOG_LEVEL_DEBUG < LOG_LEVEL_VERBOSE
    // Log macros: DDLogError < DDLogWarn < DDLogInfo < DDLogDebug < DDLogVerbose
    [DDLog addLogger:[DDASLLogger sharedInstance] withLevel:DDLogLevelVerbose];
    [DDLog addLogger:[DDTTYLogger sharedInstance] withLevel:DDLogLevelDebug];
    [[DDTTYLogger sharedInstance] setColorsEnabled:YES];
    loggerFormatter *formatter = [[loggerFormatter alloc] init];
    [[DDTTYLogger sharedInstance] setLogFormatter:formatter];
    DDFileLogger *fileLogger = [[DDFileLogger alloc] init];
    fileLogger.rollingFrequency = 60 * 60 * 24; // 24 hour rolling
    fileLogger.logFileManager.maximumNumberOfLogFiles = 7;
    [DDLog addLogger:fileLogger withLevel:DDLogLevelWarning];

    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

// Returns the URL to the application's Documents directory.
- (NSURL *)applicationDocumentsDirectory
{
    NSLog(@"Application document directory: %@",[[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory  inDomains:NSUserDomainMask] lastObject]);

    return [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] lastObject];
}

@end
