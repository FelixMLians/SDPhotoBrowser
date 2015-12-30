//
//  SDPhotoBrowser.h
//  photobrowser
//
//  Created by aier on 15-2-3.
//  Copyright (c) 2015年 aier. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SDPhotoBrowser : UIView <UIScrollViewDelegate>

@property (nonatomic, copy) NSArray *imageUrlArray;
@property (nonatomic, assign) NSInteger currentImageIndex;
@property (nonatomic, copy) NSString *placeHolderImageName;
@property (nonatomic, strong) UIImageView *sourceImageContainerView;

- (void)show;

@end
