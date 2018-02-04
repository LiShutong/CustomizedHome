//
//  ViewController.m
//  CustomizedHome
//
//  Created by 吴柳燕 on 2018/2/3.
//  Copyright © 2018年 吴柳燕. All rights reserved.
//

#import "ViewController.h"



@interface ViewController ()<UIScrollViewDelegate>

@property (nonatomic, strong) UIScrollView *scrollView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

}

//- (void)initScrollView {
//    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight * 2)];
//    scrollView.delegate = self;
//    scrollView.backgroundColor = [UIColor yellowColor];
//    [self.view addSubview:scrollView];
//
//    //设置滚动的属性
//    scrollView.showsHorizontalScrollIndicator = true;
//    scrollView.showsVerticalScrollIndicator = true;
//    scrollView.pagingEnabled = YES;
//    scrollView.contentSize = CGSizeMake(0, ScreenHeight * 3);
//    scrollView.bounces = NO;
//    self.scrollView = scrollView;
//
//    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(100, 100, 100, 50)];
//    btn.backgroundColor = [UIColor redColor];
//    [self.scrollView addSubview:btn];
//}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
