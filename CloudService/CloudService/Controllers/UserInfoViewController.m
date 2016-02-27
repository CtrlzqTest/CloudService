//
//  UserInfoViewController.m
//  CloudService
//
//  Created by zhangqiang on 16/2/27.
//  Copyright © 2016年 zhangqiang. All rights reserved.
//

#import "UserInfoViewController.h"
#import "SetUserInfoCell.h"
#import "SetUserInfoViewController.h"

@interface UserInfoViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    NSArray *_keyArray;
    NSArray *_valueArray;
    
    BOOL _isTosetUserInfo;
}
@property (nonatomic,strong)UITableView *tableView;

@end

@implementation UserInfoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initData];
    [self setupViews];
}

-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    _isTosetUserInfo = NO;
    [self.navigationController setNavigationBarHidden:NO animated:YES];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    if (!_isTosetUserInfo) {
        [self.navigationController setNavigationBarHidden:YES animated:YES];
    }
    
}

- (void)initData {
    
    _keyArray = @[@"头像",@"名字",@"手机号",@"身份证号",@"微信号",@"银行账号"];
    _valueArray = @[@"",@"张三",@"15027264687",@"421123199303042452",
                    @"zhangqiang",@"6228480791546253810"];
    
    
}

- (void)setupViews {
    
    self.title = @"个人信息";
    self.view.backgroundColor = [UIColor whiteColor];
    __weak typeof(self) weakSelf = self;
    [self setRightTextBarButtonItemWithFrame:CGRectMake(0, 0, 40, 30) title:@"编辑" titleColor:[UIColor whiteColor] backImage:nil selectBackImage:nil action:^(AYCButton *button) {
        UIStoryboard *storyBoard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        SetUserInfoViewController *setUserInfoVC = [storyBoard instantiateViewControllerWithIdentifier:@"setUserInfo"];
        _isTosetUserInfo = YES;
        [weakSelf.navigationController pushViewController:setUserInfoVC animated:YES];
    }];
    self.tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain    ];
    self.tableView.backgroundColor = [HelperUtil colorWithHexString:@"F4F4F4"];
    self.tableView.tableFooterView = [[UIView alloc] init];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.tableView registerNib:[UINib nibWithNibName:@"SetUserInfoCell" bundle:nil] forCellReuseIdentifier:@"setUserInfoCell"];
    [self.view addSubview:self.tableView];
    
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 0) {
        return 6;
    }else {
        return 1;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    SetUserInfoCell *cell = [tableView dequeueReusableCellWithIdentifier:@"setUserInfoCell" forIndexPath:indexPath];
    cell.textFiled.enabled = NO;
    if (indexPath.section == 0) {
        cell.label.text = _keyArray[indexPath.row];
        cell.textFiled.text = _valueArray[indexPath.row];
        cell.textFiled.textAlignment = NSTextAlignmentRight;
        [cell.textFiled mas_updateConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(cell).with.offset(-20);
        }];
    }else {
        cell.label.text = @"修改密码";
    }
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0 && indexPath.row == 0) {
        return 60 / 667.0 * KHeight;
    }else {
        return 50 / 667.0 * KHeight;
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.section == 0) {
        
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 10;
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
