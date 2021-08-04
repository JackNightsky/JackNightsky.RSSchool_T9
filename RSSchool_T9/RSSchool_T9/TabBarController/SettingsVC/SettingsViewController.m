//
// 📰 🐸 
// Project: RSSchool_T9
// 
// Author: Jack
// On: 4.08.21
// 
// Copyright © 2021 RSSchool. All rights reserved.


#import "SettingsViewController.h"
#import "SettingsItem.h"
#import "ColorItemTableViewCell.h"
#import "UIColor+colorFromHexString.h"

@interface SettingsViewController ()

@property (nonatomic, strong) NSMutableArray<SettingsItem *> *dataSource;
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic) BOOL drawStories;

@property (nonatomic, strong) NSString *selectColorHEX;

@property (nonatomic, strong) NSString * tableName;

@end

@implementation SettingsViewController

- (void)setDrawColor:(NSString * _Nonnull)drawColorHEX
      andDrawStories:(BOOL)drawStories{
    self.selectColorHEX = drawColorHEX;
    self.drawStories = drawStories;
    [self.tableView reloadData];
    [self.delegate setDrawColor:_selectColorHEX
                 andDrawStories:_drawStories];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    if ([_tableName isEqualToString:@"settings"]) {
        [self fillInitialDataSourceForRoot];
    } else {
        [self fillInitialDataSourceForStrokeColor];
    }
    [self setupViews];
}

-(instancetype)initWithTableName:(NSString*)tableName
                     drawStories:(BOOL)drawStories
                  selectColorHEX:(NSString*)selectColorHEX {
    self = [super init];
    if (self) {
        self.tableName = tableName;
        self.drawStories = drawStories;
        self.selectColorHEX = selectColorHEX;
    }
    return self;
}



#pragma mark - Private views methods

- (void)setupViews {
    self.view.backgroundColor = [UIColor colorWithRed:0.898 green:0.898 blue:0.898 alpha:1];
    // Navigation items setup
    if ([_tableName isEqualToString:@"settings"]) {
        self.navigationItem.title = @"Settings";
    }
    
    // Setup tableView
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, 0,0)
                                                  style:UITableViewStyleInsetGrouped];
    self.tableView.translatesAutoresizingMaskIntoConstraints = NO;
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    [self.tableView registerClass:ColorItemTableViewCell.class forCellReuseIdentifier:@"CellId"]; // check
    
    self.tableView.allowsMultipleSelection = NO;
    [self.tableView setTintColor: UIColor.redColor];
    
    
    [self.view addSubview:self.tableView];
    
    [NSLayoutConstraint activateConstraints:@[
        [self.tableView.leadingAnchor constraintEqualToAnchor:self.view.leadingAnchor],
        [self.tableView.topAnchor constraintEqualToAnchor:self.view.topAnchor],
        [self.tableView.trailingAnchor constraintEqualToAnchor:self.view.trailingAnchor],
        [self.tableView.bottomAnchor constraintEqualToAnchor:self.view.bottomAnchor]
    ]];
}


#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataSource.count;
}

// add a cell in table
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ColorItemTableViewCell *cell = [[ColorItemTableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"CellId"];
    [cell configureWithSettingsItem:self.dataSource[indexPath.row]];
    
    if (![self.dataSource[indexPath.row].title isEqualToString:@"Stroke color"]) {
    cell.selectionStyle = UITableViewCellSelectionStyleNone; // delete gray background
    }

    if ([self.dataSource[indexPath.row].title isEqualToString: _selectColorHEX]) {
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
        [self.tableView selectRowAtIndexPath:indexPath animated:NO scrollPosition:UITableViewScrollPositionNone]; // fix bug from first selection
    }
    
    // MARK: - add a switch with methos
    if ([self.dataSource[indexPath.row].title isEqualToString:@"Draw Stories"]) {
        UISwitch *switchView = [[UISwitch alloc] initWithFrame:CGRectZero];
        
        [switchView setOn:_drawStories];
        [switchView addTarget:self
                       action:@selector(toggleDrawStories)
             forControlEvents:UIControlEventValueChanged];
        
        cell.accessoryView = switchView;
    }
    
    if ([self.dataSource[indexPath.row].title isEqualToString:@"Stroke color"]) {
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        
        cell.detailTextLabel.text = _selectColorHEX;
        cell.detailTextLabel.textColor = [UIColor colorFromHexString:_selectColorHEX];
    }
    return cell;
}



#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (![_tableName isEqualToString:@"settings"]) {
        [[self.tableView cellForRowAtIndexPath:indexPath] setAccessoryType:UITableViewCellAccessoryCheckmark];
        self.selectColorHEX = self.dataSource[indexPath.row].title;
    }
    
    
    if ([self.dataSource[indexPath.row].title isEqualToString: @"Stroke color"]) {
        
        [[self.tableView cellForRowAtIndexPath:indexPath] setAccessoryType:UITableViewCellAccessoryDisclosureIndicator];
        SettingsViewController  * strokeColor = [[SettingsViewController alloc] initWithTableName:@"stroke color"
                                                                                                drawStories:_drawStories
                                                                                             selectColorHEX:_selectColorHEX];
        
        strokeColor.delegate = self;
        [self.navigationController pushViewController:strokeColor animated:YES];
    }
    
    [self.delegate setDrawColor:_selectColorHEX
                 andDrawStories:_drawStories];
}

-(void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath {
    [[self.tableView cellForRowAtIndexPath:indexPath] setAccessoryType:UITableViewCellAccessoryNone];
    if ([_tableName isEqualToString:@"settings"]) {
        [[self.tableView cellForRowAtIndexPath:indexPath] setAccessoryType:UITableViewCellAccessoryDisclosureIndicator];
    }
    
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 44.0;
}


#pragma mark - Handlers

- (void)toggleDrawStories {
    self.drawStories = !self.drawStories;
    [self.delegate setDrawColor:_selectColorHEX
                 andDrawStories:_drawStories];
}


#pragma mark - Data source init

- (void)fillInitialDataSourceForStrokeColor {
    self.dataSource = [NSMutableArray arrayWithArray:@[
        [[SettingsItem alloc] initWithTitle:@"#be2813"],
        [[SettingsItem alloc] initWithTitle:@"#3802da"],
        [[SettingsItem alloc] initWithTitle:@"#467c24"],
        [[SettingsItem alloc] initWithTitle:@"#808080"],
        [[SettingsItem alloc] initWithTitle:@"#8e5af7"],
        [[SettingsItem alloc] initWithTitle:@"#f07f5a"],
        [[SettingsItem alloc] initWithTitle:@"#f3af22"],
        [[SettingsItem alloc] initWithTitle:@"#3dacf7"],
        [[SettingsItem alloc] initWithTitle:@"#e87aa4"],
        [[SettingsItem alloc] initWithTitle:@"#0f2e3f"],
        [[SettingsItem alloc] initWithTitle:@"#213711"],
        [[SettingsItem alloc] initWithTitle:@"#511307"],
        [[SettingsItem alloc] initWithTitle:@"#92003b"]
    ]];
}

- (void)fillInitialDataSourceForRoot {
    self.dataSource = [NSMutableArray arrayWithArray:@[
        [[SettingsItem alloc] initWithTitle:@"Draw Stories"],
        [[SettingsItem alloc] initWithTitle:@"Stroke color"]
    ]];
}

@end
