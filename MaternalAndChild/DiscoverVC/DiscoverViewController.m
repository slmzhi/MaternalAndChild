//
//  DiscoverViewController.m
//  MaternalAndChild
//
//  Created by 陈奕涛 on 15/7/13.
//  Copyright (c) 2015年 fr.eivo. All rights reserved.
//

#import "DiscoverViewController.h"

@interface DiscoverViewController ()

@end

@implementation DiscoverViewController {
    UIImageView* banner;
    UIImageView* headProtrait;
    UIButton* naturalResourcesViewBtn;
    UITableView* table;
}

@synthesize banner;
@synthesize headerProtrait;

#pragma mark - sysMethod
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [[self view] setBackgroundColor:[UIColor whiteColor]];
    [[self navigationController] setNavigationBarHidden:YES animated:NO];
    [[self view] setUserInteractionEnabled:YES];

    [self initNaturalResources];
    [self initDateView];
    [self initTableView];

}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [[self navigationController] setNavigationBarHidden:YES animated:NO];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - userMethod
- (void)initTableView {
    WS(ws)
    table = [[UITableView alloc] init];
    [self.view addSubview:table];
    [self.view sendSubviewToBack:table];
    table.delegate = self;
    table.dataSource = self;
    table.separatorStyle = UITableViewCellSeparatorStyleNone;
    table.backgroundColor = [UIColor colorWithRed:240/255.0 green:239/255.0 blue:245/255.0 alpha:1.0];
    [table mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(ws.view).offset(0);
        make.right.equalTo(ws.view).offset(0);
        make.top.equalTo(ws.view).offset(00);
        make.bottom.equalTo(naturalResourcesViewBtn.mas_top).with.offset(0);
    }];
}

- (void)initNaturalResources {
    WS(ws);
    AppDelegate* delegate = [[UIApplication sharedApplication] delegate];
    naturalResourcesViewBtn = [[UIButton alloc] init];
    [self.view addSubview:naturalResourcesViewBtn];
    [naturalResourcesViewBtn setTitle:@"/\\" forState:UIControlStateNormal];
    naturalResourcesViewBtn.tag = 1002;
    naturalResourcesViewBtn.backgroundColor = [UIColor colorWithRed:240/255.0 green:239/255.0 blue:245/255.0 alpha:1.0];
    [naturalResourcesViewBtn setTitleColor:[UIColor colorWithRed:169/255.0 green:169/255.0 blue:169/255.0 alpha:1.0] forState:UIControlStateNormal];
    [naturalResourcesViewBtn addTarget:self action:NSSelectorFromString(@"btnAction:") forControlEvents:UIControlEventTouchUpInside];
    [naturalResourcesViewBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(ws.view).with.offset(0);
        make.bottom.equalTo(ws.view).with.offset(-delegate.tabbarHeight);
        make.left.equalTo(ws.view).with.offset(0);
        make.height.offset(30);
    }];
}

- (void)initDateView {
    WS(ws)
    UIButton* dateViewBtn = [[UIButton alloc] init];
    [self.view addSubview:dateViewBtn];
    [dateViewBtn setTitle:@"<<" forState:UIControlStateNormal];
    dateViewBtn.tag = 1001;
    dateViewBtn.backgroundColor = [UIColor clearColor];
    [dateViewBtn setTitleColor:[UIColor colorWithRed:169/255.0 green:169/255.0 blue:169/255.0 alpha:1.0] forState:UIControlStateNormal];
    [dateViewBtn addTarget:self action:NSSelectorFromString(@"btnAction:") forControlEvents:UIControlEventTouchUpInside];
    [dateViewBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(ws.view).with.offset(-10);
        make.top.equalTo(ws.view).with.offset(80);
        make.width.offset(30);
        make.height.offset(30);
    }];
}

#pragma mark - action
- (void)btnAction:(UIButton*)sender {
    NSInteger tag = sender.tag;
    switch (tag) {
        case 1001:
        {
            NSLog(@"<<");
        }
            break;
        case 1002:
        {
            NSLog(@"/\\");
        }
            break;

        default:
            break;
    }
}

- (void)headProtrait {
    NSLog(@"head");
}

