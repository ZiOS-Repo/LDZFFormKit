

#import "LdzfTemplateCell.h"

@implementation LdzfTemplateCell

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


#pragma mark - Display.
- (void)willDisplay {
    
}

- (void)didEndDisplay {
    
}

- (void)contentOffset:(CGPoint)offset {

}


#pragma mark - Useful method.
- (void)updateWithNewCellHeight:(CGFloat)height animated:(BOOL)animated {
    if (_tableView && _dataAdapter) {
        if (animated) {
            _dataAdapter.height = height;
            [_tableView beginUpdates];
            [_tableView endUpdates];
            
        } else {
            
            _dataAdapter.height = height;
            [_tableView reloadData];
        }
    }
}

- (void)selectedEvent {
    [self delegateEvent];
}

- (void)delegateEvent {
    if (self.delegate && [self.delegate respondsToSelector:@selector(LdzfTemplateCell:event:)]) {
        [self.delegate LdzfTemplateCell:self event:self.data];
    }
}

+ (void)registerToTableView:(UITableView *)tableView reuseIdentifier:(NSString *)reuseIdentifier {
    [tableView registerClass:[self class] forCellReuseIdentifier:reuseIdentifier];
}

+ (void)registerToTableView:(UITableView *)tableView {
    [tableView registerClass:[self class] forCellReuseIdentifier:NSStringFromClass([self class])];
}
@end
