//
//  ViewController.m
//  ios-starter-kit
//
//  Created by mm on 12/13/14.
//  Copyright (c) 2014 Pirate. All rights reserved.
//

#import "CocoaLumberjack/DDLog.h"
#import "ViewController.h"

static const int ddLogLevel = LOG_LEVEL_ALL;

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    DDLogError(@"This is an error log.");
    DDLogWarn(@"This is a warning log.");
    DDLogInfo(@"This is a info log.");
    DDLogDebug(@"This is a debug log.");
    DDLogVerbose(@"This is a verbose log");
}

@end
