//
//  IUFormKitMacos.h
//  Pods
//
//  Created by zhuyuhui on 2020/11/29.
//

#ifndef IUFormKitMacos_h
#define IUFormKitMacos_h

// 判断字符串是否为空
#define FORM_STRING_ISEMPTY(string) ((![string isKindOfClass:[NSString class]])||[string isEqualToString:@""] || (string == nil) || [string isEqualToString:@""] || [string isKindOfClass:[NSNull class]]||[[string stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]] length]==0)

#define FORM_COLOR_WITH_HEX(hexValue) [UIColor colorWithRed:((float)((hexValue & 0xFF0000) >> 16)) / 255.0 green:((float)((hexValue & 0xFF00) >> 8)) / 255.0 blue:((float)(hexValue & 0xFF)) / 255.0 alpha:1.0f]

#define FORM_COLOR_A_WITH_HEX(hexValue) [UIColor colorWithRed:((float)((hexValue & 0xFF0000) >> 16)) / 255.0 green:((float)((hexValue & 0xFF00) >> 8)) / 255.0 blue:((float)(hexValue & 0xFF)) / 255.0 alpha:((float)((hexValue & 0xFF000000) >> 24)) / 255.0]


#define FORM_ScreenSize           [[UIScreen mainScreen] bounds].size                 //(e.g. 320,480)
#define FORM_ScreenWidth          [[UIScreen mainScreen] bounds].size.width           //(e.g. 320)
#define FORM_ScreenHeight         [[UIScreen mainScreen] bounds].size.height          //(e.g. 480)



#endif /* IUFormKitMacos_h */
