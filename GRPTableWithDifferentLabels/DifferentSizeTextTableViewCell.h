//
//  DifferentSizeTextTableViewCell.h
//  GRPTableWithDifferentLabels
//
//  Created by Дмитрий Ванюшкин on 21/06/2019.
//  Copyright © 2019 Dmitry Vanyushkin. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface DifferentSizeTextTableViewCell : UITableViewCell

@property (class) NSString *reuseId;

@property (nonatomic, readonly) UILabel* flexTextLabel;

@end

NS_ASSUME_NONNULL_END
