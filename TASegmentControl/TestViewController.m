//
//  TestViewController.m
//  TASegmentControl
//
//  Created by 李小盆 on 15/3/13.
//
//

#import "TestViewController.h"
#import "TASegmentControl.h"

@interface TestViewController ()

@end

@implementation TestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
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
}

-(void) actionSegmentClicked :(TASegmentedControl*) sc
{
    switch (sc.selectedSegmentIndex) {

        default:
            break;
    }
}

@end
