//
//  AVSwipeCardCell.m
//  LZSwipeableViewDemo
//
//  Created by 周济 on 16/4/21.
//  Copyright © 2016年 LeoZ. All rights reserved.
//

#import "AVSwipeCardCell.h"

@interface AVSwipeCardCell ()
/**<#desc#>*/
@property (nonatomic, strong) UILabel *label;
@end

@implementation AVSwipeCardCell

- (instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithReuseIdentifier:reuseIdentifier]) {
        [self setupSubviews];
    }
    return  self;
}

- (void)setupSubviews{
    self.label = [UILabel new];
    self.label.numberOfLines = 0;
    self.userInteractionEnabled = NO;
    self.label.text = @"实打实大花洒霎时刻的黄金卡仕达好卡萨丁阿萨德和大家说卡号多少按就好撒多撒谎的爱上换手机达到撒娇和手动加号时间的痕迹是谁都会尽快大厦的喀什";
    [self addSubview:self.label];
}


- (void)layoutSubviews{
    [super layoutSubviews];
    
    self.label.frame = self.bounds;
}

@end
