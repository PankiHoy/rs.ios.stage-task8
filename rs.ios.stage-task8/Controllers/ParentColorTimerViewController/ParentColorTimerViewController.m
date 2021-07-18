//
//  ParentColorTimerViewController.m
//  rs.ios.stage-task8
//
//  Created by dev on 18.07.21.
//

#import "ParentColorTimerViewController.h"
#import "UIButton+Highlighted.h"

@interface ParentColorTimerViewController ()

@end

@implementation ParentColorTimerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupBottomAppendingViewControllerWithSaveButton];
}

-(void)setupBottomAppendingViewControllerWithSaveButton {
    [self.view setFrame:CGRectMake(0, 333, 375, 370)];
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view.layer setShadowColor:[UIColor colorWithRed:0 green:0 blue:0 alpha:0.25].CGColor];
    [self.view.layer setShadowOffset:CGSizeMake(0, 0)];
    [self.view.layer setShadowOpacity:1.0f];
    [self.view.layer setShadowRadius:4.0f];
    self.view.layer.cornerRadius = 35;
    
    UIView *buttonView = [[UIView alloc] initWithFrame:CGRectMake(250, 20, 85, 32)];
    UIButton *saveButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 85, 32)];
    [saveButton setTitle:@"Save" forState:UIControlStateNormal];
    [saveButton setTitleColor:[UIColor colorNamed:@"Light Green Sea"] forState:UIControlStateNormal];
    [saveButton.titleLabel setFont:[UIFont fontWithName:@"Montserrat-Medium" size:18.0f]];
    
    [saveButton.layer setCornerRadius:10.0f];
    [saveButton setDefault];
    [buttonView addSubview:saveButton];
    
    [saveButton addTarget:self action:@selector(saveColor:) forControlEvents:UIControlEventTouchUpInside];
    [saveButton addTarget:self action:@selector(touchDownSave:) forControlEvents:UIControlEventTouchDown];
    [self.view addSubview:buttonView];
}

-(void)saveColor:(UIButton *)sender {
    [self.view removeFromSuperview];
    [self removeFromParentViewController];
    [sender setDefault];
    NSLog(@"Save Color");
}

-(void)touchDownSave:(UIButton *)sender {
    [sender setHighlighted];
}

@end
