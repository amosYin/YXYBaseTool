//
//  UILabelSubject.h
//  houdu
//
//  Created by Amos on 2018/3/28.
//  Copyright © 2018年 Amos. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TextModel : NSObject

@property (nonatomic, copy) NSString *str;

@property (nonatomic, assign) NSRange range;

@end

@interface UILabelSubject : UILabel
/**
 给文本添加点击事件（使用字符串标记）
 
 @param strings 需要添加点击事件的字符串数组
 @param tapClick 点击的回调block
 */
- (void)addAttributeActionWithStrings:(NSArray *)strings
                      tapTargetAction:(void (^) (NSString *string ,                                                               NSRange range ,
                                                 NSInteger index))tapClick;

/**
 给文本添加点击事件（使用范围标记）
 
 @param tapRange 需要添加点击事件的范围数组
 @param tapClick 点击的回调block
 */
- (void)addAttributeActionWithRange:(NSArray*)tapRange
                    tapTargetAction:(void (^)
                                     (NSString *string , NSRange range , NSInteger index))tapClick;

@end
