//
//  MKColorViewController.h
//  rs.ios.stage-task8
//
//  Created by dev on 16.07.21.
//

#import <UIKit/UIKit.h>
#import "ColorDelegate.h"
#import "ParentColorTimerViewController.h"
#import "MKDrawingView.h"

NS_ASSUME_NONNULL_BEGIN

@interface MKColorViewController : ParentColorTimerViewController <ColorDelegate>

@property (strong, nonatomic) MKDrawingView *myDrawingView;

@end

NS_ASSUME_NONNULL_END
