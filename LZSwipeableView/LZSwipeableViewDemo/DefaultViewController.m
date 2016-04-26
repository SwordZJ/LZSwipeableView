//
//  DefaultViewController.m
//  LZSwipeableViewDemo
//
//  Created by 周济 on 16/4/21.
//  Copyright © 2016年 LeoZ. All rights reserved.
//

#import "DefaultViewController.h"
#import "LZSwipeableView.h"
#import "AVCardInfo.h"
#import "AVSwipeCardCell.h"
#import "AVKnackBottomToolView.h"
@interface DefaultViewController ()<LZSwipeableViewDataSource,
LZSwipeableViewDelegate,AVKnackBottomToolViewDelegate>
@property (nonatomic, strong) NSMutableArray *cardInfoList;
@property (nonatomic, strong) LZSwipeableView *swipeableView;

/** <#desc#>  */
@property (nonatomic, strong) LZSwipeableViewCell *topCell;
@end

@implementation DefaultViewController

- (NSMutableArray *)cardInfoList{
    if (!_cardInfoList) {
        _cardInfoList = [NSMutableArray array];
    }
    return _cardInfoList;
}

- (LZSwipeableView *)swipeableView{
    if (!_swipeableView) {
        _swipeableView = [[LZSwipeableView alloc] initWithFrame:self.view.bounds];
        _swipeableView.datasource = self;
        _swipeableView.delegate = self;
        _swipeableView.backgroundColor = [UIColor colorWithHex:0xebebeb];
        _swipeableView.topCardInset = UIEdgeInsetsMake(20, 20, 20, 20);
    }
    return _swipeableView;
}

- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    
    [self.swipeableView reloadData];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithHex:0xebebeb];
    self.edgesForExtendedLayout = UIRectEdgeNone;
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.swipeableView];
    self.swipeableView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    [self.swipeableView registerClass:[AVSwipeCardCell class] forCellReuseIdentifier:NSStringFromClass([AVSwipeCardCell class])];
    
//    [self.swipeableView registerNibName:NSStringFromClass([AVSwipeCardCell class]) forCellReuseIdentifier:NSStringFromClass([AVSwipeCardCell class])];
    
    for (int i = 0; i < 100; i++) {
        AVCardInfo *info = [[AVCardInfo alloc] init];
        info.feed_id = 123145;
        info.title = [NSString stringWithFormat:@"测试%zd",i];
        info.summary = [NSString stringWithFormat:@"测试desc%zd",i];
        info.fav_count = arc4random_uniform(100);
        info.is_fav = arc4random_uniform(1);
        [self.cardInfoList addObject:info];
    }
    
//    [self.swipeableView reloadData];

}

- (void)viewWillLayoutSubviews{
    [super viewWillLayoutSubviews];
    self.swipeableView.frame = self.view.bounds;
}

#pragma mark LZSwipeableViewDataSource
- (NSInteger)swipeableViewNumberOfRowsInSection:(LZSwipeableView *)swipeableView{
    return self.cardInfoList.count;
}

- (LZSwipeableViewCell *)swipeableView:(LZSwipeableView *)swipeableView cellForIndex:(NSInteger)index{
    AVSwipeCardCell *cell = [swipeableView dequeueReusableCellWithIdentifier:NSStringFromClass([AVSwipeCardCell class])];
    cell.cardInfo = self.cardInfoList[index];
    cell.backgroundColor = [UIColor randomColor];
    return cell;
}

- (LZSwipeableViewCell *)swipeableView:(LZSwipeableView *)swipeableView substituteCellForIndex:(NSInteger)index{
    AVSwipeCardCell *cell = [[AVSwipeCardCell alloc] init];
    cell.cardInfo = self.cardInfoList[index];
    return cell;
}

//- (CGSize)swipeableViewSizeForTopCard:(LZSwipeableView *)swipeableView{
//    return CGSizeMake(300, 300);
//}

#pragma mark LZSwipeableViewDelegate
- (NSInteger)swipeableViewMaxCardNumberWillShow:(LZSwipeableView *)swipeableView{
    return 2;
}
- (void)swipeableView:(LZSwipeableView *)swipeableView didTapCellAtIndex:(NSInteger)index{

}

- (UIView *)footerViewForSwipeableView:(LZSwipeableView *)swipeableView{
    AVKnackBottomToolView *bottomView = [AVKnackBottomToolView viewFromXib];
    bottomView.superVCtl = self;
    bottomView.delegate  = self;
    return bottomView;
}

- (CGFloat)heightForFooterView:(LZSwipeableView *)swipeableView{
    return 75;
}

// 拉到最后一个
- (void)swipeableViewDidLastCardRemoved:(LZSwipeableView *)swipeableView{

}


- (void)swipeableView:(LZSwipeableView *)swipeableView didCardRemovedAtIndex:(NSInteger)index{
    
}


- (void)swipeableView:(LZSwipeableView *)swipeableView didTopCardShow:(LZSwipeableViewCell *)topCell{
    self.topCell = topCell;
}


- (void)swipeableView:(LZSwipeableView *)swipeableView didLastCardShow:(LZSwipeableViewCell *)cell{

}

#pragma mark - AVKnackBottomToolViewDelegate
- (void)knackBottomToolViewDidCheckDetailBtnClick:(AVCardInfo *)idInfo{
    [self.swipeableView removeTopCardViewFromSwipe:LZSwipeableViewCellSwipeDirectionLeft];
}


- (void)knackBottomToolViewDidCollectBtnClick:(AVCardInfo *)idInfo{
    [self.swipeableView removeTopCardViewFromSwipe:LZSwipeableViewCellSwipeDirectionRight];
}

- (void)knackBottomToolViewDidShareBtnClick:(AVCardInfo *)idInfo{
    [self.swipeableView removeTopCardViewFromSwipe:LZSwipeableViewCellSwipeDirectionTop];
}




@end
