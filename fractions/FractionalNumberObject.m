//
//  Vishal Patel
//  vpatel589@csu.fullerton.edu

//  FractionalNumberObject.m
//  fractions
//
//  Created by Vishal Patel on 11/2/15.
//  Copyright (c) 2015 Vishal Patel. All rights reserved.
//
//The implementation file for the fractionalnumberobject header file
//this file will include all of the function bodies required to run the fractional calculator
//also includes the implenetations for all of the methods defined in the arithmetic protocol.

#import <Foundation/Foundation.h>
#import "FractionalNumberObject.h"

@implementation FractionalNumberObject

-(FractionalNumberObject*) grabNum:(int)user_Numerator andDen:(int)user_Denominator
{
    self.numerator = user_Numerator;
    self.denominator = user_Denominator;
    return self;
}

-(FractionalNumberObject*) add:(FractionalNumberObject*)other
{
    FractionalNumberObject* a = [[FractionalNumberObject alloc] init];
    //NSLog(@"first num %d other num %d", self.numerator, other.numerator);
    
    a.numerator = (self.numerator*other.denominator) + (other.numerator*self.denominator);
    a.denominator = (self.denominator*other.denominator);
    [a display];
    int divisor = [self gcd_of:a.numerator and:a.denominator];
    
    a.numerator /= divisor;
    a.denominator /= divisor;
    
    return a;
}
-(FractionalNumberObject*) subtract:(FractionalNumberObject*)other
{
    FractionalNumberObject* a = [[FractionalNumberObject alloc] init];
    //NSLog(@"first num %d other num %d", self.numerator, other.numerator);
    
    a.numerator =  (self.numerator*other.denominator)-(other.numerator*self.denominator);
    a.denominator = (self.denominator*other.denominator);
  
    
    int divisor = [self gcd_of:a.numerator and:a.denominator];
    
    a.numerator /= divisor;
    a.denominator /= divisor;
    
    return a;
}

-(FractionalNumberObject*) multiply:(FractionalNumberObject*)other
{
    FractionalNumberObject* a = [[FractionalNumberObject alloc] init];
    
    a.numerator = self.numerator*other.numerator;
    a.denominator = self.denominator*other.denominator;
    
    int divisor = [self gcd_of:a.numerator and:a.denominator];
    
    a.numerator /= divisor;
    a.denominator /= divisor;
    
    return a;
}


-(FractionalNumberObject*) divide:(FractionalNumberObject*)other
{
    FractionalNumberObject* a = [[FractionalNumberObject alloc] init];
    
    a.numerator = self.numerator*other.denominator;
    a.denominator = self.denominator*other.numerator;
    
    int divisor = [self gcd_of:a.numerator and:a.denominator];
    
    a.numerator /= divisor;
    a.denominator /= divisor;
    
    return a;
}


//this method will be called to find the GCD of a numerator and denominator
-(int) gcd_of:(int)val1 and:(int)val2
{
//    NSLog(@"HELLO");
    
    if (val2 == 0)
    {
        return val1;
    }
    else
    {
        return [self gcd_of:val2 and:(val1%val2)];
    }
}

//this method will return a string with the format in which our solution should be displayed
-(NSString*) display
{
    int c, r;
    if (self.numerator > self.denominator && self.numerator%self.denominator == 0)
    {
        c = self.numerator/self.denominator;
        return [NSString stringWithFormat:@"%d", c];
    }
    else if (self.numerator > self.denominator)
    {
        c = self.numerator/self.denominator;
        r = self.numerator%self.denominator;
        return [NSString stringWithFormat:@"%d  %d/%d",c,r,self.
            denominator];
        //NSLog(@"%d  %d/%d", c, r, self.denominator);
    }
    else if (self.numerator == self.denominator)
    {
        return [NSString stringWithFormat:@"%d", 1];
    }
    else
    {
        return [NSString stringWithFormat:@"%d/%d",self.numerator, self.denominator];
  //      NSLog(@"%d/%d", self.numerator, self.denominator);

    }
}

@end
