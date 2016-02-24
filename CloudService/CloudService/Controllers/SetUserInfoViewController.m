//
//  SetUserInfoViewController.m
//  CloudService
//
//  Created by zhangqiang on 16/2/23.
//  Copyright © 2016年 zhangqiang. All rights reserved.
//

#import "SetUserInfoViewController.h"
#import "SetUserInfoCell.h"
#import "SetUserInfoHeaderView.h"

static NSString *const cell_id = @"setUserInfoCell";
static NSString *const header_id = @"setUserInfoHeader";
static CGFloat headerHeight = 30;

@interface SetUserInfoViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    NSArray *_keyArray_User;
    NSArray *_keyArray_Bank;
}

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation SetUserInfoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupTableView];
    [self initData];
}

// 设置tableView样式
- (void)setupTableView {
    
    [self.tableView registerNib:[UINib nibWithNibName:@"SetUserInfoCell" bundle:nil] forCellReuseIdentifier:cell_id];
    [self.tableView registerClass:[SetUserInfoHeaderView class] forHeaderFooterViewReuseIdentifier:header_id];
}

- (void)initData {
    
    _keyArray_User = @[@"真是姓名",@"证件类型",
                       @"证件号码",@"用户类型",
                       @"原离职公司",@"原职位",
                       @"从业时间",@"工作类型",
                       @"微信号",@"申请销售保险公司",
                       @"销售数据城市"];
    _keyArray_Bank = @[@"开户人姓名",@"开户银行",
                       @"银行账号",@"支行名称",
                       @"开户省份",@"开户城市"];
    
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 0) {
        return 11;
    }else {
        return 6;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    SetUserInfoCell *cell = [tableView dequeueReusableCellWithIdentifier:cell_id forIndexPath:indexPath];
    cell.label.text = indexPath.section == 0 ? _keyArray_User[indexPath.row] : _keyArray_Bank[indexPath.row];
    cell.backgroundColor = [UIColor colorWithWhite:0.919 alpha:1.000];
    return cell;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    
    SetUserInfoHeaderView *headerView = [tableView dequeueReusableHeaderFooterViewWithIdentifier:header_id];
    headerView.titleLabel.text = section == 0 ? @"个人信息" : @"银行信息";
    return headerView;
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 0.1;
}

- (CGFloat )tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return headerHeight;
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
