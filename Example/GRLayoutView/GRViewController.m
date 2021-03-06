//
//  GRViewController.m
//  GRLayoutView
//
//  Created by AntiMoron on 02/24/2017.
//  Copyright (c) 2017 AntiMoron. All rights reserved.
//

#import "GRViewController.h"
#import <GRLayoutView/GRLayoutView.h>

@interface GRViewController ()
/**
 *  layoutView
 */
@property(nonatomic, strong) GRHorizontalLayoutView* layoutView;
/**
 *  userName
 */
@property(nonatomic, strong) UITextField* userName;
/**
 *  password
 */
@property(nonatomic, strong) UITextField* password;
/**
 *  test label
 */
@property(nonatomic, strong) UILabel* textLabel;
/**
 *  submit
 */
@property(nonatomic, strong) UIButton* submit;

@end

@implementation GRViewController

-(void)viewDidLoad {
    [super viewDidLoad];
    
    self.userName = [self createTextField];
    self.userName.placeholder = @"user name";
    self.password = [self createTextField];
    self.password.placeholder = @"password";
    self.password.secureTextEntry = YES;
    self.textLabel = [[UILabel alloc] init];
    self.textLabel.text = @"Test text!!!";
    self.submit = [UIButton buttonWithType:UIButtonTypeSystem];
    self.submit.backgroundColor = UIColor.orangeColor;
    [self.submit setTitleColor:UIColor.whiteColor forState:UIControlStateNormal];
    [self.submit setTitle:@"submit" forState:UIControlStateNormal];
    self.submit.GRMarginTop = 50;
    
    GRVerticalLayoutView* aL = GRVerticalH(@"User Form", self.userName, self.password);
    aL.GRLayoutMutableViewWidth = 350;
    self.layoutView = GRHorizontal(self.textLabel, aL, self.submit);
    self.layoutView.frame = self.view.bounds;
//    self.layoutView.headerContent = @"Demo page";
    [self.view addSubview:self.layoutView];
}

-(UITextField*) createTextField {
    UITextField* field = [[UITextField alloc] initWithLayoutFrame:CGRectZero withMargins:CGRectMake(0, 15, 0, 15)];
    field.layer.borderWidth = 1;
    field.layer.cornerRadius = 5;
    field.layer.borderColor = UIColor.lightGrayColor.CGColor;
    return field;
}

-(BOOL) prefersStatusBarHidden {
    return YES;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
