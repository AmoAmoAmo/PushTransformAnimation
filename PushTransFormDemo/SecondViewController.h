//
//  SecondViewController.h
//  PushTransFormDemo
//
//  Created by Jane on 16/8/23.
//  Copyright © 2016年 Jane. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SecondViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIImageView *headImgView;
@property (weak, nonatomic) IBOutlet UITextView *textView;
@property (nonatomic, strong) NSIndexPath *indexPath;
@end
