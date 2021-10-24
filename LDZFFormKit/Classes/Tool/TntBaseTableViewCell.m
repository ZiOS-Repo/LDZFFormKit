//
//  TntBaseTableViewCell.m
//  CRJFormKit
//
// on 2020/11/29.
//

#import "TntBaseTableViewCell.h"

@implementation TntBaseTableViewCell
- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    [self setupCell];
    
    [self buildSubview];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        
        [self setupCell];
        
        [self buildSubview];
    }
    
    return self;
}

- (void)setupCell {

}

- (void)buildSubview {
    
}

- (void)loadContent {
    
}

+ (CGFloat)cellHeightWithData:(id)data {
    return 0.f;
}

- (void)delegateEvent {
    
}

@end
