//
//  MainViewController.m
//  rs.ios.stage-task8
//
//  Created by dev on 16.07.21.
//

#import "MKMainViewController.h"
#import "UIButton+Highlighted.h"
#import "MKDrawingView.h"
#import "MKColorViewController.h"
#import "rs_ios_stage_task8-Swift.h"


@interface MKMainViewController ()

@property (strong, nonatomic) MKDrawingsSwiftController *drawings;
@property (strong, nonatomic) MKColorViewController *colorController;
@property (strong, nonatomic) MKTimerSwiftController *timerController;
@property (strong, nonatomic) MKDrawingView *myDrawing;
@property NSRunLoop *runLoop;
@property NSRunLoopMode runLoopMode;

@property (strong, nonatomic) UIButton *paletteButton;
@property (strong, nonatomic) UIButton *timerButton;
@property (strong, nonatomic) UIButton *shareButton;

@property (assign, nonatomic) BOOL isfirstAppeareance;

@end

@implementation MKMainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setTintColor:[UIColor colorNamed:@"Light Green Sea"]];
    self.drawings = [[MKDrawingsSwiftController alloc] init];
    self.colorController = [[MKColorViewController alloc] init];
    self.timerController = [[MKTimerSwiftController alloc] init];
    self.isfirstAppeareance = YES;
    [self setup];
}

