//
//  AVCardInfo.h
//  LZSwipeableViewDemo
//
//  Created by 周济 on 16/4/21.
//  Copyright © 2016年 LeoZ. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AVCardInfo : NSObject
@property (nonatomic, assign) long long  feed_id;
@property (nonatomic, copy  ) NSString  *title;
@property (nonatomic, copy  ) NSString  *summary;
@property (nonatomic, copy  ) NSString  *webview_url;
@property (nonatomic, assign) NSInteger fav_count;
@property (nonatomic, assign) BOOL      is_fav;
@end