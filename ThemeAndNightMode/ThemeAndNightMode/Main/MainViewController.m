//
//  MainViewController.m
//  ThemeAndNightMode
//
//  Created by shen on 17/4/17.
//  Copyright © 2017年 shen. All rights reserved.
//

#import "MainViewController.h"
#import "MainCollectionViewCell.h"


@interface MainViewController ()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>{
    
    UICollectionView *_collectView;
    NSArray *_colorsDataArr;
}

@end

@implementation MainViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.navigationItem.title = @"主题设置";
    
    [self createCollectViewView];
}

-(void)createCollectViewView{
    
    NSString *path = [[NSBundle mainBundle] pathForResource:@"colors.plist" ofType:nil];
    NSMutableArray *data = [[NSMutableArray alloc]initWithContentsOfFile:path];
    NSMutableArray * zero = data[0];
    NSMutableArray *color = [NSMutableArray array];
    for (NSDictionary *dic in zero) {
        [color addObject:[dic objectForKey:@"hash"]];
        
    }
    _colorsDataArr = [[color reverseObjectEnumerator] allObjects];
    
    UICollectionViewFlowLayout * layout = [[UICollectionViewFlowLayout alloc]init];
    layout.scrollDirection = UICollectionViewScrollDirectionVertical;
    _collectView = [[UICollectionView alloc]initWithFrame:CGRectMake(0,64, kScreenWidth, kScreenHeight - 64 - 49) collectionViewLayout:layout];
    _collectView.delegate=self;
    _collectView.dataSource=self;
    _collectView.backgroundColor = [UIColor clearColor];
    [_collectView registerClass:[MainCollectionViewCell class] forCellWithReuseIdentifier:@"MainCollectionViewCellID"];
    [self.view addSubview:_collectView];
}
#pragma mark --UICollectionViewDelegate

-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    return UIEdgeInsetsMake(2, 2, 2,2);
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    return CGSizeMake(55,55);
}
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return _colorsDataArr.count;
}
-(BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    return YES;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    MainCollectionViewCell * cell  = [collectionView dequeueReusableCellWithReuseIdentifier:@"MainCollectionViewCellID" forIndexPath:indexPath];
    cell.backgroundColor = [UIColor colorFromHexString:_colorsDataArr[indexPath.row]];
    return cell;
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
    self.navigationController.navigationBar.barTintColor = [UIColor colorFromHexString:_colorsDataArr[indexPath.row]];
    [self.tabBarController.tabBar setBarTintColor:[UIColor colorFromHexString:_colorsDataArr[indexPath.row]]];
    [[NSUserDefaults standardUserDefaults] setObject:_colorsDataArr[indexPath.row] forKey:@"color"];
    [[NSUserDefaults standardUserDefaults] synchronize];
    
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
