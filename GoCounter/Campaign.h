//
//  Campaign.h
//  GoCounter
//
//  Created by mihata on 1/8/14.
//  Copyright (c) 2014 mihata. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Customer;

@interface Campaign : NSManagedObject

@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSSet *customers;
@end

@interface Campaign (CoreDataGeneratedAccessors)

- (void)addCustomersObject:(Customer *)value;
- (void)removeCustomersObject:(Customer *)value;
- (void)addCustomers:(NSSet *)values;
- (void)removeCustomers:(NSSet *)values;

@end
