//
//  FormManager.m
//  CRJFormKit
//
// on 2020/11/29.
//

#import "FormManager.h"
#import <LDZFCommon/LDZFCommon.h>
@implementation FormManager
+ (instancetype)shared {
    static dispatch_once_t onceToken;
    static FormManager *instance = nil;
    dispatch_once(&onceToken, ^{
        instance = [[super allocWithZone:NULL] init];
    });
    return instance;
}

+ (id)allocWithZone:(struct _NSZone *)zone {
    return [self shared];
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        //header
        self.headerHeight = 0;
        self.headerColor = [UIColor groupTableViewBackgroundColor];
        //footer
        self.footerHeight = 0;
        self.footerColor = [UIColor groupTableViewBackgroundColor];
        //body
        self.bodyHeight = 50;
        self.bodyColor = [UIColor whiteColor];
        self.bodyPadding = UIEdgeInsetsMake(0, 12, 0, 12);
        //separator
        self.separatorHeight = 0.5;
        self.separatorColor = kHexColor(0xE4E4E4);
        self.separatorMargin = UIEdgeInsetsMake(0, 12, 0, 0);
        //key
        self.keyColor = [UIColor blackColor];
        self.keyFont = [UIFont systemFontOfSize:15];
        self.keyMaxWidth = 150;
        //value
        self.valColor = [UIColor blackColor];
        self.valFont = [UIFont systemFontOfSize:15];
        //placeholder
        self.placeholderColor = [UIColor grayColor];
        
        //showDebugLine
        self.showDebugLine = NO;
    }
    return self;
}

+ (UIImage *)imageName:(NSString *)name {
    NSString *bundlePath = [[NSBundle bundleForClass:[self class]].resourcePath
        stringByAppendingPathComponent:@"/LDZFFormKit.bundle"];
    NSBundle *resource_bundle = [NSBundle bundleWithPath:bundlePath];
    UIImage *image = [UIImage imageNamed:name
                                inBundle:resource_bundle
           compatibleWithTraitCollection:nil];
    return image;
}
@end
