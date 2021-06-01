//
//  McQuizViewController.m
//  Quizzards Of Kids
//


#import "McQuizViewController.h"
#import "AppDelegate.h"

@interface McQuizViewController ()
{
    int score;
    int questionCount;
    int minute;
    int seconds;
    bool checkedAnswer;
    NSString* userAnswer;
    NSTimer *timer;
    AppDelegate* appGlobal;
}
@end

@implementation McQuizViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.hidesBackButton = YES;
    [self changeBackgroundColour];
    
    score = 0;
    questionCount = 0;
    minute=30;
    seconds=00;
    checkedAnswer = NO;
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
    
    _questions = @[@"How long does it take for the earth to revolve around the sun for a week?",
                   @"2r = 14, r = __________",
                   @"The perimeter of a square is 36 cm. Find the length of one side of the square in cm.",
                   @"Buying 16 pencils pays 48 dollars. Now I only buy 14 sticks. How much is it?",
                   @"What is the closest planet to the sun?",
                   @"What is the L.C.M. of 24 and 36?",
                   @"What is the 'L' in Roman numerals?",
                   @"What is the H.C.F. of 15 and 45?",
                   @"Name the largest planet in the solar system.",
                   @"How many time zones is the earth divided into?"];
    
    _aAnswers = @[@"one day",
                  @"28",
                  @"4 cm",
                  @"42",
                  @"Mercury",
                  @"100",
                  @"10",
                  @"35",
                  @"Uranus",
                  @"6"];
    
    _bAnswers = @[@"one month",
                  @"7",
                  @"15 cm",
                  @"44",
                  @"Venus",
                  @"60",
                  @"50",
                  @"25",
                  @"Neptune",
                  @"12"];
    
    _cAnswers = @[@"one year",
                  @"16",
                  @"9 cm",
                  @"46",
                  @"Mars",
                  @"64",
                  @"100",
                  @"45",
                  @"Saturn",
                  @"24"];
    
    _dAnswers = @[@"ten years",
                  @"12",
                  @"12 cm",
                  @"48",
                  @"Uranus",
                  @"72",
                  @"500",
                  @"15",
                  @"Jupiter",
                  @"39"];
    
    _correctAnswers = @[@"c",
                        @"b",
                        @"c",
                        @"a",
                        @"a",
                        @"d",
                        @"b",
                        @"c",
                        @"d",
                        @"c"];
    
    _questionImages = @[@"mcQuiz1",
                        @"mcQuiz2",
                        @"mcQuiz3",
                        @"mcQuiz4",
                        @"mcQuiz5",
                        @"mcQuiz6",
                        @"mcQuiz7",
                        @"mcQuiz8",
                        @"mcQuiz9",
                        @"mcQuiz10"];
    
    _myScoreLabel.text = [NSString stringWithFormat:@"%i",score];
    
    _myAnswerALabel.layer.cornerRadius = 40;
    _myAnswerALabel.clipsToBounds = true;
    
    _myAnswerBLabel.layer.cornerRadius = 40;
    _myAnswerBLabel.clipsToBounds = true;
    
    _myAnswerCLabel.layer.cornerRadius = 40;
    _myAnswerCLabel.clipsToBounds = true;
    
    _myAnswerDLabel.layer.cornerRadius = 40;
    _myAnswerDLabel.clipsToBounds = true;
    
    _myQuestionImage.layer.cornerRadius = 30;
    _myQuestionImage.clipsToBounds = true;
    
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

- (IBAction)AnswerAClick:(id)sender {
    userAnswer = @"a";
    checkedAnswer = [self checkAnswer:userAnswer];
    [self updateButtonColour:checkedAnswer];
    [self updatescore:checkedAnswer];
    [self disableAnswerButton];
    questionCount++;
    [self showNextPage];
}

- (IBAction)AnswerBClick:(id)sender {
    userAnswer = @"b";
    checkedAnswer = [self checkAnswer:userAnswer];
    [self updateButtonColour:checkedAnswer];
    [self updatescore:checkedAnswer];
    [self disableAnswerButton];
    questionCount++;
    [self showNextPage];
}

- (IBAction)AnswerCClick:(id)sender {
    userAnswer = @"c";
    checkedAnswer = [self checkAnswer:userAnswer];
    [self updateButtonColour:checkedAnswer];
    [self updatescore:checkedAnswer];
    [self disableAnswerButton];
    questionCount++;
    [self showNextPage];
}

