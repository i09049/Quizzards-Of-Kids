//
//  TableViewController.m
//  Quizzards Of Kids
//


#import "TableViewController.h"

#import "TableViewCell.h"

#import "DetailViewController.h"

#import "AppDelegate.h"

@interface TableViewController ()
{
    AppDelegate* appGlobal;
}
@end

@implementation TableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    appGlobal = (AppDelegate*)[[UIApplication sharedApplication] delegate];
    
    _Titles = @[@"MultiChoice question", @"Fill question", @"Yes No question",];
    _Descriptions = @[@"There are several advantages to multiple choice tests. If item writers are well trained and items are quality assured, it can be a very effective assessment technique.",
                      
                      @"These are questions that may contain a sentence or even a paragraph with a blank space. This space represents a word, number, symbol, or maybe a phrase that the designer has left out on purpose. The learner is required to fill in this blank. They are expected to know the exact word or phrase in order to get the answer correct. ",
                      
                      @"Yes or no questions are closed questions, meaning that a specific answer (yes or no) is expected and can be answered with a single word. If you are asking them in the body of an essay, they could be used to emphasize a point or to direct the thought path of the reader.",];
    _Images = @[@"MCQ.png", @"FIQ.jpeg", @"YNQ.jpeg",];
    _Movies = @[@"MCQvideo", @"FIQvideo", @"YNQvideo",];
  
    [self changeBackgroundColour];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidAppear:(BOOL)animated
{
    [self changeBackgroundColour];
}

#pragma mark - Table view data source


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _Titles.count;
}
 
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"TableViewCell";
    
    TableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    // Configure the cell...
    
    NSInteger row = [indexPath row];
    
    tableView.rowHeight = 220;
    
    cell.TitleLabel.text = _Titles[row];
    
    cell.ThumbImage.image = [UIImage imageNamed:_Images[row]];
    
    [cell setBackgroundColor:[UIColor clearColor]];
    
    return cell;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"ShowDetails"]) {
        
        [appGlobal playTapSound];
        
        DetailViewController *detailViewController = [segue destinationViewController];
        
        NSIndexPath *myIndexPath = [self.tableView indexPathForSelectedRow];
        
        NSInteger row = [myIndexPath row];
        
        detailViewController.DetailModal = @[_Titles[row], _Descriptions[row], _Images[row], _Movies[row]];
        
    }
}

- (void)changeBackgroundColour{
    if(appGlobal.getBackgroundColourSwitch)
    {
        super.view.backgroundColor = [UIColor colorWithRed:appGlobal.getRedColour
                                                     green:appGlobal.getGreenColour
                                                      blue:appGlobal.getBlueColour
                                                     alpha:1];
    }else{
        self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"background.png"]];
    }
}
@end
