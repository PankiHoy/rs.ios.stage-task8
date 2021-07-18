//
//  ColorButton.m
//  rs.ios.stage-task8
//
//  Created by dev on 16.07.21.
//

#import "ColorButton.h"
#import "UIButton+Highlighted.h"

@interface ColorButton()

@end

@implementation ColorButton

- (instancetype)initWithFrame:(CGRect)frame andColor:(UIColor *)color {
    self = [super initWithFrame:frame];
    if (self) {
        [self setupColorButtonWithColor:color];
    }
    return self;
}

- (void)setupColorButtonWithColor:(UIColor *)color {
    UIButton *subViewOfColor = [[UIButton alloc] initWithFrame:CGRectMake(8, 8, 24, 24)];
    [subViewOfColor setDefaultColorButton:color];
    
    [self.layer setCornerRadius:10.0f];
    [self.layer setShadowOffset:CGSizeMake(0, 0)];
    [self.layer setShadowRadius:1.0f];
    [self.layer setShadowOpacity:1.0f];
    [self.layer setShadowColor:[UIColor colorWithRed:0 green:0 blue:0 alpha:0.25].CGColor];
    [self setBackgroundColor:[UIColor whiteColor]];
    [self addSubview:subViewOfColor];
    
    [subViewOfColor addTarget:self.delegate action:@selector(putColorInStack:) forControlEvents:UIControlEventTouchUpInside];
}

@end
