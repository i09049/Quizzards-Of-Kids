//
//  ViewControllerTwo.h
//  Quizzards Of Kids
//


#import <UIKit/UIKit.h>

@interface ViewControllerTwo : UIViewController

- (IBAction)quizOneClick:(id)sender;
- (IBAction)quizTwoClick:(id)sender;
- (IBAction)quizThreeClick:(id)sender;
@property (weak, nonatomic) IBOutlet UIImageView *myBackgroundImage;


@end
