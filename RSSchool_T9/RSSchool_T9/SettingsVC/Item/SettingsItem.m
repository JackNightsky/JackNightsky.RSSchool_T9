//
// 📰 🐸 
// Project: RSSchool_T9
// 
// Author: Jack
// On: 4.08.21
// 
// Copyright © 2021 RSSchool. All rights reserved.

#import "SettingsItem.h"

@implementation SettingsItem

- (instancetype)initWithTitle:(NSString *)title{
    self = [super init];
    if (self) {
        _title = title;
        _subtitle = @"";
    }
    return self;
}

- (instancetype)initWithTitle:(NSString *)title andSubtitle:(NSString*)subtitle {
    self = [super init];
    if (self) {
        _title = title;
        _subtitle = subtitle;
    }
    return self;
}


@end
