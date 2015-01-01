//
//  ResultViewController.m
//  CloudService
//
//  Created by 安永超 on 16/2/23.
//  Copyright © 2016年 zhangqiang. All rights reserved.
//

#import "ResultViewController.h"
#import "ResultTableViewCell.h"

@interface ResultViewController ()<LazyPageScrollViewDelegate,UITableViewDelegate,UITableViewDataSource>

@end

@implementation ResultViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initPageView];
    // Do any additional setup after loading the view.
}
- (void)viewWillAppear:(BOOL)animated {
    self.tabBarController.title = @"业绩查询";
    [self.navigationController setNavigationBarHidden:NO animated:NO];
    self.tabBarController.navigationItem.rightBarButtonItem = nil;
}

#pragma mark pageView
- (void)initPageView {
    _pageView.delegate=self;
    [_pageView initTab:YES Gap:38 TabHeight:38 VerticalDistance:0 BkColor:[UIColor whiteColor]];
    UITableView *tableView = [[UITableView alloc] init];
    tableView.backgroundColor = [HelperUtil colorWithHexString:@"F4F4F4"];
    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;

    tableView.tag = 100;
    tableView.delegate = self;
    tableView.dataSource = self;
    [_pageView addTab:@"当日业绩" View:tableView Info:nil];
    tableView = [[UITableView alloc] init];
    tableView.tag = 101;
    tableView.delegate = self;
    tableView.dataSource = self;
    [_pageView addTab:@"本周业绩" View:tableView Info:nil];
    
    tableView = [[UITableView alloc] init];
    tableView.tag = 102;
    tableView.delegate = self;
    tableView.dataSource = self;
    [_pageView addTab:@"本月业绩" View:tableView Info:nil];
    
    [_pageView enableTabBottomLine:YES LineHeight:2 LineColor:[HelperUtil colorWithHexString:@"277FD9"] LineBottomGap:0 ExtraWidth:15];
    [_pageView enableBreakLine:YES Width:2 TopMargin:0 BottomMargin:0 Color:[UIColor lightGrayColor]];
    [_pageView setTitleStyle:[UIFont systemFontOfSize:14] SelFont:[UIFont systemFontOfSize:16] Color:[UIColor blackColor] SelColor:[HelperUtil colorWithHexString:@"277FD9"]];
    [_pageView generate:^(UIButton *firstTitleControl, UIView *viewTitleEffect) {
        
    }];
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
    
    ResultTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (cell == nil) {
        NSArray *array = [[NSBundle mainBundle] loadNibNamed:@"ResultTableViewCell" owner:self options:nil];
        cell = [array objectAtIndex:1];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 89;
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
