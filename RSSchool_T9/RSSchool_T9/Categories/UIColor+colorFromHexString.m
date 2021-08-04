//
// 📰 🐸 
// Project: RSSchool_T9
// 
// Author: Jack
// On: 4.08.21
// 
// Copyright © 2021 RSSchool. All rights reserved.

#import "UIColor+colorFromHexString.h"

@implementation UIColor (colorFromHexString)

+ (UIColor *)colorFromHexString:(NSString *)hexString {
    if ([[hexString substringToIndex:1] isEqualToString:@"#"] && hexString.length == 7) {
        unsigned rgbValue = 0;
        NSScanner *scanner = [NSScanner scannerWithString:hexString];
        [scanner setScanLocation:1]; // bypass '#' character
        [scanner scanHexInt:&rgbValue];
        return [UIColor colorWithRed:((rgbValue & 0xFF0000) >> 16)/255.0
                               green:((rgbValue & 0xFF00) >> 8)/255.0
                                blue:(rgbValue & 0xFF)/255.0
                               alpha:1.0];
    } else {
        return UIColor.blackColor;
    }
}

@end
