//
//  DetailViewController.m
//  Quizzards Of Kids
//


#import "DetailViewController.h"

#import "AppDelegate.h"
#import "ViewController.h"
#import "SettingViewController.h"
#import <AVFoundation/AVFoundation.h>
#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]
@interface DetailViewController ()
{
    AppDelegate* appGlobal;
}
@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    appGlobal = (AppDelegate*)[[UIApplication sharedApplication] delegate];
    
    _TitleLabel.text = _DetailModal[0];
    _DescriptionLabel.text = _DetailModal[1];
    _ImageView.image = [UIImage imageNamed:_DetailModal[2]];
    
    _ImageView.clipsToBounds = true;
    _ImageView.layer.cornerRadius = 50;
    
    self.navigationItem.title = _DetailModal[0];
}

- (void)viewDidAppear:(BOOL)animated
{
    [self changeBackgroundColour];
    [appGlobal continueMusic];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
- (IBAction)playMoive:(id)sender;{
    [appGlobal playTapSound];
    [appGlobal stopMusic];
    
    NSString *movieName = _DetailModal[3];
    
    NSString *filePath = [[NSBundle mainBundle] pathForResource:movieName ofType:@"mp4"];
    
    NSURL *videoURL = [NSURL fileURLWithPath:filePath];
    
    self.moviePlayerController = [[MPMoviePlayerController alloc]initWithContentURL:videoURL];
    self.moviePlayerController.controlStyle = MPMovieControlStyleDefault;
    self.moviePlayerController.shouldAutoplay = YES;
    
    //    [super viewDidAppear:animated];
    
    [self.view addSubview:self.moviePlayerController.view];
    
    [self.moviePlayerController setFullscreen:YES animated:YES];
    
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


@end
