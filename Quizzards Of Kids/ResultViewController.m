//
//  ResultViewController.m
//  Quizzards Of Kids
//


#import "ResultViewController.h"
#import "AppDelegate.h"

@interface ResultViewController ()
{
    AppDelegate* appGlobal;
    int score;
}
@end

@implementation ResultViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.hidesBackButton = YES;
    [self changeBackgroundColour];
    
    appGlobal = (AppDelegate*)[[UIApplication sharedApplication] delegate];
    score = appGlobal.getScore;
    
    if(score <= 20){
        _myResultImage.image = [UIImage imageNamed:@"1star"];
        _myRankLabel.text = @"Poor";
    }else if (score <= 40){
        _myResultImage.image = [UIImage imageNamed:@"2star"];
        _myRankLabel.text = @"Not bad";
    }else if (score <= 60){
        _myResultImage.image = [UIImage imageNamed:@"3star"];
        _myRankLabel.text = @"Average";
    }else if (score <= 80){
        _myResultImage.image = [UIImage imageNamed:@"4star"];
        _myRankLabel.text = @"Good!";
    }else{
        _myResultImage.image = [UIImage imageNamed:@"5star"];
        _myRankLabel.text = @"Excellent!";
    }
    _myResultLabel.text = [NSString stringWithFormat:@"%d",score];
}

- (void)viewDidAppear:(BOOL)animated
{
    [self changeBackgroundColour];
}

- (void)changeBackgroundColour{
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


- (IBAction)restartClick:(id)sender {
    [appGlobal playTapSound];
}
@end
