//
//  ViewController.h
//  Quizzards Of Kids
//
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>
#import <MediaPlayer/MediaPlayer.h>

#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]


@interface ViewController : UIViewController

@property (strong, nonatomic) IBOutlet UIView *gradientView;
@property (strong, nonatomic) IBOutlet UIView *movieView;
@property (nonatomic, strong) AVAudioPlayer *audioPlayer;
@property (nonatomic, strong) AVPlayer *avplayer;
@property (nonatomic, strong) MPMoviePlayerController *moviePlayerController;

- (IBAction)startClick:(id)sender;


@end

