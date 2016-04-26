//
//  AVKnackBottomToolView.h
//  avari
//
//  Created by 周济 on 16/4/7.
//  Copyright © 2016年 puahome. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AVCardInfo.h"
@protocol AVKnackBottomToolViewDelegate <NSObject>
@optional
- (void)knackBottomToolViewDidCheckDetailBtnClick:(AVCardInfo *)idInfo;
- (void)knackBottomToolViewDidCollectBtnClick:(AVCardInfo *)idInfo;
- (void)knackBottomToolViewDidShareBtnClick:(AVCardInfo *)idInfo;
@end


@interface AVKnackBottomToolView : UIView
@property (nonatomic, strong)UIViewController * superVCtl;
@property (nonatomic, weak) id<AVKnackBottomToolViewDelegate> delegate;
- (void)changeBottomState:(AVCardInfo *)info;
@end
