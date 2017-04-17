//
//  NightViewController.m
//  ThemeAndNightMode
//
//  Created by shen on 17/4/17.
//  Copyright © 2017年 shen. All rights reserved.
//

#import "NightViewController.h"

@interface NightViewController ()

@end

@implementation NightViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.navigationItem.title = @"夜间模式";
    
    
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(0, 200, 100, 40)];
    button.center = self.view.center;
    [button setTitle:@"点击" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor colorWithNormalHexColor:0x333333 nightHexColor:0xffffff] forState:UIControlStateNormal];
    [button addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
   
}


-(void)buttonClicked:(UIButton *)button{
    
    NSString *mode = !button.isSelected ? @"night" : @"";

    [[NSUserDefaults standardUserDefaults] setObject:mode forKey:kSkinStyle];
    [[NSUserDefaults standardUserDefaults] synchronize];
    self.view.backgroundColor = [UIColor colorWithNormalHexColor:0xffffff nightHexColor:0x333333];
   [button setTitleColor:[UIColor colorWithNormalHexColor:0x333333 nightHexColor:0xffffff] forState:UIControlStateNormal];
    
    button.selected = !button.selected;
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
