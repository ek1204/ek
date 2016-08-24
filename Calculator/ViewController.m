//
//  ViewController.m
//  Calculator
//
//  Created by 방문 사용자 on 2016. 8. 24..
//  Copyright © 2016년 ldcc. All rights reserved.
//

#import "ViewController.h"
#import "Calculator.h"

enum opr {none, plus, minus, divide, muliply};
typedef enum opr Operator;

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UILabel *myLabel;

@end

@implementation ViewController
{
    int currentValue;
    Operator currentOpr;
    Calculator *calc;
}

- (IBAction)buttonClicked:(id)sender{
    
    UIButton *btn = (UIButton *)sender;
    int value = btn.tag;
    
    if (currentOpr == none) {
        currentValue = currentValue * 10 + value;
    } else {
        currentValue = value;
    }
    self.myLabel.text = [NSString stringWithFormat:@"%d", currentValue];
}

- (IBAction)clear:(id)sender {
    self.myLabel.text = @"0";
}

- (IBAction)ClickOpr:(id)sender {
    
    UIButton *btn = (UIButton *)sender;
    int tagNum = (int)btn.tag;
    
    switch (tagNum) {
        case 1:
            currentOpr = plus;
            break;
        case 2:
            currentOpr = minus;
            break;
        case 3:
            currentOpr = muliply;
            break;
        case 4:
            currentOpr = divide;
            break;
        default:
            break;
    }
    
    [calc setAccumulator: currentValue];
}

- (IBAction)ClickEqual:(id)sender {
    switch (currentOpr) {
        case plus:
            [calc add: currentValue];
            currentValue = [calc accumulator];
            
            break;
        case minus:
            [calc subtract: currentValue];
            currentValue = [calc accumulator];
            break;
        case muliply:
            [calc multiply: currentValue];
            currentValue = [calc accumulator];
            break;
        case divide:
            [calc divide: currentValue];
            currentValue = [calc accumulator];
            break;
        default:
            break;
    }
    self.myLabel.text = [NSString stringWithFormat:@"%d", currentValue];
}

- (IBAction)unwind:(UIStoryboardSegue *)sender {
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    calc = [[Calculator alloc] init];
    currentOpr = none;
    currentValue = 0;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
