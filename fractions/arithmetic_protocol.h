//
//  Vishal Patel
//  vpatel589@csu.fullerton.edu

//  arithmetic_protocol.h
//  fractions
//
//  Created by Vishal Patel on 11/2/15.
//  Copyright (c) 2015 Vishal Patel. All rights reserved.
//

@protocol ArithmeticProtocol <NSObject>
-(id) add:(id)other;
-(id) subtract:(id)other;
-(id) multiply:(id)other;
-(id) divide:(id)other;
@end
