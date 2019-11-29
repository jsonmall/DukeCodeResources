//
//  UMengRgt.m
//  夺宝吧
//
//  Created by xiaocai on 15/7/27.
//  Copyright (c) 2015年 FangYuan. All rights reserved.
//

#import "UMengRgt.h"
#import "UMSocialWechatHandler.h"
#import "UMSocialQQHandler.h"
#import "UMSocialSinaHandler.h"
#import "UMSocialSinaSSOHandler.h"
#import "MobClick.h"
@implementation UMengRgt
+ (void)rgtUmengInFo :(NSDictionary *)launchOptions
{
    
    //统计分析
    [MobClick startWithAppkey:@"55a3546867e58e899b0024b1" reportPolicy:BATCH   channelId:@"AppStore"];
    NSString *version = [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"];
    [MobClick setAppVersion:version];
}


+ (void)shareWithVC:(UIViewController *)vc delegate:(id <UMSocialUIDelegate>)delegate
{
    //社会化分享
    
    [UMSocialData setAppKey:@"55a3546867e58e899b0024b1"];
    
    NSString *shareUrl = [NSString stringWithFormat:@"http://fx.dbba.cn:8080/pv?userid=%@",[UserInfo getUserID]];
    if ([UserInfo getShareUrl].length != 0) {
        shareUrl = [NSString stringWithFormat:@"%@?userid=%@",[UserInfo getShareUrl],[UserInfo getUserID]];
    }
    //设置微信AppId、appSecret，分享url
    [UMSocialWechatHandler setWXAppId:@"wxadf8311f1e2659ff" appSecret:@"7420a4c9a958b76975c35ff97016a860" url:shareUrl];
    
    
    //设置手机QQ 的AppId，Appkey，和分享URL，需要#import "UMSocialQQHandler.h"
    //[UMSocialQQHandler setQQWithAppId:@"1104778948" appKey:@"s6hoR3EvUOllJQ8H" url:shareUrl];
    

    
//    //打开新浪微博的SSO开关，设置新浪微博回调地址，这里必须要和你在新浪微博后台设置的回调地址一致。若在新浪后台设置我们的回调地址，“http://sns.whalecloud.com/sina2/callback”，这里可以传nil ,需要 #import "UMSocialSinaHandler.h"
    [UMSocialSinaHandler openSSOWithRedirectURL:shareUrl];
//    [UMSocialSinaSSOHandler openNewSinaSSOWithRedirectURL:@"http://sns.whalecloud.com/sina2/callback"];
    
    //由于苹果审核政策需求，建议大家对未安装客户端平台进行隐藏，在设置QQ、微信AppID之后调用下面的方法， UMShareToQQ,
    [UMSocialConfig hiddenNotInstallPlatforms:@[UMShareToQQ,UMShareToQzone,UMShareToWechatSession,UMShareToWechatTimeline,UMShareToWechatFavorite]];

    //设置title
    [UMSocialData defaultData].extConfig.title = [UserInfo getShareTitle];
    //注意：分享到微信好友、微信朋友圈、微信收藏、QQ空间、QQ好友、来往好友、来往朋友圈、易信好友、易信朋友圈、Facebook、Twitter、Instagram等平台需要参考各自的集成方法
    [UMSocialSnsService presentSnsIconSheetView:vc
                                         appKey:@"55a3546867e58e899b0024b1"
                                      shareText:[UserInfo getShareContent]
                                     shareImage:[UIImage imageNamed:@"icon120"]
                                shareToSnsNames:@[UMShareToQQ,UMShareToWechatSession,UMShareToWechatTimeline,UMShareToWechatFavorite,UMShareToQzone,UMShareToSina]
                                       delegate:delegate];
}

@end
