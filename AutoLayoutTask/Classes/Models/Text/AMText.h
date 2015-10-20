//
//  AMText.h
//  AutoLayoutTask
//
//  Created by Mark on 20.10.15.
//  Copyright © 2015 ThinkMobiles. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AMText : NSObject

@property (strong, nonatomic) NSString *text;

+ (instancetype)textWithDataFromTextFile;

@end
