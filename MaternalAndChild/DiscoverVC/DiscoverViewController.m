//
//  DiscoverViewController.m
//  MaternalAndChild
//
//  Created by 陈奕涛 on 15/7/13.
//  Copyright (c) 2015年 fr.eivo. All rights reserved.
//

#import "DiscoverViewController.h"
#import "DateViewController.h"
#import "RecommendViewController.h"

@interface DiscoverViewController ()

@end

@implementation DiscoverViewController {
    UIImageView* banner;
    UIImageView* headProtrait;
    UIButton* naturalResourcesViewBtn;
    UITableView* table;
    DateViewController* dateVC;
    RecommendViewController* recommend;

    NSArray* data;
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

    data = @[@{@"date":@[@"2015", @"7", @"7"],
                 @"text":@"某剩女虔诚信奉上帝，上帝感动决定奖励她一个愿望。\
               　　剩女说：我的愿望是成为高高在上滴女王，住在超级豪华滴复合式城堡，身边有美男围绕，手下有无数工人为我辛勤工作……\
               　　上帝答应了。\
               　　然后……\
               　　剩女变成了一只女王……蜂！",
               @"photo":@[@"http://img1.imgtn.bdimg.com/it/u=1005212286,2432746147&fm=21&gp=0.jpg", @"http://img4.imgtn.bdimg.com/it/u=701528370,1718452498&fm=21&gp=0.jpg"],
               @"favour":@"77",
               @"comment":@"33"},
             @{@"date":@[@"2015", @"7", @"5"],
               @"text":@"儿子：妈妈，明天家长会咋办？\
                 　　妈妈：什么咋办，我去参加就是了呀.......\
                 　　儿子：不行，老师说了必须要爸爸参加！\
                 　　妈妈：可你爸爸出差了，要很久才回来.....\
                 　　儿子：要不请隔壁王叔叔帮帮忙吧？\
                 　　妈妈：这怎么行，他又不是你爸？\
                 　　儿子：管他是不是，只要长得像，老师就不会怀疑.....\
                 　　妈妈：........",
               @"photo":@[@"http://img4.imgtn.bdimg.com/it/u=2314042252,4134060736&fm=21&gp=0.jpg"],
               @"favour":@"13",
               @"comment":@"23"},
             @{@"date":@[@"2015", @"7", @"1"],
               @"text":@"二哥是处女座的大家都知道，向女生表白却因此被拒绝。女生：我不喜欢处女座的男生……二哥：其实处女座也有十大优点的，\
                 仔细认真，循规蹈矩，勤奋上进，绝不屈服，永不气馁，事事谨慎小心，谦逊不夸大，对爱情忠实，正义感强……\
                 　　女生打断他说：你优点还好挺多的，咱们交往试试吧！\
                 　　二哥怒喊：你让我把最后一个说完行不行？最后一个：追求完美……好了，终于说完了，你刚才说什么？？？\
                 　　女生头也不回地走了……",
               @"photo":@[@"http://img3.imgtn.bdimg.com/it/u=85967481,2078707596&fm=21&gp=0.jpg", @"http://img1.imgtn.bdimg.com/it/u=539380423,2945182428&fm=21&gp=0.jpg", @"http://img4.imgtn.bdimg.com/it/u=702139592,2102071640&fm=21&gp=0.jpg", @"http://img3.imgtn.bdimg.com/it/u=3619654095,2995625302&fm=21&gp=0.jpg"],
               @"favour":@"66",
               @"comment":@"44"},
             @{@"date":@[@"2015", @"6", @"4"],
               @"text":@"老公：你说我是A型血，你是B型血，孩子却是O型血是怎么回事？\
                 　　老婆：这都怪你！孩子出生你也不在身边，当时孩子生下来体弱贫血，\
                 必须输血，好心的邻居大哥给输的血，孩子才抢救过来！",
               @"photo":@[@"http://img2.imgtn.bdimg.com/it/u=674974778,3619962318&fm=21&gp=0.jpg", @"http://img4.imgtn.bdimg.com/it/u=701528370,1718452498&fm=21&gp=0.jpg"],
               @"favour":@"33",
               @"comment":@"9"},
             @{@"date":@[@"2014", @"7", @"5"],
               @"text":@"凤姐不小心掉进了海豚养殖池里。就在这千钧一发之际，一只雄性海豚救了凤姐，把她从池里推到了岸边。\
                 　　雌性海豚生气地问：“你为什么要救她？”\
                 　　雄性海豚笑着说：“一个这么丑的人如果死在了池里，我会天天做恶梦的。”",
               @"photo":@[@"http://img1.imgtn.bdimg.com/it/u=3942008063,1487971776&fm=21&gp=0.jpg"],
               @"favour":@"13",
               @"comment":@"0"}
             ];
    [table reloadData];
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
            if (!dateVC) {
                dateVC = [[DateViewController alloc] init];
            }
            [self.view addSubview:dateVC.view];

        }
            break;
        case 1002:
        {
            if (!recommend) {
                recommend=[[RecommendViewController alloc] init];
            }
            [self.view addSubview:recommend.view];
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
        [self setMsgInfo:cell.contentView info:nil];

    }

    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 0 || section == 1) {
        return 1;
    } else if (section == 2) {
        return [data count];
    }
    return 0;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        return 150.0;
    } else if (indexPath.section == 1) {
        return 60.0;
    } else if (indexPath.section == 2) {
//        CGFloat height = 0;
//        NSDictionary* info = [data objectAtIndex:indexPath.row];
//        NSString* text = [info objectForKey:@"text"];
//        NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc]init];
//        paragraphStyle.lineBreakMode = NSLineBreakByWordWrapping;
//        NSDictionary *attributes = @{NSFontAttributeName:[UIFont systemFontOfSize:12], NSParagraphStyleAttributeName:paragraphStyle.copy};
//
////        CGSize labelSize = [text boundingRectWithSize:CGSizeMake(self.width - joinBtn.width - 4, 100) options:NSStringDrawingUsesLineFragmentOrigin attributes:attributes context:nil].size;
//        /*
//         This method returns fractional sizes (in the size component of the returned CGRect); to use a returned size to size views, you must use raise its value to the nearest higher integer using the ceil function.
//         */
////        labelSize.height = ceil(labelSize.height);
////        labelSize.width = ceil(labelSize.width);

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

- (void)setMsgInfo:(UIView*)superView info:(NSDictionary*)info {
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
