//
//  TFQuizViewController.h
//  Quizzards Of Kids
//


#import <UIKit/UIKit.h>

@interface TFQuizViewController : UIViewController

@property (strong, nonatomic) IBOutlet UIImageView *myQuestionImage;
@property (strong, nonatomic) IBOutlet UILabel *myQuestionLabel;
@property (strong, nonatomic) IBOutlet UILabel *myQuestionNumLabel;
@property (strong, nonatomic) IBOutlet UILabel *myScoreLabel;
@property (strong, nonatomic) IBOutlet UILabel *myTimeLabel;
@property (strong, nonatomic) IBOutlet UIButton *myNextButton;
@property (strong, nonatomic) IBOutlet UIButton *myTrueButton;
@property (strong, nonatomic) IBOutlet UIButton *myFalseButton;
@property (strong, nonatomic) IBOutlet UIButton *myCheckResultButton;
@property (strong, nonatomic) IBOutlet UIImageView *myBackgroundImage;
@property (strong, nonatomic) IBOutlet UILabel *myFalseLabel;
@property (strong, nonatomic) IBOutlet UILabel *myTrueLabel;

@property (nonatomic, retain) NSArray *questions;
@property (nonatomic, retain) NSArray *questionNumbers;
@property (nonatomic, retain) NSArray *questionImages;
@property (nonatomic, retain) NSArray *correctAnswers;

- (IBAction)trueClick:(id)sender;
- (IBAction)falseClick:(id)sender;
- (IBAction)nextQuestionClick:(id)sender;
- (IBAction)checkResultClick:(id)sender;

@end
