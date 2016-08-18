// Vishal Patel
// vpatel589@csu.fullerton.edu
//  shunting_yard.m
//  basic_calculator
//
//  Created by Vishal Patel on 10/19/15.
//  Copyright (c) 2015 Vishal Patel. All rights reserved.
//

#import "shunting_yard.h"
static shunting_yard* _shunting_yard_instance;

@implementation shunting_yard
@synthesize num_queue;
@synthesize op_stack;

//initialization...
-(shunting_yard*) init
{
    self = [super init];
    return self;
}
+(void) initialize
{
    if ([shunting_yard class] == self)
    {
        _shunting_yard_instance = [self new];
    }
}
+(shunting_yard*) sy_obj
{
    return _shunting_yard_instance;
}

//implementation for stack protocol
-(void) push:(NSString*)obj
{
    [op_stack addObject:obj];
    
}
-(NSString*)peek
{
    return [op_stack objectAtIndex:[op_stack count]-1];
}
-(NSString*)pop
{
    NSString* tmp;
    tmp = [op_stack objectAtIndex:[op_stack count]-1];
    [op_stack removeLastObject];
    return tmp;
}
-(BOOL) isEmpty
{
    if ([op_stack count] == 0)
    {
        return YES;
    }
    else
    {
        return NO;
    }
}

//implementations for shunting yard algorithm
-(NSMutableArray*) algorithm:(NSMutableArray*)expr
{
    num_queue = [[NSMutableArray alloc] initWithCapacity:[expr count]];
    op_stack = [[NSMutableArray alloc] initWithCapacity:[expr count]];
 
    for (int i = 0; i < [expr count]; ++i)
    {
        if(i%2 == 0)
        {
            //we have a fractional object at every even index, including 0
            [num_queue addObject:[expr objectAtIndex:i]];
        }
        else
        {
            //we are at an odd index, which contains operators for our expr array
            if ([self isEmpty])
            {
                //need to change
                [self push:[expr objectAtIndex:i]];
            }
            
            else if ([[expr objectAtIndex:i]  isEqualToString:@"+"] || [[expr objectAtIndex:i]  isEqualToString:@"-"])
            {
                if([[self peek] isEqualToString: @"*"] || [[self peek] isEqualToString: @"/"])
                {
                    [num_queue addObject:[self pop]];
                    [op_stack addObject:[expr objectAtIndex:i]];
                    
                }
                else
                {
                    [op_stack addObject:[expr objectAtIndex:i]];
                }
                
            }
            else
            {
                [op_stack addObject:[expr objectAtIndex:i]];
            }
            
        }
        
        
    }
//    NSLog(@"QUEUE: %@", num_queue);
//    NSLog(@"OP: %@", op_stack);
    for (int i = 0; i < [op_stack count] + i;  ++i)
    {
        [num_queue addObject:[self pop]];
    }
    
//    NSLog(@"HEre is the postfix: %@", num_queue);
    
    return num_queue;
  
}
@end
