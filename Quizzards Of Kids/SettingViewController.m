//
//  SettingViewController.m
//  Quizzards Of Kids
//


#import "SettingViewController.h"
#import "AppDelegate.h"

@interface SettingViewController ()
{
    int musicNumber;
    float myRedValue;
    float myGreenValue;
    float myBlueValue;
    float myAlphaValue;
    AppDelegate* appGlobal;
}
@end

@implementation SettingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _musics = @[@"backgroundA", @"backgroundB",@"backgroundC"];
    
    musicNumber = 0;
    myRedValue = 0;
    myGreenValue = 0;
    myBlueValue = 0;
    myAlphaValue = 1.0;
    
    appGlobal = (AppDelegate*)[[UIApplication sharedApplication] delegate];
    _myMusicLabel.text = _musics[musicNumber];
    
    super.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:255
                                                                            green:255
                                                                             blue:255
                                                                            alpha:1];
    super.tabBarController.tabBar.barTintColor = [UIColor colorWithRed:255
                                                                 green:255
                                                                  blue:255
                                                                 alpha:1];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)backgroundMusicSwitch:(id)sender {
    [appGlobal playTapSound];
    if(_myMusicSwitch.on == YES)
    {
        [_myMusicSwitch setOn:NO animated:YES];
        [appGlobal saveMusicSwitch:NO];
        [appGlobal.musicPlayer stop];
    }else{
        [_myMusicSwitch setOn:YES animated:YES];
        [appGlobal.musicPlayer prepareToPlay];
        [appGlobal saveMusicSwitch:YES];
        [appGlobal.musicPlayer play];
    }
}

- (IBAction)segmentChanged:(id)sender {
    [_myBackgroundSwitch setOn:YES animated:YES];
    [appGlobal playTapSound];
    
    _myBackgroundImage.alpha = 0;
    int index;
    index = (int)self.mySegmentControl.selectedSegmentIndex;
    
    switch (index)
    {
        case 0:
            myRedValue=1.0;
            myGreenValue=0.0;
            myBlueValue=0.0;
            break;
        case 1:
            myRedValue=0.0;
            myGreenValue=1.0;
            myBlueValue=0.0;
            break;
        case 2:
            myRedValue=0.0;
            myGreenValue=0.0;
            myBlueValue=1.0;
            break;
        case 3:
            myRedValue=0.0;
            myGreenValue=0.0;
            myBlueValue=0.0;
            break;
            // Ex. add white color as well
    }
    [self changeBackgroundColour];
    [appGlobal saveRedColour:myRedValue];
    [appGlobal saveGreenColour:myGreenValue];
    [appGlobal saveBlueColour:myBlueValue];
    [appGlobal saveBackgroundColourSwitch:_myBackgroundSwitch.on];
}

- (IBAction)sliderMoveRed:(id)sender {
    [_myBackgroundSwitch setOn:YES animated:YES];
    _myBackgroundImage.alpha = 0;
    UISlider* slider = sender;
    myRedValue = slider.value;
    [appGlobal saveRedColour:myRedValue];
    [appGlobal saveBackgroundColourSwitch:_myBackgroundSwitch.on];
    [self changeBackgroundColour];
}

- (IBAction)sliderMoveGreen:(id)sender {
    [_myBackgroundSwitch setOn:YES animated:YES];
    _myBackgroundImage.alpha = 0;
    UISlider* slider = sender;
    myGreenValue = slider.value;
    [appGlobal saveGreenColour:myGreenValue];
    [appGlobal saveBackgroundColourSwitch:_myBackgroundSwitch.on];
    [self changeBackgroundColour];
}

- (IBAction)sliderMoveBlue:(id)sender {
    [_myBackgroundSwitch setOn:YES animated:YES];
    _myBackgroundImage.alpha = 0;
    UISlider* slider = sender;
    myBlueValue = slider.value;
    [appGlobal saveBlueColour:myBlueValue];
    [appGlobal saveBackgroundColourSwitch:_myBackgroundSwitch.on];
    [self changeBackgroundColour];
}

- (IBAction)backgroundSwitch:(id)sender {
    [appGlobal playTapSound];
    if(_myBackgroundSwitch.on == YES)
    {
        [_myBackgroundSwitch setOn:NO animated:YES];
        [_mySegmentControl setSelectedSegmentIndex:UISegmentedControlNoSegment];
        _myBackgroundImage.alpha = 1;
    }else{
        [_myBackgroundSwitch setOn:YES animated:YES];
        _myBackgroundImage.alpha = 0;
        
        self.navigationController.navigationBar.alpha = 1;
        self.tabBarController.tabBar.alpha = 1;
        [self changeBackgroundColour];
    }
    [appGlobal saveBackgroundColourSwitch:_myBackgroundSwitch.on];
}

- (IBAction)soundsEffectSwitch:(id)sender {
    if(_mySoundSwitch.on == NO)
    {
        [_mySoundSwitch setOn:NO animated:YES];
        [appGlobal saveSoundEffectSwitch:NO];
    }else{
        [_mySoundSwitch setOn:YES animated:YES];
        [appGlobal saveSoundEffectSwitch:YES];
        [appGlobal playTapSound];
    }
}

- (IBAction)nextMusicClick:(id)sender {
    [_myMusicSwitch setOn:YES animated:YES];
    [appGlobal playTapSound];
    if(musicNumber < 2){
        musicNumber++;
    }else{
        musicNumber = 0;
    }
    _myMusicLabel.text = _musics[musicNumber];
    [appGlobal saveMusicTitle:_musics[musicNumber]];
    [appGlobal playMusic];
}

- (IBAction)previousMusicClick:(id)sender {
    [_myMusicSwitch setOn:YES animated:YES];
    [appGlobal playTapSound];
    if(musicNumber > 0){
        musicNumber--;
    }else{
        musicNumber = 2;
    }
    _myMusicLabel.text = _musics[musicNumber];
    [appGlobal saveMusicTitle:_musics[musicNumber]];
    [appGlobal playMusic];
}

- (IBAction)updateVolume:(id)sender {
    appGlobal.musicPlayer.volume = self.myVolumeSlider.value;
}

- (void)changeBackgroundColour{
    super.view.backgroundColor = [UIColor colorWithRed:myRedValue
                                                 green:myGreenValue
                                                  blue:myBlueValue
                                                 alpha:myAlphaValue];
    _myRedSlider.value = myRedValue;
    _myGreenSlider.value = myGreenValue;
    _myBlueSlider.value = myBlueValue;

    if(myRedValue == 0 && myGreenValue == 0 && myBlueValue == 0)
        self.mySegmentControl.selectedSegmentIndex = 3;
}
@end
