//
//  loggerFormatter.m
//  ios-starter-kit
//
//  Created by mm on 12/13/14.
//  Copyright (c) 2014 Pirate. All rights reserved.
//

#import "loggerFormatter.h"

@implementation loggerFormatter

- (NSString *)formatLogMessage:(DDLogMessage *)logMessage
{
    return [NSString stringWithFormat:@"%@ | %@ | %@ @ %i | %@", logMessage.timestamp, logMessage.fileName, logMessage.function, logMessage.line, logMessage.message];
}

@end
