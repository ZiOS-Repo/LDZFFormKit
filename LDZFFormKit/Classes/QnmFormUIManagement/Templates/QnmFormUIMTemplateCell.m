//
//  QnmFormUIMTemplateCell.m
//  LDZFFormKit
//
//  Created by zhuyuhui on 2022/6/20.
//

#import "QnmFormUIMTemplateCell.h"

@implementation QnmFormUIMTemplateCell

+ (NSString *)reuseCellIdentifier {
    return NSStringFromClass([self class]);
}

+ (NSString *)nonReuseCellWithIdentifier:(NSString *)identifier {
    return [NSStringFromClass([self class]) stringByAppendingString:identifier?:@""];
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
    }
    
    return self;
}


@end
