# TASegmentAnimationControl

![image](https://github.com/jiaopen/TASegmentAnimationControl/blob/master/screenshot.gif)

.h

```Objective-C
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
```

how to use

```Objective-C
TASegmentedControl* segmentedControl = [[TASegmentedControl alloc] initWithItems:@[@"猪肉大葱", @"猪肉茴香", @"牛肉大葱", @"韭菜鸡蛋"]];
segmentedControl.selectedSegmentTextColor = [UIColor blueColor];
segmentedControl.segmentTextColor = [UIColor blackColor];
segmentedControl.borderColor = [UIColor grayColor];
segmentedControl.segmentBackgroundColor = [UIColor whiteColor];
segmentedControl.selectedSegmentBackgroundColor = [UIColor lightGrayColor];
segmentedControl.titleFont = [UIFont boldSystemFontOfSize:14];
segmentedControl.selectedSegmentIndex = 0;
[segmentedControl addTarget:self action:@selector(actionSegmentClicked:) forControlEvents:UIControlEventValueChanged];
[self.view addSubview:segmentedControl];
segmentedControl.frame = CGRectMake(0, 44, 320, 40);
```