//
//  DateViewController.m
//  MaternalAndChild
//
//  Created by 陈奕涛 on 15/7/14.
//  Copyright (c) 2015年 fr.eivo. All rights reserved.
//

#import "DateViewController.h"

@interface DateViewController ()

@end

@implementation DateViewController {
    UITableView* table;
    UIButton* hideThisViewBtn;
    NSArray* data;
    UIButton* currentMonthBtn;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.userInteractionEnabled = YES;

    [self initTableView];
    [self initHideThisViewAction];

    data = @[
             @{@"2015":@[@"1", @"3", @"5", @"7", @"9", @"11"]},
             @{@"2014":@[@"2", @"8", @"10", @"12"]},
             @{@"2013":@[@"2", @"3", @"4", @"5", @"6", @"8", @"9", @"11", @"12"]},
             @{@"2012":@[@"2", @"3", @"4", @"5", @"6", @"8", @"9", @"12"]},
             @{@"2011":@[@"2", @"3", @"4", @"6", @"8", @"9", @"11", @"12"]},
             @{@"2010":@[@"2", @"5", @"6", @"8", @"9", @"11", @"12"]}
             ];
    [table reloadData];

}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];

    [self showHideThisView:YES];

}

#pragma mark - userMethod
- (void)initTableView {
    WS(ws)
    AppDelegate* delegate = (AppDelegate*)[[UIApplication sharedApplication] delegate];
    table = [[UITableView alloc] init];
    [self.view addSubview:table];
    table.backgroundColor = [UIColor whiteColor];
    table.backgroundView = [[UIView alloc] init];
    table.backgroundView.backgroundColor = [UIColor whiteColor];
    table.delegate = self;
    table.dataSource = self;
    table.separatorStyle = UITableViewCellSeparatorStyleNone;
    table.backgroundColor = [UIColor colorWithRed:240/255.0 green:239/255.0 blue:245/255.0 alpha:1.0];
    [table mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(ws.view.frame.size.width);
        make.top.offset(20);
        make.right.offset(ws.view.frame.size.width/3.0*2);
        make.bottom.offset(-delegate.tabbarHeight-30);
    }];

}

- (void)initHideThisViewAction {
    hideThisViewBtn = [[UIButton alloc] init];
    [self.view addSubview:hideThisViewBtn];
    [hideThisViewBtn setTitle:@">>" forState:UIControlStateNormal];
    hideThisViewBtn.tag = 1001;
    hideThisViewBtn.backgroundColor = [UIColor clearColor];
    [hideThisViewBtn setTitleColor:[UIColor colorWithRed:169/255.0 green:169/255.0 blue:169/255.0 alpha:1.0] forState:UIControlStateNormal];
    [hideThisViewBtn addTarget:self action:NSSelectorFromString(@"btnAction:") forControlEvents:UIControlEventTouchUpInside];
    [hideThisViewBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(table.mas_left).with.offset(0);
        make.top.equalTo(table.mas_centerY).with.offset(-15);
        make.width.offset(30);
        make.height.offset(30);
    }];
}

- (void)showHideThisView:(BOOL)show {
    WS(ws)
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.01 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [table mas_updateConstraints:^(MASConstraintMaker *make) {
            make.left.offset(show?ws.view.frame.size.width/3.0:ws.view.frame.size.width);
            make.right.offset(show?0:ws.view.frame.size.width/3.0*2);
        }];
        [hideThisViewBtn mas_updateConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(table.mas_left).with.offset(0);
        }];
        [table setNeedsUpdateConstraints];
        [table updateConstraintsIfNeeded];
        [UIView animateWithDuration:0.3 animations:^{
            [table layoutIfNeeded];
            [hideThisViewBtn layoutIfNeeded];
        } completion:^(BOOL finished) {
            if (!show) {
                [ws.view removeFromSuperview];
            }
        }];

    });

}

#pragma mark - Action
- (void)btnAction:(id)sender {
    [self showHideThisView:NO];

}

#pragma mark - UITableView
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = nil;

    if (indexPath.section == 0) {
        static NSString *CellIdentifier = @"timeCell";
        cell = (UITableViewCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
        if (!cell) {
            cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            cell.userInteractionEnabled = YES;

        }
        UIImageView* time = (UIImageView*)[cell.contentView viewWithTag:1101];
        if (!time) {
            time = [[UIImageView alloc] init];
            [cell.contentView addSubview:time];
            time.tag = 1101;
            UIImage* img = [UIImage imageNamed:@"time2"];
            img = [img resizableImageWithCapInsets:UIEdgeInsetsMake(25, 0, 25, 0) resizingMode:UIImageResizingModeStretch];
            time.image = img;
            [time mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.offset(26);
                make.top.offset(20);
                make.bottom.offset(0);
                make.width.offset(24);
            }];
        }

    } else if (indexPath.section == 1) {
        static NSString *CellIdentifier = @"dateCell";
        cell = (UITableViewCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
        if (!cell) {
            cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            cell.userInteractionEnabled = YES;

        }
        [self setDateInfo:cell.contentView info:[data objectAtIndex:indexPath.row]];

    }

    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 0) {
        return 1;
    } else if (section == 1) {
        return [data count];
    }
    return 0;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        return 60.0;
    } else if (indexPath.section == 1) {
        NSDictionary* dic = [data objectAtIndex:indexPath.row];
        NSInteger count = [[dic objectForKey:[[dic allKeys] objectAtIndex:0]] count];
        CGFloat height = (count/4+(count%4>0?1:0))*50+40;
        return height;
    }
    return 0;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

