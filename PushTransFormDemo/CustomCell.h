//
//  CustomCell.h
//  PushTransFormDemo
//
//  Created by Jane on 16/8/22.
//  Copyright © 2016年 Jane. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *imgView;

+(instancetype)cellWithTableView:(UITableView *)tableView andindexPath:(NSIndexPath *)indexPath;

@end
