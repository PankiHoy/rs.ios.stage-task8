//
//  MainViewController.m
//  rs.ios.stage-task8
//
//  Created by dev on 16.07.21.
//

#import "MKMainViewController.h"
#import "MKTableViewController.h"

@interface MKMainViewController ()

@property (strong, nonatomic) MKTableViewController *drawings;

@end

@implementation MKMainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.drawings = [[MKTableViewController alloc] init];
}

-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self setup];
}

-(void)setup {
    self.navigationItem.title = @"Artist";
    [self.navigationController.navigationBar setTitleTextAttributes:@{
        NSFontAttributeName:[UIFont fontWithName:@"Montserrat-Regular" size:17.0f]
    }];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Drawings"
                                                                              style:UIBarButtonItemStylePlain
                                                                             target:self
                                                                             action:@selector(accessDrawings:)];
    [self.navigationItem.rightBarButtonItem setTitleTextAttributes:@{
                                        NSFontAttributeName:[UIFont fontWithName:@"Montserrat-Regular" size:17.0f] }
                                                          forState:UIControlStateNormal];
    [self.navigationItem.rightBarButtonItem setTitleTextAttributes:@{
                                        NSFontAttributeName:[UIFont fontWithName:@"Montserrat-Regular" size:17.0f] }
                                                          forState:UIControlStateHighlighted];
    self.navigationItem.rightBarButtonItem.tintColor = [UIColor colorNamed:@"Light Green Sea"];
    
}

-(void)accessDrawings:(id)sender {
    [self.navigationController pushViewController:self.drawings animated:YES];
}

@end
