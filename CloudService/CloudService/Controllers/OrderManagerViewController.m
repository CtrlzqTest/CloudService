//
//  OrderManagerViewController.m
//  CloudService
//
//  Created by 安永超 on 16/2/23.
//  Copyright © 2016年 zhangqiang. All rights reserved.
//

#import "OrderManagerViewController.h"
#import "OrderManagerCell.h"
#import <MJRefresh.h>

@interface OrderManagerViewController ()<LazyPageScrollViewDelegate,UITableViewDataSource,UITableViewDelegate>

@end

@implementation OrderManagerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initPageView];
    // Do any additional setup after loading the view.
}
#pragma mark pageView
- (void)initPageView {
    _pageView.delegate=self;
    [_pageView initTab:YES Gap:44 TabHeight:44 VerticalDistance:0 BkColor:[HelperUtil colorWithHexString:@"#F4F4F4"]];
    UITableView *tableView = [[UITableView alloc] init];
    // 下拉刷新
    tableView.mj_header= [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        // 模拟延迟加载数据，因此2秒后才调用（真实开发中，可以移除这段gcd代码）
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            // 结束刷新
            [tableView.mj_header endRefreshing];
        });
    }];
    
    // 设置自动切换透明度(在导航栏下面自动隐藏)
    tableView.mj_header.automaticallyChangeAlpha = YES;
    
    // 上拉刷新
    tableView.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
        // 模拟延迟加载数据，因此2秒后才调用（真实开发中，可以移除这段gcd代码）
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            // 结束刷新
            [tableView.mj_footer endRefreshing];
        });
    }];

    tableView.tag = 100;
    tableView.delegate = self;
    tableView.dataSource = self;
    [_pageView addTab:@"未支付订单" View:tableView Info:nil];
    tableView = [[UITableView alloc] init];
    tableView.tag = 101;
    tableView.delegate = self;
    tableView.dataSource = self;
    [_pageView addTab:@"待支付订单" View:tableView Info:nil];
    
    tableView = [[UITableView alloc] init];
    tableView.tag = 102;
    tableView.delegate = self;
    tableView.dataSource = self;
    [_pageView addTab:@"已支付订单" View:tableView Info:nil];
   
    [_pageView enableTabBottomLine:YES LineHeight:2 LineColor:[UIColor blueColor] LineBottomGap:4 ExtraWidth:15];
    [_pageView enableBreakLine:YES Width:2 TopMargin:0 BottomMargin:0 Color:[UIColor purpleColor]];
//    [_pageView setTitleStyle:[UIFont systemFontOfSize:16] SelFont:[UIFont systemFontOfSize:16] Color:[UIColor blackColor] SelColor:[UIColor blueColor]];
//    [_pageView generate:^(UIButton *firstTitleControl, UIView *viewTitleEffect) {
//        
//    }];
}

- (void)LazyPageScrollViewPageChange:(LazyPageScrollView *)pageScrollView Index:(NSInteger)index PreIndex:(NSInteger)preIndex TitleEffectView:(UIView *)viewTitleEffect SelControl:(UIButton *)selBtn {
    NSLog(@"之前下标：%ld 当前下标：%ld",preIndex,index);
}

-(void)LazyPageScrollViewEdgeSwipe:(LazyPageScrollView *)pageScrollView Left:(BOOL)bLeft
{
    if(bLeft)
    {
        NSLog(@"left");
    }
    else
    {
        NSLog(@"right");
    }
}
#pragma mark tableView
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 10;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString *cellId=@"cell";
    
    OrderManagerCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (cell == nil) {
        NSArray *array = [[NSBundle mainBundle] loadNibNamed:@"OrderManagerCell" owner:self options:nil];
        cell = [array objectAtIndex:0];
        
    }
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 123;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
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
