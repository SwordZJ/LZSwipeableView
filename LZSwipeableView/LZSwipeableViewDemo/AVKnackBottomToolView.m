//
//  AVKnackBottomToolView.m
//  avari
//
//  Created by 周济 on 16/4/7.
//  Copyright © 2016年 puahome. All rights reserved.
//

#import "AVKnackBottomToolView.h"

@interface AVKnackBottomToolView ()
@property (weak, nonatomic) IBOutlet UIButton *checkDetailBtn;

@property (weak, nonatomic) IBOutlet UIButton *favBtn;

@property (weak, nonatomic) IBOutlet UIButton *shareBtn;

@property (weak, nonatomic) IBOutlet UILabel *favNumLabel;


@property (nonatomic, strong) AVCardInfo *cardInfo;
@end

@implementation AVKnackBottomToolView

- (void)awakeFromNib{
    self.checkDetailBtn.backgroundColor = [UIColor whiteColor];
    self.checkDetailBtn.layer.cornerRadius = 25;
    self.checkDetailBtn.layer.masksToBounds = YES;
    
    self.favBtn.backgroundColor = [UIColor whiteColor];
    self.favBtn.layer.cornerRadius = 27.5;
    self.favBtn.layer.masksToBounds = YES;
    self.favBtn.adjustsImageWhenHighlighted = NO;
    
    self.shareBtn.backgroundColor = [UIColor whiteColor];
    self.shareBtn.layer.cornerRadius = 25;
    self.shareBtn.layer.masksToBounds = YES;
}


- (IBAction)checkKnackDetail {
    if ([self.delegate respondsToSelector:@selector(knackBottomToolViewDidCheckDetailBtnClick:)]) {
        [self.delegate knackBottomToolViewDidCheckDetailBtnClick:self.cardInfo];
    }
}

- (IBAction)collectBtnClick {
    if ([self.delegate respondsToSelector:@selector(knackBottomToolViewDidCollectBtnClick:)]) {
        [self.delegate knackBottomToolViewDidCollectBtnClick:self.cardInfo];
    }
}

- (IBAction)shareBtnClick {
    if ([self.delegate respondsToSelector:@selector(knackBottomToolViewDidShareBtnClick:)]) {
        [self.delegate knackBottomToolViewDidShareBtnClick:self.cardInfo];
    }
}

- (void)changeBottomState:(AVCardInfo *)info{
    self.cardInfo = info;
    if (info.fav_count > 0) {
        self.favNumLabel.text = [NSString stringWithFormat:@"%ld",info.fav_count];
        self.favNumLabel.hidden = NO;
    }else{
        self.favNumLabel.hidden = YES;
    }
    self.favBtn.selected  = info.is_fav;
}




@end
