//
//  MagicMoveTransion.m
//  PushTransFormDemo
//
//  Created by Jane on 16/8/23.
//  Copyright © 2016年 Jane. All rights reserved.
//

#import "MagicMoveTransion.h"
#import "ViewController.h"
#import "SecondViewController.h"
#import "CustomCell.h"

@implementation MagicMoveTransion

// synchronize with the main animation.
- (NSTimeInterval)transitionDuration:(nullable id <UIViewControllerContextTransitioning>)transitionContext
{
    return 0.6;
}


// This method can only  be a nop if the transition is interactive and not a percentDriven interactive transition.
/**
 1、 - (UIView *)containerView;  //转场动画发生的容器
 
 2、 - (UIViewController *)viewControllerForKey:(NSString *)key;
 // 我们可以通过它拿到过渡的两个 ViewController。
 3、 - (CGRect)initialFrameForViewController:(UIViewController *)vc;
 - (CGRect)finalFrameForViewController:(UIViewController *)vc;
 // 通过这两个方法，可以获得过度动画前后两个ViewController的frame。
 */
- (void)animateTransition:(id <UIViewControllerContextTransitioning>)transitionContext
{
    // 1.获取两个VC 和 动画发生的容器
    ViewController *firstVC = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    SecondViewController *secondVC = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    UIView *containerView = [transitionContext containerView];  // 此处容器大小即为屏幕大小 self.view
    
    // 2.创建一个 Cell 中 imageView 的截图，并把 imageView 隐藏，造成使用户以为移动的就是 imageView 的假象
    CustomCell *cell = [firstVC.table cellForRowAtIndexPath:[firstVC.table indexPathForSelectedRow]];
    firstVC.indexPath = [firstVC.table indexPathForSelectedRow];
    /** 截图 */
    UIView *snapShotView = [cell.imgView snapshotViewAfterScreenUpdates:NO];
    CGRect firstFrame  = [containerView convertRect:cell.imgView.frame fromView:cell];
    CGRect secondFrame = [containerView convertRect:secondVC.headImgView.frame fromView:secondVC.view];
    snapShotView.frame = firstFrame;
    cell.imgView.hidden = YES;
    
    // 3.设置第二个控制器的位置、透明度，并把透明度设为0，在后面的动画中慢慢显示出来变为1
    secondVC.view.frame = [transitionContext finalFrameForViewController:secondVC];//初始化secondVC的位置,否则约束无效
    secondVC.view.alpha = 0;
    secondVC.headImgView.hidden = YES;
    
    // 4.把动画前后的两个ViewController加到容器中,顺序很重要,snapShotView在上方 就是截图和secondVC.view之间的动画
    [containerView addSubview:secondVC.view];
    [containerView addSubview:snapShotView];
    
    // 5.执行动画。第二个控制器的透明度0~1；让截图SnapShotView的位置更新到最新 弹性       弹性比例        最初的       速度(时间)
    [UIView animateWithDuration:0.6 delay:0 usingSpringWithDamping:0.6 initialSpringVelocity:1 options:UIViewAnimationOptionCurveLinear animations:^{
        [containerView layoutIfNeeded];
        secondVC.view.alpha = 1;
        snapShotView.frame = secondFrame;
    } completion:^(BOOL finished) {
        //为了让回来的时候，cell上的图片显示，必须要让cell上的图片显示出来
        cell.imgView.hidden = NO;
        secondVC.headImgView.hidden = NO;
        [snapShotView removeFromSuperview];
        //告诉系统动画结束 一定要记得动画完成后执行此方法，让系统管理 navigation
        [transitionContext completeTransition:YES];
    }];
}

@end
