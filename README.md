# TASegmentAnimationControl

![image](https://github.com/jiaopen/TASegmentAnimationControl/blob/master/screenshot.gif)

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
