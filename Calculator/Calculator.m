//
//  Calculator.m
//  Sample
//
//  Created by 방문 사용자 on 2016. 8. 23..
//  Copyright © 2016년 ldcc. All rights reserved.
//

#import "Calculator.h"

@implementation Calculator
//@synthesize accumulator = _accumulator;
//{
//    double accumulator;
//}

//- (void)setAccumulator:(double)value
//{
//    accumulator = value;
//}

- (void)clear
{
    self.accumulator = 0;
}

//- (double)accumulator
//{
//    return accumulator;
//}

- (void)add:(double)value
{
    self.accumulator += value;
}

- (void)subtract:(double)value
{
    self.accumulator -= value;
}

- (void)multiply:(double)value
{
    self.accumulator *= value;
}

- (void)divide:(double)value
{
    self.accumulator /= value;
}
@end
