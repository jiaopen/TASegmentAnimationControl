//
//  TASegmentControl.h
//  Triphare
//
//  Created by 李小盆 on 15/3/13.
//  Copyright (c) 2015年 ___LOTTO___. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TASegmentedControl : UIControl<NSCoding>

@property (strong, nonatomic) UIColor*    segmentTextColor;
@property (strong, nonatomic) UIColor*    selectedSegmentTextColor;
@property (strong, nonatomic) UIColor*    selectedSegmentBackgroundColor;
@property (strong, nonatomic) UIColor*    borderColor;
@property (strong, nonatomic) UIColor*    segmentBackgroundColor;
@property (strong, nonatomic) UIFont*     titleFont;
@property (assign, nonatomic) NSInteger   selectedSegmentIndex;


- (id)initWithItems:(NSArray *)items;

@end
