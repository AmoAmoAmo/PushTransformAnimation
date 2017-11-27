//
//  CustomCell.m
//  PushTransFormDemo
//
//  Created by Jane on 16/8/22.
//  Copyright © 2016年 Jane. All rights reserved.
//

#import "CustomCell.h"

@interface CustomCell ()


@end


@implementation CustomCell

- (void)awakeFromNib {
    // Initialization code
    [super awakeFromNib];
    self.selectionStyle = UITableViewCellSelectionStyleNone;//去掉cell选中效果

    self.bgView.clipsToBounds = YES;
    self.bgView.layer.cornerRadius = 20;
    
    //    // 设置阴影
    self.imgView.clipsToBounds = YES;
    self.imgView.layer.cornerRadius = 20;
    
    self.contentView.clipsToBounds = YES;
    self.layer.cornerRadius = 20;
    self.contentView.layer.cornerRadius = 20.0f;
    
    self.layer.shadowColor = [UIColor darkGrayColor].CGColor;
    self.layer.shadowOffset = CGSizeMake(5, 5);
    self.layer.shadowRadius = 4.0f;
    self.layer.shadowOpacity = 0.5f;
}



+(instancetype)cellWithTableView:(UITableView *)tableView andindexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"cell";
    
    CustomCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[CustomCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        
    }
    
    NSInteger num = indexPath.row % 4;
    [cell.imgView setImage:[UIImage imageNamed:[NSString stringWithFormat:@"%ld.jpeg",num]]];

    return cell;
}

-(void)setFrame:(CGRect)frame
{
    frame.origin.x += 10;
    frame.origin.y += 20;
    frame.size.width -= 20;
    frame.size.height -= 20;
//    NSLog(@"---- x= %.f, y = %.f, w = %.f, h = %.f ----", frame.origin.x, frame.origin.y, frame.size.width, frame.size.height);
    [super setFrame:frame];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
