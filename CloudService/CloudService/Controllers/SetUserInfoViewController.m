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
    NSMutableArray *_valueArray_User;
    NSMutableArray *_valueArray_Bank;
    
    NSIndexPath *_indexPath;
    NSInteger _selectCellIndex;
    BOOL _isAnimating;
}

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property(nonatomic,strong) UITableView *selectTableView;
@property(nonatomic,strong) NSArray *selectArray;
@property(nonatomic,strong) UIButton *maskView;
@end

@implementation SetUserInfoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupTableView];
    [self initData];
    [self setupSelectTableView];
}

-(void)setSelectArray:(NSArray *)selectArray {
    
    if (_selectArray != selectArray) {
        _selectArray = [selectArray copy];
        
    }
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
    
    _valueArray_User = [NSMutableArray arrayWithArray:@[@"",@"身份证",@"",@"初级用户",@"",@"",@"",@"销售人员",@"",@"阳光保险",@""]];
    
    _valueArray_Bank = [NSMutableArray arrayWithArray:@[@"",@"",@"",@"",@"",@""]];
    
}

- (void)setupSelectTableView {
    
    // 现加上蒙版
    self.maskView = [UIButton buttonWithType:UIButtonTypeCustom];
    self.maskView.frame = self.view.bounds;
    [self.maskView addTarget:self action:@selector(hidePullDownView) forControlEvents:UIControlEventTouchUpInside];
    self.view.backgroundColor = [UIColor whiteColor];
    self.maskView.hidden = YES;
    [self.view addSubview:self.maskView];
    
    self.selectTableView = [[UITableView alloc] initWithFrame:CGRectZero style:(UITableViewStylePlain)];
    self.selectTableView.dataSource = self;
    self.selectTableView.delegate = self;
    [self.selectTableView registerClass:[UITableViewCell class] forCellReuseIdentifier:select_CellID];
    self.selectTableView.layer.borderWidth = 0.6;
    self.selectTableView.layer.borderColor = [UIColor grayColor].CGColor;
    [self.maskView addSubview:self.selectTableView];
}

// 显示下拉列表
- (void)showPullDownViewWithRect:(CGRect )rect {
    
    if (_isAnimating) {
        return ;
    }
    _isAnimating = YES;
    self.maskView.hidden = NO;
    [self.selectTableView reloadData];
    CGRect tempRect = rect;
    tempRect.size.height = 0.1;
    self.selectTableView.frame = tempRect;
    
    [UIView animateWithDuration:0.5 animations:^{
        self.selectTableView.frame = rect;
    } completion:^(BOOL finished) {
        self.selectTableView.frame = rect;
        _isAnimating = NO;
    }];
    
}


// 隐藏下拉列表
- (void)hidePullDownView {
    if (_isAnimating) {
        return;
    }
    CGRect tempRext = self.selectTableView.frame;
    tempRext.size.height = 0.1;
    _isAnimating = YES;
    [UIView animateWithDuration:0.5 animations:^{
        self.selectTableView.frame = tempRext;
    } completion:^(BOOL finished) {
       self.maskView.hidden = YES;
        _isAnimating = NO;
        
    }];

}

#pragma mark -- SetUserInfoCellDelegate
// 确定编辑在哪个cell上
-(void)textFiledShouldBeginEditAtCell:(SetUserInfoCell *)cell {
    _indexPath = [self.tableView indexPathForCell:cell];
}

-(void)textFiledDidEndEdit:(NSString *)text {
    if (_indexPath.section == 0) {
        _valueArray_User[_indexPath.row] = text;
    }else {
        _valueArray_Bank[_indexPath.row] = text;
    }
    _indexPath = nil;
}

