//
//  UIButton+Highlighted.m
//  rs.ios.stage-task8
//
//  Created by dev on 16.07.21.
//

#import "UIButton+Highlighted.h"

@implementation UIButton (Highlighted)

-(void)setHighlighted {
    [self addShadowWithRadius:2.0f andColor:[UIColor colorNamed:@"Light Green Sea"]];
}

-(void)setDisabled {
    self.alpha = 0.5;
    [self addShadowWithRadius:1.0f andColor:[UIColor colorWithRed:0 green:0 blue:0 alpha:0.25]];
}

-(void)setDefault {
    [self addShadowWithRadius:1.0f andColor:[UIColor colorWithRed:0 green:0 blue:0 alpha:0.25]];
}

-(void)addShadowWithRadius:(CGFloat)radius andColor:(UIColor *)color{
    [self setBackgroundColor:[UIColor whiteColor]];
    [self.layer setShadowOffset:CGSizeMake(0, 0)];
    [self.layer setShadowColor:color.CGColor];
    [self.layer setShadowRadius:radius];
    [self.layer setShadowOpacity:radius];
}

-(void)setHighlightedColorButton {
    [self setFrame:CGRectMake(2, 2, 36, 36)];
    [self.layer setCornerRadius:8.0f];
}

-(void)setDefaultColorButton:(UIColor *)color {
    self.backgroundColor = color;
    [self setFrame:CGRectMake(8, 8, 24, 24)];
    [self.layer setCornerRadius:6.0f];
}

@end
