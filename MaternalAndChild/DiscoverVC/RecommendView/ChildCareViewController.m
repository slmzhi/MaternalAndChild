//
//  ChildCareViewController.m
//  MaternalAndChild
//
//  Created by SLM on 15/7/14.
//  Copyright (c) 2015年 fr.eivo. All rights reserved.
//

#import "ChildCareViewController.h"
#import "ADView.h"

@interface ChildCareViewController ()
{
    NSMutableArray* _dataArr;
}
@end

@implementation ChildCareViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _dataArr=[[NSMutableArray alloc]initWithObjects:@"宝宝便秘",@"宝宝低烧",@"宝宝防潮", nil];
    self.view.backgroundColor=[UIColor colorWithRed:243/255.0 green:246/255.0 blue:245/255.0 alpha:1.0];
    [self creatNavigationView];
    
   
}
- (void)creatNavigationView
{
    UIView* titleView=[[UIView alloc]initWithFrame:CGRectMake(0, 0, kScreenSize.width, 80)];
    
    UIButton* backButton=[[UIButton alloc]initWithFrame:CGRectMake(10, 15, 30, 30)];
    [backButton setTitle:@"<" forState:UIControlStateNormal];
    [backButton setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [backButton addTarget:self action:@selector(backClick) forControlEvents:UIControlEventTouchUpInside];
    [titleView addSubview:backButton];
    
    UILabel* titleLabel=[[UILabel alloc]initWithFrame:CGRectMake((kScreenSize.width-80)/2, 15, 80, 30)];
    titleLabel.text=@"育儿资讯";
    [titleView addSubview:titleLabel];
    
    [self creatSegControl:titleView];
    
    [self.view addSubview:titleView];

}
- (void)backClick
{
    [self dismissViewControllerAnimated:YES completion:nil];
}
- (void)creatSegControl:(UIView*)titleView
{
    NSArray* titleArr=@[@"产后恢复",@"辅助大全",@"育儿指南",@"常见问题"];
    UISegmentedControl* seg=[[UISegmentedControl  alloc]initWithItems:titleArr];
    seg.frame=CGRectMake(20, 50, kScreenSize.width-40, 25);
    
    seg.selectedSegmentIndex=0;
    
    NSDictionary *dict = @{NSFontAttributeName:[UIFont systemFontOfSize:12],NSForegroundColorAttributeName:[UIColor blueColor]};
    [seg setTitleTextAttributes:dict forState:UIControlStateNormal];
    [seg addTarget:self action:@selector(segClick:) forControlEvents:UIControlEventValueChanged];
    [titleView addSubview:seg];
    [self creatTableView];
}
- (void)segClick:(UISegmentedControl*)seg
{
    NSLog(@"index:%ld",seg.selectedSegmentIndex);
       switch (seg.selectedSegmentIndex) {
        case 0:
        {
            [self creatTableView];
        }
            break;
        case 1:
        {
            
        }
            break;
        case 2:
        {
            
        }
            break;
        case 3:
        {
            
        }
            break;
            
        default:
            break;
    }
}
#pragma mark - tableView
- (void)creatTableView
{
    self.tableView=[[UITableView alloc]initWithFrame:CGRectMake(0, 80, kScreenSize.width, kScreenSize.height-80)];
    self.tableView.delegate=self;
    self.tableView.dataSource=self;
    self.tableView.rowHeight=120;
    self.tableView.bounces=NO;
    ADView* headerView=[[ADView alloc]initWithFrame:CGRectMake(0, 0, kScreenSize.width, 160)];
    self.tableView.tableHeaderView=headerView;
    
    self.tableView.layer.borderWidth=1;
    self.tableView.layer.borderColor=[[UIColor blackColor]CGColor ];
    
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"seg0"];
    [self.view addSubview:self.tableView];
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 3;
}
- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell* cell=[self.tableView dequeueReusableCellWithIdentifier:@"seg0" forIndexPath:indexPath];
    cell.layer.borderWidth=1;
    cell.layer.borderColor=[[UIColor grayColor]CGColor ];
    
    UILabel* titleLabel=[[UILabel alloc]initWithFrame:CGRectMake(0, 0, kScreenSize.width, 20)];
    titleLabel.textAlignment=NSTextAlignmentLeft;
    titleLabel.text=_dataArr[indexPath.row];
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
    return cell;
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
