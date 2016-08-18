// Vishal Patel
// vpatel589@csu.fullerton.edu
//  ViewController.m
//  basic_calculator
//
//  Created by Vishal Patel on 10/15/15.
//  Copyright (c) 2015 Vishal Patel. All rights reserved.
//

#import "ViewController.h"
#import "shunting_yard.h"
@interface ViewController ()

@end


@implementation ViewController

- (IBAction)zero_pressed:(id)sender {
    self.user_field.text = [self.user_field.text stringByAppendingString:@"0"];
}
- (IBAction)one_pressed:(id)sender {
    self.user_field.text = [self.user_field.text stringByAppendingString:@"1"];
}
- (IBAction)two_pressed:(id)sender {
    self.user_field.text = [self.user_field.text stringByAppendingString:@"2"];
}
- (IBAction)three_pressed:(id)sender {
    self.user_field.text = [self.user_field.text stringByAppendingString:@"3"];
}
- (IBAction)four_pressed:(id)sender {
    self.user_field.text = [self.user_field.text stringByAppendingString:@"4"];
}
- (IBAction)five_pressed:(id)sender {
    self.user_field.text = [self.user_field.text stringByAppendingString:@"5"];
}
- (IBAction)six_pressed:(id)sender {
    self.user_field.text = [self.user_field.text stringByAppendingString:@"6"];
}
- (IBAction)seven_pressed:(id)sender {
    self.user_field.text = [self.user_field.text stringByAppendingString:@"7"];
}
- (IBAction)eight_pressed:(id)sender {
    self.user_field.text = [self.user_field.text stringByAppendingString:@"8"];
}
- (IBAction)nine_pressed:(id)sender {
    self.user_field.text = [self.user_field.text stringByAppendingString:@"9"];
}
- (IBAction)dot_pressed:(id)sender {
    self.user_field.text = [self.user_field.text stringByAppendingString:@"."];
}
- (IBAction)equal_pressed:(id)sender {
    //create instance of the shunting_yard class
    shunting_yard* sy = [shunting_yard sy_obj];
    
    self.user_field.text = [NSString stringWithFormat:@"%d", [[sy algorithm:_user_field.text] intValue]];

    
}
- (IBAction)divide_pressed:(id)sender {
        self.user_field.text = [self.user_field.text stringByAppendingString:@"/"];
}
- (IBAction)multiply_pressed:(id)sender {
        self.user_field.text = [self.user_field.text stringByAppendingString:@"*"];
}
- (IBAction)subtract_pressed:(id)sender {
        self.user_field.text = [self.user_field.text stringByAppendingString:@"-"];
}
- (IBAction)addition_pressed:(id)sender {
        self.user_field.text = [self.user_field.text stringByAppendingString:@"+"];
}
- (IBAction)sqrt_pressed:(id)sender {
        self.user_field.text = [self.user_field.text stringByAppendingString:@"sqrt"];
}
- (IBAction)back_pressed:(id)sender {
    self.user_field.text = [self.user_field.text substringToIndex:[self.user_field.text length]-1];
}
- (IBAction)close_pressed:(id)sender {
    self.user_field.text = [self.user_field.text stringByAppendingString:@")"];
}
- (IBAction)open_pressed:(id)sender {
    self.user_field.text = [self.user_field.text stringByAppendingString:@"("];
}
- (IBAction)clear_pressed:(id)sender {
    self.user_field.text = @"";
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib
    self.user_field.text = @"";
    [self.open_button setEnabled:NO];
    [self.close_button setEnabled:NO];
    self.user_field.enabled=NO;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