- (void)setDateInfo:(UIView*)superView info:(NSDictionary*)info {
    UIImageView* timeLine = (UIImageView*)[superView viewWithTag:1201];
    if (!timeLine) {
        timeLine = [[UIImageView alloc] init];
        [superView addSubview:timeLine];
        timeLine.tag = 1201;

    }
    UIImage* img = [UIImage imageNamed:@"line2"];
    img = [img resizableImageWithCapInsets:UIEdgeInsetsMake(40, 0, 40, 0) resizingMode:UIImageResizingModeStretch];
    timeLine.image = img;
    [timeLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(28);
        make.top.offset(0);
        make.bottom.offset(0);
        make.width.offset(18);
    }];

    UILabel* year = (UILabel*)[superView viewWithTag:1202];
    if (!year) {
        year = [[UILabel alloc] init];
        [superView addSubview:year];
        year.tag = 1202;
        year.backgroundColor = [UIColor clearColor];
        year.textColor = [UIColor blackColor];
        year.font = [UIFont boldSystemFontOfSize:16.0];
        [year mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(timeLine.mas_right).with.offset(6);
            make.top.offset(3);
            make.right.offset(0);
            make.height.offset(20);
        }];
    }
    NSString* key = [[info allKeys] objectAtIndex:0];
    year.text = key;

    NSArray* monthArr = [info objectForKey:key];
    UIView* month = [superView viewWithTag:1203];
    if (!month) {
        month = [[UIView alloc] init];
        [superView addSubview:month];
        month.tag = 1203;
        month.backgroundColor = [UIColor clearColor];
        month.userInteractionEnabled = YES;
        [month mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(timeLine.mas_right).with.offset(4);
            make.right.equalTo(superView);
            make.bottom.equalTo(superView);
            make.top.equalTo(year.mas_bottom).with.offset(5);
        }];
    }
    NSArray* subViewArr = [month subviews];
    for (UIView* subView in subViewArr) {
        [subView removeFromSuperview];
    }
    for (int i=0; i<[monthArr count]; i++) {
        NSString* m = [monthArr objectAtIndex:i];
        UIButton* monthBtn = [[UIButton alloc] init];
        [month addSubview:monthBtn];
        int date = [key intValue];
        date = date<<sizeof(int)*8/2;
        date += [m intValue];
        [monthBtn setTag:date];
        [monthBtn addTarget:self action:NSSelectorFromString(@"dateBtnAction:") forControlEvents:UIControlEventTouchUpInside];
        if (date == currentMonthBtn.tag) {
            [monthBtn setBackgroundColor:[UIColor colorWithRed:26/225.0 green:156/255.0 blue:199/255.0 alpha:1.0]];
            currentMonthBtn = monthBtn;
        } else {
            [monthBtn setBackgroundColor:[UIColor clearColor]];
        }
        monthBtn.layer.masksToBounds = YES;
        monthBtn.layer.cornerRadius = 18.0;
        monthBtn.layer.borderColor = [UIColor blackColor].CGColor;
        monthBtn.layer.borderWidth = 1;
        monthBtn.titleLabel.font = [UIFont systemFontOfSize:14];
        [monthBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [monthBtn setTitle:[NSString stringWithFormat:@"%@月", m] forState:UIControlStateNormal];
        int row = i/4;
        int line = i%4;
        [monthBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.offset(46*line);
            make.top.offset(50*row);
            make.width.offset(36);
            make.height.offset(36);
        }];
    }

}

- (void)dateBtnAction:(UIButton*)sender {
    if (currentMonthBtn) {
        currentMonthBtn.backgroundColor = [UIColor clearColor];
    }
    sender.backgroundColor = [UIColor colorWithRed:26/225.0 green:156/255.0 blue:199/255.0 alpha:1.0];
    currentMonthBtn = sender;

    int tag = (int)sender.tag;
    int y = tag>>sizeof(int)*8/2;
    int m = tag-(y<<sizeof(int)*8/2);
    NSLog(@"%d 年 %d 月", y, m);
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
