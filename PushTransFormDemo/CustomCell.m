//
//  CustomCell.m
//  PushTransFormDemo
//
//  Created by Jane on 16/8/22.
//  Copyright © 2016年 Jane. All rights reserved.
//

#import "CustomCell.h"

@implementation CustomCell

- (void)awakeFromNib {
    // Initialization code
    
//    self.imgView.backgroundColor = [UIColor yellowColor];
}


+(instancetype)cellWithTableView:(UITableView *)tableView andindexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"cell";
    
    CustomCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[CustomCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        
    }
    
    NSInteger num = indexPath.row % 4;
//    NSLog(@"num == %ld", num);
    [cell.imgView setImage:[UIImage imageNamed:[NSString stringWithFormat:@"%ld.jpeg",num]]];
    
    return cell;
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
