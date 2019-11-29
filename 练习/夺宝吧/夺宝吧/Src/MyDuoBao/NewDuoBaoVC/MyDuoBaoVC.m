//
//  MyDuoBaoVC.m
//  夺宝吧
//
//  Created by xiaocai on 15/6/15.
//  Copyright (c) 2015年 FangYuan. All rights reserved.
//

#import "MyDuoBaoVC.h"
#import "MyDuoBaoView.h"
static MyDuoBaoVC *_myDuoBaoVC = nil;

#define GET_USERINFO_URL @"/api/ApiUser/getUserProfile"
@interface MyDuoBaoVC ()
{
    MyDuoBaoView *dbao;
}
@end

@implementation MyDuoBaoVC

- (instancetype)init
{
    if (self = [super init]) {
        self.view.backgroundColor = [UIColor whiteColor];
    }
    return  self;
}
- (void)viewWillAppear:(BOOL)animated
{
    [dbao updateMyInfo];
    [self requestForUserInfo];
}
//获取夺宝界面单例的方法
+ (MyDuoBaoVC *)shareMyDuoBaoVC
{
    static MyDuoBaoVC *staticDuoBaoVC = nil;
    static dispatch_once_t once;
    dispatch_once(&once, ^{
        staticDuoBaoVC = [[MyDuoBaoVC alloc]init];
    });
    
    return staticDuoBaoVC;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.automaticallyAdjustsScrollViewInsets = NO;
    dbao = [[[NSBundle mainBundle]loadNibNamed:@"MyDuoBaoView" owner:self options:nil]lastObject];
    dbao.father = self;
    dbao.frame = CGRectMake(0, 0, WYMWITH, WYMHEIGHT);
    [self.view addSubview:dbao];
}
//请求用户信息
- (void)requestForUserInfo
{
    if ([UserInfo getUserID] != nil && [UserInfo getUserToken]!=nil && [UserInfo getRefreshToken]!= nil) {
        //唯一标示devicetoken
        NSString *device_token = [[NSUserDefaults standardUserDefaults] objectForKey:@"DEVICETOKEN"];

        //update by weienjie 20150917
        NSMutableDictionary *params =[NSMutableDictionary dictionaryWithDictionary:@{@"refresh_cache":@"1",@"uid":[UserInfo getUserID],@"token":[UserInfo getUserToken],@"refresh_token":[UserInfo getRefreshToken]}];
        if (device_token)
        {
            [params setObject:device_token forKey:@"device_token"];
        }
        //update end
        
    
        [WYRequest startPostForDicWithUrlStR:[NSString stringWithFormat:@"%@%@",DBB_IP,GET_USERINFO_URL] Parameters:params successBlock:^(NSDictionary *dic) {
            [UserInfo updateUserInfoWithDic:dic[@"data"]];
            //是否上架标志show_pay
            if ([dic[@"data"][@"show_pay"] class]!= [NSNull class]) {
                NSUserDefaults *user = [NSUserDefaults standardUserDefaults];
                NSNumber *flag = dic[@"data"][@"show_pay"];
                [user setObject:flag forKey:@"user_show_pay"];
            }
            [dbao showBtn];
            [dbao updateMyInfo];
            //保存分享信息
            [UserInfo setShareTitle:dic[@"data"][@"share_title"] Content:dic[@"data"][@"share_content"] ShareURL:dic[@"data"][@"share_link"]];
            //保存一键加群key
            [UserInfo keyForAddQQ:[WYPublic getUsefullStr:dic[@"data"][@"one_key_add_qq_group"]] Num:dic[@"data"][@"one_key_add_qq_group_num"]];
        } failedBlock:^{
            
        } needLog:NO];
    }
}
//跳往充值页面
- (void)goToPay{
    [dbao goToPay];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
