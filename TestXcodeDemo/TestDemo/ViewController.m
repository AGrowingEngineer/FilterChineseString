//
//  ViewController.m
//  TestDemo
//
//  Created by Beauty-ruanjian-063 on 2018/8/30.
//  Copyright © 2018年 Beauty-ruanjian-063. All rights reserved.
//

#import "ViewController.h"
#import "SecondViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 这个是中文注释
    // this is English note
    
    UIButton *btn = [[UIButton alloc] init];
    btn.frame = CGRectMake(100, 100, 200, 50);
//    [btn setTitle:@"一个按钮" forState:UIControlStateNormal];
    [btn setTitle:NSLocalizedString(@"这是一个按钮", nil) forState:UIControlStateNormal]; //@"这是"
    [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(press_buttonAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    
    
    UILabel *label = [[UILabel alloc] init];
    label.frame = CGRectMake(100, CGRectGetMaxY(btn.frame) + 20, 200, 100);
    label.numberOfLines = 2;
    label.lineBreakMode = NSLineBreakByWordWrapping;
    label.text = NSLocalizedString(@"点击上面的\"按钮\"进入\"SecondViewController\"", nil);
    [self.view addSubview:label];
}

- (void)press_buttonAction {
    [self presentViewController:[[SecondViewController alloc] init] animated:NO completion:nil];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
    
    
}


@end
