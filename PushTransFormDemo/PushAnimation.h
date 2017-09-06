//
//  PushAnimation.h
//  PushTransFormDemo
//
//  Created by Jane on 16/8/23.
//  Copyright © 2016年 Jane. All rights reserved.
//
//  实现协议的两个方法，并在其中编写 Push 的动画。   转场动画

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

/*
 添加一个 Cocoa Touch Class，继承自 NSObject，取名 MagicMoveTransion，遵守 UIViewControllerAnimatedTransitioning 协议。
 
 实现该协议的方法
 
 */

@interface PushAnimation : NSObject<UIViewControllerAnimatedTransitioning>

@end
