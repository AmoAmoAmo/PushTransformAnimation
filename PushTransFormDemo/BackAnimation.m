//
//  BackAnimation.m
//  PushTransFormDemo
//
//  Created by Jane on 16/8/24.
//  Copyright © 2016年 Jane. All rights reserved.
//

#import "BackAnimation.h"
#import "FirstViewController.h"
#import "SecondViewController.h"
#import "CustomCell.h"

@implementation BackAnimation

- (NSTimeInterval)transitionDuration:(nullable id <UIViewControllerContextTransitioning>)transitionContext
{
    return 0.6;
}


- (void)animateTransition:(id <UIViewControllerContextTransitioning>)transitionContext
{
    FirstViewController *firstVC = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    SecondViewController *secondVC = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIView *containerView = [transitionContext containerView];
    
    // 2.在前一个VC上创建一个截图
    UIView *snapShotView = [secondVC.headImgView snapshotViewAfterScreenUpdates:NO];
    // 获取firstVC中图片的位置
    CustomCell *cell = [firstVC.table cellForRowAtIndexPath:[firstVC.table indexPathForSelectedRow]];
    CGRect firstFrame  = [containerView convertRect:cell.imgView.frame fromView:cell];
    CGRect secondFrame = [containerView convertRect:secondVC.headImgView.frame fromView:secondVC.view];
    snapShotView.frame = secondFrame;
    secondVC.headImgView.hidden = YES;
    cell.imgView.hidden = YES;
//    NSLog(@"firstFrame = %@, secondFrame = %@, secondVC = %@",NSStringFromCGRect(firstFrame),NSStringFromCGRect(secondFrame), NSStringFromCGRect(secondVC.view.frame));
    
    // 3.设置firstVC控制器的位置
    firstVC.view.frame = [transitionContext finalFrameForViewController:firstVC];//初始化firstVC的位置
    
    
    // 4.把动画前后的两个ViewController加到容器中,顺序很重要,snapShotView在上方  就是截图和secondVC.view之间的动画
    [containerView insertSubview:firstVC.view belowSubview:secondVC.view];//firstVC.view在secondVC.view的下面
    [containerView addSubview:snapShotView];
    
    // 5.执行动画。第二个控制器的透明度0~1；让截图SnapShotView的位置更新到最新
    [UIView animateWithDuration:0.6 delay:0 usingSpringWithDamping:0.6 initialSpringVelocity:1 options:UIViewAnimationOptionCurveLinear animations:^{
        secondVC.view.alpha = 0;
        snapShotView.frame = firstFrame;
    } completion:^(BOOL finished) {
        [snapShotView removeFromSuperview];
        secondVC.headImgView.hidden = NO;
        cell.imgView.hidden = NO;
        [transitionContext completeTransition:YES];
    }];
}

@end
