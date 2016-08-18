//  Vishal Patel
//  vpatel589@csu.fullerton.edu
//
//  FractionalNumberObject.h
//  fractions
//
//  Created by Vishal Patel on 11/2/15.
//  Copyright (c) 2015 Vishal Patel. All rights reserved.
//

//This file defines an object that will be used to represent our fraction.
//the object holds two ints, a numerator and a denominator


#import "arithmetic_protocol.h"

@interface FractionalNumberObject : NSObject <ArithmeticProtocol>

@property (assign, nonatomic) int numerator;
@property (assign, nonatomic) int denominator;

-(FractionalNumberObject*) grabNum:(int)user_Numerator andDen:(int)user_Denominator;
-(NSString*) display;
@end
