//
//  DetailViewController.h
//  Quizzards Of Kids
//


#import <UIKit/UIKit.h>

#import <MediaPlayer/MediaPlayer.h>

@interface DetailViewController : UIViewController

@property (strong, nonatomic) IBOutlet UIImageView *myBackgroundImage;

@property (strong, nonatomic) IBOutlet UILabel *TitleLabel;

@property (strong, nonatomic) IBOutlet UILabel *DescriptionLabel;

@property (strong, nonatomic) IBOutlet UIImageView *ImageView;

@property (strong, nonatomic) NSArray *DetailModal;

@property (nonatomic, strong) MPMoviePlayerController *moviePlayerController;


@end
