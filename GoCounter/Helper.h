//
//  Helper.h
//  GoCounter
//
//  Created by mihata on 1/12/14.
//  Copyright (c) 2014 mihata. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Helper : NSObject
@property (strong, nonatomic) NSArray *categories;

+ (NSArray*) getCategories;
@end
