//
// 📰 🐸 
// Project: RSSchool_T9
// 
// Author: Jack
// On: 4.08.21
// 
// Copyright © 2021 RSSchool. All rights reserved.

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface SettingsItem : NSObject

@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *subtitle;

- (instancetype)initWithTitle:(NSString *)title;
- (instancetype)initWithTitle:(NSString *)title andSubtitle:(NSString*)subtitle;

@end

NS_ASSUME_NONNULL_END
