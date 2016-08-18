// Vishal Patel
// vpatel589@csu.fullerton.edu
//  shunting_yard.h
//  basic_calculator
//
//  Created by Vishal Patel on 10/19/15.
//  Copyright (c) 2015 Vishal Patel. All rights reserved.
//
#import <Foundation/Foundation.h>
//#include "stack_protocol.h"

@interface shunting_yard  : NSObject

@property(strong, nonatomic) NSMutableArray* num_queue;
@property(strong, nonatomic) NSMutableArray* op_stack;

+(shunting_yard*) sy_obj;
-(NSMutableArray*) algorithm:(NSMutableArray*)expr;
@end
