//
//  UIButton+Highlighted.m
//  rs.ios.stage-task8
//
//  Created by dev on 16.07.21.
//

#import "UIButton+Highlighted.h"

@implementation UIButton (Highlighted)

-(void)changeToHighlighted:(BOOL)check {
    [self setHighlighted:check];
    if (check) {
        self.layer.borderColor = [UIColor colorNamed:@"Light Green Sky"].CGColor;
    } else {
        self.layer.borderColor = [UIColor colorWithRed:0 green:0 blue:0.25 alpha:1].CGColor;
    }
}

@end
