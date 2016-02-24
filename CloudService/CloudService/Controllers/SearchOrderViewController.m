//
//  SearchOrderViewController.m
//  CloudService
//
//  Created by 安永超 on 16/2/24.
//  Copyright © 2016年 zhangqiang. All rights reserved.
//

#import "SearchOrderViewController.h"

@interface SearchOrderViewController ()
{
    UIView *_searchView;//搜索菜单页面
    UIButton *_blackBtn;//背景层
    BOOL isOpen;//菜单是否展开
}
@end

@implementation SearchOrderViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    __weak typeof(self) weakSelf = self;
    [weakSelf setLeftImageBarButtonItemWithFrame:CGRectMake(0, 0, 20, 20) image:@"title-back" selectImage:@"back" action:^(AYCButton *button) {
        [weakSelf.navigationController popViewControllerAnimated:YES];
    }];
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemSearch target:self action:@selector(searchOrder:)];
    self.navigationItem.rightBarButtonItem = item;
    _blackBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    _blackBtn.backgroundColor = [UIColor blackColor];
    _blackBtn.frame = self.view.frame;
    _blackBtn.alpha = 0.5f;
    [_blackBtn addTarget:self action:@selector(upMenu) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_blackBtn];
    [self initSearchMenu];
    // Do any additional setup after loading the view.
}

- (void)viewWillAppear:(BOOL)animated {
    self.title=@"订单搜索";
    [self downMenu];
}
- (void)searchOrder:(UIButton *)sender{
    if (isOpen) {
        [self upMenu];
    }else {
        [self downMenu];
    }
    
}

