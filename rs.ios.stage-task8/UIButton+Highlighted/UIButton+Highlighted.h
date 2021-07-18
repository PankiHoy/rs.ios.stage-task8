//
//  UIButton+Highlighted.h
//  rs.ios.stage-task8
//
//  Created by dev on 16.07.21.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIButton (Highlighted)

-(void)setHighlighted;
-(void)setDisabled;
-(void)setDefault;
-(void)setHighlightedColorButton;
-(void)setDefaultColorButton:(UIColor *)color;

@end

NS_ASSUME_NONNULL_END
