//
//  ResultViewController.h
//  Quizzards Of Kids
//


#import <UIKit/UIKit.h>

@interface ResultViewController : UIViewController

@property (strong, nonatomic) IBOutlet UIImageView *myResultImage;
@property (strong, nonatomic) IBOutlet UILabel *myResultLabel;
@property (strong, nonatomic) IBOutlet UIImageView *myBackgroundImage;
@property (strong, nonatomic) IBOutlet UILabel *myRankLabel;

- (IBAction)restartClick:(id)sender;

@end
