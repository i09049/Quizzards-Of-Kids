//
//  ToolController.h
//  YAU
//


#import <UIKit/UIKit.h>

@interface ToolController : UIViewController

@property (weak, nonatomic) IBOutlet UIImageView *MyImage;
@property (weak, nonatomic) IBOutlet UITextField *myTextfieldUrl;
@property (weak, nonatomic) IBOutlet UIImageView *myBackgroundImage;
- (IBAction)btnBrowserClick:(id)sender;
@property (strong, nonatomic) IBOutlet UISegmentedControl *mySegment;
- (IBAction)segmentChange:(id)sender;
- (IBAction)calculatorClick:(id)sender;

@end

