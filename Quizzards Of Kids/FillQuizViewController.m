//
//  FillQuizViewController.m
//  Quizzards Of Kids
//


#import "FillQuizViewController.h"
#import "AppDelegate.h"

@interface FillQuizViewController ()
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

@implementation FillQuizViewController

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
    
    _questions = @[@"I __________(start) to play football when I was six years old.",
                   @"I __________(play) football for four years.",
                   @"Have you __________(throw) away the rubbish yet?",
                   @"We have already __________(buy) the birthday present for mum.",
                   @"May and Betty argue __________ each other all the time.",
                   @"Gary and John are the funniest pupils in the class. We all laugh __________ their jokes.",
                   @"Ann is tired __________ she went to bed very late last night.",
                   @"Peter is usually very quiet at school __________ he is talkative at home.",
                   @"Drinking too __________ soda is bad for your health.",
                   @"You need to eat __________ junk food if you want to be healthy."];
    
    _correctAnswers = @[@"started",
                        @"have played",
                        @"thrown",
                        @"bought",
                        @"with",
                        @"at",
                        @"because",
                        @"but",
                        @"much",
                        @"less"];
    
    _questionImages = @[@"fillQuiz1",
                        @"fillQuiz2",
                        @"fillQuiz3",
                        @"fillQuiz4",
                        @"fillQuiz5",
                        @"fillQuiz6",
                        @"fillQuiz7",
                        @"fillQuiz8",
                        @"fillQuiz9",
                        @"fillQuiz10"];
    
    _myScoreLabel.text = [NSString stringWithFormat:@"%i",score];
    _myTextfield.enabled = YES;
    _myCheckResultButton.hidden = YES;
    
    _myQuestionImage.clipsToBounds = true;
    _myQuestionImage.layer.cornerRadius = 30;
    
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
    
    UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(dismissKeyboard)];
    
    [self.view addGestureRecognizer:tap];
}

- (void)viewDidAppear:(BOOL)animated
{
    [self changeBackgroundColour];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)enterAnswerClick:(id)sender {
    [self.myTextfield resignFirstResponder];
    [appGlobal playTapSound];
    _myTextfield.enabled = NO;
    _myEnterButton.enabled = NO;
    userAnswer = _myTextfield.text;
    [self updatescore:[self checkAnswer:userAnswer]];
    [self showNextPage];
    
}

- (IBAction)nextQuestionClick:(id)sender {
    [appGlobal playTapSound];
    questionCount++;
    [self updateContent];
}

- (IBAction)checkResultClick:(id)sender {
    [appGlobal playTapSound];
    [appGlobal saveScore:score];
}

- (BOOL)checkAnswer:(NSString*) userAnswer
{
    if ([_correctAnswers[questionCount] isEqualToString:userAnswer]){
        [appGlobal playCorrectSound];
        _myTextfield.backgroundColor = [UIColor colorWithRed:0
                                                       green:255
                                                        blue:0
                                                       alpha:0.5];
        return YES;
    }
    else{
        [appGlobal playWrongSound];
        _myTextfield.backgroundColor = [UIColor colorWithRed:255
                                                       green:0
                                                        blue:0
                                                       alpha:0.5];
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
    if (questionCount == 9)
    {
        _myNextButton.hidden = YES;
        _myNextButton.enabled = NO;
        _myCheckResultButton.hidden = NO;
        _myCheckResultButton.enabled = YES;
    }
    else
        _myNextButton.enabled = YES;
}

- (void)updateContent
{
    _myQuestionNumLabel.text = _questionNumbers[questionCount];
    _myQuestionLabel.text = _questions[questionCount];
    _myQuestionImage.image = [UIImage imageNamed:_questionImages[questionCount]];
    
    _myEnterButton.enabled = YES;
    _myNextButton.enabled = NO;
    _myTextfield.text = @"";
    _myTextfield.enabled = YES;
    _myTextfield.backgroundColor = [UIColor colorWithRed:255
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

-(void)dismissKeyboard{
    [_myTextfield resignFirstResponder];
}
@end
