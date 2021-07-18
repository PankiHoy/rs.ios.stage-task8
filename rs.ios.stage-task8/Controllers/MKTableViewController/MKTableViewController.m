//
//  MKTableVIewController.m
//  rs.ios.stage-task8
//
//  Created by dev on 16.07.21.
//

#import "MKTableViewController.h"
#import "UIButton+Highlighted.h"
#import "MKDrawingView.h"

@interface MKTableViewController ()

@property (strong, nonatomic) NSDictionary <NSString *, NSNumber *> *helpDict;

@property (strong, nonatomic) UIButton *planetDrawing;
@property (strong, nonatomic) UIButton *headDrawing;
@property (strong, nonatomic) UIButton *treeDrawing;
@property (strong, nonatomic) UIButton *landscapeDrawing;

@end

@implementation MKTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.helpDict = @{@"Planet": @1, @"Head": @2, @"Tree": @3, @"Landscape": @4};
    [self setup];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
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
    
    self.planetDrawing = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 200, 40)];
    self.headDrawing = [[UIButton alloc] initWithFrame:CGRectMake(0, 55, 200, 40)];
    self.treeDrawing = [[UIButton alloc] initWithFrame:CGRectMake(0, 110, 200, 40)];
    self.landscapeDrawing = [[UIButton alloc] initWithFrame:CGRectMake(0, 165, 200, 40)];
    
    self.planetDrawing.layer.cornerRadius = 10.0f;
    self.headDrawing.layer.cornerRadius = 10.0f;
    self.treeDrawing.layer.cornerRadius = 10.0f;
    self.landscapeDrawing.layer.cornerRadius = 10.0f;
    
    [self.planetDrawing setDefault];
    [self.headDrawing setDefault];
    [self.treeDrawing setDefault];
    [self.landscapeDrawing setDefault];
    
    [self.planetDrawing setTitle:@"Planet" forState:UIControlStateNormal];
    [self.headDrawing setTitle:@"Head" forState:UIControlStateNormal];
    [self.treeDrawing setTitle:@"Tree" forState:UIControlStateNormal];
    [self.landscapeDrawing setTitle:@"Landscape" forState:UIControlStateNormal];
    
    self.planetDrawing.titleLabel.textAlignment = NSTextAlignmentCenter;
    self.headDrawing.titleLabel.textAlignment = NSTextAlignmentCenter;
    self.treeDrawing.titleLabel.textAlignment = NSTextAlignmentCenter;
    self.landscapeDrawing.titleLabel.textAlignment = NSTextAlignmentCenter;
    
    self.planetDrawing.titleLabel.font = [UIFont fontWithName:@"Montserrat-Regular" size:18.0f];
    self.headDrawing.titleLabel.font = [UIFont fontWithName:@"Montserrat-Regular" size:18.0f];
    self.treeDrawing.titleLabel.font = [UIFont fontWithName:@"Montserrat-Regular" size:18.0f];
    self.landscapeDrawing.titleLabel.font = [UIFont fontWithName:@"Montserrat-Regular" size:18.0f];
    
    [self.planetDrawing setTitleColor:[UIColor colorNamed:@"Light Green Sea"] forState:UIControlStateNormal];
    [self.headDrawing setTitleColor:[UIColor colorNamed:@"Light Green Sea"] forState:UIControlStateNormal];
    [self.treeDrawing setTitleColor:[UIColor colorNamed:@"Light Green Sea"] forState:UIControlStateNormal];
    [self.landscapeDrawing setTitleColor:[UIColor colorNamed:@"Light Green Sea"] forState:UIControlStateNormal];
    
    [self.planetDrawing addTarget:self action:@selector(buttonTouchedUp:) forControlEvents:UIControlEventTouchUpInside];
    [self.headDrawing addTarget:self action:@selector(buttonTouchedUp:) forControlEvents:UIControlEventTouchUpInside];
    [self.treeDrawing addTarget:self action:@selector(buttonTouchedUp:) forControlEvents:UIControlEventTouchUpInside];
    [self.landscapeDrawing addTarget:self action:@selector(buttonTouchedUp:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.planetDrawing addTarget:self action:@selector(buttonTouchedDown:) forControlEvents:UIControlEventTouchDown];
    [self.headDrawing addTarget:self action:@selector(buttonTouchedDown:) forControlEvents:UIControlEventTouchDown];
    [self.treeDrawing addTarget:self action:@selector(buttonTouchedDown:) forControlEvents:UIControlEventTouchDown];
    [self.landscapeDrawing addTarget:self action:@selector(buttonTouchedDown:) forControlEvents:UIControlEventTouchDown];
    
    [self.view.subviews[0] addSubview:self.planetDrawing];
    [self.view.subviews[0] addSubview:self.headDrawing];
    [self.view.subviews[0] addSubview:self.treeDrawing];
    [self.view.subviews[0] addSubview:self.landscapeDrawing];
    
}

-(void)back:(id)sender {
    [self.navigationController popToRootViewControllerAnimated:YES];
}

-(void)buttonTouchedUp:(UIButton *)sender {
    for (NSString *key in self.helpDict) {
        if ([key isEqual:sender.titleLabel.text]) {
            self.myDrawingView.currentDrawing = self.helpDict[key];
        }
    }
    [self back:sender];
}

-(NSString *)findKeyOfObject:(NSNumber *)object {
    for (NSString *key in self.helpDict) {
        if (self.helpDict[key] == object) {
            return key;
        }
    }
    return nil;
}

-(void)buttonTouchedDown:(UIButton *)sender {
    NSArray *arrayWithButtons = [NSArray arrayWithObjects:self.planetDrawing, self.headDrawing, self.treeDrawing, self.landscapeDrawing, nil];
    for (UIButton *button in arrayWithButtons) {
        if (button == sender) {
            [button setHighlighted];
        } else {
            [button setDefault];
        }
    }
}

@end
