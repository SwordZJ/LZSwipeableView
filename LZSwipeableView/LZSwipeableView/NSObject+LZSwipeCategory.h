//
//  NSObject+LZSwipeCategory.h
//  LZSwipeableViewDemo
//
//  Created by liuzhouji on 16/4/20.
//  Copyright © 2016年 LeoZ. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (LZSwipeCategory)

@property (nonatomic) CGFloat x;
@property (nonatomic) CGFloat y;
@property (nonatomic) CGFloat left;
@property (nonatomic) CGFloat top;
@property (nonatomic) CGFloat right;
@property (nonatomic) CGFloat bottom;
@property (nonatomic) CGFloat width;
@property (nonatomic) CGFloat height;

@property (nonatomic) CGFloat centerX;
@property (nonatomic) CGFloat centerY;

@property (nonatomic) CGPoint origin;
@property (nonatomic) CGSize size;


- (UIView*)snapshotView;
- (void)removeAllSubviews;
+ (instancetype)viewFromXib;
@end


@interface UIColor (LZSwipeCategory)
+ (instancetype)randomColor;
+ (instancetype)colorWithHex:(NSUInteger)hexColor;
+ (instancetype)colorWithHexString:(NSString *)hexStr;
@end


@interface UIButton (LZSwipeCategory)
// 注意使用此方法 控制器必须实现按钮点击事件方法 leftNavButtonClick
+(UIBarButtonItem *)createNavBarButtonItemWithText:(NSString *)btnTitle target:(id)target;
@end