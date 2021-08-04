//
// 📰 🐸 
// Project: RSSchool_T9
// 
// Author: Jack
// On: 4.08.21
// 
// Copyright © 2021 RSSchool. All rights reserved.

#import <UIKit/UIKit.h>

@protocol SettingsDrawColor <NSObject>


-(void) setDrawColor:(NSString*_Nonnull)drawColorHEX
      andDrawStories:(BOOL)drawStories;

@end

NS_ASSUME_NONNULL_BEGIN

@interface SettingsViewController : UIViewController <UITableViewDelegate, UITableViewDataSource, SettingsDrawColor>

@property (nonatomic, weak) id<SettingsDrawColor> delegate;
-(instancetype)initWithTableName:(NSString*)tableName
                     drawStories:(BOOL)drawStories
                  selectColorHEX:(NSString*)selectColorHEX;

@end

NS_ASSUME_NONNULL_END
