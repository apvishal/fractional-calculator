//
//  Vishal Patel
//  vpatel589@csu.fullerton.edu

//  ViewController.h
//  fractions
//
//  Created by Vishal Patel on 11/2/15.
//  Copyright (c) 2015 Vishal Patel. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIButton *button0;
@property (weak, nonatomic) IBOutlet UIButton *button1;
@property (weak, nonatomic) IBOutlet UIButton *button2;
@property (weak, nonatomic) IBOutlet UIButton *button3;
@property (weak, nonatomic) IBOutlet UIButton *button4;
@property (weak, nonatomic) IBOutlet UIButton *button5;
@property (weak, nonatomic) IBOutlet UIButton *button6;
@property (weak, nonatomic) IBOutlet UIButton *button7;
@property (weak, nonatomic) IBOutlet UIButton *button8;
@property (weak, nonatomic) IBOutlet UIButton *button9;
@property (weak, nonatomic) IBOutlet UIButton *buttonEqual;
@property (weak, nonatomic) IBOutlet UIButton *buttonClear;
@property (weak, nonatomic) IBOutlet UIButton *buttonPlus;
@property (weak, nonatomic) IBOutlet UIButton *buttonMinus;
@property (weak, nonatomic) IBOutlet UIButton *buttonMultiply;
@property (weak, nonatomic) IBOutlet UIButton *buttonDivide;
@property (weak, nonatomic) IBOutlet UIButton *buttonSqrt;
@property (weak, nonatomic) IBOutlet UITextField *input_numerator;
@property (weak, nonatomic) IBOutlet UITextField *input_denominator;
@property (weak, nonatomic) IBOutlet UILabel *equation;

@property (strong, nonatomic) NSMutableArray *buttons;
@property (strong, nonatomic) NSMutableArray *expressionArray;


-(void) appendToTextField:(NSString*)intVal;
-(void) appendExpression;
-(void) storeInfo:(NSString*)userOp;
-(void) displayAnswer:(id)answer;
-(void) clearAll;
-(void) solve;
@end

