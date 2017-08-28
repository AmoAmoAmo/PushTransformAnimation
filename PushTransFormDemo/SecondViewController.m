//
//  SecondViewController.m
//  PushTransFormDemo
//
//  Created by Jane on 16/8/23.
//  Copyright © 2016年 Jane. All rights reserved.
//

#import "SecondViewController.h"
#import "MagicMoveBackTransion.h"
#import "FirstViewController.h"

@interface SecondViewController ()<UINavigationControllerDelegate>

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
//    self.view.backgroundColor = [UIColor lightGrayColor];
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:YES];
    NSInteger num = self.indexPath.row % 4;
    [self.headImgView setImage:[UIImage imageNamed:[NSString stringWithFormat:@"%ld", num]]];
    
    self.navigationController.delegate = self;
    
    /** 重新设置返回手势的代理给nav */
    self.navigationController.interactivePopGestureRecognizer.delegate = (id)self;
}



#pragma mark - UINavigationControllerDelegate
- (nullable id <UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController
                                            animationControllerForOperation:(UINavigationControllerOperation)operation
                                                         fromViewController:(UIViewController *)fromVC
                                                           toViewController:(UIViewController *)toVC  NS_AVAILABLE_IOS(7_0)
{
    if([toVC isKindOfClass:[FirstViewController class]]){
        MagicMoveBackTransion *transion = [[MagicMoveBackTransion alloc] init];
        return transion;
    }else{
        return nil;
    }
}



@end
