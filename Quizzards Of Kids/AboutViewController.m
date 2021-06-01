//
//  AboutViewController.m
//  Quizzards Of Kids
//

#import "AboutViewController.h"
#import "AppDelegate.h"

@interface AboutViewController ()
{
    AppDelegate* appGlobal;
}
@end

@implementation AboutViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    appGlobal = (AppDelegate*)[[UIApplication sharedApplication] delegate];
    _myTextView.editable = NO;
}

- (void)viewDidAppear:(BOOL)animated
{
    [self changeBackgroundColour];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)detailsClick:(id)sender {
    [appGlobal playTapSound];
}

- (IBAction)GoFb:(id)sender {
    [appGlobal playTapSound];
    [[UIApplication sharedApplication] openURL: [NSURL URLWithString:@"https://www.facebook.com/yiu.pingping.7"]];
}

- (IBAction)Goig:(id)sender {
    [appGlobal playTapSound];
    [[UIApplication sharedApplication] openURL: [NSURL URLWithString:@"https://www.instagram.com/yiu.p/?hl=zh-tw"]];
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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
