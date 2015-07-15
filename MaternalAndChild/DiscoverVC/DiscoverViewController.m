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
    NSMutableDictionary* cellHeightDic;
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
                 @"text":@"某剩女虔诚信奉上帝，上帝感动决定奖励她一个愿望。\n剩女说：我的愿望是成为高高在上滴女王，住在超级豪华滴复合式城堡，身边有美男围绕，手下有无数工人为我辛勤工作……\n上帝答应了。\n然后……\n剩女变成了一只女王……蜂！",
               @"photo":@[@"https://ss2.bdstatic.com/70cFvnSh_Q1YnxGkpoWK1HF6hhy/it/u=3042410010,1849246464&fm=116&gp=0.jpg", @"https://ss2.bdstatic.com/70cFvnSh_Q1YnxGkpoWK1HF6hhy/it/u=862868179,785881333&fm=116&gp=0.jpg"],
               @"favour":@"77",
               @"comment":@"33"},
             @{@"date":@[@"2015", @"7", @"5"],
               @"text":@"儿子：妈妈，明天家长会咋办？\n妈妈：什么咋办，我去参加就是了呀.......\n儿子：不行，老师说了必须要爸爸参加！\n妈妈：可你爸爸出差了，要很久才回来.....\n儿子：要不请隔壁王叔叔帮帮忙吧？\n妈妈：这怎么行，他又不是你爸？\n儿子：管他是不是，只要长得像，老师就不会怀疑.....\n妈妈：........",
               @"photo":@[@"https://ss1.bdstatic.com/70cFuXSh_Q1YnxGkpoWK1HF6hhy/it/u=2651666712,3423349209&fm=116&gp=0.jpg"],
               @"favour":@"13",
               @"comment":@"23"},
             @{@"date":@[@"2015", @"7", @"1"],
               @"text":@"二哥是处女座的大家都知道，向女生表白却因此被拒绝。女生：我不喜欢处女座的男生……二哥：其实处女座也有十大优点的，\n仔细认真，循规蹈矩，勤奋上进，绝不屈服，永不气馁，事事谨慎小心，谦逊不夸大，对爱情忠实，正义感强……\n女生打断他说：你优点还好挺多的，咱们交往试试吧！\n二哥怒喊：你让我把最后一个说完行不行？最后一个：追求完美……好了，终于说完了，你刚才说什么？？？\n女生头也不回地走了……",
               @"photo":@[@"https://ss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=298400068,822827541&fm=116&gp=0.jpg", @"https://ss1.bdstatic.com/70cFuXSh_Q1YnxGkpoWK1HF6hhy/it/u=3658159165,4286511134&fm=116&gp=0.jpg", @"https://ss3.bdstatic.com/70cFv8Sh_Q1YnxGkpoWK1HF6hhy/it/u=3371032114,892333757&fm=116&gp=0.jpg", @"https://ss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=1005212286,2432746147&fm=116&gp=0.jpg"],
               @"favour":@"66",
               @"comment":@"44"},
             @{@"date":@[@"2015", @"6", @"4"],
               @"text":@"老公：你说我是A型血，你是B型血，孩子却是O型血是怎么回事？\n老婆：这都怪你！孩子出生你也不在身边，当时孩子生下来体弱贫血，\n必须输血，好心的邻居大哥给输的血，孩子才抢救过来！",
               @"photo":@[@"https://ss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=3229727480,642457655&fm=116&gp=0.jpg", @"https://ss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=2783552916,508796275&fm=116&gp=0.jpg"],
               @"favour":@"33",
               @"comment":@"9"},
             @{@"date":@[@"2014", @"7", @"5"],
               @"text":@"凤姐不小心掉进了海豚养殖池里。就在这千钧一发之际，一只雄性海豚救了凤姐，把她从池里推到了岸边。\n雌性海豚生气地问：“你为什么要救她？”\n雄性海豚笑着说：“一个这么丑的人如果死在了池里，我会天天做恶梦的。”",
               @"photo":@[@"https://ss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=705115385,3322141037&fm=116&gp=0.jpg"],
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
        [self setMsgInfo:cell.contentView info:[data objectAtIndex:indexPath.row]];

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
        if (!cellHeightDic) {
            cellHeightDic = [[NSMutableDictionary alloc] initWithCapacity:20];
        }
        NSString* key = [NSString stringWithFormat:@"%ld", indexPath.row];
        NSNumber* h = [cellHeightDic objectForKey:key];
        if (h) {
            return [h floatValue];
        }
        CGFloat height = 76;
        NSDictionary* info = [data objectAtIndex:indexPath.row];

        NSString* text = [info objectForKey:@"text"];
        NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
        paragraphStyle.lineBreakMode = NSLineBreakByWordWrapping;
        NSDictionary *attributes = @{NSFontAttributeName:[UIFont systemFontOfSize:14], NSParagraphStyleAttributeName:paragraphStyle.copy};
        CGSize labelSize = [text boundingRectWithSize:CGSizeMake(_MainScreen_Width-64, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:attributes context:nil].size;
        labelSize.height = ceil(labelSize.height);
        height += labelSize.height;

        NSArray* photos = [info objectForKey:@"photo"];
        if ([photos count] > 1) {
            height += (((_MainScreen_Width-64-20)/3.0)*([photos count]/3+([photos count]%3>0?1:0)));
        } else {
            height += 100;
        }
        if (!h) {
            [cellHeightDic setObject:[NSNumber numberWithFloat:height] forKey:key];
        }

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

    UILabel* date = (UILabel*)[superView viewWithTag:1202];
    if (!date) {
        date = [[UILabel alloc] init];
        [superView addSubview:date];
        date.tag = 1202;
        date.backgroundColor = [UIColor clearColor];
        date.textColor = [UIColor blackColor];
        date.font = [UIFont boldSystemFontOfSize:16.0];
        [date mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(timeLine.mas_right).with.offset(6);
            make.top.offset(6);
            make.right.offset(0);
            make.height.offset(20);
        }];
    }
    NSArray* dateArr = [info objectForKey:@"date"];
    NSString* dateStr = [NSString stringWithFormat:@"%@日 %@月 %@", [dateArr objectAtIndex:2], [dateArr objectAtIndex:1], [dateArr objectAtIndex:0]];
    date.text = dateStr;

    UIButton* more = (UIButton*)[superView viewWithTag:1203];
    if (!more) {
        more = [[UIButton alloc] init];
        [superView addSubview:more];
        [more setImage:[UIImage imageNamed:@"default_gift"] forState:UIControlStateNormal];
        more.tag = 1203;
        [more mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.offset(-10);
            make.bottom.offset(-10);
            make.size.sizeOffset(CGSizeMake(30, 25));
        }];
    }

    UIButton* comment = (UIButton*)[superView viewWithTag:1204];
    if (!comment) {
        comment = [[UIButton alloc] init];
        [superView addSubview:comment];
        [comment setImage:[UIImage imageNamed:@"screen_public-voice"] forState:UIControlStateNormal];
        comment.tag = 1204;
        [comment setContentHorizontalAlignment:UIControlContentHorizontalAlignmentRight];
        [comment setTitleEdgeInsets:UIEdgeInsetsMake(0, -35, 0, 0)];
        [[comment titleLabel] setFont:[UIFont systemFontOfSize:13]];
        [comment setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        [comment setImageEdgeInsets:UIEdgeInsetsMake(0, 0, 0, 35)];
        [comment setBackgroundColor:[UIColor clearColor]];
        [comment mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(more.mas_left).with.offset(-5);
            make.bottom.offset(-10);
            make.size.sizeOffset(CGSizeMake(60, 25));
        }];
    }
    [comment setTitle:[NSString stringWithFormat:@"%@k+", [info objectForKey:@"comment"]] forState:UIControlStateNormal];

    UIButton* favour = (UIButton*)[superView viewWithTag:1205];
    if (!favour) {
        favour = [[UIButton alloc] init];
        [superView addSubview:favour];
        [favour setImage:[UIImage imageNamed:@"screen_private voice"] forState:UIControlStateNormal];
        favour.tag = 1205;
        [favour setContentHorizontalAlignment:UIControlContentHorizontalAlignmentRight];
        [favour setTitleEdgeInsets:UIEdgeInsetsMake(0, -35, 0, 0)];
        [[favour titleLabel] setFont:[UIFont systemFontOfSize:13]];
        [favour setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        [favour setImageEdgeInsets:UIEdgeInsetsMake(0, 0, 0, 35)];
        [favour setBackgroundColor:[UIColor clearColor]];
        [favour mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(comment.mas_left).with.offset(-5);
            make.bottom.offset(-10);
            make.size.sizeOffset(CGSizeMake(60, 25));
        }];
    }
    [favour setTitle:[NSString stringWithFormat:@"%@k+", [info objectForKey:@"favour"]] forState:UIControlStateNormal];

    CGFloat photoViewWidth = _MainScreen_Width-64-20;
    UIView* photo = [superView viewWithTag:1206];
    if (!photo) {
        photo = [[UIView alloc] init];
        [superView addSubview:photo];
        photo.tag = 1206;
        photo.userInteractionEnabled = YES;
        photo.backgroundColor = [UIColor clearColor];
        [photo mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(timeLine.mas_right).with.offset(6);
            make.bottom.equalTo(favour.mas_top).with.offset(-5);
            make.width.offset(photoViewWidth/3.0);
            make.height.offset(photoViewWidth/3.0);
        }];
    }
    CGFloat height = 0;
    NSArray* photos = [info objectForKey:@"photo"];
    int photoCnt = (int)[photos count];
    if (photoCnt > 1) {
        height = (photoViewWidth/3.0)*(photoCnt/3+(photoCnt%3>0?1:0));
        [photo mas_updateConstraints:^(MASConstraintMaker *make) {
            make.height.offset(height);
        }];
    }
    NSArray* subViews = [photo subviews];
    for (UIView* subView in subViews) {
        [subView removeFromSuperview];
    }
    for (int i=0; i<photoCnt; i++) {
        UIImageView* photoItem = [[UIImageView alloc] init];
        [photo addSubview:photoItem];
        photoItem.backgroundColor = [UIColor clearColor];
        photoItem.userInteractionEnabled = YES;
        if (photoCnt > 1) {
            int row = i/3;
            int line = i%3;
            [photoItem mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.offset((photoViewWidth/3.0+10)*line);
                make.top.offset((photoViewWidth/3.0+10)*row);
                make.width.offset(photoViewWidth/3.0);
                make.height.offset(photoViewWidth/3.0);
            }];
            photoItem.contentMode = UIViewContentModeScaleToFill;
        } else {
            [photoItem mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.offset(0);
                make.top.offset(0);
                make.width.equalTo(photo);
                make.height.equalTo(photo);
            }];
            photoItem.contentMode = UIViewContentModeScaleAspectFit;
        }
        NSString* photoUrl = [photos objectAtIndex:i];
        [photoItem sd_setImageWithPreviousCachedImageWithURL:[NSURL URLWithString:photoUrl] andPlaceholderImage:[UIImage imageNamed:@"screen_private voice"] options:SDWebImageRetryFailed progress:^(NSInteger receivedSize, NSInteger expectedSize) {

        } completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
            
        }];
    }

    UILabel* text = (UILabel*)[superView viewWithTag:1207];
    if (!text) {
        text = [[UILabel alloc] init];
        [superView addSubview:text];
        text.tag = 1207;
        text.backgroundColor = [UIColor clearColor];
        text.textColor = [UIColor blackColor];
        text.font = [UIFont boldSystemFontOfSize:14.0];
        text.textAlignment = NSTextAlignmentLeft;
        text.lineBreakMode = NSLineBreakByWordWrapping;
        text.numberOfLines = 0;
        [text mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(timeLine.mas_right).with.offset(6);
            make.top.equalTo(date.mas_bottom).with.offset(5);
            make.right.offset(-10);
            make.bottom.equalTo(photo.mas_top).with.offset(-5);
        }];
    }
    text.text = [info objectForKey:@"text"];

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
