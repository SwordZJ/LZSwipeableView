//
//  AVSwipeCardCell.h
//  LZSwipeableViewDemo
//
//  Created by 周济 on 16/4/21.
//  Copyright © 2016年 LeoZ. All rights reserved.
//

#import "LZSwipeableView.h"
#import "AVCardInfo.h"
@interface AVSwipeCardCell : LZSwipeableViewCell
/** 卡片信息  */
@property (nonatomic, strong) AVCardInfo *cardInfo;
@end
