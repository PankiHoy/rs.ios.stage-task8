//
//  MKTableVIewController.m
//  rs.ios.stage-task8
//
//  Created by dev on 16.07.21.
//

#import "MKTableViewController.h"
#import "UIButton+Highlighted.h"

@interface MKTableViewController ()

@property (strong, nonatomic) NSDictionary *helpDict;

@end

@implementation MKTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.helpDict = @{@"Planet": @1, @"Head": @2, @"Tree": @3, @"Landscape": @4};
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self setup];
}

-(void)setup {
#pragma mark - Configuring navigation bar
    self.navigationItem.title = @"Drawings";
    [self.navigationController.navigationBar setTitleTextAttributes:@{
        NSFontAttributeName:[UIFont fontWithName:@"Montserrat-Regular" size:17.0f],
        NSForegroundColorAttributeName:[UIColor colorNamed:@"Black"]
    }];
    self.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Artist"
                                                                             style:UIBarButtonItemStylePlain
                                                                            target:self
                                                                            action:@selector(back:)];
    [self.navigationItem.backBarButtonItem setTitleTextAttributes:@{
            NSFontAttributeName:[UIFont fontWithName:@"Montserrat-Regular" size:17.0f],
            NSForegroundColorAttributeName:[UIColor colorNamed:@"Black"]
    } forState:UIControlStateNormal];
    
#pragma mark - Making a list of drawings
    UIView *list = [[UIView alloc] initWithFrame:CGRectMake(88, 112, 200, 205)];
    list.tintColor = [UIColor colorNamed:@"Light Green Sea"];
    [self.view addSubview:list];
    [self.view bringSubviewToFront:list];
    
    UIButton *planetDrawing = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 200, 40)];
    UIButton *headDrawing = [[UIButton alloc] initWithFrame:CGRectMake(0, 55, 200, 40)];
    UIButton *treeDrawing = [[UIButton alloc] initWithFrame:CGRectMake(0, 110, 200, 40)];
    UIButton *landScapeDrawing = [[UIButton alloc] initWithFrame:CGRectMake(0, 165, 200, 40)];
    
    planetDrawing.layer.cornerRadius = 10.0f;
    headDrawing.layer.cornerRadius = 10.0f;
    treeDrawing.layer.cornerRadius = 10.0f;
    landScapeDrawing.layer.cornerRadius = 10.0f;
    
    planetDrawing.layer.borderWidth = 0.1;
    headDrawing.layer.borderWidth = 0.1;
    treeDrawing.layer.borderWidth = 0.1;
    landScapeDrawing.layer.borderWidth = 0.1;
    
    [planetDrawing setTitle:@"Planet" forState:UIControlStateNormal];
    [headDrawing setTitle:@"Head" forState:UIControlStateNormal];
    [treeDrawing setTitle:@"Tree" forState:UIControlStateNormal];
    [landScapeDrawing setTitle:@"Landscape" forState:UIControlStateNormal];
    
    planetDrawing.titleLabel.textAlignment = NSTextAlignmentCenter;
    headDrawing.titleLabel.textAlignment = NSTextAlignmentCenter;
    treeDrawing.titleLabel.textAlignment = NSTextAlignmentCenter;
    landScapeDrawing.titleLabel.textAlignment = NSTextAlignmentCenter;
    
    planetDrawing.titleLabel.font = [UIFont fontWithName:@"Montserrat-Regular" size:18.0f];
    headDrawing.titleLabel.font = [UIFont fontWithName:@"Montserrat-Regular" size:18.0f];
    treeDrawing.titleLabel.font = [UIFont fontWithName:@"Montserrat-Regular" size:18.0f];
    landScapeDrawing.titleLabel.font = [UIFont fontWithName:@"Montserrat-Regular" size:18.0f];
    
    [planetDrawing setTitleColor:[UIColor colorNamed:@"Light Green Sea"] forState:UIControlStateNormal];
    [headDrawing setTitleColor:[UIColor colorNamed:@"Light Green Sea"] forState:UIControlStateNormal];
    [treeDrawing setTitleColor:[UIColor colorNamed:@"Light Green Sea"] forState:UIControlStateNormal];
    [landScapeDrawing setTitleColor:[UIColor colorNamed:@"Light Green Sea"] forState:UIControlStateNormal];
    
    [planetDrawing addTarget:self action:@selector(buttonTouchedUp:) forControlEvents:UIControlEventTouchUpInside];
    [headDrawing addTarget:self action:@selector(buttonTouchedUp:) forControlEvents:UIControlEventTouchUpInside];
    [treeDrawing addTarget:self action:@selector(buttonTouchedUp:) forControlEvents:UIControlEventTouchUpInside];
    [landScapeDrawing addTarget:self action:@selector(buttonTouchedUp:) forControlEvents:UIControlEventTouchUpInside];
    
    [planetDrawing addTarget:self action:@selector(buttonTouchedDown:) forControlEvents:UIControlEventTouchDown];
    [headDrawing addTarget:self action:@selector(buttonTouchedDown:) forControlEvents:UIControlEventTouchDown];
    [treeDrawing addTarget:self action:@selector(buttonTouchedDown:) forControlEvents:UIControlEventTouchDown];
    [landScapeDrawing addTarget:self action:@selector(buttonTouchedDown:) forControlEvents:UIControlEventTouchDown];
    
    [self.view.subviews[0] addSubview:planetDrawing];
    [self.view.subviews[0] addSubview:headDrawing];
    [self.view.subviews[0] addSubview:treeDrawing];
    [self.view.subviews[0] addSubview:landScapeDrawing];
    
}

-(void)back:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

-(void)buttonTouchedUp:(UIButton *)sender {
    for (NSString *key in self.helpDict) {
        if ([key isEqual:sender.titleLabel.text]) {
            self.currentDrawing = self.helpDict[key];
        }
    }
    [sender changeToHighlighted:NO];
}

-(void)buttonTouchedDown:(UIButton *)sender {
    [sender changeToHighlighted:YES];
}

@end
