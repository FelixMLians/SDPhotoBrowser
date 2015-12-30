//
//  SDViewController.m
//  SDPhotoBrowser
//
//  Created by YuanRong on 15/12/30.
//  Copyright © 2015年 GSD. All rights reserved.
//

#import "SDViewController.h"
#import "CLAutoSlideView.h"
#import "SDPhotoBrowser.h"
#import "UIImageView+WebCache.h"

@interface SDViewController ()<CLAutoSlideViewDelegate>
@property (nonatomic, strong) CLAutoSlideView *topSlideView;

@end

#define kTopSlideViewHeight ( [UIScreen mainScreen].bounds.size.width * 9 / 16)

static NSString *kPlaceholderImageString = @"placeHolder.png";

@implementation SDViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.view addSubview:self.topSlideView];
    [self setupTopAutoSlideViews];
}

#pragma mark - CLAutoSlideViewDelegate

- (void)autoSlideView:(CLAutoSlideView *)autoSlideView didClickedImageAtIndex:(NSInteger)index {
    NSArray *networkImages=@[
                             @"http://www.netbian.com/d/file/20150519/f2897426d8747f2704f3d1e4c2e33fc2.jpg",
                             @"http://www.netbian.com/d/file/20130502/701d50ab1c8ca5b5a7515b0098b7c3f3.jpg",
                             @"http://www.netbian.com/d/file/20110418/48d30d13ae088fd80fde8b4f6f4e73f9.jpg",
                             @"http://www.netbian.com/d/file/20150318/869f76bbd095942d8ca03ad4ad45fc80.jpg",
                             @"http://www.netbian.com/d/file/20110424/b69ac12af595efc2473a93bc26c276b2.jpg",
                             
                             @"http://www.netbian.com/d/file/20140522/3e939daa0343d438195b710902590ea0.jpg",
                             
                             @"http://www.netbian.com/d/file/20141018/7ccbfeb9f47a729ffd6ac45115a647a3.jpg",
                             
                             @"http://www.netbian.com/d/file/20140724/fefe4f48b5563da35ff3e5b6aa091af4.jpg",
                             
                             @"http://www.netbian.com/d/file/20140529/95e170155a843061397b4bbcb1cefc50.jpg"
                             ];
    
    SDPhotoBrowser *browser = [[SDPhotoBrowser alloc] init];
    browser.sourceImageContainerView = self.topSlideView.imageViews[index]; // 原图的父控件
    browser.imageUrlArray = networkImages; // 图片总数
    browser.currentImageIndex = index;
    [browser show];
}

- (void)setupTopAutoSlideViews {
    NSMutableArray *viewsArray = [@[] mutableCopy];
    NSArray *networkImages=@[
                             @"http://www.netbian.com/d/file/20150519/f2897426d8747f2704f3d1e4c2e33fc2.jpg",
                             @"http://www.netbian.com/d/file/20130502/701d50ab1c8ca5b5a7515b0098b7c3f3.jpg",
                             @"http://www.netbian.com/d/file/20110418/48d30d13ae088fd80fde8b4f6f4e73f9.jpg",
                             @"http://www.netbian.com/d/file/20150318/869f76bbd095942d8ca03ad4ad45fc80.jpg",
                             @"http://www.netbian.com/d/file/20110424/b69ac12af595efc2473a93bc26c276b2.jpg",
                             
                             @"http://www.netbian.com/d/file/20140522/3e939daa0343d438195b710902590ea0.jpg",
                             
                             @"http://www.netbian.com/d/file/20141018/7ccbfeb9f47a729ffd6ac45115a647a3.jpg",
                             
                             @"http://www.netbian.com/d/file/20140724/fefe4f48b5563da35ff3e5b6aa091af4.jpg",
                             
                             @"http://www.netbian.com/d/file/20140529/95e170155a843061397b4bbcb1cefc50.jpg"
                             ];
    
    for (int i = 0; i < 9; ++i) {
        UIImageView *imageView = [[UIImageView alloc] init];
        imageView.frame = CGRectMake(0, 0, self.view.frame.size.width, kTopSlideViewHeight);
        [imageView sd_setImageWithURL:[NSURL URLWithString:networkImages[i]] placeholderImage:[UIImage imageNamed:kPlaceholderImageString]];
        imageView.contentMode = UIViewContentModeScaleAspectFit;
        [viewsArray addObject:imageView];
    }
    
    [self.topSlideView setImageViews:viewsArray];
}

- (CLAutoSlideView *)topSlideView {
    if (!_topSlideView) {
        _topSlideView = [CLAutoSlideView autoSlideViewWithFrame:CGRectMake(0, 64, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.width * 9 / 16)
                                                       delegate:self
                                                         images:nil
                                              animationInterval:3.0
                                  currentPageIndicatorTintColor:[UIColor orangeColor]
                                         pageIndicatorTintColor:[UIColor lightGrayColor]];
        _topSlideView.backgroundColor = [UIColor groupTableViewBackgroundColor];
    }
    return _topSlideView;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
