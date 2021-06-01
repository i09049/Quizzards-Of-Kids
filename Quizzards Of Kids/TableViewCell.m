//
//  TableViewCell.m
//  Quizzards Of Kids
//


#import "TableViewCell.h"

@implementation TableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    _ThumbImage.clipsToBounds = true;
    _ThumbImage.layer.cornerRadius = 50;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
