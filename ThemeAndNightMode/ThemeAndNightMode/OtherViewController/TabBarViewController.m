//
//  TabBarViewController.m
//  ThemeAndNightMode
//
//  Created by shen on 17/4/17.
//  Copyright © 2017年 shen. All rights reserved.
//

#import "TabBarViewController.h"
#import "UIImage+Extension.h"


@interface TabBarViewController ()

@end

@implementation TabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self addSubViewsControllers];
    [self customTabbarItem];

    [self.tabBar setBarTintColor:[UIColor colorFromHexString:[[NSUserDefaults standardUserDefaults] objectForKey:@"color"]]];
    
    [[UITabBarItem appearance] setTitleTextAttributes:@{ NSForegroundColorAttributeName:[UIColor blackColor]} forState:UIControlStateNormal];
    [[UITabBarItem appearance] setTitleTextAttributes:@{ NSForegroundColorAttributeName:[UIColor whiteColor]} forState:UIControlStateSelected];
}

-(void)addSubViewsControllers{
    NSArray *classControllers = @[@"MainViewController",@"NightViewController"];
    NSMutableArray *conArr = [NSMutableArray array];
    
    for (int i = 0; i < classControllers.count; i ++) {
        Class cts = NSClassFromString(classControllers[i]);
        
        UIViewController *vc = [[cts alloc] init];
        UINavigationController *naVC = [[UINavigationController alloc] initWithRootViewController:vc];
        [conArr addObject:naVC];
    }
    self.viewControllers = conArr;
}

-(void)customTabbarItem{
    
    NSArray *titles = @[@"主题设置",@"夜间模式"];
    
    NSArray *normalImages = @[@"tab_icon_home",@"tab_icon_dingdan"];
    NSArray *selectImages = @[@"tab_icon_home_selected",@"tab_icon_dingdan_selected"];
    
    for (int i = 0; i < titles.count; i++) {
        
        UIViewController *vc = self.viewControllers[i];
        
        UIImage *normalImage = [UIImage imageWithOriginalImageName:normalImages[i]];
        UIImage *selectImage = [UIImage imageWithOriginalImageName:selectImages[i]];
        
        vc.tabBarItem = [[UITabBarItem alloc] initWithTitle:titles[i] image:normalImage selectedImage:selectImage];
        
    }
    
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
