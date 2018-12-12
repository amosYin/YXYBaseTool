//
//  YXY_PickerViewForPurchaseOrder.m
//  Insurance
//
//  Created by Amos on 2018/9/7.
//  Copyright © 2018年 com.uqiauto. All rights reserved.
//

#import "YXY_PickerViewForPurchaseOrder.h"
#import "Masonry.h"
#import "My_Define.h"
#import "UIView+Extend.h"

@interface YXY_PickerViewForPurchaseOrder()<UIPickerViewDelegate,UIPickerViewDataSource>
{
    UIView *bgv;
    UIButton *cancel;
    UIButton *sureBtn;
    UILabel *titleLab;
}
@property(nonatomic,strong) UIPickerView *myDatePicker;

@end
@implementation YXY_PickerViewForPurchaseOrder
#pragma mark - setter get 方法
- (void)setTitle:(NSString *)title{
    _title = title;
    titleLab.text = title;
    NSMutableAttributedString * tempString = [[NSMutableAttributedString alloc] initWithString: titleLab.text];
    [tempString addAttribute:NSForegroundColorAttributeName value:[UIColor redColor] range:NSMakeRange(2, title.length-2)];
    titleLab.attributedText = tempString;
}
- (void)setDateArr:(NSArray *)dateArr{
    _dateArr = dateArr;
}


- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        
        [self initUI];
        
    }
    return self;
}

- (void)initUI{
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tap:)];
    [self addGestureRecognizer:tap];
    
    
//    self.myDatePicker = [[UIPickerView alloc] initWithFrame:CGRectMake(0, self.height-300, SCREEN_WIDTH, 200)];
    self.myDatePicker = [UIPickerView new];
    self.myDatePicker.backgroundColor = [UIColor whiteColor];
    self.myDatePicker.delegate = self;
    self.myDatePicker.dataSource = self;
    [self addSubview:self.myDatePicker];
//    [self.myDatePicker selectRow:[self.dateArr count]/2 inComponent:0 animated:NO];
    
    bgv = [UIView new];
    bgv.backgroundColor = [UIColor whiteColor];
    [self addSubview:bgv];
    
    
    cancel = [UIButton buttonWithType:UIButtonTypeCustom];
    cancel.frame = CGRectMake(20, 8.5, 40, 30);
    [cancel setTitle:@"取消" forState:UIControlStateNormal];
    [cancel setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    cancel.titleLabel.font = [UIFont systemFontOfSize:17];
    [cancel addTarget:self action:@selector(cancelClick) forControlEvents:UIControlEventTouchUpInside];
    [bgv addSubview:cancel];

    sureBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    sureBtn.frame = CGRectMake(self.width-60, 8.5, 40, 30);
    [sureBtn setTitle:@"确定" forState:UIControlStateNormal];
    [sureBtn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    sureBtn.titleLabel.font = [UIFont systemFontOfSize:17];
    [sureBtn addTarget:self action:@selector(sureBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [bgv addSubview:sureBtn];
    
    titleLab = [UILabel new];
    titleLab.text = @"title";
    titleLab.textColor = HexRGB(0x333333);
    titleLab.textAlignment = NSTextAlignmentCenter;
    titleLab.font = [UIFont systemFontOfSize:14];
    [bgv addSubview:titleLab];
}

- (void)layoutSubviews{
    [_myDatePicker mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(150);
        make.width.mas_equalTo(self.width);
        make.bottom.mas_equalTo(0);
        make.left.mas_equalTo(0);
    }];
    [bgv mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(0);
        make.width.mas_equalTo(self.width);
        make.height.mas_equalTo(40);
        make.bottom.mas_equalTo(_myDatePicker.mas_top);
    }];
    [cancel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(20);
        make.width.mas_equalTo(40);
        make.height.mas_equalTo(40);
        make.top.mas_equalTo(0);
    }];
    [sureBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(-20);
        make.width.mas_equalTo(40);
        make.height.mas_equalTo(40);
        make.top.mas_equalTo(0);
    }];
    [titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(cancel.mas_right);
        make.right.mas_equalTo(sureBtn.mas_left);
        make.top.bottom.mas_equalTo(0);
    }];
}

#pragma mark pickerview function

- (void)cancelClick{
    self.hidden = YES;
}

- (void)sureBtnClick{
    NSInteger row = [_myDatePicker selectedRowInComponent:0];
    if (self.returnDate) {
        self.returnDate([_dateArr objectAtIndex:row]);
    }
    self.hidden = YES;
}

- (void)tap:(UITapGestureRecognizer *)tap {
    self.hidden = YES;
}

//返回有几列

-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView

{
    
    return 1;
    
}

//返回指定列的行数

-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component

{
    
    return [_dateArr count];
    
}

//返回指定列，行的高度，就是自定义行的高度

- (CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component{
    
    return 30.0f;
    
}

//返回指定列的宽度

- (CGFloat) pickerView:(UIPickerView *)pickerView widthForComponent:(NSInteger)component{
    return self.width;
}



// 自定义指定列的每行的视图，即指定列的每行的视图行为一致

- (UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view{

    if (!view){

        view = [[UIView alloc]init];

    }

    UILabel *text = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, self.frame.size.width, 30)];

    text.textAlignment = NSTextAlignmentCenter;

    text.text = [_dateArr objectAtIndex:row];

    [view addSubview:text];

    //隐藏上下直线

    [_myDatePicker.subviews objectAtIndex:1].backgroundColor = HexRGB(0x999999);

    [_myDatePicker.subviews objectAtIndex:2].backgroundColor = HexRGB(0x999999);

    return view;

}

//显示的标题

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    
    NSString *str = [_dateArr objectAtIndex:row];
    
    return str;
    
}

//显示的标题字体、颜色等属性

- (NSAttributedString *)pickerView:(UIPickerView *)pickerView attributedTitleForRow:(NSInteger)row forComponent:(NSInteger)component{

    NSString *str = [_dateArr objectAtIndex:row];

    NSMutableAttributedString *AttributedString = [[NSMutableAttributedString alloc] initWithString:str];

    [AttributedString addAttributes:@{NSFontAttributeName:[UIFont boldSystemFontOfSize:20], NSForegroundColorAttributeName:HexRGB(0x666666)} range:NSMakeRange(0, [AttributedString  length])];



    return AttributedString;

}//NS_AVAILABLE_IOS(6_0);



//被选择的行

-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    
    
    
    NSLog(@"HANG%@",[_dateArr objectAtIndex:row]);
    
    
    
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
