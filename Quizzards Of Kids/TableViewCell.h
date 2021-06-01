//
//  TableViewCell.h
//  Quizzards Of Kids
//


#import <UIKit/UIKit.h>

@interface TableViewCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UILabel *TitleLabel;

@property (strong, nonatomic) IBOutlet UILabel *DescriptionLabel;

@property (strong, nonatomic) IBOutlet UIImageView *ThumbImage;
@end
