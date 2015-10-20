//
//  AMText.m
//  AutoLayoutTask
//
//  Created by Mark on 20.10.15.
//  Copyright © 2015 ThinkMobiles. All rights reserved.
//

#import "AMText.h"

@implementation AMText

#pragma mark - Lifecycle

- (instancetype)initWithDataFromTextFile
{
    self = [super init];
    if (self) {
        _text = [[NSString alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"Data" ofType:@".txt"] encoding:NSASCIIStringEncoding error:nil];
    }
    return self;
}

+ (instancetype)textWithDataFromTextFile
{
    return [[self alloc] initWithDataFromTextFile];
}

@end
