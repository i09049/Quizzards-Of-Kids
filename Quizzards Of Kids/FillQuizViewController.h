//
//  FillQuizViewController.h
//  Quizzards Of Kids
//


#import <UIKit/UIKit.h>

@interface FillQuizViewController : UIViewController
@property (strong, nonatomic) IBOutlet UIImageView *myQuestionImage;
@property (strong, nonatomic) IBOutlet UILabel *myQuestionLabel;
@property (strong, nonatomic) IBOutlet UILabel *myQuestionNumLabel;
@property (strong, nonatomic) IBOutlet UILabel *myScoreLabel;
@property (strong, nonatomic) IBOutlet UILabel *myTimeLabel;
@property (strong, nonatomic) IBOutlet UIButton *myEnterButton;
@property (strong, nonatomic) IBOutlet UITextField *myTextfield;
@property (strong, nonatomic) IBOutlet UIButton *myNextButton;
@property (strong, nonatomic) IBOutlet UIButton *myCheckResultButton;
@property (strong, nonatomic) IBOutlet UIImageView *myBackgroundImage;

@property (nonatomic, retain) NSArray *questions;
@property (nonatomic, retain) NSArray *questionNumbers;
@property (nonatomic, retain) NSArray *questionImages;
@property (nonatomic, retain) NSArray *correctAnswers;

- (IBAction)enterAnswerClick:(id)sender;
- (IBAction)nextQuestionClick:(id)sender;
- (IBAction)checkResultClick:(id)sender;




@end
