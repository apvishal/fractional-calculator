//  Vishal Patel
//  vpatel589@csu.fullerton.edu

//  ViewController.m
//  fractions
//
//  Created by Vishal Patel on 11/2/15.
//  Copyright (c) 2015 Vishal Patel. All rights reserved.
//

#import "ViewController.h"
#import "FractionalNumberObject.h"
#import "shunting_yard.h"
@interface ViewController ()

@end


@implementation ViewController



- (void)viewDidLoad {

    [super viewDidLoad];

    self.expressionArray = [[NSMutableArray alloc] init];
    
    //set a dummy keyboard so we can use the buttons
    //made for the app.
    UIView *dummyView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 0, 0)];
    self.input_numerator.inputView = dummyView; // Hide keyboard, but show blinking cursor
    self.input_denominator.inputView = dummyView;
    
    [self.input_numerator becomeFirstResponder];
    
    //set the text field text
    self.input_numerator.text = @"";
    self.input_denominator.text = @"";
    self.equation.text = @"";
    
    //initilize our mutable array
    self.buttons = [[NSMutableArray alloc] init];
    
    //add all of our buttons to the mutable array
    [self.buttons addObject:self.button0];
    [self.buttons addObject:self.button1];
    [self.buttons addObject:self.button2];
    [self.buttons addObject:self.button3];
    [self.buttons addObject:self.button4];
    [self.buttons addObject:self.button5];
    [self.buttons addObject:self.button6];
    [self.buttons addObject:self.button7];
    [self.buttons addObject:self.button8];
    [self.buttons addObject:self.button9];
    [self.buttons addObject:self.buttonEqual];
    [self.buttons addObject:self.buttonClear];
    [self.buttons addObject:self.buttonPlus];
    [self.buttons addObject:self.buttonMinus];
    [self.buttons addObject:self.buttonMultiply];
    [self.buttons addObject:self.buttonDivide];
    [self.buttons addObject:self.buttonSqrt];
    
    
    //loop through the array, and set the selector for all buttons
    for ( int i = 0; i < [self.buttons count]; ++i)
    {
        [[self.buttons objectAtIndex:i] addTarget:self action:@selector(buttonPressed:) forControlEvents:UIControlEventTouchUpInside];
    }
    
    
    
 }
-(void) displayAnswer:(FractionalNumberObject*)answer
{
    self.equation.text = @"";
    if(answer.denominator == 0)
    {
        self.equation.text = @"UNDEF";
    }
    else
    {
        self.equation.text = [answer display];
    }
}
-(void) appendExpression
{
    NSString* exp = [NSString stringWithFormat:@" %d/%d %@", [self.input_numerator.text intValue], [self.input_denominator.text intValue], [self.expressionArray objectAtIndex:[self.expressionArray count]-1]];
    self.equation.text = [self.equation.text stringByAppendingString:exp];
}

-(void) clearAll
{
    
    if ([self.expressionArray count] != 0)
    {
        
        //clear the expressionArray
        for (int i = 0; i < [self.expressionArray count]; ++i)
        {
            [self.expressionArray removeLastObject];
        }
    }
    //clear the label holding the expression and answer
    self.equation.text = @"";
    
    //clear the numerator and denominator fields
    self.input_numerator.text = @"";
    self.input_denominator.text = @"";
}


-(void) solve
{
    NSMutableArray* stack = [[NSMutableArray alloc] init];
    FractionalNumberObject* answerObject;
    for (int i = 0; i < [self.expressionArray count]; ++i)
    {
        if ([[self.expressionArray objectAtIndex:i] isKindOfClass: [FractionalNumberObject class]])
        {
            [stack addObject:[self.expressionArray objectAtIndex:i]];
        }
        else
        {
            if([[self.expressionArray objectAtIndex:i] isEqualToString: @"+"])
            {
                answerObject = [(FractionalNumberObject*)[stack objectAtIndex:[stack count] - 1] add:(FractionalNumberObject*)[stack objectAtIndex:[stack count]-2]];
                [stack removeLastObject];
                [stack removeLastObject];
                [stack addObject:answerObject];
            }
            else if([[self.expressionArray objectAtIndex:i] isEqualToString: @"-"])
            {
                answerObject = [(FractionalNumberObject*)[stack objectAtIndex:[stack count] - 2] subtract:(FractionalNumberObject*)[stack objectAtIndex:[stack count]-1]];
                [stack removeLastObject];
                [stack removeLastObject];
                [stack addObject:answerObject];
            }
            else if([[self.expressionArray objectAtIndex:i] isEqualToString: @"*"])
            {
               answerObject = [(FractionalNumberObject*)[stack objectAtIndex:[stack count] - 1] multiply:(FractionalNumberObject*)[stack objectAtIndex:[stack count]-2]];
                [stack removeLastObject];
                [stack removeLastObject];
                [stack addObject:answerObject];
            }
            else if([[self.expressionArray objectAtIndex:i] isEqualToString: @"/"])
            {
                answerObject = [(FractionalNumberObject*)[stack objectAtIndex:[stack count] - 2] divide:(FractionalNumberObject*)[stack objectAtIndex:[stack count]-1]];
                [stack removeLastObject];
                [stack removeLastObject];
                [stack addObject:answerObject];
            }

        }
    }
    
    [self displayAnswer:[stack objectAtIndex:0]];
    //erase expression array
    for (int i = 0; i < [self.expressionArray count] + i; ++i)
    {
        [self.expressionArray removeLastObject];
    }
    
}

