//
//  Customer.h
//  GoCounter
//
//  Created by mihata on 1/8/14.
//  Copyright (c) 2014 mihata. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Campaign;

@interface Customer : NSManagedObject

@property (nonatomic, retain) NSDate * timestamp;
@property (nonatomic, retain) NSNumber * latitude;
@property (nonatomic, retain) NSNumber * longitude;
@property (nonatomic, retain) NSNumber * age;
@property (nonatomic, retain) NSNumber * hour;
@property (nonatomic, retain) Campaign *campaign;

@end
