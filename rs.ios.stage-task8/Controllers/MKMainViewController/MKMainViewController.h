//
//  MainViewController.h
//  rs.ios.stage-task8
//
//  Created by dev on 16.07.21.
//

#import <UIKit/UIKit.h>
#import "PaintingDelegate.h"

NS_ASSUME_NONNULL_BEGIN

@interface MKMainViewController : UIViewController <PaintingDelegate>

@property (strong, nonatomic) UIButton *drawButton;
@property (weak, nonatomic) NSTimer *timer;

@end

NS_ASSUME_NONNULL_END
