//
//  AppointmentViewController.m
//  CloudService
//
//  Created by 安永超 on 16/2/26.
//  Copyright © 2016年 zhangqiang. All rights reserved.
//

#import "AppointmentViewController.h"
#import "PlaceholderTextView.h"
#import "PellTableViewSelect.h"
#import "HZQDatePickerView.h"

#undef  RGBCOLOR
#define RGBCOLOR(r,g,b) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:1]

@interface AppointmentViewController ()<HZQDatePickerViewDelegate>
@property (nonatomic, strong) PlaceholderTextView * textView;
@property (weak, nonatomic)IBOutlet UIView *bgView;
@property (weak, nonatomic) IBOutlet UILabel *lbCode;
@property (weak, nonatomic) IBOutlet UILabel *lbDate;
@property (strong, nonatomic)HZQDatePickerView *pickerView;//时间选择器
@end

@implementation AppointmentViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    __weak typeof(self) weakSelf = self;
    [weakSelf setLeftImageBarButtonItemWithFrame:CGRectMake(0, 0, 20, 20) image:@"title-back" selectImage:@"back" action:^(AYCButton *button) {
        [weakSelf.navigationController popViewControllerAnimated:YES];
    }];
    [self.bgView addSubview:self.textView];
    self.lbCode.userInteractionEnabled = YES;
    UITapGestureRecognizer *codeTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(codeClick:)];
    [self.lbCode addGestureRecognizer:codeTap];
    
    self.lbDate.userInteractionEnabled = YES;
    UITapGestureRecognizer *dateTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dateClick:)];
    [self.lbDate addGestureRecognizer:dateTap];
    // Do any additional setup after loading the view.
}

- (void)codeClick:(UITapGestureRecognizer *)tap {
    [self resignKeyBoardInView:self.view];
    [PellTableViewSelect addPellTableViewSelectWithWindowFrame:CGRectMake(110, 135, 200, 200) selectData:
     
     @[@"筛选1",@"筛选2",@"筛选3",@"筛选4",@"筛选5"]
                                                        action:^(NSInteger index) {
                                                            
                                                            NSLog(@"选择了 %ld",index);
                                                        } animated:YES];
}

- (void)dateClick:(UITapGestureRecognizer *)tap {
    [self resignKeyBoardInView:self.view];
    [self setupDateView:DateTypeOfStart];
}

#pragma mark HZQDatePickerView
- (void)setupDateView:(DateType)type {
    
    _pickerView = [HZQDatePickerView instanceDatePickerView];
    _pickerView.frame = CGRectMake(0, 0, KWidth, KHeight + 20);
    [_pickerView setBackgroundColor:[UIColor clearColor]];
    [_pickerView.datePickerView setDatePickerMode:UIDatePickerModeDateAndTime];
    _pickerView.delegate = self;
    _pickerView.type = type;
    [_pickerView.datePickerView setMinimumDate:[NSDate date]];
    [self.view addSubview:_pickerView];
    
}

- (void)getSelectDate:(NSDate *)date type:(DateType)type {

    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy年MM月dd日 HH:mm"];
    NSString *currentOlderOneDateStr = [dateFormatter stringFromDate:date];
    switch (type) {
        case DateTypeOfStart:
            
            self.lbDate.text = currentOlderOneDateStr;
            
            break;
            
            
        default:
            break;
    }
}
-(PlaceholderTextView *)textView{
    
    if (!_textView) {
        _textView = [[PlaceholderTextView alloc]initWithFrame:CGRectMake(15, 155, self.view.frame.size.width - 30, 70)];
        _textView.backgroundColor = [UIColor whiteColor];
        _textView.font = [UIFont systemFontOfSize:15.f];
        _textView.textColor = [UIColor blackColor];
        _textView.textAlignment = NSTextAlignmentLeft;
        _textView.editable = YES;
        _textView.placeholderColor = RGBCOLOR(0x89, 0x89, 0x89);
        _textView.placeholder = @"请输入备注内容";

    }
    
    return _textView;
}
- (IBAction)save:(id)sender {
}
/** 消失键盘*/
- (void)resignKeyBoardInView:(UIView *)view

{
    
    for (UIView *v in view.subviews) {
        
        if ([v.subviews count] > 0) {
            
            [self resignKeyBoardInView:v];
            
        }
        
        if ([v isKindOfClass:[UITextView class]] || [v isKindOfClass:[UITextField class]]) {
            
            [v resignFirstResponder];
            
        }
        
    }
    
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