-(void) storeInfo:(NSString*)userOp
{

    //first check for an undefined value before storing
    if(![self.input_numerator.text isEqualToString: @""] && ![self.input_denominator.text isEqualToString: @""] && [self.input_denominator.text intValue] != 0)
    {
    //grab the information from input_numerator, and input_denominator
        FractionalNumberObject* obj = [[FractionalNumberObject alloc] init];
        [obj grabNum:[self.input_numerator.text intValue] andDen:[self.input_denominator.text intValue]];
        
        //store into expressionArray
        [self.expressionArray addObject:obj];
        
        if (![userOp isEqualToString:@"="])
        {
            [self.expressionArray addObject:userOp];
            [self appendExpression];
        }
        
        //clear the numerator and denoninator
        self.input_numerator.text = @"";
        
        self.input_denominator.text = @"";
        
        [self.input_numerator becomeFirstResponder];
    }
    else if ([self.input_numerator.text isEqualToString: @""] || [self.input_denominator.text isEqualToString: @""])
    {
        //do nothing at all
    }
   else if ([self.input_denominator.text intValue] == 0)
    {
        [self clearAll];
        self.equation.text = @"UNDEF";
    }


    

}


-(void) appendToTextField:(NSString*)intVal
{
    if (self.input_numerator.isEditing)
    {
        self.input_numerator.text = [self.input_numerator.text stringByAppendingString:intVal];
    }
    else
    {
        self.input_denominator.text = [self.input_denominator.text stringByAppendingString:intVal];
    }
    
    
}

- (void)buttonPressed:(id)sender {
    
    int value = -1;
    NSString* input;
   
    //for loop will take care of inputting the integers
    for (int i = 0; i < 10; ++i)
    {
        if (((UIButton *)sender) == [self.buttons objectAtIndex:i])
        {
            //NSLog(@"%d WAS CLICKED!", i);
            input = [NSString stringWithFormat:@"%d",i];
            [self appendToTextField:input];
            value = 0;
            break;
        }
    }
    
    //these statements below will take care of the operations.
    if (value == -1)
    {
        if (((UIButton *)sender) == [self.buttons objectAtIndex:10])
        {
            //NSLog(@"= WAS CLICKED");
            if (![self.input_numerator.text isEqualToString:@""] && ![self.input_denominator.text isEqualToString:@""])
            {
                input = [NSString stringWithFormat:@"%@", @"="];
                [self storeInfo:input];

                shunting_yard* sy = [shunting_yard sy_obj];
                
                //call algorithm from shunting yard to perform operations
                //and have our expressionArray point to a new POSTFIX array
                self.expressionArray = [sy algorithm:self.expressionArray];
                //  NSLog(@"PostFix expressionArray: %@", self.expressionArray);
                
                //solve the postfixed expressionArray
                [self solve];
                
            }
            
        }
        else if (((UIButton *)sender) == [self.buttons objectAtIndex:11])
        {
            //NSLog(@"CLEAR WAS CLICKED!");
            
            //erase both fields, and clear mutable arrays
            [self clearAll];
            
        }
        else if (((UIButton *)sender) == [self.buttons objectAtIndex:12])
        {
            //NSLog(@"+ WAS CLICKED!");
            input = [NSString stringWithFormat:@"%@", @"+"];
            [self storeInfo:input];
            
        }
        else if (((UIButton *)sender) == [self.buttons objectAtIndex:13])
        {
            //NSLog(@"- WAS CLICKED!");
            input = [NSString stringWithFormat:@"%@", @"-"];
            [self storeInfo:input];
        }
        else if (((UIButton *)sender) == [self.buttons objectAtIndex:14])
        {
            //NSLog(@"* WAS CLICKED!");
            input = [NSString stringWithFormat:@"%@", @"*"];
            [self storeInfo:input];

        }
        else if (((UIButton *)sender) == [self.buttons objectAtIndex:15])
        {
            //NSLog(@"/ WAS CLICKED!");
            input = [NSString stringWithFormat:@"%@", @"/"];
            [self storeInfo:input];

        }
        else if (((UIButton *)sender) == [self.buttons objectAtIndex:16])
        {
            //NSLog(@"SQRT WAS CLICKED!");
            //[self storeInfo:input];
        }
      
    }
    
    

}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