/** 搜索菜单*/
- (void)initSearchMenu {
    _searchView = [[UIView alloc] initWithFrame:CGRectMake(0, -310, KWidth, 310)];
    _searchView.backgroundColor = [HelperUtil colorWithHexString:@"#F4F4F4"];
    [self.view addSubview:_searchView];
    
    UILabel *lbName = [UILabel new];
    lbName.textColor = [UIColor darkGrayColor];
    lbName.font = [UIFont systemFontOfSize:14];
    lbName.text = @"姓名";
    [_searchView addSubview:lbName];
    
    [lbName mas_makeConstraints:^(MASConstraintMaker *make) {
        //添加大小约束
        make.size.mas_equalTo(CGSizeMake(50, 34));
        //添加左边距约束
        make.left.mas_equalTo(20);
        //添加上边距约束
        make.top.mas_equalTo(15);
    }];
    
    UITextField *tfName = [UITextField new];
    tfName.placeholder = @"请输入客户姓名";
    [tfName setValue:[UIFont boldSystemFontOfSize:14] forKeyPath:@"_placeholderLabel.font"];
    tfName.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    tfName.borderStyle = UITextBorderStyleRoundedRect;
    [_searchView addSubview:tfName];
    [tfName mas_makeConstraints:^(MASConstraintMaker *make) {
        //添加高约束
        make.height.mas_equalTo(34);
        //添加左边距约束(距离左边label的距离)
        make.left.mas_equalTo(90);
        //添加右边距约束
        make.right.mas_equalTo(-20);
        //添加上边距约束
        make.top.mas_equalTo(15);
        
        
    }];
    
    UILabel *lbTel = [UILabel new];
    lbTel.textColor = [UIColor darkGrayColor];
    lbTel.font = [UIFont systemFontOfSize:14];
    lbTel.text = @"手机号";
    [_searchView addSubview:lbTel];
    
    [lbTel mas_makeConstraints:^(MASConstraintMaker *make) {
        //添加大小约束
        make.size.mas_equalTo(CGSizeMake(50, 34));
        //添加左边距约束
        make.left.mas_equalTo(20);
        //添加上边距约束（上边距 = lbName的下边框 + 偏移量15）
        make.top.equalTo(lbName.mas_bottom).offset(15);
    }];
    
    UITextField *tfTel = [UITextField new];
    tfTel.placeholder = @"请输入客户手机号";
    [tfTel setValue:[UIFont boldSystemFontOfSize:14] forKeyPath:@"_placeholderLabel.font"];
    tfTel.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    tfTel.borderStyle = UITextBorderStyleRoundedRect;
    [_searchView addSubview:tfTel];
    [tfTel mas_makeConstraints:^(MASConstraintMaker *make) {
        //添加高约束
        make.height.mas_equalTo(34);
        //添加左边距约束(距离左边label的距离)
        make.left.mas_equalTo(90);
        //添加右边距约束
        make.right.mas_equalTo(-20);
        //添加上边距约束
        make.top.equalTo(tfName.mas_bottom).offset(15);
 
    }];
    
    UILabel *lbCar = [UILabel new];
    lbCar.textColor = [UIColor darkGrayColor];
    lbCar.font = [UIFont systemFontOfSize:14];
    lbCar.text = @"车牌号";
    [_searchView addSubview:lbCar];
    
    [lbCar mas_makeConstraints:^(MASConstraintMaker *make) {
        //添加大小约束
        make.size.mas_equalTo(CGSizeMake(50, 34));
        //添加左边距约束
        make.left.mas_equalTo(20);
        //添加上边距约束（上边距 = lbName的下边框 + 偏移量15）
        make.top.equalTo(lbTel.mas_bottom).offset(15);
    }];
    
    UITextField *tfCar = [UITextField new];
    tfCar.placeholder = @"请输入车牌号";
    [tfCar setValue:[UIFont boldSystemFontOfSize:14] forKeyPath:@"_placeholderLabel.font"];
    tfCar.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    tfCar.borderStyle = UITextBorderStyleRoundedRect;
    [_searchView addSubview:tfCar];
    [tfCar mas_makeConstraints:^(MASConstraintMaker *make) {
        //添加高约束
        make.height.mas_equalTo(34);
        //添加左边距约束(距离左边label的距离)
        make.left.mas_equalTo(90);
        //添加右边距约束
        make.right.mas_equalTo(-20);
        //添加上边距约束
        make.top.equalTo(tfTel.mas_bottom).offset(15);
        
    }];
    
    UILabel *lbState = [UILabel new];
    lbState.textColor = [UIColor darkGrayColor];
    lbState.font = [UIFont systemFontOfSize:14];
    lbState.text = @"结束码";
    [_searchView addSubview:lbState];
    
    [lbState mas_makeConstraints:^(MASConstraintMaker *make) {
        //添加大小约束
        make.size.mas_equalTo(CGSizeMake(50, 34));
        //添加左边距约束
        make.left.mas_equalTo(20);
        //添加上边距约束（上边距 = lbName的下边框 + 偏移量15）
        make.top.equalTo(lbCar.mas_bottom).offset(15);
    }];
    
    UITextField *tfState = [UITextField new];
    tfState.placeholder = @"未报价";
    [tfState setValue:[UIFont boldSystemFontOfSize:14] forKeyPath:@"_placeholderLabel.font"];
    tfState.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    tfState.borderStyle = UITextBorderStyleRoundedRect;
    [_searchView addSubview:tfState];
    [tfState mas_makeConstraints:^(MASConstraintMaker *make) {
        //添加高约束
        make.height.mas_equalTo(34);
        //添加左边距约束(距离左边label的距离)
        make.left.mas_equalTo(90);
        //添加右边距约束
        make.right.mas_equalTo(-20);
        //添加上边距约束
        make.top.equalTo(tfCar.mas_bottom).offset(15);
        
    }];
    
    UILabel *lbTime = [UILabel new];
    lbTime.textColor = [UIColor darkGrayColor];
    lbTime.font = [UIFont systemFontOfSize:14];
    lbTime.text = @"起止时间";
    [_searchView addSubview:lbTime];
    
    [lbTime mas_makeConstraints:^(MASConstraintMaker *make) {
        //添加大小约束
        make.size.mas_equalTo(CGSizeMake(60, 34));
        //添加左边距约束
        make.left.mas_equalTo(20);
        //添加上边距约束（上边距 = lbName的下边框 + 偏移量15）
        make.top.equalTo(lbState.mas_bottom).offset(15);
    }];
    
    UILabel *lbStart = [UILabel new];
    lbStart.textAlignment = NSTextAlignmentCenter;
    lbStart.textColor = [UIColor lightGrayColor];
    lbStart.font = [UIFont systemFontOfSize:14];
    lbStart.text = @"起始时间";
    [_searchView addSubview:lbStart];
    
    UILabel *lbEnd = [UILabel new];
    lbEnd.textAlignment = NSTextAlignmentCenter;
    lbEnd.textColor = [UIColor lightGrayColor];
    lbEnd.font = [UIFont systemFontOfSize:14];
    lbEnd.text = @"终止时间";
    [_searchView addSubview:lbEnd];
    [lbStart mas_makeConstraints:^(MASConstraintMaker *make) {
        //添加高约束
        make.height.mas_equalTo(34);
        //添加上边距约束
        make.top.equalTo(tfState.mas_bottom).offset(15);
        // 添加左边距约束（距离当前主视图左边的距离）
        make.left.equalTo(lbTime.mas_right).offset(15);
        // 添加右边距约束（距离第二个按键左边的距离）
        make.right.equalTo(lbEnd.mas_left).with.offset(-20);

        // 添加宽度（宽度跟右边按键一样）
        make.width.equalTo(lbEnd);
    }];
    
    
    [lbEnd mas_makeConstraints:^(MASConstraintMaker *make) {
        //添加高约束
        make.height.mas_equalTo(34);
        //添加上边距约束
        make.top.equalTo(tfState.mas_bottom).offset(15);
        // 添加左边距约束（距离左边按键的距离）
        make.left.equalTo(lbStart.mas_right).with.offset(20);
        // 添加右边距约束（距离当前主视图右边的距离）
        make.right.equalTo(self.view.mas_right).with.offset(-20);
        
        // 添加宽度（宽度跟右边按键一样）
        make.width.equalTo(lbStart);
    }];
    
    UIView *lineView = [UIView new];
    lineView.backgroundColor = [UIColor lightGrayColor];
    [_searchView addSubview:lineView];
    [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        //添加大小约束
        make.size.mas_equalTo(CGSizeMake(10, 1));
        //添加左边距约束
         make.left.equalTo(lbStart.mas_right).with.offset(5);
        //添加上边距约束（上边距 = lbName的下边框 + 偏移量15）
        make.top.equalTo(lbState.mas_bottom).offset(31);
    }];
    
    UIButton *btnCancel = [UIButton buttonWithType:UIButtonTypeCustom];
    btnCancel.layer.cornerRadius = 5.0f;
    btnCancel.layer.masksToBounds = YES;
    [btnCancel setTitle:@"取消" forState:UIControlStateNormal];
    btnCancel.titleLabel.font = [UIFont systemFontOfSize:14];
    btnCancel.backgroundColor = [UIColor darkGrayColor];
    [_searchView addSubview:btnCancel];
    
    UIButton *btnSearch = [UIButton buttonWithType:UIButtonTypeCustom];
    btnSearch.layer.cornerRadius = 5.0f;
    btnSearch.layer.masksToBounds = YES;
    [btnSearch setTitle:@"搜索" forState:UIControlStateNormal];
    btnSearch.titleLabel.font = [UIFont systemFontOfSize:14];
    btnSearch.backgroundColor = [UIColor redColor];
    [_searchView addSubview:btnSearch];
    
    // 给左边视图添加约束
    [btnCancel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        //添加上边距约束
        make.top.equalTo(lbStart.mas_bottom).offset(15);
        // 添加左边距约束（距离当前主视图左边的距离）
        make.left.equalTo(self.view.mas_left).with.offset(20);
        // 添加右边距约束（距离第二个按键左边的距离）
        make.right.equalTo(btnSearch.mas_left).with.offset(-20);
        // 添加当前按钮的高度
        make.height.mas_equalTo(34);
        // 添加宽度（宽度跟右边按键一样）
        make.width.equalTo(btnSearch);
    }];
    
    // 给右边视图添加约束
    [btnSearch mas_makeConstraints:^(MASConstraintMaker *make) {
        
        //添加上边距约束
        make.top.equalTo(lbEnd.mas_bottom).offset(15);
        // 添加左边距约束（距离左边按键的距离）
        make.left.equalTo(btnCancel.mas_right).with.offset(20);
        // 添加右边距约束（距离当前主视图右边的距离）
        make.right.equalTo(self.view.mas_right).with.offset(-20);
        // 添加当前按钮的高度
        make.height.mas_equalTo(34);
        // 添加宽度（宽度跟左边按键一样）
        make.width.equalTo(btnCancel);
    }];

}
/** 下拉菜单*/
- (void)downMenu {
   isOpen = !isOpen;
    [UIView animateWithDuration:0.5 animations:^{
        _searchView.frame = CGRectMake(0, 0, KWidth, 310);
        _blackBtn.hidden = NO;
    }];
}
/** 收回菜单*/
- (void)upMenu {
    isOpen = !isOpen;
    [UIView animateWithDuration:0.5 animations:^{
        _searchView.frame = CGRectMake(0, -310, KWidth, 310);
        _blackBtn.hidden = YES;
    }];
}

-(void)dealloc {
    NSLog(@"搜索界面已销毁");
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
