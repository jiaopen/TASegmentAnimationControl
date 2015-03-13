//
//  TASegmentControl.m
//  Triphare
//
//  Created by 李小盆 on 15/3/13.
//  Copyright (c) 2015年 ___LOTTO___. All rights reserved.
//

#import "TASegmentControl.h"


@interface TASegmentControlSelectedBackgroundView : UIView

@end


@interface TASegmentedControl ()

@property (strong, nonatomic) NSMutableArray*       items;
@property (strong, nonatomic) UIView*     selectedBackgroundView;

@end


@implementation TASegmentedControl

- (id)init
{
    if ((self = [super init]))
    {
        _items = [[NSMutableArray alloc] init];
        _selectedSegmentIndex = -1;
        _segmentTextColor = [UIColor colorWithRed:0.451 green:0.451 blue:0.451 alpha:1];
        _selectedSegmentTextColor = [UIColor colorWithRed:0.169 green:0.169 blue:0.169 alpha:1];
        
        [self.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
        self.autoresizingMask = UIViewAutoresizingFlexibleWidth;
        
        _selectedBackgroundView = [[UIView alloc] init];
        _selectedBackgroundView.backgroundColor = [UIColor grayColor];
        [self addSubview:_selectedBackgroundView];
    }
    return self;
}


- (id)initWithItems:(NSArray *)items
{
    if ((self = [self init]))
    {
        [items enumerateObjectsUsingBlock:^(id title, NSUInteger idx, BOOL *stop)
         {
             UILabel *segmentView = [[UILabel alloc] init];
             segmentView.text = title;
             segmentView.textColor = self.segmentTextColor;
             segmentView.font = [UIFont systemFontOfSize:14];
             segmentView.backgroundColor = UIColor.clearColor;
             segmentView.textAlignment = NSTextAlignmentCenter;
             segmentView.userInteractionEnabled = YES;
             [segmentView addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(actionSelected:)]];
             [self addSubview:segmentView];
             [self.items addObject:segmentView];
         }];
    }
    return self;
}


- (void)layoutSubviews
{
    [_items enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        UIView* item = obj;
        item.backgroundColor = [UIColor clearColor];
#ifdef mas_equalTo
        [item remakeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.mas_top);
            make.bottom.equalTo(self.mas_bottom);
            make.width.equalTo(@(CGRectGetWidth(self.frame)/_items.count));
            make.left.equalTo(@(CGRectGetWidth(self.frame)/_items.count * idx));
        }];
#else
        item.frame = CGRectMake(CGRectGetWidth(self.frame)/_items.count * idx, 0, CGRectGetWidth(self.frame)/_items.count, CGRectGetHeight(self.frame));
#endif
    }];
    
#ifndef mas_equalTo
    UIView *selectedItem = self.items[self.selectedSegmentIndex];
    if (CGRectEqualToRect(_selectedBackgroundView.frame, CGRectZero)) {
        _selectedBackgroundView.frame = selectedItem.frame;
    }
#endif

    self.layer.cornerRadius = self.frame.size.height / 6;
    self.layer.borderWidth = 1;
    self.layer.borderColor = _borderColor.CGColor;
    
    _selectedBackgroundView.layer.cornerRadius = self.frame.size.height / 6;
    _selectedBackgroundView.layer.borderWidth = 1;
    _selectedBackgroundView.layer.borderColor = _borderColor.CGColor;
}

- (void)setTitle:(NSString *)title forSegmentAtIndex:(NSUInteger)segment
{
    NSUInteger index = MAX(MIN(segment, self.items.count - 1), 0);
    UILabel *segmentView = self.items[index];
    segmentView.text = title;
    [segmentView sizeToFit];
    [self setNeedsLayout];
}

- (NSString *)titleForSegmentAtIndex:(NSUInteger)segment
{
    NSUInteger index = MAX(MIN(segment, self.items.count - 1), 0);
    UILabel *segmentView = self.items[index];
    return segmentView.text;
}

- (void)setSelectedSegmentIndex:(NSInteger)selectedSegmentIndex
{
    if (_selectedSegmentIndex != selectedSegmentIndex)
    {
        NSParameterAssert(selectedSegmentIndex < self.items.count);
        _selectedSegmentIndex = selectedSegmentIndex;
        
        if (_selectedSegmentIndex == -1)
        {
            _selectedBackgroundView.hidden = NO;
        }
        else
        {
            UIView *selectedItem = self.items[self.selectedSegmentIndex];
           
            BOOL animated = !_selectedBackgroundView.hidden && !CGRectEqualToRect(_selectedBackgroundView.frame, CGRectZero);
            UIView.animationsEnabled = animated;
#ifdef mas_equalTo
            [_selectedBackgroundView remakeConstraints:^(MASConstraintMaker *make) {
                make.top.equalTo(selectedItem.mas_top);
                make.bottom.equalTo(selectedItem.mas_bottom);
                make.width.equalTo(selectedItem.mas_width);
                make.left.equalTo(selectedItem.mas_left);
            }];
#else

#endif
            for (UILabel *item in self.items)
            {
                if (item == selectedItem)
                {
                    item.textColor = _selectedSegmentTextColor;
                }
                else
                {
                    item.textColor = _segmentTextColor;
                }
            }
            [UIView animateWithDuration:animated ? 0.2 : 0 animations:^
             {
#ifdef mas_equalTo
                 [self setNeedsLayout];
                 [self layoutIfNeeded];
#else
                 _selectedBackgroundView.frame = selectedItem.frame;
#endif
             }
                             completion:^(BOOL finished)
             {
                
                 
             }];
            UIView.animationsEnabled = YES;
        }
        [self setNeedsLayout];
    }
}

- (void)actionSelected:(UIGestureRecognizer *)gestureRecognizer
{
    NSUInteger index = [self.items indexOfObject:gestureRecognizer.view];
    if (index != NSNotFound)
    {
        self.selectedSegmentIndex = index;
        [self sendActionsForControlEvents:UIControlEventValueChanged];
    }
}

-(void)setSegmentTextColor:(UIColor *)segmentTextColor
{
    [_items enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        UILabel* item = obj;
        item.textColor = segmentTextColor;
    }];
}

-(void)setSegmentBackgroundColor:(UIColor *)segmentBackgroundColor
{
    self.backgroundColor = segmentBackgroundColor;
}

-(void)setSelectedSegmentTextColor:(UIColor *)selectedSegmentTextColor
{
    _selectedSegmentTextColor = selectedSegmentTextColor;
    [self setNeedsLayout];
}

-(void)setSelectedSegmentBackgroundColor:(UIColor *)selectedSegmentBackgroundColor
{
    _selectedBackgroundView.backgroundColor = selectedSegmentBackgroundColor;
}

-(void)setBorderColor:(UIColor *)borderColor
{
    _borderColor = borderColor;
    [self setNeedsLayout];
}

-(void)setTitleFont:(UIFont *)titleFont
{
    [_items enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        UILabel* item = obj;
        item.font = titleFont;
    }];
}
@end
