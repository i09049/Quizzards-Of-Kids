//
//  TFQuizViewController.m
//  Quizzards Of Kids
//


#import "TFQuizViewController.h"
#import "AppDelegate.h"

@interface TFQuizViewController ()
{
    int score;
    int questionCount;
    int minute;
    int seconds;
    NSString* userAnswer;
    NSTimer *timer;
    AppDelegate* appGlobal;
}
@end

@implementation TFQuizViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.hidesBackButton = YES;
    [self changeBackgroundColour];
    
    score = 0;
    questionCount = 0;
    minute=30;
    seconds=00;
    userAnswer = nil;
    appGlobal = (AppDelegate*)[[UIApplication sharedApplication] delegate];
    
    _questionNumbers = @[@"Question 1",
                         @"Question 2",
                         @"Question 3",
                         @"Question 4",
                         @"Question 5",
                         @"Question 6",
                         @"Question 7",
                         @"Question 8",
                         @"Question 9",
                         @"Question 10"];
    
    _questions = @[@"Acid rain has a corrosive effect on buildings.",
                   @"Petroleum and coal are examples of sustainable energy.",
                   @"Burning petroleum and coal releases carbon dioxide.",
                   @"Vitamin D and A can improve the health of bones and tooth.",
                   @"The ozone layer prevents ultraviolet entering the Earth.",
                   @"Most of the materials experience thermal expansion under cold circumstances.",
                   @"Blue Whale is the biggest mammal.",
                   @"Canberra is the capital of Australia",
                   @"Iron is an insulator.",
                   @"When the water is hot, it will become ice."];
    
    _correctAnswers = @[@"t",
                        @"f",
                        @"t",
                        @"f",
                        @"t",
                        @"f",
                        @"t",
                        @"t",
                        @"f",
                        @"f"];
    
    _questionImages = @[@"tfQuiz1",
                        @"tfQuiz2",
                        @"tfQuiz3",
                        @"tfQuiz4",
                        @"tfQuiz5",
                        @"tfQuiz6",
                        @"tfQuiz7",
                        @"tfQuiz8",
                        @"tfQuiz9",
                        @"tfQuiz10"];
    
    _myScoreLabel.text = [NSString stringWithFormat:@"%i",score];
    
    _myQuestionImage.layer.cornerRadius = 30;
    _myQuestionImage.clipsToBounds = true;
    
    _myTrueLabel.layer.cornerRadius = 30;
    _myTrueLabel.clipsToBounds = true;
    
    _myFalseLabel.layer.cornerRadius = 30;
    _myFalseLabel.clipsToBounds = true;
    
    _myCheckResultButton.hidden = YES;
    
    [self updateContent];
    [self startCountdown];
    
    super.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:255
                                                                            green:255
                                                                             blue:255
                                                                            alpha:1];
    super.tabBarController.tabBar.barTintColor = [UIColor colorWithRed:255
                                                                 green:255
                                                                  blue:255
                                                                 alpha:1];
}

- (void)viewDidAppear:(BOOL)animated
{
    [self changeBackgroundColour];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)trueClick:(id)sender {
    userAnswer = @"t";
    [self updatescore:[self checkAnswer:userAnswer]];
    [self updateButtonColour];
    [self disableAnswerButton];
    questionCount++;
    [self showNextPage];
}

- (IBAction)falseClick:(id)sender {
    userAnswer = @"f";
    [self updatescore:[self checkAnswer:userAnswer]];
    [self updateButtonColour];
    [self disableAnswerButton];
    questionCount++;
    [self showNextPage];
}
- (IBAction)nextQuestionClick:(id)sender {
    [appGlobal playTapSound];
    [self updateContent];
    _myTrueButton.enabled = YES;
    _myFalseButton.enabled = YES;
}

- (IBAction)checkResultClick:(id)sender {
    [appGlobal playTapSound];
    [appGlobal saveScore:score];
}

- (BOOL)checkAnswer:(NSString*) userAnswer
{
    if ([_correctAnswers[questionCount] isEqualToString:userAnswer]){
        [appGlobal playCorrectSound];
        return YES;
    }
    else{
        [appGlobal playWrongSound];
        return NO;
    }
}

- (void)updatescore:(BOOL) checkedAnswer
{
    if(checkedAnswer){
        score+=10;
        _myScoreLabel.text = [NSString stringWithFormat:@"%i",score];
    }
}

- (void)showNextPage
{
    if (questionCount == 10)
    {
        _myNextButton.hidden = YES;
        _myNextButton.enabled = NO;
        _myCheckResultButton.hidden = NO;
        _myCheckResultButton.enabled = YES;
    }
    else
        _myNextButton.enabled = YES;
}

- (void)updateButtonColour
{
    if([_correctAnswers[questionCount] isEqualToString: @"t"]){
        _myTrueLabel.backgroundColor = [UIColor colorWithRed:0
                                                          green:255
                                                           blue:0
                                                          alpha:0.5];
        _myFalseLabel.backgroundColor = [UIColor colorWithRed:255
                                                         green:0
                                                          blue:0
                                                         alpha:0.5];
    }else{
        _myTrueLabel.backgroundColor = [UIColor colorWithRed:255
                                                        green:0
                                                         blue:0
                                                        alpha:0.5];
        _myFalseLabel.backgroundColor = [UIColor colorWithRed:0
                                                         green:255
                                                          blue:0
                                                         alpha:0.5];
    }
}

- (void)updateContent
{
    _myNextButton.enabled = NO;
    _myQuestionImage.image = [UIImage imageNamed:_questionImages[questionCount]];

    _myQuestionNumLabel.text = _questionNumbers[questionCount];
    _myQuestionLabel.text = _questions[questionCount];
    
    _myTrueLabel.backgroundColor = [UIColor colorWithRed:255
                                                      green:255
                                                       blue:255
                                                      alpha:0.5];
    
    _myFalseLabel.backgroundColor = [UIColor colorWithRed:255
                                                      green:255
                                                       blue:255
                                                      alpha:0.5];
}

- (void)disableAnswerButton
{
    _myTrueButton.enabled = NO;
    _myFalseButton.enabled = NO;
}

-(void)startCountdown
{
    timer=[NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(timerFired) userInfo:nil repeats:YES];
}

-(void)timesUp
{
    [self updateButtonColour];
    _myNextButton.hidden = YES;
    _myNextButton.enabled = NO;
    _myCheckResultButton.hidden = NO;
    _myCheckResultButton.enabled = YES;
}

-(void)timerFired
{
    if((minute>0 || seconds>=0) && minute>=0)
    {
        if(seconds==0)
        {
            minute-=1;
            seconds=59;
        }
        else if(seconds>0)
        {
            seconds-=1;
        }
        if(minute>-1)
            [_myTimeLabel setText:[NSString stringWithFormat:@"%d%@%02d",minute,@":",seconds]];
    }
    else
    {
        [timer invalidate];
        [self timesUp];
    }
}

- (void)changeBackgroundColour
{
    if(appGlobal.getBackgroundColourSwitch)
    {
        _myBackgroundImage.alpha = 0;
        super.view.backgroundColor = [UIColor colorWithRed:appGlobal.getRedColour
                                                     green:appGlobal.getGreenColour
                                                      blue:appGlobal.getBlueColour
                                                     alpha:1];
    }else{
        _myBackgroundImage.alpha = 1;
    }
}
@end
