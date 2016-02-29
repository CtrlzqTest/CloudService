//
//  HomeViewController.m
//  CloudService
//
//  Created by 安永超 on 16/2/23.
//  Copyright © 2016年 zhangqiang. All rights reserved.
//

#import "HomeViewController.h"
#import "HomeCollectionCell.h"

@interface HomeViewController ()<UICollectionViewDataSource,UICollectionViewDelegate>
{
    NSMutableDictionary *_dataDict;
    NSArray *_dataKeyArray;
}
@property (weak, nonatomic) IBOutlet UIView *pageScrBackView;
@property (weak, nonatomic) IBOutlet UIImageView *headImg;
@property (weak, nonatomic) IBOutlet UILabel *userNameLabel;
@property (weak, nonatomic) IBOutlet UIButton *sginBtn;
@property (weak, nonatomic) IBOutlet UILabel *integralLabel;
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;

@end
static NSString *cell_id = @"menuCell";

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    [self.tabBarController.tabBar setBackgroundColor:[UIColor blackColor]];
    [self initData];
    [self setupViews];
}

- (void)initData {
    
    _dataKeyArray = @[@"获取数据",@"我的客户",@"创建订单",@"积分商城",@"邀请好友",@"我的积分"];
    
    _dataDict = [NSMutableDictionary dictionary];
    [_dataDict setValue:@"获取客户数据" forKey:_dataKeyArray[0]];
    [_dataDict setValue:@"我的客户内容" forKey:_dataKeyArray[1]];
    [_dataDict setValue:@"联系我的订单" forKey:_dataKeyArray[2]];
    [_dataDict setValue:@"商城自选内容" forKey:_dataKeyArray[3]];
    [_dataDict setValue:@"业绩查询" forKey:_dataKeyArray[4]];
    [_dataDict setValue:@"积分明细查询" forKey:_dataKeyArray[5]];

}

- (void)setupViews {
    
    self.view.backgroundColor = [HelperUtil colorWithHexString:@"F4F4F4"];
    self.collectionView.backgroundColor = [HelperUtil colorWithHexString:@"F4F4F4"];
    [self.collectionView registerNib:[UINib nibWithNibName:@"HomeCollectionCell" bundle:nil] forCellWithReuseIdentifier:cell_id];
    
    CGFloat inset = 8;
    UICollectionViewFlowLayout *flowLayOut = [[UICollectionViewFlowLayout alloc] init];
    flowLayOut.minimumInteritemSpacing = inset;
    flowLayOut.minimumLineSpacing = 2 * inset;
    flowLayOut.sectionInset = UIEdgeInsetsMake(2 * inset, inset, 2 * inset, inset);
    flowLayOut.itemSize = CGSizeMake((KWidth - 4 * inset) / 3.0, (self.collectionView.frame.size.height - 6 * inset) / 2.0);
    self.collectionView.collectionViewLayout = flowLayOut;
    
}

- (void)viewWillAppear:(BOOL)animated {
    
    [super viewWillAppear:animated];
    [self setNavigationBarTitleColor:[UIColor whiteColor]];
    self.navigationController.navigationBar.barTintColor = [HelperUtil
                                                            colorWithHexString:@"277FD9"];
    self.tabBarController.title = @"首页";
    [self.navigationController setNavigationBarHidden:NO animated:NO];
    self.tabBarController.navigationItem.rightBarButtonItem = nil;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return _dataKeyArray.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    HomeCollectionCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cell_id forIndexPath:indexPath];
    cell.titleLabel.text = _dataKeyArray[indexPath.row];
    cell.detailTitleLabel.text = [_dataDict valueForKey:_dataKeyArray[indexPath.row]];
    return cell;
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
