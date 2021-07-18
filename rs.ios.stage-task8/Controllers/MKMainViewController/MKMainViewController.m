//
//  MainViewController.m
//  rs.ios.stage-task8
//
//  Created by dev on 16.07.21.
//

#import "MKMainViewController.h"
#import "MKTableViewController.h"
#import "MKColorViewController.h"
#import "UIButton+Highlighted.h"
#import "MKDrawingView.h"
#import "MKTimerViewController.h"

@interface MKMainViewController ()

@property (strong, nonatomic) MKTableViewController *drawings;
@property (strong, nonatomic) MKColorViewController *colorController;
@property (strong, nonatomic) MKTimerViewController *timerController;

@property (assign, nonatomic) BOOL isfirstAppeareanceExecutionDone;

@end

@implementation MKMainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setTintColor:[UIColor colorNamed:@"Light Green Sea"]];
    self.drawings = [[MKTableViewController alloc] init];
    self.colorController = [[MKColorViewController alloc] init];
    [self setup];
}

-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
}

-(void)setup {
    [self configureNavigationBar];
    [self configureButtons];
    
#pragma mark - Drawing View setup
    
    MKDrawingView *drawingView = [[MKDrawingView alloc] initWithFrame:CGRectMake(38, 104, 300, 300)];
    self.drawings.myDrawingView = drawingView;
    self.colorController.myDrawingView = drawingView;
    [self.view addSubview:drawingView];
    
}

-(void)configureNavigationBar {
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

-(void)configureButtons {
    UIButton *paletteButton = [[UIButton alloc] initWithFrame:CGRectMake(20, 452, 163, 32)];
    UIButton *drawButton = [[UIButton alloc] initWithFrame:CGRectMake(243, 452, 91, 32)];
    UIButton *timerButton = [[UIButton alloc] initWithFrame:CGRectMake(20, 504, 151, 32)];
    UIButton *shareButton = [[UIButton alloc] initWithFrame:CGRectMake(239, 504, 95, 32)];
    
    [paletteButton setDefault];
    [drawButton setDefault];
    [timerButton setDefault];
    [shareButton setDefault];
    
    [paletteButton.layer setCornerRadius:10];
    [drawButton.layer setCornerRadius:10];
    [timerButton.layer setCornerRadius:10];
    [shareButton.layer setCornerRadius:10];
    
    [paletteButton setTitle:@"Open Palette" forState:UIControlStateNormal];
    [drawButton setTitle:@"Draw" forState:UIControlStateNormal];
    [timerButton setTitle:@"Timer" forState:UIControlStateNormal];
    [shareButton setTitle:@"Share" forState:UIControlStateNormal];
    
    [paletteButton.titleLabel setFont:[UIFont fontWithName:@"Montserrat-Medium" size:18.0f]];
    [drawButton.titleLabel setFont:[UIFont fontWithName:@"Montserrat-Medium" size:18.0f]];
    [timerButton.titleLabel setFont:[UIFont fontWithName:@"Montserrat-Medium" size:18.0f]];
    [shareButton.titleLabel setFont:[UIFont fontWithName:@"Montserrat-Medium" size:18.0f]];
    
    [paletteButton setTitleColor:[UIColor colorNamed:@"Light Green Sea"] forState:UIControlStateNormal];
    [drawButton setTitleColor:[UIColor colorNamed:@"Light Green Sea"] forState:UIControlStateNormal];
    [timerButton setTitleColor:[UIColor colorNamed:@"Light Green Sea"] forState:UIControlStateNormal];
    [shareButton setTitleColor:[UIColor colorNamed:@"Light Green Sea"] forState:UIControlStateNormal];
    
    [paletteButton addTarget:self action:@selector(openPalette:) forControlEvents:UIControlEventTouchUpInside];
    [drawButton addTarget:self action:@selector(drawPainting:) forControlEvents:UIControlEventTouchUpInside];
    [timerButton addTarget:self action:@selector(openTimer:) forControlEvents:UIControlEventTouchUpInside];
    [shareButton addTarget:self action:@selector(sharePainting:) forControlEvents:UIControlEventTouchUpInside];
    
    [paletteButton addTarget:self action:@selector(touchDown:) forControlEvents:UIControlEventTouchDown];
    [drawButton addTarget:self action:@selector(touchDown:) forControlEvents:UIControlEventTouchDown];
    [timerButton addTarget:self action:@selector(touchDown:) forControlEvents:UIControlEventTouchDown];
    [shareButton addTarget:self action:@selector(touchDown:) forControlEvents:UIControlEventTouchDown];
    
    [self.view addSubview:paletteButton];
    [self.view addSubview:drawButton];
    [self.view addSubview:timerButton];
    [self.view addSubview:shareButton];
}

-(void)addContentController:(UIViewController *)content {
    [self addChildViewController:content];
    [self.view addSubview:content.view];
    content.view.frame = self.colorController.view.frame;
    [content didMoveToParentViewController:self];
}

-(void)accessDrawings:(id)sender {
    [self.navigationController pushViewController:self.drawings animated:YES];
}

-(void)openPalette:(UIButton *)sender {
    [self addContentController:self.colorController];
    [sender setDefault];
}

-(void)drawPainting:(UIButton *)sender {
    [sender setDefault];
    [self.drawings.myDrawingView setNeedsDisplay];
}

-(void)openTimer:(UIButton *)sender {
    [self addContentController:self.timerController];
    [sender setDefault];
}

-(void)sharePainting:(UIButton *)sender {
    [sender setDefault];
    [self share:sender];
}

-(void)touchDown:(UIButton *)sender {
    [sender setHighlighted];
}

-(void)share:(UIButton *)sender {
    CGRect rect = [self.drawings.myDrawingView bounds];
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    [self.drawings.myDrawingView.layer renderInContext:context];
    UIImage *img = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    NSArray *activityItems = @[img];
    UIActivityViewController *activityViewControntroller = [[UIActivityViewController alloc] initWithActivityItems:activityItems applicationActivities:nil];
    activityViewControntroller.excludedActivityTypes = @[];
    activityViewControntroller.popoverPresentationController.sourceView = self.view;
    activityViewControntroller.popoverPresentationController.sourceRect = CGRectMake(self.view.bounds.size.width/2, self.view.bounds.size.height/4, 0, 0);
    [self presentViewController:activityViewControntroller animated:YES completion:nil];
}

@end
