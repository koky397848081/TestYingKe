//
//  TYKHotTableViewCell.m
//  TestYingKe
//
//  Created by xujing on 16/11/21.
//  Copyright © 2016年 xujing. All rights reserved.
//

#import "TYKHotTableViewCell.h"

@interface TYKHotTableViewCell()

@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *cityLabel;
@property (weak, nonatomic) IBOutlet UILabel *onLineUserLabel;
@property (weak, nonatomic) IBOutlet UIImageView *portraitImageView;
@property (weak, nonatomic) IBOutlet UIImageView *bigImageView;

@end

@implementation TYKHotTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.portraitImageView.layer.cornerRadius = CGRectGetWidth(self.portraitImageView.frame) / 2;
    self.portraitImageView.layer.masksToBounds = YES;
}

- (void)setLive:(SXTLive *)live {
    
    _live = live;
    
    self.nameLabel.text = live.creator.nick;
    self.cityLabel.text = live.city;
    self.onLineUserLabel.text = [@(live.online_users) stringValue];
    
    if ([live.creator.nick isEqualToString:@"大欢"]) {
        
        self.portraitImageView.image = [UIImage  imageNamed:@"dahuan.png"];
        self.bigImageView.image = [UIImage  imageNamed:@"dahuan.png"];
        
    } else {
        
        [self.portraitImageView downloadImage:[NSString stringWithFormat:@"%@%@",IMAGE_HOST,live.creator.portrait] placeholder:@"default_room"];
        [self.bigImageView downloadImage:[NSString stringWithFormat:@"%@%@",IMAGE_HOST,live.creator.portrait] placeholder:@"default_room"];
    }
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

@end
