//
//  LZSwipeableView.h
//
//  Created by 周济 on 16/4/6.
//  Copyright © 2016年 LeoZ. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LZSwipeCostantDefine.h"

typedef enum : NSUInteger {
    LZSwipeableViewCellSwipeDirectionLeft = 0,
    LZSwipeableViewCellSwipeDirectionRight,
    LZSwipeableViewCellSwipeDirectionTop,
    LZSwipeableViewCellSwipeDirectionBottom,
} LZSwipeableViewCellSwipeDirection;


@interface LZSwipeableViewCell : UIView
/** 重用标示  */
@property (nonatomic, copy) NSString *reuseIdentifier;
@property (nonatomic, strong) UIView *contentView;
/** 最后一张  */
@property (nonatomic, assign) BOOL isLast;
- (instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier;

// 添加屏幕截图(此方法可用于动画过程中的cell内容视觉效果不变)
- (void)addSnapshotView:(UIView*)snapshotView;
- (void)removeSnapshotView;

- (void)removeFromSuperviewWithDirection:(LZSwipeableViewCellSwipeDirection)direction;
@end



@class LZSwipeableView;
/**
 *  数据源方法
 */
@protocol LZSwipeableViewDataSource<NSObject>
@required
/** 
 * 总卡片数
 */
- (NSInteger)swipeableViewNumberOfRowsInSection:(LZSwipeableView *)swipeableView;

/** 
 * 每张卡片内容
 */
- (LZSwipeableViewCell *)swipeableView:(LZSwipeableView *)swipeableView cellForIndex:(NSInteger)index;

@optional
/**
 * 一次显示最大卡片式数
 */
- (NSInteger)swipeableViewMaxCardNumberWillShow:(LZSwipeableView *)swipeableView;
@end

/**
 *  代理方法
 */
@protocol LZSwipeableViewDelegate <NSObject>
@optional
/** 
 * 顶部卡片尺寸 (更换为设置顶部卡片四边距确定卡片位置尺寸)
 */
//- (CGSize)swipeableViewSizeForTopCard:(LZSwipeableView *)swipeableView;
/**
 *  顶部卡片实现时调用
 */
- (void)swipeableView:(LZSwipeableView *)swipeableView didTopCardShow:(LZSwipeableViewCell *)topCell;
/**
 *  最后一个卡片被移除时调用
 */
- (void)swipeableViewDidLastCardRemoved:(LZSwipeableView *)swipeableView;
/**
 *  当前移除的是哪一个卡片
 */
- (void)swipeableView:(LZSwipeableView *)swipeableView didCardRemovedAtIndex:(NSInteger)index withDirection:(LZSwipeableViewCellSwipeDirection)direction;

/**
 *  当前点击了哪张卡片
 */
- (void)swipeableView:(LZSwipeableView *)swipeableView didTapCellAtIndex:(NSInteger)index;

/**
 *  最后一张卡片显示时调用
 */
- (void)swipeableView:(LZSwipeableView *)swipeableView didLastCardShow:(LZSwipeableViewCell *)cell;

/**
 *  创建替身cell，配合cell的添加屏幕截图方法使用，可实现动画时内容尺寸不变视觉效果
 */
- (__kindof LZSwipeableViewCell *)swipeableView:(LZSwipeableView *)swipeableView substituteCellForIndex:(NSInteger)index;

// 卡片头部视图代理方法
- (CGFloat)heightForHeaderView:(LZSwipeableView *)swipeableView;
- (UIView *)headerViewForSwipeableView:(LZSwipeableView *)swipeableView;

// 卡片底部视图代理方法
- (CGFloat)heightForFooterView:(LZSwipeableView *)swipeableView;
- (UIView *)footerViewForSwipeableView:(LZSwipeableView *)swipeableView;

@end


@interface LZSwipeableView : UIView
@property (nonatomic, weak) id <LZSwipeableViewDataSource> datasource;
@property (nonatomic, weak) id <LZSwipeableViewDelegate> delegate;
/** 头部视图  */
@property (nonatomic, strong,readonly) UIView *headerView;
/** 底部视图  */
@property (nonatomic, strong,readonly) UIView *footerView;

/** 顶部卡片位置 默认都是20 */
@property (nonatomic, assign) UIEdgeInsets topCardInset;

// 卡片之间的水平和垂直间距 默认10
@property (nonatomic, assign) CGFloat bottomCardInsetVerticalMargin;
@property (nonatomic, assign) CGFloat bottomCardInsetHorizontalMargin;

/** 
 *  若是注册过cell，请在注册cell之后调用reloadData（第一次加载数据时调用）
 */
- (void)reloadData;
/**
 *  刷新数据源(加载更多数据时调用)
 */
- (void)refreshDataSource;

/**
 *  注册cell
 */
- (void)registerNibName:(NSString *)nibName forCellReuseIdentifier:(NSString *)identifier;
- (void)registerClass:(Class)cellClass forCellReuseIdentifier:(NSString *)identifier;

// 重刷内部子控件位置
- (void)setLayoutSubViews;

/**
 *  去缓存池取可重用的cell
 */
- (__kindof LZSwipeableViewCell *)dequeueReusableCellWithIdentifier:(NSString *)identifier;



/**
 *  移除最顶层的card
 */
- (void)removeTopCardViewFromSwipe:(LZSwipeableViewCellSwipeDirection)direction;


@end


