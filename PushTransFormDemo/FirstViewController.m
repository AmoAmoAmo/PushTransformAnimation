//
//  FirstViewController.m
//  PushTransFormDemo
//
//  Created by Jane on 16/8/22.
//  Copyright © 2016年 Jane. All rights reserved.
//

#import "FirstViewController.h"
#import "CustomCell.h"
#import "SecondViewController.h"

#import "PushAnimation.h"

@interface FirstViewController ()<UITableViewDataSource,UITableViewDelegate,UINavigationControllerDelegate>

//@property (nonatomic, strong) UITableView *table;

@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    [self.view addSubview:self.table];
    //cell注册方式
    [self.table registerNib:[UINib nibWithNibName:@"CustomCell" bundle:nil] forCellReuseIdentifier:@"cell"];

}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:YES];
    
    self.navigationController.delegate = self;
}




#pragma mark - UINavigationController - Delegate
// nav 协议方法的实现 告知 Nav 去使用 UIViewControllerAnimatedTransitioning协议中的方法
- (nullable id <UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController
                                            animationControllerForOperation:(UINavigationControllerOperation)operation
                                                         fromViewController:(UIViewController *)fromVC
                                                           toViewController:(UIViewController *)toVC  NS_AVAILABLE_IOS(7_0)
{
    if([toVC isKindOfClass:[SecondViewController class]])
    {
        PushAnimation *animation = [[PushAnimation alloc] init];
        return animation;
    }else
    {
        return nil;
    }
    
}






#pragma mark - UITableViewDataSource


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 20;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 238;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CustomCell *cell = [CustomCell cellWithTableView:tableView andindexPath:indexPath];

    return cell;
}

#pragma mark - UITableViewDelegate
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    SecondViewController *vc = [[SecondViewController alloc] init];
    vc.indexPath = indexPath;
    [self.navigationController pushViewController:vc animated:YES];
    
}




#pragma mark - setter and getter
//懒加载
-(UITableView *)table
{
    if (_table == nil)
    {
        _table = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];//style:UITableViewStylePlain(默认 设置分组有悬浮)
        //        _table.separatorStyle = UITableViewCellSeparatorStyleNone;//把table的线去掉
        _table.delegate = self;
        _table.dataSource = self;
    }
    return _table;

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
