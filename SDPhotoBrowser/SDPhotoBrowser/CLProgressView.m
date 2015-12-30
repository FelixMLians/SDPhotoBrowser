//
//  CLProgressView.m
//  CLPhotoBrowser
//
//  Created by YuanRong on 15/12/29.
//  Copyright © 2015年 FelixMLians. All rights reserved.
//

#import "CLProgressView.h"

#define CLProgressViewBackgroundColor [UIColor colorWithRed:0 green:0 blue:0 alpha:0.7] // 图片下载进度指示器背景色
#define CLProgressViewMargin 4 // 图片下载进度指示器内部控件间的间距

@implementation CLProgressView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        self.layer.cornerRadius = MIN(frame.size.width * 0.5, frame.size.height* 0.5);
        self.clipsToBounds = YES;
        self.style = CLProgressViewStylePieDiagram;
    }
    return self;
}

- (void)drawRect:(CGRect)rect {
    switch (self.style) {
        case CLProgressViewStylePieDiagram:
        {
            [self setupPieDiagramStyleProgressWithRect:rect];
        }
            break;
        case CLProgressViewStyleLoopDiagram:
        {
            [self setupLoopDiagramStyleProgressWithRect:rect];
        }
            break;
        default:
            break;
    }
}

- (void)setupPieDiagramStyleProgressWithRect:(CGRect)rect {
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    CGFloat xCenter = rect.size.width * 0.5;
    CGFloat yCenter = rect.size.height * 0.5;
    
    [[UIColor whiteColor] set];
    
    CGFloat radius = MIN(rect.size.width * 0.5, rect.size.height * 0.5) - CLProgressViewMargin;
    CGFloat width = radius * 2 + CLProgressViewMargin* 1.2;
    CGFloat height = width;
    CGFloat xOrigin = (rect.size.width - width) * 0.5;
    CGFloat yOrigin = (rect.size.height - height) * 0.5;
    CGContextAddEllipseInRect(ctx, CGRectMake(xOrigin, yOrigin, width, height));
    
    [CLProgressViewBackgroundColor set];
    CGContextMoveToPoint(ctx, xCenter, yCenter);
    CGContextAddLineToPoint(ctx, xCenter, 0);
    CGFloat toDegree = - M_PI * 0.5 + self.progress * M_PI * 2;
    CGContextAddArc(ctx, xCenter, yCenter, radius, - M_PI * 0.5, toDegree, 1);
    CGContextClosePath(ctx);
    
    CGContextFillPath(ctx);
}

- (void)setupLoopDiagramStyleProgressWithRect:(CGRect)rect {
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    CGFloat xCenter = rect.size.width * 0.5;
    CGFloat yCenter = rect.size.height * 0.5;
    
    [CLProgressViewBackgroundColor set];
    
    CGContextSetLineWidth(ctx, 6);
    CGContextSetLineCap(ctx, kCGLineCapRound);
    CGFloat to = - M_PI * 0.5 + self.progress * M_PI * 2;
    CGFloat radius = MIN(rect.size.width, rect.size.height) * 0.5 - CLProgressViewMargin;
    CGContextAddArc(ctx, xCenter, yCenter, radius, - M_PI * 0.5, to, 0);
    CGContextStrokePath(ctx);
}

#pragma mark - Accessor 

- (void)setProgress:(CGFloat)progress {
    _progress = progress;
    
    [self setNeedsDisplay];
    
    if (progress >= 1) {
        [self removeFromSuperview];
    }
}

- (void)setStyle:(NSInteger)style {
    _style = style;
}
@end
