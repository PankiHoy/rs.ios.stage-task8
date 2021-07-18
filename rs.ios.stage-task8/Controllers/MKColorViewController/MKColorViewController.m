//
//  MKColorViewController.m
//  rs.ios.stage-task8
//
//  Created by dev on 16.07.21.
//

#import "MKColorViewController.h"
#import "ColorButton.h"
#import "UIButton+Highlighted.h"

@interface MKColorViewController ()

@end

@implementation MKColorViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupColorController];
}

-(void)setupColorController {
    ColorButton *red = [[ColorButton alloc] initWithFrame:CGRectMake(17, 92, 40, 40) andColor:[UIColor colorNamed:@"rsRed"]];
    ColorButton *blue = [[ColorButton alloc] initWithFrame:CGRectMake(77, 92, 40, 40) andColor:[UIColor colorNamed:@"rsBlue"]];
    ColorButton *green = [[ColorButton alloc] initWithFrame:CGRectMake(137, 92, 40, 40) andColor:[UIColor colorNamed:@"rsGreen"]];
    ColorButton *grey = [[ColorButton alloc] initWithFrame:CGRectMake(197, 92, 40, 40) andColor:[UIColor colorNamed:@"rsGray"]];
    ColorButton *purple = [[ColorButton alloc] initWithFrame:CGRectMake(257, 92, 40, 40) andColor:[UIColor colorNamed:@"rsPurple"]];
    ColorButton *orange = [[ColorButton alloc] initWithFrame:CGRectMake(317, 92, 40, 40) andColor:[UIColor colorNamed:@"rsOrange"]];
    ColorButton *yellow = [[ColorButton alloc] initWithFrame:CGRectMake(17, 152, 40, 40) andColor:[UIColor colorNamed:@"rsYellow"]];
    ColorButton *lightBlue = [[ColorButton alloc] initWithFrame:CGRectMake(77, 152, 40, 40) andColor:[UIColor colorNamed:@"rsLightBlue"]];
    ColorButton *pink = [[ColorButton alloc] initWithFrame:CGRectMake(137, 152, 40, 40) andColor:[UIColor colorNamed:@"rsPink"]];
    ColorButton *black = [[ColorButton alloc] initWithFrame:CGRectMake(197, 152, 40, 40) andColor:[UIColor colorNamed:@"sortOfRsBlack"]];
    ColorButton *darkGreen = [[ColorButton alloc] initWithFrame:CGRectMake(257, 152, 40, 40) andColor:[UIColor colorNamed:@"rsDarkGreen"]];
    ColorButton *brown = [[ColorButton alloc] initWithFrame:CGRectMake(317, 152, 40, 40) andColor:[UIColor colorNamed:@"rsBrown"]];
    
    red.delegate = self;
    blue.delegate = self;
    green.delegate = self;
    grey.delegate = self;
    purple.delegate = self;
    orange.delegate = self;
    yellow.delegate = self;
    lightBlue.delegate = self;
    pink.delegate = self;
    black.delegate = self;
    darkGreen.delegate = self;
    brown.delegate = self;
    
    [self.view addSubview:red];
    [self.view addSubview:blue];
    [self.view addSubview:green];
    [self.view addSubview:grey];
    [self.view addSubview:purple];
    [self.view addSubview:orange];
    [self.view addSubview:yellow];
    [self.view addSubview:lightBlue];
    [self.view addSubview:pink];
    [self.view addSubview:black];
    [self.view addSubview:darkGreen];
    [self.view addSubview:brown];
}

-(void)putColorInStack:(UIButton *)sender {
    if ([self.myDrawingView.colorPalette containsObject:sender]) {
        [sender setDefaultColorButton:sender.backgroundColor];
        [self.myDrawingView.colorPalette removeObject:sender];
        [self.view setBackgroundColor:[UIColor whiteColor]];
    } else {
        [sender setHighlightedColorButton];
        [self.myDrawingView.colorPalette addObject:sender];
        if (self.myDrawingView.colorPalette.count == 4) {
            [self.myDrawingView.colorPalette.firstObject setDefaultColorButton:self.myDrawingView.colorPalette.firstObject.backgroundColor];
            [self.myDrawingView.colorPalette removeObject:self.myDrawingView.colorPalette.firstObject];
        }
        [self.view setBackgroundColor:sender.backgroundColor];
    }
}


@end
