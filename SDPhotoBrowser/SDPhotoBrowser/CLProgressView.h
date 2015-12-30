//
//  CLProgressView.h
//  CLPhotoBrowser
//
//  Created by YuanRong on 15/12/29.
//  Copyright © 2015年 FelixMLians. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum {
    CLProgressViewStyleLoopDiagram, // 环形
    CLProgressViewStylePieDiagram // 饼型
} CLProgressViewStyle;

@interface CLProgressView : UIView

@property (nonatomic, assign) CGFloat progress;
@property (nonatomic, assign) NSInteger style;

@end
