//
// 📰 🐸 
// Project: RSSchool_T9
// 
// Author: Jack
// On: 4.08.21
// 
// Copyright © 2021 RSSchool. All rights reserved.

#import "ColorItemTableViewCell.h"
#import "UIColor+colorFromHexString.h"

@interface ColorItemTableViewCell ()

@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UILabel *subtitle;
@property (nonatomic, strong) UIView *completedIndicatorView;


@end


@implementation ColorItemTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier subTitle:(NSString*)subtitle{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self setupViews];
        
    }
    return self;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    [self setupViews];
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)configureWithSettingsItem:(SettingsItem *)settingsItem {
    
    self.textLabel.text = settingsItem.title;
    self.textLabel.textColor = [UIColor colorFromHexString:self.textLabel.text];
    self.detailTextLabel.text = settingsItem.subtitle;
}


- (void)setupViews {
    self.completedIndicatorView = [[UIView alloc] init];

    self.completedIndicatorView.translatesAutoresizingMaskIntoConstraints = NO;
    [self addSubview:self.completedIndicatorView];
    [NSLayoutConstraint activateConstraints:@[
        [self.completedIndicatorView.leadingAnchor constraintEqualToAnchor:self.leadingAnchor],
        [self.completedIndicatorView.topAnchor constraintEqualToAnchor:self.topAnchor],
        [self.completedIndicatorView.bottomAnchor constraintEqualToAnchor:self.bottomAnchor],
        [self.completedIndicatorView.widthAnchor constraintEqualToConstant:5.0]
    ]];

    self.titleLabel = [[UILabel alloc] init];
    self.titleLabel.translatesAutoresizingMaskIntoConstraints = NO;
    
    
    [self addSubview:self.titleLabel];
    [NSLayoutConstraint activateConstraints:@[
        [self.titleLabel.leadingAnchor constraintEqualToAnchor:self.leadingAnchor constant:16.0],
        [self.titleLabel.trailingAnchor constraintEqualToAnchor:self.trailingAnchor constant:-16.0],
        [self.trailingAnchor constraintEqualToAnchor:self.titleLabel.trailingAnchor constant:16.0],
        [self.titleLabel.centerYAnchor constraintEqualToAnchor:self.centerYAnchor]
    ]];
}



@end
