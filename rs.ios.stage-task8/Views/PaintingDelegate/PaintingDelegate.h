//
//  PaintingDelegate.h
//  rs.ios.stage-task8
//
//  Created by dev on 18.07.21.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@protocol PaintingDelegate <NSObject>

-(void)paintingIsDrawing:(BOOL)check;

@end

NS_ASSUME_NONNULL_END