#pragma mark -- UITableViewDelegate
-(void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {
    
    if (_indexPath) {
        SetUserInfoCell *cell = [self.tableView cellForRowAtIndexPath:_indexPath];
        [cell.textFiled resignFirstResponder];
    }
    
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    if ([tableView isEqual:self.tableView]) {
        return 2;
    }else {
        return 1;
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    if ([tableView isEqual:self.selectTableView]) {
        return _selectArray.count;
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
        cell.textLabel.text = _selectArray[indexPath.row];
        return cell;
    }
    
    SetUserInfoCell *cell = [tableView dequeueReusableCellWithIdentifier:cell_id forIndexPath:indexPath];
    cell.delegate = self;
    cell.label.text = indexPath.section == 0 ? _keyArray_User[indexPath.row] : _keyArray_Bank[indexPath.row];
    cell.textFiled.text = indexPath.section == 0 ? _valueArray_User[indexPath.row] : _valueArray_Bank[indexPath.row];
    [cell isPullDown:NO];
    if (indexPath.section == 0) {
        if (indexPath.row == 1 || indexPath.row == 3 || indexPath.row == 7 || indexPath.row == 9) {
            [cell isPullDown:YES];
        }
    }
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if ([tableView isEqual:self.selectTableView]) {
        [self hidePullDownView];
        _valueArray_User[_selectCellIndex] = _selectArray[indexPath.row];
        [self.tableView reloadData];
        return;
    }
    SetUserInfoCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    CGRect tempRect = [cell.contentView convertRect:cell.textFiled.frame fromView:self.view];
    _selectCellIndex = indexPath.row;
    if (indexPath.section == 0) {
        switch (indexPath.row) {
            case 1:     _selectArray = @[@"身份证",@"军人证"];
                        CGRect rect1 = CGRectMake(tempRect.origin.x, CGRectGetMaxY(cell.frame) - self.tableView.contentOffset.y, 150, _selectArray.count * 30);
                        [self showPullDownViewWithRect:rect1];
                        break;
            case 3:     _selectArray = @[@"身份证",@"军人证"];
                        CGRect rect3 = CGRectMake(tempRect.origin.x, CGRectGetMaxY(cell.frame) - self.tableView.contentOffset.y, 150, _selectArray.count * 30);
                        [self showPullDownViewWithRect:rect3];
                        break;
            case 7:     _selectArray = @[@"身份证",@"军人证"];
                        CGRect rect7 = CGRectMake(tempRect.origin.x, CGRectGetMaxY(cell.frame) - self.tableView.contentOffset.y, 150, _selectArray.count * 30);
                        [self showPullDownViewWithRect:rect7];
                        break;
                
            case 9:     _selectArray = @[@"身份证",@"军人证"];
                        CGRect rect9 = CGRectMake(tempRect.origin.x, CGRectGetMaxY(cell.frame) - self.tableView.contentOffset.y, 150, _selectArray.count * 30);
                        [self showPullDownViewWithRect:rect9];
                        break;
            default:
                break;
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
    if ([tableView isEqual:self.selectTableView]) {
        return 30;
    }
    return 50;
}

- (CGFloat )tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    if ([tableView isEqual:self.selectTableView]) {
        return 0.1;
    }
    return headerHeight;
}

-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPat{
    
    if ([tableView isEqual:self.selectTableView]) {
        if ([cell respondsToSelector:@selector(setLayoutMargins:)]) {
            [cell setLayoutMargins:UIEdgeInsetsZero];
        }
        if ([cell respondsToSelector:@selector(setSeparatorInset:)]){
            [cell setSeparatorInset:UIEdgeInsetsZero];
        }
    }
}

-(void)viewDidLayoutSubviews {
    
    if ([self.selectTableView respondsToSelector:@selector(setSeparatorInset:)]) {
        [self.selectTableView setSeparatorInset:UIEdgeInsetsZero];
        
    }
    if ([self.selectTableView respondsToSelector:@selector(setLayoutMargins:)])  {
        [self.selectTableView setLayoutMargins:UIEdgeInsetsZero];
    }
    
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
