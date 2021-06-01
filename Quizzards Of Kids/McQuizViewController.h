//
//  McQuizViewController.h
//  Quizzards Of Kids
//


#import <UIKit/UIKit.h>
#import "AppDelegate.h"

@interface McQuizViewController : UIViewController

@property (strong, nonatomic) IBOutlet UIImageView *myQuestionImage;
@property (strong, nonatomic) IBOutlet UILabel *myQuestionLabel;
@property (strong, nonatomic) IBOutlet UILabel *myQuestionNumLabel;
@property (strong, nonatomic) IBOutlet UILabel *myScoreLabel;
@property (strong, nonatomic) IBOutlet UILabel *myTimeLabel;
@property (strong, nonatomic) IBOutlet UILabel *myAnswerALabel;
@property (strong, nonatomic) IBOutlet UILabel *myAnswerBLabel;
@property (strong, nonatomic) IBOutlet UILabel *myAnswerCLabel;
@property (strong, nonatomic) IBOutlet UILabel *myAnswerDLabel;
@property (strong, nonatomic) IBOutlet UIButton *myAnswerAButton;
@property (strong, nonatomic) IBOutlet UIButton *myAnswerBButton;
@property (strong, nonatomic) IBOutlet UIButton *myAnswerCButton;
@property (strong, nonatomic) IBOutlet UIButton *myAnswerDButton;
@property (strong, nonatomic) IBOutlet UIButton *myNextButton;
@property (strong, nonatomic) IBOutlet UIButton *myCheckResultButton;
@property (strong, nonatomic) IBOutlet UIImageView *myBackgroundImage;

@property (nonatomic, retain) NSArray *questions;
@property (nonatomic, retain) NSArray *questionNumbers;
@property (nonatomic, retain) NSArray *questionImages;
@property (nonatomic, retain) NSArray *correctAnswers;
@property (nonatomic, retain) NSArray *aAnswers;
@property (nonatomic, retain) NSArray *bAnswers;
@property (nonatomic, retain) NSArray *cAnswers;
@property (nonatomic, retain) NSArray *dAnswers;

- (IBAction)AnswerAClick:(id)sender;
- (IBAction)AnswerBClick:(id)sender;
- (IBAction)AnswerCClick:(id)sender;
- (IBAction)AnswerDClick:(id)sender;
- (IBAction)nextQuestionClick:(id)sender;
- (IBAction)checkResultClick:(id)sender;


@end