- (IBAction)AnswerDClick:(id)sender {
    userAnswer = @"d";
    checkedAnswer = [self checkAnswer:userAnswer];
    [self updateButtonColour:checkedAnswer];
    [self updatescore:checkedAnswer];
    [self disableAnswerButton];
    questionCount++;
    [self showNextPage];
}

- (IBAction)nextQuestionClick:(id)sender {
    [appGlobal playTapSound];
    [self updateContent];
    _myAnswerAButton.enabled = YES;
    _myAnswerBButton.enabled = YES;
    _myAnswerCButton.enabled = YES;
    _myAnswerDButton.enabled = YES;
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

- (void)disableAnswerButton
{
    _myAnswerAButton.enabled = NO;
    _myAnswerBButton.enabled = NO;
    _myAnswerCButton.enabled = NO;
    _myAnswerDButton.enabled = NO;
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

- (void)updateButtonColour:(BOOL) checkedAnswer
{
    if([_correctAnswers[questionCount] isEqualToString: @"a"]){
        _myAnswerALabel.backgroundColor = [UIColor colorWithRed:0
                                                          green:255
                                                           blue:0
                                                          alpha:0.5];
    }
    else if([_correctAnswers[questionCount] isEqualToString: @"b"]){
        _myAnswerBLabel.backgroundColor = [UIColor colorWithRed:0
                                                          green:255
                                                           blue:0
                                                          alpha:0.5];
    }
    else if([_correctAnswers[questionCount] isEqualToString: @"c"]){
        _myAnswerCLabel.backgroundColor = [UIColor colorWithRed:0
                                                          green:255
                                                           blue:0
                                                          alpha:0.5];
    }
    else if([_correctAnswers[questionCount] isEqualToString: @"d"]){
        _myAnswerDLabel.backgroundColor = [UIColor colorWithRed:0
                                                          green:255
                                                           blue:0
                                                          alpha:0.5];
    }
    if (!checkedAnswer){
        if([userAnswer isEqualToString: @"a"]){
            _myAnswerALabel.backgroundColor = [UIColor colorWithRed:255
                                                              green:0
                                                               blue:0
                                                              alpha:0.5];
        }
        else if([userAnswer isEqualToString: @"b"]){
            _myAnswerBLabel.backgroundColor = [UIColor colorWithRed:255
                                                              green:0
                                                               blue:0
                                                              alpha:0.5];
        }
        else if([userAnswer isEqualToString: @"c"]){
            _myAnswerCLabel.backgroundColor = [UIColor colorWithRed:255
                                                              green:0
                                                               blue:0
                                                              alpha:0.5];
        }
        else if([userAnswer isEqualToString: @"d"]){
            _myAnswerDLabel.backgroundColor = [UIColor colorWithRed:255
                                                              green:0
                                                               blue:0
                                                              alpha:0.5];
        }
    }
}

- (void)updateContent
{
    _myNextButton.enabled = NO;
    _myQuestionImage.image = [UIImage imageNamed:_questionImages[questionCount]];
    _myQuestionNumLabel.text = _questionNumbers[questionCount];
    _myQuestionLabel.text = _questions[questionCount];
    _myAnswerALabel.text = _aAnswers[questionCount];
    _myAnswerBLabel.text = _bAnswers[questionCount];
    _myAnswerCLabel.text = _cAnswers[questionCount];
    _myAnswerDLabel.text = _dAnswers[questionCount];
    
    _myAnswerALabel.backgroundColor = [UIColor colorWithRed:255
                                                      green:255
                                                       blue:255
                                                      alpha:0.5];
    
    _myAnswerBLabel.backgroundColor = [UIColor colorWithRed:255
                                                      green:255
                                                       blue:255
                                                      alpha:0.5];
    
    _myAnswerCLabel.backgroundColor = [UIColor colorWithRed:255
                                                      green:255
                                                       blue:255
                                                      alpha:0.5];
    
    _myAnswerDLabel.backgroundColor = [UIColor colorWithRed:255
                                                      green:255
                                                       blue:255
                                                      alpha:0.5];
}

-(void)startCountdown
{
    timer=[NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(timerFired) userInfo:nil repeats:YES];
}

-(void)timesUp
{
    checkedAnswer = YES;
    [self updateButtonColour:checkedAnswer];
    [self disableAnswerButton];
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

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end
