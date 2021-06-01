//
//  AboutViewController.h
//  Quizzards Of Kids
//


#import <UIKit/UIKit.h>

@interface AboutViewController : UIViewController
@property (strong, nonatomic) IBOutlet UIImageView *myBackgroundImage;
@property (strong, nonatomic) IBOutlet UITextView *myTextView;
- (IBAction)detailsClick:(id)sender;
- (IBAction)GoFb:(id)sender;
- (IBAction)Goig:(id)sender;
@end
