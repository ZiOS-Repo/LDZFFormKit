//
//  TntBaseHeaderFooterView.m
//  CRJFormKit_Example
//
// on 2020/12/7.
//  Copyright © 2020 zhuyuhui434@gmail.com. All rights reserved.
//

#import "TntBaseHeaderFooterView.h"

@implementation TntBaseHeaderFooterView
- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    [self setupCell];

    [self buildSubview];
}

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self setupCell];

        [self buildSubview];
    }

    return self;
}

- (instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithReuseIdentifier:reuseIdentifier];
    if (self) {
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
