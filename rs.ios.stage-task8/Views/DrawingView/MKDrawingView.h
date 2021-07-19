//
//  MKDrawingView.h
//  rs.ios.stage-task8
//
//  Created by dev on 17.07.21.
//

#import <UIKit/UIKit.h>
#import "MKMainViewController.h"
#import "PaintingDelegate.h"

NS_ASSUME_NONNULL_BEGIN

@interface MKDrawingView : UIView

@property (assign, nonatomic) NSNumber *currentDrawing;
@property (assign, nonatomic) float progress;
@property (strong, nonatomic) NSMutableArray <UIButton *> *colorPalette;
@property (weak, nonatomic) MKMainViewController <PaintingDelegate> *delegate;

-(void)changeStrokeEnd;


@end

NS_ASSUME_NONNULL_END
