//
//  AppDelegate.h
//  Quizzards Of Kids
//
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (nonatomic, strong) AVAudioPlayer *musicPlayer;
@property (nonatomic, strong) AVAudioPlayer *soundEffectPlayer;

@property (nonatomic, retain) NSString *music;
@property (nonatomic, retain) NSString *soundEffect;

-(void)saveScore:(int)quizScore;
-(void)saveRedColour:(float)redColour;
-(void)saveGreenColour:(float)greenColour;
-(void)saveBlueColour:(float)blueColour;
-(void)saveBackgroundColourSwitch:(bool)musicSwitch;
-(void)saveSoundEffectSwitch:(bool)soundEffectSwitch;
-(void)saveMusicTitle:(NSString *) musicTitle;
-(void)saveMusicSwitch:(bool)musicSwitch;

-(int)getScore;
-(float)getRedColour;
-(float)getGreenColour;
-(float)getBlueColour;
-(bool)getBackgroundColourSwitch;
-(bool)getSoundEffectSwitch;
-(bool)getMusicSwitch;
-(NSString *)getMusicTitle;

-(void)stopMusic;
-(void)continueMusic;
-(void)playMusic;
-(void)playTapSound;
-(void)playCorrectSound;
-(void)playWrongSound;

@end