#pragma mark - UITableView
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = nil;

    if (indexPath.section == 0) {
        static NSString *CellIdentifier = @"bannerAndHeadCell";
        cell = (UITableViewCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
        if (!cell) {
            cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            [cell setBackgroundColor:[UIColor clearColor]];
            cell.userInteractionEnabled = YES;
            
        }
        [self setBannerInfo:cell.contentView];
        [self setHeadPortraitInfo:cell.contentView];

    } else if (indexPath.section == 1) {
        static NSString *CellIdentifier = @"timeCell";
        cell = (UITableViewCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
        if (!cell) {
            cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            [cell setBackgroundColor:[UIColor clearColor]];
            cell.userInteractionEnabled = YES;

        }
        UIImageView* time = (UIImageView*)[cell.contentView viewWithTag:1101];
        if (!time) {
            time = [[UIImageView alloc] init];
            [cell.contentView addSubview:time];
            time.tag = 1101;
            UIImage* img = [UIImage imageNamed:@"time"];
            img = [img resizableImageWithCapInsets:UIEdgeInsetsMake(40, 0, 40, 0) resizingMode:UIImageResizingModeStretch];
            time.image = img;
            [time mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.offset(26);
                make.top.offset(20);
                make.bottom.offset(0);
                make.width.offset(24);
            }];
        }

    } else if (indexPath.section == 2) {
        static NSString *CellIdentifier = @"msgCell";
        cell = (UITableViewCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
        if (!cell) {
            cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            [cell setBackgroundColor:[UIColor clearColor]];
            cell.userInteractionEnabled = YES;
            
        }
        [self setMsgInfo:cell.contentView];

    }

    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 0 || section == 1) {
        return 1;
    } else if (section == 2) {
        return 10;
    }
    return 0;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        return 150.0;
    } else if (indexPath.section == 1) {
        return 60.0;
    } else if (indexPath.section == 2) {
        NSArray* arr = @[@60.0,@100.0,@80.0,@120.0,@60.0,@90.0,@150.0,@80.0,@60.0,@80.0];
        CGFloat height = [[arr objectAtIndex:indexPath.row] floatValue];
        return height;
    }
    return 0;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 3;
}

- (void)setBannerInfo:(UIView*)superView {
    if (!banner) {
        self.banner = [[UIImageView alloc] init];
        [superView addSubview:banner];
        [banner setUserInteractionEnabled:YES];
        [banner setBackgroundColor:[UIColor grayColor]];
        [banner mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(superView).with.offset(0);
            make.right.equalTo(superView).with.offset(0);
            make.top.equalTo(superView).with.offset(0);
            make.bottom.equalTo(superView).with.offset(-50);
        }];
    }
    [banner sd_setImageWithURL:[NSURL URLWithString:@"https://ss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=3303992133,3208352813&fm=116&gp=0.jpg"]];

}

- (void)setHeadPortraitInfo:(UIView*)superView {
    if (!headProtrait) {
        self.headerProtrait = [[UIImageView alloc] init];
        [superView addSubview:headerProtrait];
        headerProtrait.backgroundColor = [UIColor blueColor];
        headerProtrait.userInteractionEnabled = YES;
        [headerProtrait mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(superView).with.offset(20);
            make.top.equalTo(banner.mas_bottom).with.offset(-30);
            make.size.mas_equalTo(CGSizeMake(80, 80));
        }];
        UITapGestureRecognizer* gesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:NSSelectorFromString(@"headProtrait")];
        [headerProtrait addGestureRecognizer:gesture];
        [self.view bringSubviewToFront:headerProtrait];
    }
    [headerProtrait sd_setImageWithURL:[NSURL URLWithString:@"https://ss2.baidu.com/6ONYsjip0QIZ8tyhnq/it/u=1866378941,1732048739&fm=58"]];

}

- (void)setMsgInfo:(UIView*)superView {
    UIImageView* timeLine = (UIImageView*)[superView viewWithTag:3201];
    if (!timeLine) {
        timeLine = [[UIImageView alloc] init];
        [superView addSubview:timeLine];
        timeLine.tag = 1201;

    }
    UIImage* img = [UIImage imageNamed:@"line"];
    img = [img resizableImageWithCapInsets:UIEdgeInsetsMake(50, 0, 50, 0) resizingMode:UIImageResizingModeStretch];
    timeLine.image = img;
    [timeLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(30);
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
