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
    _Operator = @"+";
    
    NSLog(@"Memory = %@", self.Memory);
    
    double result;
    if ([self.Operator isEqualToString:@"+"]) {
        //_Memory = [NSNumber numberWithDouble:0];
        NSLog(@"+");
        result = [self.Memory doubleValue] + [self.display.text doubleValue];
    }
    else if([self.Operator isEqualToString:@"-"]){
        //_Memory = [NSNumber numberWithDouble:0];
        NSLog(@"-");
        result = [self.Memory doubleValue] - [self.display.text doubleValue];
    }
    else if([self.Operator isEqualToString:@"*"]){
        //_Memory = [NSNumber numberWithDouble:1];
        NSLog(@"*");
        result = [self.Memory doubleValue] * [self.display.text doubleValue];
    }
    else if([self.Operator isEqualToString:@"/"]){
        //_Memory = [NSNumber numberWithDouble:1];
        NSLog(@"/");
        result = [self.display.text doubleValue]/[self.Memory doubleValue];
    }
    
    _Operator = sender.currentTitle;
    
    self.display.text = [NSString stringWithFormat:@"%g", result];
    NSLog(@"result = %g", result);
    _Memory = [NSNumber numberWithDouble:result];
    
    //_Memory = [NSNumber numberWithDouble:[self.display.text doubleValue]];
    //self.display.text = @"0";
    self.isUserFirstPressBtndigit = NO;
    self.isUserFirstPressBtndot = NO;
}

- (IBAction)btnenter:(id)sender {
    
    NSLog(@"before enter Memory = %@", self.Memory);
    NSLog(@"before enter Operator = %@", self.Operator);
    
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
    
    _Memory = [NSNumber numberWithDouble:0];
    _Operator = @"+";
    NSLog(@"after enter Memory = %@", self.Memory);
    NSLog(@"after enter Operator = %@", self.Operator);
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
