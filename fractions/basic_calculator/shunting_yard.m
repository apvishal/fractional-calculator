// Vishal Patel
// vpatel589@csu.fullerton.edu
//  shunting_yard.m
//  basic_calculator
//
//  Created by Vishal Patel on 10/19/15.
//  Copyright (c) 2015 Vishal Patel. All rights reserved.
//

#import "shunting_yard.h"
#import "calculator_protocol.h"
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
-(NSNumber*) algorithm:(NSString*)expr
{
    NSArray* expression = [[NSArray alloc] init];
    num_queue = [[NSMutableArray alloc] initWithCapacity:[expr length]];
    op_stack = [[NSMutableArray alloc] initWithCapacity:[expr length]];
 
    expression = [expr componentsSeparatedByString:@""];
    NSLog(@"%@", expression);
    
    //   [num_queue addObject:@24];

//    NSLog(@"%@",expr);
    for (int i = 0; i < [expr length]; ++i)
    {
        if(isnumber([expr characterAtIndex:i]))
        {
            NSLog(@"HERe");
            [num_queue addObject:[NSString stringWithFormat:@"%c",[expr characterAtIndex:i]]];
             NSLog(@"LOL%@",[num_queue objectAtIndex:[num_queue count]-1]);
        }
        else
        {
            if ([self isEmpty])
            {
                //need to change
                //[self.op_stack addObject:[NSString stringWithFormat:@"%c",[expr characterAtIndex:i]]];
                [self push:[NSString stringWithFormat:@"%c",[expr characterAtIndex:i]]];
            }
            
            else if ([expr characterAtIndex:i]  == '+' || [expr characterAtIndex:i]  == '-')
            {
                if([[self peek] isEqualToString: @"*"] || [[self peek] isEqualToString: @"/"])
                {
                    [num_queue addObject:[self pop]];
                    [op_stack addObject:[NSString stringWithFormat:@"%c",[expr characterAtIndex:i]]];
                    
                }
                else
                {
                    [op_stack addObject:[NSString stringWithFormat:@"%c",[expr characterAtIndex:i]]];
                }
                
            }
            else
            {
                [op_stack addObject:[NSString stringWithFormat:@"%c",[expr characterAtIndex:i]]];
            }
            
        }
        
    }
    NSLog(@"QUEUE: %@", num_queue);
    NSLog(@"OP: %@", op_stack);
    for (int i = 0; i < [op_stack count] + 1; ++i)
    {

        [num_queue addObject:[self pop]];
        NSLog(@"added to queue: %@", [num_queue objectAtIndex:([num_queue count]-1)]);
    }
    
 //   NSLog(@"result = %@\n", num_queue);
    
    return [self solve:num_queue];
  
}

-(NSNumber*) solve:(NSMutableArray*)queue
{
    NSMutableArray* post_stack = [[NSMutableArray alloc] init];
    int a;
    int b;
    NSLog(@"HELLO");
    for(int i = 0; i < [queue count]; ++i)
    {
        
        if ([[queue objectAtIndex:i] isKindOfClass:[NSNumber class]])
        {
            NSLog(@"FINALLY");
            [post_stack addObject:[queue objectAtIndex:i]];
        }
        else
        {
            if([post_stack count] < 2)
            {
                NSLog(@"EMPTY");
                NSLog(@"%@", [queue objectAtIndex:i]);
                //error
            }
            else
            {
                if ([[queue objectAtIndex:i] isEqualToString: @"+"])
                {
                    a = (int)[post_stack count] - 1;
                    b = (int)[post_stack count] - 2;
                    
                    [post_stack removeLastObject];
                    [post_stack removeLastObject];
                    
                    [post_stack addObject:[NSNumber numberWithInt:(a + b)]];
                }
                else if ([[queue objectAtIndex:i] isEqualToString: @"/"])
                {
                    a = (int)[post_stack count] - 1;
                    b = (int)[post_stack count] - 2;
                    
                    [post_stack removeLastObject];
                    [post_stack removeLastObject];
                    
                    [post_stack addObject:[NSNumber numberWithInt:(a / b)]];
                }
                else if ([[queue objectAtIndex:i] isEqualToString: @"-"])
                {
                    a = (int)[post_stack count] - 1;
                    b = (int)[post_stack count] - 2;
                    
                    [post_stack removeLastObject];
                    [post_stack removeLastObject];
                    
                    [post_stack addObject:[NSNumber numberWithInt:(a - b)]];
                }
                else if ([[queue objectAtIndex:i] isEqualToString: @"*"])
                {
                    a = (int)[post_stack count] - 1;
                    b = (int)[post_stack count] - 2;
                    
                    [post_stack removeLastObject];
                    [post_stack removeLastObject];
                    
                    [post_stack addObject:[NSNumber numberWithInt:(a * b)]];
                }
            }


        }
    }
    return [post_stack objectAtIndex:0];
}


/*
-(NSNumber*) add:(NSNumber*)other
{
    float _a
    return @25;
}
*/
@end
