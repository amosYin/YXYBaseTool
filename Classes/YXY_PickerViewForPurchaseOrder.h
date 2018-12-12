//
//  YXY_PickerViewForPurchaseOrder.h
//  Insurance
//
//  Created by Amos on 2018/9/7.
//  Copyright © 2018年 com.uqiauto. All rights reserved.
//

#import <UIKit/UIKit.h>


@protocol YXY_PickerForPurchaseOrderDelegate;



@interface YXY_PickerViewForPurchaseOrder : UIView
@property (nonatomic,copy) NSString *title;
@property(nonatomic,copy) NSArray *dateArr;//@[@"字符串类型时间"];
@property (nonatomic,copy) void (^returnDate)(NSString *str);
@end


