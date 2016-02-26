//
//  PersonalViewController.m
//  CloudService
//
//  Created by 安永超 on 16/2/23.
//  Copyright © 2016年 zhangqiang. All rights reserved.
//

#import "PersonalViewController.h"
#import "PersonalViewCell.h"

@interface PersonalViewController ()<UITableViewDataSource,UITableViewDelegate> {
    NSArray *_dataArray;
    NSMutableDictionary *_dataDict;
}

@property (weak, nonatomic) IBOutlet UIImageView *headIconImg;
@property (weak, nonatomic) IBOutlet UILabel *userNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *phoneNumLabel;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

static NSString *cell_id = @"personalCell";

@implementation PersonalViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initData];
    [self setupViews];
}

- (void)initData {
    
    NSArray *array1 = @[@"我的团队",@"积分管理",@"用户认证",@"团队成员邀请",@"好友邀请"];
    NSArray *array2 = @[@"我的优惠券"];
    NSArray *array3 = @[@"关于应用",@"版本更新"];
    
    _dataArray = [NSArray arrayWithObjects:array1,array2,array3, nil];
    
    _dataDict = [NSMutableDictionary dictionary];
    [_dataDict setValue:@"" forKey:array1[0]];
    [_dataDict setValue:@"" forKey:array1[1]];
    [_dataDict setValue:@"" forKey:array1[2]];
    [_dataDict setValue:@"" forKey:array1[3]];
    [_dataDict setValue:@"" forKey:array1[4]];
    [_dataDict setValue:@"" forKey:array2[0]];
    [_dataDict setValue:@"" forKey:array3[0]];
    [_dataDict setValue:@"" forKey:array3[1]];
    
}

- (void)setupViews {
    // 注册Cell
    [self.tableView registerNib:[UINib nibWithNibName:@"PersonalViewCell" bundle:nil] forCellReuseIdentifier:cell_id];

}

- (IBAction)exit:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)viewWillAppear:(BOOL)animated {
    
    [super viewWillAppear:animated];
    self.tabBarController.title = @"个人中心";
    
}

-(void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [self.navigationController setNavigationBarHidden:YES animated:NO];
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return _dataArray.count + 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == _dataArray.count) {
        return 1;
    }else {
        return [_dataArray[section] count];
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
//    if (indexPath.section == _dataArray.count) {
//        static NSString *cell_ID = @"logOutCell";
//        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cell_ID];
//        return cell;
//    }
    
    PersonalViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cell_id forIndexPath:indexPath];
    return cell;
}

- (CGFloat )tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 10;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [self dismissViewControllerAnimated:YES completion:nil];
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
