//
//  SettingViewController.h
//  Quizzards Of Kids
//


#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>

@interface SettingViewController : UIViewController

@property (nonatomic, retain) NSArray *musics;

@property (strong, nonatomic) IBOutlet UISegmentedControl *mySegmentControl;
@property (strong, nonatomic) IBOutlet UISlider *myRedSlider;
@property (strong, nonatomic) IBOutlet UISlider *myGreenSlider;
@property (strong, nonatomic) IBOutlet UISlider *myBlueSlider;
@property (strong, nonatomic) IBOutlet UIImageView *myBackgroundImage;
@property (strong, nonatomic) IBOutlet UISwitch *myBackgroundSwitch;
@property (strong, nonatomic) IBOutlet UISwitch *myMusicSwitch;
@property (strong, nonatomic) IBOutlet UISwitch *mySoundSwitch;
@property (strong, nonatomic) IBOutlet UILabel *myMusicLabel;
@property (strong, nonatomic) IBOutlet UISlider *myVolumeSlider;

- (IBAction)soundsEffectSwitch:(id)sender;
- (IBAction)backgroundMusicSwitch:(id)sender;
- (IBAction)segmentChanged:(id)sender;
- (IBAction)sliderMoveRed:(id)sender;
- (IBAction)sliderMoveGreen:(id)sender;
- (IBAction)sliderMoveBlue:(id)sender;
- (IBAction)backgroundSwitch:(id)sender;
- (IBAction)nextMusicClick:(id)sender;
- (IBAction)previousMusicClick:(id)sender;
- (IBAction)updateVolume:(id)sender;

@end
