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
static NSString *const select_CellID = @"selectCell";
@interface SetUserInfoViewController ()<SetUserInfoCellDelegate,UITableViewDelegate,UITableViewDataSource>
{
    NSArray *_keyArray_User;
    NSArray *_keyArray_Bank;
    NSMutableArray *_selectArray0;
    NSMutableArray *_selectArray1;
    NSIndexPath *_indexPath;
    
}

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property(nonatomic,strong) UITableView *selectTableView;

@end

@implementation SetUserInfoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupTableView];
    [self initData];
    [self setupSelectTableView];
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
    
    _selectArray0 = [NSMutableArray arrayWithArray:@[@"",@"身份证",@"",@"",@"",@"",@"",@"",@"",@"",@""]];
    
    _selectArray1 = [NSMutableArray arrayWithArray:@[@"",@"",@"",@"",@"",@""]];
    
}

- (void)setupSelectTableView {
    
    self.selectTableView = [[UITableView alloc] initWithFrame:CGRectZero style:(UITableViewStylePlain)];
    self.selectTableView.dataSource = self;
    self.selectTableView.delegate = self;
    [self.selectTableView registerClass:[UITableViewCell class] forCellReuseIdentifier:select_CellID];
//    [self.view addSubview:self.selectTableView];
}
#pragma mark -- SetUserInfoCellDelegate
-(void)textFiledDidChange:(NSString *)text cellIndePath:(NSIndexPath *)indexPath {
    _indexPath = indexPath;
    NSLog(@"%ld",indexPath.row);
}

#pragma mark -- UITableViewDelegate

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    if ([tableView isEqual:self.tableView]) {
        return 2;
    }else {
        return 1;
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    if ([tableView isEqual:self.selectTableView]) {
        return _selectArray0.count;
    }
    if (section == 0) {
        return 11;
    }else {
        return 6;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    // 下拉的tableView
    if ([tableView isEqual:self.selectTableView]) {
        
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:select_CellID];
        cell.textLabel.text = _selectArray0[indexPath.row];
        return cell;
    }
    
    SetUserInfoCell *cell = [tableView dequeueReusableCellWithIdentifier:cell_id forIndexPath:indexPath];
    cell.delegate = self;
    cell.label.text = indexPath.section == 0 ? _keyArray_User[indexPath.row] : _keyArray_Bank[indexPath.row];
    cell.textFiled.text = indexPath.section == 0 ? _selectArray0[indexPath.row] : _selectArray1[indexPath.row];
    [cell isPullDown:NO];
    CGRect tempRect = [cell convertRect:cell.textFiled.frame fromView:self.view];
    if (indexPath.section == 0) {
        switch (indexPath.row) {
            case 1:
//                NSLog(@"%@",NSStringFromCGRect(tempRect));
                [cell isPullDown:YES];
//                CGRect rect = CGRectMake(tempRect.origin.x, CGRectGetMaxY(cell.frame), 150, 200);
//                self.selectTableView.frame = rect;
//                [cell addSubview:self.selectTableView];
//                [self.selectTableView reloadData];
                break;
                
            default:
                break;
        }
    }
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.section == 0) {
        if (indexPath.row == 1) {
            
        }
    }
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    
    SetUserInfoHeaderView *headerView = [tableView dequeueReusableHeaderFooterViewWithIdentifier:header_id];
    headerView.titleLabel.text = section == 0 ? @"个人信息" : @"银行信息";
    return headerView;
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 0.1;
}

- (CGFloat )tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 50;
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
