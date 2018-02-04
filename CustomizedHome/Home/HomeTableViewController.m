//
//  HomeTableViewController.m
//  CustomizedHome
//
//  Created by 吴柳燕 on 2018/2/3.
//  Copyright © 2018年 吴柳燕. All rights reserved.
//

#import "HomeTableViewController.h"
#import "CarouselTableViewCell.h"
#import "CommonFunctionsTableViewCell.h"
#import "FinancialManagementTableViewCell.h"

@interface HomeTableViewController ()

@end

@implementation HomeTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self registerNib];

}

- (void)registerNib {
    [self.tableView registerNib:[UINib nibWithNibName:@"CarouselTableViewCell" bundle:nil] forCellReuseIdentifier:@"CarouselTableViewCell"];
    [self.tableView registerNib:[UINib nibWithNibName:@"FinancialManagementTableViewCell" bundle:nil] forCellReuseIdentifier:@"FinancialManagementTableViewCell"];
}

- (instancetype)initWithStyle:(UITableViewStyle)style {
    return [super initWithStyle:UITableViewStyleGrouped];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return  180;

}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        CarouselTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CarouselTableViewCell" forIndexPath:indexPath];
        return cell;
    }
    if(indexPath.section == 1) {
        CommonFunctionsTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CommonFunctionsTableViewCell"];
        if (!cell) {
            cell = [[CommonFunctionsTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"CommonFunctionsTableViewCell"];
            return cell;
        }
    }
    if(indexPath.section == 2) {
        FinancialManagementTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"FinancialManagementTableViewCell" forIndexPath:indexPath];
        return cell;
    }
    return nil;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    return [self createHeadViewforSection:section];
}

//- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
//
//}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 30;
}

- (UIView *)createHeadViewforSection:(NSInteger)section {
    UIView *headView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, 30)];
    headView.backgroundColor = [UIColor whiteColor];
    headView.userInteractionEnabled = YES;
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(10, 0, ScreenWidth - 100, 30)];
    label.lineBreakMode = NSLineBreakByWordWrapping;
    label.numberOfLines = 0;
    label.backgroundColor = [UIColor whiteColor];

    if (section == 0) {
        return nil;
    } else if (section == 1)
    {
        label.text = @"常用功能";
    } else {
        label.text = @"特色理财";
        UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(ScreenWidth - 50, 0, 50 ,30)];
        [btn addTarget:self action:@selector(moreBtnClick) forControlEvents:UIControlEventTouchUpInside];
        [btn setTitle:@"更多" forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        btn.backgroundColor = [UIColor whiteColor];
        [headView addSubview:btn];
    }
    [headView addSubview:label];
    return headView;
}
- (void)moreBtnClick {
    NSLog(@"更多");
}




@end
