//
//  DifferentSizeTextTableViewCell.m
//  GRPTableWithDifferentLabels
//
//  Created by Дмитрий Ванюшкин on 21/06/2019.
//  Copyright © 2019 Dmitry Vanyushkin. All rights reserved.
//

#import "DifferentSizeTextTableViewCell.h"

@interface  DifferentSizeTextTableViewCell()

@property (nonatomic, strong) UILabel* flexTextLabel;

@end

@implementation DifferentSizeTextTableViewCell

@dynamic reuseId;

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self)
    {
        self.backgroundColor = UIColor.whiteColor;
        _flexTextLabel = [UILabel new];
        _flexTextLabel.numberOfLines = 0;
        _flexTextLabel.translatesAutoresizingMaskIntoConstraints = NO;
        
        [self.contentView addSubview:_flexTextLabel];
        
        [self setConstraints];
        
    }
    
    return self;
}

-(void) setConstraints
{
    [self.flexTextLabel.topAnchor constraintEqualToAnchor:self.contentView.topAnchor constant:5].active = YES;
    [self.flexTextLabel.leadingAnchor constraintEqualToAnchor:self.contentView.leadingAnchor constant:5].active = YES;
    [self.flexTextLabel.trailingAnchor constraintEqualToAnchor:self.contentView.trailingAnchor constant:-5].active = YES;
    [self.flexTextLabel.bottomAnchor constraintEqualToAnchor:self.contentView.bottomAnchor constant:-5].active = YES;
}

+(NSString*) reuseId
{
    return @"FlexibleCell";
}

@end
