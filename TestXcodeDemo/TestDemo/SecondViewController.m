//
//  SecondViewController.m
//  TestDemo
//
//  Created by Beauty-ruanjian-063 on 2018/8/30.
//  Copyright © 2018年 Beauty-ruanjian-063. All rights reserved.
//

#import "SecondViewController.h"

@interface SecondViewController ()

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor lightGrayColor];
    
    UIButton *backBtn = [[UIButton alloc] init];
    backBtn.frame = CGRectMake(30, 50, 50, 50);
    [backBtn setTitle:NSLocalizedString(@"back", nil) forState:UIControlStateNormal];
    [backBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [backBtn addTarget:self action:@selector(press_backButton) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:backBtn];
    
    
    UITextField *tf = [[UITextField alloc] init];
    tf.frame = CGRectMake(100, 200, 200, 30);
    tf.placeholder = NSLocalizedString(@"这是placeholder", nil);
    [self.view addSubview:tf];
    
    NSLog(@"Second ViewController viewDidLoad");
    NSLog(@"Second ViewController viewDidLoad 加点中文");
    
}

- (void)press_backButton {
    [self dismissViewControllerAnimated:NO completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
