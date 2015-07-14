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
    CGRect tableFrameNormal;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.userInteractionEnabled = YES;


    [self initTableView];
    [self initHideThisViewAction];

    tableFrameNormal = table.frame;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];

    [self showHideThisView:YES];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
        make.edges.equalTo(ws.view).width.insets(UIEdgeInsetsMake(20, ws.view.frame.size.width/3.0, delegate.tabbarHeight+30, 0));
    }];
    
}

- (void)initHideThisViewAction {
    UIButton* hideThisViewBtn = [[UIButton alloc] init];
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
    __block CGRect frame = self.view.frame;
    frame.origin.x = show?frame.size.width:0;
    [self.view setFrame:frame];
    [UIView animateWithDuration:0.3 animations:^{
        frame.origin.x = show?0:frame.size.width;
        [ws.view setFrame:frame];
    } completion:^(BOOL finished) {
        if (!show) {
            [ws.view removeFromSuperview];
        }

    }];

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
            img = [img resizableImageWithCapInsets:UIEdgeInsetsMake(40, 0, 40, 0) resizingMode:UIImageResizingModeStretch];
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
        [self setDateInfo:cell.contentView];

    }

    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 0) {
        return 1;
    } else if (section == 1) {
        return 10;
    }
    return 0;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        return 60.0;
    } else if (indexPath.section == 1) {
        NSArray* arr = @[@60.0,@100.0,@80.0,@120.0,@60.0,@90.0,@150.0,@80.0,@60.0,@80.0];
        CGFloat height = [[arr objectAtIndex:indexPath.row] floatValue];
        return height;
    }
    return 0;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

- (void)setDateInfo:(UIView*)superView {
    UIImageView* timeLine = (UIImageView*)[superView viewWithTag:3201];
    if (!timeLine) {
        timeLine = [[UIImageView alloc] init];
        [superView addSubview:timeLine];
        timeLine.tag = 1201;

    }
    UIImage* img = [UIImage imageNamed:@"line2"];
    img = [img resizableImageWithCapInsets:UIEdgeInsetsMake(50, 0, 50, 0) resizingMode:UIImageResizingModeStretch];
    timeLine.image = img;
    [timeLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(28);
        make.top.offset(0);
        make.bottom.offset(0);
        make.width.offset(18);
    }];
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
