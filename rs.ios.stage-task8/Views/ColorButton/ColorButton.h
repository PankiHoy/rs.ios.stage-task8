//
//  ColorButton.h
//  rs.ios.stage-task8
//
//  Created by dev on 16.07.21.
//

#import <UIKit/UIKit.h>
#import "ColorDelegate.h"
#import "MKColorViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface ColorButton : UIButton

@property (weak, nonatomic) MKColorViewController <ColorDelegate> *delegate;

-(instancetype)initWithFrame:(CGRect)frame andColor:(UIColor *)color;

@end

NS_ASSUME_NONNULL_END