-(void)setup {
    [self configureNavigationBar];
    [self configureButtons];
    self.myDrawing = [[MKDrawingView alloc] initWithFrame:CGRectMake(38, 104, 300, 300)];
    self.colorController.myDrawingView = self.myDrawing;
    self.timerController.myDrawingView = self.myDrawing;
    self.drawings.myDrawingView = self.myDrawing;
    self.drawings.delegate = self;
    self.myDrawing.delegate = self;
    [self.view addSubview:self.myDrawing];
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
    self.paletteButton = [[UIButton alloc] initWithFrame:CGRectMake(20, 452, 163, 32)];
    self.drawButton = [[UIButton alloc] initWithFrame:CGRectMake(243, 452, 91, 32)];
    self.timerButton = [[UIButton alloc] initWithFrame:CGRectMake(20, 504, 151, 32)];
    self.shareButton = [[UIButton alloc] initWithFrame:CGRectMake(239, 504, 95, 32)];
    
    [self.paletteButton setDefault];
    [self.drawButton setDefault];
    [self.timerButton setDefault];
    [self.shareButton setDisabled];
    
    [self.paletteButton.layer setCornerRadius:10];
    [self.drawButton.layer setCornerRadius:10];
    [self.timerButton.layer setCornerRadius:10];
    [self.shareButton.layer setCornerRadius:10];
    
    [self.paletteButton setTitle:@"Open Palette" forState:UIControlStateNormal];
    [self.drawButton setTitle:@"Draw" forState:UIControlStateNormal];
    [self.timerButton setTitle:@"Timer" forState:UIControlStateNormal];
    [self.shareButton setTitle:@"Share" forState:UIControlStateNormal];
    
    [self.paletteButton.titleLabel setFont:[UIFont fontWithName:@"Montserrat-Medium" size:18.0f]];
    [self.drawButton.titleLabel setFont:[UIFont fontWithName:@"Montserrat-Medium" size:18.0f]];
    [self.timerButton.titleLabel setFont:[UIFont fontWithName:@"Montserrat-Medium" size:18.0f]];
    [self.shareButton.titleLabel setFont:[UIFont fontWithName:@"Montserrat-Medium" size:18.0f]];
    
    [self.paletteButton setTitleColor:[UIColor colorNamed:@"Light Green Sea"] forState:UIControlStateNormal];
    [self.drawButton setTitleColor:[UIColor colorNamed:@"Light Green Sea"] forState:UIControlStateNormal];
    [self.timerButton setTitleColor:[UIColor colorNamed:@"Light Green Sea"] forState:UIControlStateNormal];
    [self.shareButton setTitleColor:[UIColor colorNamed:@"Light Green Sea"] forState:UIControlStateNormal];
    
    [self.paletteButton addTarget:self action:@selector(openPalette:) forControlEvents:UIControlEventTouchUpInside];
    [self.drawButton addTarget:self action:@selector(drawPainting:) forControlEvents:UIControlEventTouchUpInside];
    [self.timerButton addTarget:self action:@selector(openTimer:) forControlEvents:UIControlEventTouchUpInside];
    [self.shareButton addTarget:self action:@selector(sharePainting:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.paletteButton addTarget:self action:@selector(touchDown:) forControlEvents:UIControlEventTouchDown];
    [self.drawButton addTarget:self action:@selector(touchDown:) forControlEvents:UIControlEventTouchDown];
    [self.timerButton addTarget:self action:@selector(touchDown:) forControlEvents:UIControlEventTouchDown];
    [self.shareButton addTarget:self action:@selector(touchDown:) forControlEvents:UIControlEventTouchDown];
    
    [self.view addSubview:self.paletteButton];
    [self.view addSubview:self.drawButton];
    [self.view addSubview:self.timerButton];
    [self.view addSubview:self.shareButton];
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
    if ([self.myDrawing.currentDrawing isEqual:@0] || self.myDrawing.currentDrawing == nil) {
        if (self.isfirstAppeareance) {
            self.myDrawing.currentDrawing = @2;
        } else {
            self.myDrawing.currentDrawing = self.myDrawing.previousDrawing;
        }
    }
    [sender setDefault];
    [self.myDrawing setNeedsDisplay];
    self.myDrawing.previousDrawing = self.myDrawing.currentDrawing;
    self.isfirstAppeareance = false;
}

-(void)changeToResetButton:(BOOL)check {
    if (check) {
        [self.drawButton setTitle:@"Reset" forState:UIControlStateNormal];
        [self.drawButton addTarget:self action:@selector(resetDrawing) forControlEvents:UIControlEventTouchUpInside];
    } else {
        [self.drawButton setTitle:@"Draw" forState:UIControlStateNormal];
        [self.drawButton removeTarget:self action:@selector(resetDrawing) forControlEvents:UIControlEventTouchUpInside];
        [self.drawButton addTarget:self action:@selector(drawPainting:) forControlEvents:UIControlEventTouchUpInside];
    }
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
    CGRect rect = [self.myDrawing bounds];
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    [self.myDrawing.layer renderInContext:context];
    UIImage *img = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    NSArray *activityItems = @[img];
    UIActivityViewController *activityViewControntroller = [[UIActivityViewController alloc] initWithActivityItems:activityItems applicationActivities:nil];
    [self presentViewController:activityViewControntroller animated:YES completion:nil];
}

-(void)paintingIsDrawing:(BOOL)check {
    float timeIntervalForProgress = 1.0/60.0;
    self.timer = [NSTimer scheduledTimerWithTimeInterval:timeIntervalForProgress
                                                                 target:self.myDrawing
                                                               selector:@selector(changeStrokeEnd)
                                                               userInfo:nil
                                                                repeats:true];
    if (check) {
        [self.paletteButton setDisabled];
        [self changeToResetButton:YES];
        [self.timerButton setDisabled];
        [self.shareButton setDefault];
        [self.navigationController.navigationBar setUserInteractionEnabled:NO];
        self.navigationController.navigationBar.alpha = 0.5;
    } else {
        [self.timer invalidate];
        self.timer = nil;
        [self.paletteButton setDefault];
        [self changeToResetButton:NO];
        [self.timerButton setDefault];
        [self.navigationController.navigationBar setUserInteractionEnabled:YES];
        self.navigationController.navigationBar.alpha = 1;
    }
}

-(void)resetDrawing {
    self.myDrawing.currentDrawing = @0;
    [self.drawings setAllButtonsDefault];
    [self paintingIsDrawing:NO];
    [self.shareButton setDisabled];
}

@end
