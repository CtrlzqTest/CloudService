//
//  OrderInfoViewController.m
//  CloudService
//
//  Created by 安永超 on 16/2/25.
//  Copyright © 2016年 zhangqiang. All rights reserved.
//

#import "OrderInfoViewController.h"

@interface OrderInfoViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property(nonatomic,strong) UIView *footView;
@end

@implementation OrderInfoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    __weak typeof(self) weakSelf = self;
    [weakSelf setLeftImageBarButtonItemWithFrame:CGRectMake(0, 0, 20, 20) image:@"title-back" selectImage:@"back" action:^(AYCButton *button) {
        [weakSelf.navigationController popViewControllerAnimated:YES];
    }];
    [self initFootView];
    self.tableView.tableFooterView = self.footView;
    // Do any additional setup after loading the view.
}
- (void)viewWillAppear:(BOOL)animated {
    self.title=@"订单详情";
}

- (void)initFootView {
    self.footView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, KWidth, 44)];
    self.footView.backgroundColor = [UIColor lightGrayColor];
    float height = 44.0f;
    float width = 60.0f;
    for (int i = 1; i<4; i++) {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.frame = CGRectMake(KWidth-i*width, 0, width, height);
        [button addTarget:self action:@selector(orderClick:) forControlEvents:UIControlEventTouchUpInside];
        [self.footView addSubview:button];
        
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 30, 20)];
        label.center = CGPointMake(30, 30);
        label.font = [UIFont systemFontOfSize:12];
        label.text = @"预约";
        [button addSubview:label];
        
    }
    
}
- (void)orderClick:(UIButton *)sender {
    
}
#pragma mark tableView
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 5;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString *cellId=@"cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellId];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    cell.textLabel.textColor = [UIColor darkGrayColor];
    cell.textLabel.font = [UIFont systemFontOfSize:14];
    cell.detailTextLabel.textColor = [UIColor blackColor];
    cell.detailTextLabel.font = [UIFont systemFontOfSize:12];
    switch (indexPath.row) {
        case 0:
            cell.textLabel.text = @"订单号";
            cell.detailTextLabel.text = @"20161349873423";
            break;
        case 1:
            cell.textLabel.text = @"客户姓名";
            cell.detailTextLabel.text = @"20161349873423";
            break;
        case 2:
            cell.textLabel.text = @"手机号";
            cell.detailTextLabel.text = @"20161349873423";
            break;
        case 3:
            cell.textLabel.text = @"车牌号";
            cell.detailTextLabel.text = @"20161349873423";
            break;
        case 4:
            cell.textLabel.text = @"结束码";
            cell.detailTextLabel.text = @"未报价";
            break;
//        case 5:
//            cell.textLabel.text = @"结束码";
//            cell.detailTextLabel.text = @"未报价";
//            break;
            
        default:
            break;
    }
    
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
