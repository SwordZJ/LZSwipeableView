//
//  ViewController.m
//  LZSwipeableViewDemo
//
//  Created by 周济 on 16/4/20.
//  Copyright © 2016年 LeoZ. All rights reserved.
//

#import "ViewController.h"
#import "DefaultViewController.h"
@interface ViewController ()
@property (nonatomic, strong) NSArray *demoList;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.demoList = @[
                      @"default",
                      @"headerViewShow",
                      @"footerViewShow"
                      ];
    [self.tableView reloadData];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Table view data source
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.demoList.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    cell.textLabel.text = self.demoList[indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    DefaultViewController *mormalVc = [DefaultViewController new];
    mormalVc.hidesBottomBarWhenPushed = YES;
    mormalVc.title = self.demoList[indexPath.row];
    [self.navigationController pushViewController:mormalVc animated:YES];
}


@end
