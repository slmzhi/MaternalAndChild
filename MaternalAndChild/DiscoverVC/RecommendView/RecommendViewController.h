//
//  RecommendViewController.h
//  MaternalAndChild
//
//  Created by SLM on 15/7/14.
//  Copyright (c) 2015年 fr.eivo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ChildCareViewController.h"

@interface RecommendViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>

@property(nonatomic,strong)UITableView* tableView;

@end
