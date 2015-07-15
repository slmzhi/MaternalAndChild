//
//  RecommendViewController.m
//  MaternalAndChild
//
//  Created by SLM on 15/7/14.
//  Copyright (c) 2015年 fr.eivo. All rights reserved.
//

#import "RecommendViewController.h"

@interface RecommendViewController ()
{
    NSMutableArray* _dataArr;
}
@end

@implementation RecommendViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSArray* arr1=@[@"宝宝便秘",@"宝宝低烧",@"宝宝防潮"];
    NSArray* arr2=@[@"中国国学",@"母婴教育",@"胎教音乐",@"宝宝识字",@"提高宝宝情商"];
    NSArray* arr3=@[@"如何建立一周岁良好餐谱",@"看数据知宝宝健康"];
    _dataArr=[[NSMutableArray alloc]initWithObjects:arr1,arr2,arr3, nil];
    
    self.view.backgroundColor=[UIColor colorWithRed:240/255.0 green:239/255.0 blue:245/255.0 alpha:1.0];
    [self creatTableView];
    [self creatBackButton];
    
}
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self showHideThisView:YES];
}
- (void)creatBackButton
{
    UIView* headView=[[UIView alloc]initWithFrame:CGRectMake(0, 0, kScreenSize.width, 30)];
    UIButton* button=[[UIButton alloc]initWithFrame:headView.bounds];
    [button setTitle:@"👇" forState:UIControlStateNormal];
    //[button setBackgroundColor:[UIColor grayColor]];
    [button addTarget:self action:@selector(backButton:) forControlEvents:UIControlEventTouchUpInside];
    [headView addSubview:button];
    self.tableView.tableHeaderView=headView;
}
- (void)backButton:(UIButton*)button
{
    NSLog(@"点击了");
    [self showHideThisView:NO];
}
- (void)showHideThisView:(BOOL)show {
    WS(ws)
    __block CGRect frame = self.view.frame;
    frame.origin.y = show?self.view.frame.size.height:0;
    [self.view setFrame:frame];
    [UIView animateWithDuration:0.3 animations:^{
        frame.origin.y = show?0:self.view.frame.size.height;
        [ws.view setFrame:frame];
    } completion:^(BOOL finished) {
        if (!show) {
            [ws.view removeFromSuperview];
        }
        
    }];
    
}

