//
//  ViewControllerTwo.m
//  Quizzards Of Kids
//


#import "ViewControllerTwo.h"
#import "AppDelegate.h"
@interface ViewControllerTwo ()
{
    AppDelegate* appGlobal;
}
@end

@implementation ViewControllerTwo

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.hidesBackButton = YES;
    appGlobal = (AppDelegate*)[[UIApplication sharedApplication] delegate];
}

- (void)viewDidAppear:(BOOL)animated
{
    [self changeBackgroundColour];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)quizOneClick:(id)sender {
    [appGlobal playTapSound];
}

- (IBAction)quizTwoClick:(id)sender {
    [appGlobal playTapSound];
}

- (IBAction)quizThreeClick:(id)sender {
    [appGlobal playTapSound];
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
}@end
