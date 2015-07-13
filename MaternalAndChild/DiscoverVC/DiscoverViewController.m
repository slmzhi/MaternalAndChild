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

}

@synthesize banner;
@synthesize headerProtrait;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [[self view] setBackgroundColor:[UIColor whiteColor]];
    [[self navigationController] setNavigationBarHidden:YES animated:NO];
    [[self view] setUserInteractionEnabled:YES];

    [self initBanner];
    [self initNatural];
    [self initHeadPortrait];

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
- (void)initBanner {
    WS(ws)
    self.banner = [[UIImageView alloc] init];
    [self.view addSubview:banner];
    [banner setUserInteractionEnabled:YES];
    [banner setBackgroundColor:[UIColor grayColor]];
    [banner mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(ws.view).with.offset(0);
        make.right.equalTo(ws.view).with.offset(0);
        make.top.equalTo(ws.view).with.offset(20);
        make.height.offset(100);
    }];
    [banner sd_setImageWithURL:[NSURL URLWithString:@"https://ss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=3303992133,3208352813&fm=116&gp=0.jpg"]];

    UIButton* dateViewBtn = [[UIButton alloc] init];
    [banner addSubview:dateViewBtn];
    [dateViewBtn setTitle:@"<<" forState:UIControlStateNormal];
    dateViewBtn.tag = 1001;
    dateViewBtn.backgroundColor = [UIColor greenColor];
    [dateViewBtn addTarget:self action:NSSelectorFromString(@"btnAction:") forControlEvents:UIControlEventTouchUpInside];
    [dateViewBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(banner).with.offset(-10);
        make.bottom.equalTo(banner).with.offset(-10);
        make.width.offset(30);
        make.height.offset(30);
    }];

}

- (void)initNatural {
    WS(ws);
    AppDelegate* delegate = [[UIApplication sharedApplication] delegate];
    UIButton* naturalViewBtn = [[UIButton alloc] init];
    [self.view addSubview:naturalViewBtn];
    [naturalViewBtn setTitle:@"/|\\" forState:UIControlStateNormal];
    naturalViewBtn.tag = 1002;
    naturalViewBtn.backgroundColor = [UIColor greenColor];
    [naturalViewBtn addTarget:self action:NSSelectorFromString(@"btnAction:") forControlEvents:UIControlEventTouchUpInside];
    [naturalViewBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(ws.view).with.offset(0);
        make.bottom.equalTo(ws.view).with.offset(-delegate.tabbarHeight);
        make.left.equalTo(ws.view).with.offset(0);
        make.height.offset(30);
    }];
}

- (void)initHeadPortrait {
    WS(ws)
    self.headerProtrait = [[UIImageView alloc] init];
    [self.view addSubview:headerProtrait];
    headerProtrait.backgroundColor = [UIColor blueColor];
    headerProtrait.userInteractionEnabled = YES;
    [headerProtrait sd_setImageWithURL:[NSURL URLWithString:@"https://ss2.baidu.com/6ONYsjip0QIZ8tyhnq/it/u=1866378941,1732048739&fm=58"]];
    [headerProtrait mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(ws.view).with.offset(20);
        make.top.equalTo(banner.mas_bottom).with.offset(-30);
        make.size.mas_equalTo(CGSizeMake(80, 80));
    }];
    UITapGestureRecognizer* gesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:NSSelectorFromString(@"headProtrait")];
    [headerProtrait addGestureRecognizer:gesture];
    [self.view bringSubviewToFront:headerProtrait];
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
            NSLog(@"/|\\");
        }
            break;

        default:
            break;
    }
}

- (void)headProtrait {
    NSLog(@"head");
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
