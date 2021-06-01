//
//  AppDelegate.m
//  Quizzards Of Kids
//
//

#import "AppDelegate.h"

#define DEFAULT_MUSIC_TITLE @"backgroundA"
#define DEFAULT_SOUND_SWITCH YES;
#define DEFAULT_MUSIC_SWITCH YES;
#define TAP_SOUND @"tap"
#define CORRECT_SOUND @"correct"
#define WRONG_SOUND @"wrong"


@interface AppDelegate ()
{
    int score;
    float red;
    float green;
    float blue;
    bool myColourSwitch;
    bool mySoundEffectSwitch;
    bool myMusicSwitch;
    bool stopMusic;
}
@end

@implementation AppDelegate

-(void)saveScore:(int)quizScore{
    score = quizScore;
}

-(void)saveBackgroundColourSwitch:(bool)colourSwitch{
    myColourSwitch = colourSwitch;
}

-(void)saveMusicTitle:(NSString *)musicTitle
{
    _music = [NSString stringWithFormat:@"%@",musicTitle];
}

-(void)saveMusicSwitch:(bool)musicSwitch
{
    myMusicSwitch = musicSwitch;
}

-(void)saveRedColour:(float)redColour{
    red = redColour;
}

-(void)saveGreenColour:(float)greenColour{
    green = greenColour;
}

-(void)saveBlueColour:(float)blueColour{
    blue = blueColour;
}

-(void)saveSoundEffectSwitch:(bool)soundEffectSwitch{
    mySoundEffectSwitch = soundEffectSwitch;
}

-(void)saveSoundEffectTitle:(NSString *) SoundEffectTitle
{
    _soundEffect = [NSString stringWithFormat:@"%@",SoundEffectTitle];
}

-(NSString *)getMusicTitle{
    return [NSString stringWithFormat:@"%@",_music];
}

-(NSString *)getSoundEffectTitle{
    return [NSString stringWithFormat:@"%@",_soundEffect];
}

-(int)getScore{
    return score;
}

-(float)getRedColour{
    return red;
}

-(float)getGreenColour{
    return green;
}

-(float)getBlueColour{
    return blue;
}

-(bool)getBackgroundColourSwitch{
    return myColourSwitch;
}

-(bool)getSoundEffectSwitch{
    return mySoundEffectSwitch;
}

-(bool)getMusicSwitch{
    return myMusicSwitch;
}

-(void)playMusic
{
    if([self getMusicSwitch]){
        NSString *soundFilePath = [[NSBundle mainBundle] pathForResource:[self getMusicTitle] ofType:@"mp3"];
        NSURL *fileURL = [NSURL fileURLWithPath:soundFilePath];
        self.musicPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:fileURL error:NULL];
        self.musicPlayer.volume = 0.6;
        self.musicPlayer.numberOfLoops = -1;
        [self.musicPlayer prepareToPlay];
        [self.musicPlayer play];
    }
}

-(void)stopMusic{
    [self.musicPlayer stop];
    stopMusic = YES;
}

-(void)continueMusic{
    if(stopMusic){
        [self.musicPlayer prepareToPlay];
        [self.musicPlayer play];
        stopMusic = NO;
    }
}

-(void)playTapSound
{
    if([self getSoundEffectSwitch]){
        NSString *soundFilePath = [[NSBundle mainBundle] pathForResource:TAP_SOUND ofType:@"mp3"];
        NSURL *fileURL = [NSURL fileURLWithPath:soundFilePath];
        self.soundEffectPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:fileURL error:NULL];
        self.soundEffectPlayer.volume = 0.6;
        [self.soundEffectPlayer prepareToPlay];
        [self.soundEffectPlayer play];
    }
}

-(void)playCorrectSound
{
    if([self getSoundEffectSwitch]){
        NSString *soundFilePath = [[NSBundle mainBundle] pathForResource:CORRECT_SOUND ofType:@"mp3"];
        NSURL *fileURL = [NSURL fileURLWithPath:soundFilePath];
        self.soundEffectPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:fileURL error:NULL];
        self.soundEffectPlayer.volume = 0.6;
        [self.soundEffectPlayer prepareToPlay];
        [self.soundEffectPlayer play];
    }
}

-(void)playWrongSound
{
    if([self getSoundEffectSwitch]){
        NSString *soundFilePath = [[NSBundle mainBundle] pathForResource:WRONG_SOUND ofType:@"mp3"];
        NSURL *fileURL = [NSURL fileURLWithPath:soundFilePath];
        self.soundEffectPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:fileURL error:NULL];
        self.soundEffectPlayer.volume = 0.6;
        [self.soundEffectPlayer prepareToPlay];
        [self.soundEffectPlayer play];
    }
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    NSUserDefaults *defaults=[NSUserDefaults standardUserDefaults];
    _music = [defaults objectForKey:@"music"];
    if (_music == NULL)
    {
        _music = DEFAULT_MUSIC_TITLE;
    }
    
    mySoundEffectSwitch = [defaults objectForKey:@"mySoundEffectSwitch"];
    if (mySoundEffectSwitch == (int)NULL)
    {
        mySoundEffectSwitch = DEFAULT_SOUND_SWITCH;
    }
    
    myMusicSwitch = [defaults objectForKey:@"mySoundEffectSwitch"];
    if (myMusicSwitch == (int)NULL)
    {
        myMusicSwitch = DEFAULT_MUSIC_SWITCH;
    }

    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
