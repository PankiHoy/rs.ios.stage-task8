//
//  MKDrawingView.h
//  rs.ios.stage-task8
//
//  Created by dev on 17.07.21.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface MKDrawingView : UIView

@property (assign, nonatomic) NSNumber *currentDrawing;
@property (strong, nonatomic) NSMutableArray <UIButton *> *colorPalette;

@end

NS_ASSUME_NONNULL_END