#pragma mark - tableView
- (void)creatTableView
{
    self.tableView=[[UITableView alloc]initWithFrame:CGRectMake(10,20,kScreenSize.width-20, kScreenSize.height-50)style:UITableViewStyleGrouped];
    self.tableView.delegate=self;
    self.tableView.dataSource=self;
    self.tableView.bounces=NO;
    self.tableView.backgroundColor=[UIColor clearColor];
    
    [self.view addSubview:self.tableView];
    //[self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"RecommendCell"];
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
       return _dataArr.count;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section==1) {
        return [_dataArr[section] count]/2+1;
    }
    return [_dataArr[section] count];
}
- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell*  cell=[[UITableViewCell alloc]init];
    cell.layer.borderColor=[[UIColor grayColor]CGColor];
    cell.layer.borderWidth=1;
    
   // NSLog(@"indexPath.section：%ld",indexPath.section);

    switch (indexPath.section) {
        case 0:
        {
            UILabel* titleLabel=[[UILabel alloc]initWithFrame:CGRectMake(0, 0, kScreenSize.width, 20)];
            titleLabel.textAlignment=NSTextAlignmentLeft;
            titleLabel.text=_dataArr[indexPath.section][indexPath.row];
            [cell addSubview:titleLabel];
            
            UIImageView* imageView=[[UIImageView alloc]initWithFrame:CGRectMake(0, 20, kScreenSize.width, 80)];
            [imageView sd_setImageWithURL:[NSURL URLWithString:@"https://ss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=3303992133,3208352813&fm=116&gp=0.jpg"]];
            [cell addSubview:imageView];
            NSArray* labelTitle=@[@"原创",@"浏览",@"评论"];
            
            for (NSInteger i=0; i<3; i++) {
                UILabel* label=[[UILabel alloc]initWithFrame:CGRectMake(60*i,100, 60, 20)];
                label.text=[NSString stringWithFormat:@"%@ %u",labelTitle[i],arc4random()%50];
                label.font=[UIFont systemFontOfSize:12];
                [cell addSubview:label];
            }

        }
            break;
        case 1:
        {
            if (indexPath.row==0)
            {
                UIImageView* imageView=[[UIImageView alloc]initWithFrame:CGRectMake(0, 0,kScreenSize.width, 200)];
                [imageView sd_setImageWithURL:[NSURL URLWithString:@"https://ss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=3303992133,3208352813&fm=116&gp=0.jpg"]];
                [cell addSubview:imageView];
                
                UILabel* titleLabel=[[UILabel alloc]initWithFrame:CGRectMake(10,200-50, kScreenSize.width-10, 30)];
                titleLabel.text=_dataArr[indexPath.section][indexPath.row];
                [cell addSubview:titleLabel];
                NSArray* titles=@[@"国学教育",@"13K",@"13K"];
                for (NSInteger i=0; i<3; i++)
                {
                    UIButton* button=[[UIButton alloc]initWithFrame:CGRectMake(10+80*i,180, 75, 20)];
                    [button setImage:[UIImage imageNamed:@"icon_guanbi"] forState:UIControlStateNormal];
                    [button setTitle:titles[i] forState:UIControlStateNormal];
                    [ button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
                    button.titleLabel.font=[UIFont systemFontOfSize:12];
                    button.titleEdgeInsets = UIEdgeInsetsMake(0,-40,0,0);//设置title在button上的位置（上top，左left，下bottom，右right）
                    button.imageEdgeInsets = UIEdgeInsetsMake(0,0,0,40);//设置image在button上的位置（上top，左left，下bottom，右right）这里可以写负值，对上写－5，那么image就象上移动5个像素
                    [cell addSubview:button];
                 }
            }
            else
            {
                for (NSInteger i=0; i<2; i++) {
                    CGFloat wid=(self.tableView.bounds.size.width-40)/2.0;
                    UIImageView* imageView=[[UIImageView alloc]initWithFrame:CGRectMake(10+(wid+20)*i, 10,wid , 120-20)];
                    [imageView sd_setImageWithURL:[NSURL URLWithString:@"https://ss2.baidu.com/6ONYsjip0QIZ8tyhnq/it/u=1866378941,1732048739&fm=58"]];
                    UILabel* titleLabel=[[UILabel alloc]initWithFrame:CGRectMake(0, 120-40, wid-40, 20)];
                    titleLabel.text=_dataArr[indexPath.section][indexPath.row+i ];
                    [imageView addSubview:titleLabel];
                    [cell addSubview:imageView];
                }
            }
        }
            break;
        case 2:
        {
            UIImageView* imageView=[[UIImageView alloc]initWithFrame:CGRectMake(10, 10,100, 80)];
            [imageView sd_setImageWithURL:[NSURL URLWithString:@"https://ss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=3303992133,3208352813&fm=116&gp=0.jpg"]];
            [cell addSubview:imageView];
            
            UILabel* label=[[UILabel alloc]initWithFrame:CGRectMake(120, 10, self.tableView.bounds.size.width-120-10, 120-60)];
            label.textAlignment=UIControlContentVerticalAlignmentTop;
            label.textAlignment=NSTextAlignmentLeft;
            label.numberOfLines=3;
            label.text=_dataArr[indexPath.section][indexPath.row];
            [cell addSubview:label];
            
            NSArray* titles=@[@"育儿经",@"13K"];
            for (NSInteger j=0; j<2; j++) {
                UIButton* button=[[UIButton alloc]initWithFrame:CGRectMake(120+80*j, 100-40, 70,30)];
                [button setImage:[UIImage imageNamed:@"icon_guanbi"] forState:UIControlStateNormal];
                [button setTitle:titles[j] forState:UIControlStateNormal];
                [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
                button.titleLabel.font=[UIFont systemFontOfSize:14];
                button.titleEdgeInsets = UIEdgeInsetsMake(0,-40,0,0);
                button.imageEdgeInsets = UIEdgeInsetsMake(0,0,0,40);
                
                [cell addSubview:button];
            }
        }
            break;
            
        default:
            break;
    }
        return cell;
    
}

- (UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView* headView=[self.tableView dequeueReusableHeaderFooterViewWithIdentifier:@"RecommendCellHeader"];
    if (headView==nil) {
        headView=[[UIView alloc]initWithFrame:CGRectMake(0,0,kScreenSize.width,self.tableView.sectionHeaderHeight)];
    }
    
    headView.layer.borderColor=[[UIColor grayColor]CGColor];
    headView.layer.borderWidth=2;
    
    headView.backgroundColor=[UIColor greenColor];
    NSArray* dataArr=[NSArray arrayWithObjects:@"推荐资讯",@"育儿教程",@"火热圈子", nil];
    UILabel* titleLabel=[[UILabel alloc]initWithFrame:CGRectMake(0, 0, 150, 30)];
    titleLabel.text=dataArr[section];
    titleLabel.textAlignment=NSTextAlignmentLeft;
    [headView addSubview:titleLabel];
    
    UIButton* button=[[UIButton alloc]initWithFrame:CGRectMake(kScreenSize.width-70, 0, 60,30)];
    [button setTitle:@"更多" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [button addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    [headView addSubview:button];
    
    return  headView;
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CGFloat height=100;
    if (indexPath.section==0)
    {
        height=120;
    }
    else if (indexPath.section==1)
    {
        if (indexPath.row==0)
        {
             height=200;
        }
        else
        {
            height=120;
        }
    }
      return height;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 30;
}

- (void)btnClick:(UIButton*)button
{
    NSLog(@"section被点击了");
    ChildCareViewController* child=[[ChildCareViewController alloc]init];
    [self.view.window.rootViewController presentViewController:child animated:YES completion:nil];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
