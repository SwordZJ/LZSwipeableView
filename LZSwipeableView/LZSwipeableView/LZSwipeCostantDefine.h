//
//  LZSwipeCostantDefine.h
//  LZSwipeableViewDemo
//
//  Created by liuzhouji on 16/4/20.
//  Copyright © 2016年 LeoZ. All rights reserved.
//

#ifndef LZSwipeCostantDefine_h
#define LZSwipeCostantDefine_h

#define LZSwipeableViewDefaultMaxShowCardNumber 3

#define MAIN_BOUNDS_SIZE [UIScreen mainScreen].bounds.size
#define RGBA(r,g,b,a) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:a]

#define ACTION_MARGIN 50

#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height

// 顶部卡片默认边距
#define Top_Card_Inset_Margin_Default 20
// 底部卡片默认间距
#define Bottom_Card_Inset_Margin 10

// 默认头部和底部工具条的高度
#define HeaderFooterToolViewDefaultHeight 49

#import "NSObject+LZSwipeCategory.h"


#endif /* LZSwipeCostantDefine_h */
