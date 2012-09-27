//
//  CalculatorViewController.m
//  Calculator
//
//  Created by MichaelHsu on 12/9/26.
//  Copyright (c) 2012年 MichaelHsu. All rights reserved.
//

#import "CalculatorViewController.h"

@interface CalculatorViewController ()
@property (nonatomic) BOOL isUserFirstPressBtndigit;
@property (nonatomic) BOOL isUserFirstPressBtndot;
@property (nonatomic) NSString *Operator;
@property (nonatomic) NSNumber *Memory;
@end

@implementation CalculatorViewController

- (IBAction)btndigit:(UIButton *)sender {
    NSString *currentDisplay = sender.currentTitle;
    if (_isUserFirstPressBtndigit || _isUserFirstPressBtndot) {
        self.display.text = [self.display.text stringByAppendingString:currentDisplay];
    }
    else{
        self.display.text = currentDisplay;
        _isUserFirstPressBtndigit = YES;
    }

    
}

- (IBAction)btndot:(id)sender {
    if (!_isUserFirstPressBtndot) {
        self.display.text = [self.display.text stringByAppendingString:@"."];
        _isUserFirstPressBtndot = YES;
    }
}

- (IBAction)btnoperator:(UIButton *)sender {
    _Operator = sender.currentTitle;
    _Memory = [NSNumber numberWithDouble:[self.display.text doubleValue]];
    self.display.text = @"0";
    self.isUserFirstPressBtndigit = NO;
    self.isUserFirstPressBtndot = NO;
}

- (IBAction)btnenter:(id)sender {
    NSLog(@"%@", self.Memory);
    double result;
    if ([self.Operator isEqualToString:@"+"]) {
        NSLog(@"+");
        result = [self.Memory doubleValue] + [self.display.text doubleValue];
    }
    else if([self.Operator isEqualToString:@"-"]){
        result = [self.Memory doubleValue] - [self.display.text doubleValue];
    }
    else if([self.Operator isEqualToString:@"*"]){
        result = [self.Memory doubleValue] * [self.display.text doubleValue];
    }
    else if([self.Operator isEqualToString:@"/"]){
        result = [self.Memory doubleValue] / [self.display.text doubleValue];
    }
    self.display.text = [NSString stringWithFormat:@"%g", result];
}

- (IBAction)btnac:(id)sender {
    self.Operator = nil;
    self.Memory = nil;
    self.display.text = @"0";
    self.isUserFirstPressBtndigit = NO;
    self.isUserFirstPressBtndot = NO;
}

- (IBAction)btninverse:(id)sender {
    double checkValue;
    checkValue = 0 - [self.display.text doubleValue];
    self.display.text = [NSString stringWithFormat:@"%g", checkValue];
}

@end
