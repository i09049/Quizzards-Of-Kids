//
//  ToolController.m
//  YAU
//


#import "ToolController.h"
#import "AppDelegate.h"
@interface ToolController ()
{
    NSString *myString;
    AppDelegate* appGlobal;
}

@end

@implementation ToolController

- (void)viewDidLoad {
    [super viewDidLoad];
    appGlobal = (AppDelegate*)[[UIApplication sharedApplication] delegate];
    _MyImage.clipsToBounds = true;
    _MyImage.layer.cornerRadius = 30;
}

- (void)viewDidAppear:(BOOL)animated
{
    [self changeBackgroundColour];
}

- (IBAction)btnBrowserClick:(id)sender {
    [appGlobal playTapSound];
    _myTextfieldUrl.text = [_myTextfieldUrl.text stringByTrimmingCharactersInSet:
                            [NSCharacterSet whitespaceCharacterSet]];
    if ([_myTextfieldUrl.text isEqual:@""]) _myTextfieldUrl.text = @"http://www.google.com/";
    NSURL *url = [self myGetUrl:_myTextfieldUrl.text];
    [[UIApplication sharedApplication] openURL:url options:@{} completionHandler:nil];
    
    UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(dismissKeyboard)];
    
    [self.view addGestureRecognizer:tap];
}

//- (IBAction)btnThreeClick:(id)sender {
//    NSString *myString = @"image3.png";
//    _MyImage.image = [UIImage imageNamed:myString];
//}
//
//- (IBAction)btnOneClick:(id)sender {
//    NSString *myString = @"image1.png";
//    _MyImage.image = [UIImage imageNamed:myString];
//}
//
//- (IBAction)btnTwoClick:(id)sender {
//    NSString *myString = @"image2.png";
//    _MyImage.image = [UIImage imageNamed:myString];
//}

-(NSURL*)myGetUrl:(NSString*)urlString
{
    NSURL *myURL;
    if ([urlString hasPrefix:@"http://"] || [urlString hasPrefix:@"https://"])
    {
        myURL = [NSURL URLWithString:urlString];
    } else
    {
        myURL = [NSURL URLWithString:[NSString stringWithFormat:@"http://%@",urlString]];
    }
    return myURL;
    //[[UIApplication sharedApplication] openURL:url]; // ios 9 or before
    
}
- (IBAction)segmentChange:(id)sender {
    [appGlobal playTapSound];
    int index;
    index = (int)self.mySegment.selectedSegmentIndex;
    switch (index)
    {
        case 0:
            myString = @"image1.png";
            _MyImage.image = [UIImage imageNamed:myString];
            break;
        case 1:
            myString = @"image2.png";
            _MyImage.image = [UIImage imageNamed:myString];
            break;
        case 2:
            myString = @"image3.png";
            _MyImage.image = [UIImage imageNamed:myString];
            break;
            // Ex. add white color as well
    }
}

- (IBAction)calculatorClick:(id)sender {
    [appGlobal playTapSound];
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

-(void)dismissKeyboard{
    [_myTextfieldUrl resignFirstResponder];
}
@end
