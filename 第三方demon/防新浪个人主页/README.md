# XMProfileController

#### 项目介绍
XMProfileController 是仿微博、网易云音乐等实现的个人主页示例控制器，实现了子控制器分页、tab 菜单滚动悬停、导航栏透明度自动变化等。

![例子演示](http://cdn.cocimg.com/bbs/attachment/Fid_21/21_471816_6638bddab4d538f.gif "演示")

![截图](https://gitee.com/uploads/images/2018/0428/100224_29d555ff_554189.png "XMProfileDemo.png")

#### 软件说明
软件说明
1. ARC,Xcode 8+;
2. Suport IPhone X;
3. Dependent on 依赖框架[WMPageController](https://github.com/wangmchn/WMPageController)

#### 安装教程
下载整个项目，将项目里面的XMProfileController文件夹拖进你的项目

#### 使用说明

1. 新建一个个人主页控制器，继承自 XMProfileController;
2. 新建 TableView 子控制器，继承自 XMTableViewController;
3. 在控制器中用子控制器类型数组和标题数组初始化你的个人主页控制器，并设置个性化菜单

#### 例子
```
// for modal方式
- (void)modalVc
{
    // 设置子控制器，子控制器数组必须和标题数组数量一致 ChildViewControllers.count must eq titlesAarray.count
    // TestMeController须继承自 XMTableViewController,其他子控制器须继承自XMTableViewController
    TestMeController *meVc = [[TestMeController alloc]initWithChildViewControllerClasses:
                              @[[TestTableViewController class],
                                [TestTableViewController class],
                                [PhotosTableViewController class],
                                [TestTableViewController class]]
                                theirTitles:@[@"主页",@"动态",@"相册", @"私密"]];
    
    // 个性化设置分页tab子控制器菜单属性
    meVc.pageVc.titleColorSelected = [UIColor blackColor];
    meVc.pageVc.titleColorNormal = [UIColor grayColor];
    meVc.pageVc.menuBGColor = [UIColor groupTableViewBackgroundColor];
    meVc.pageVc.menuViewStyle = WMMenuViewStyleLine;
    meVc.pageVc.menuViewLayoutMode = WMMenuViewLayoutModeCenter;
    meVc.pageVc.titleSizeSelected = 15;
    meVc.pageVc.titleSizeNormal = 13;
    meVc.pageVc.menuHeight = 40;
    meVc.pageVc.menuItemWidth = XMSCREEN_WIDTH /6;
    meVc.pageVc.progressColor = [UIColor orangeColor];
    meVc.pageVc.progressWidth = 25;
    meVc.pageVc.progressHeight = 2.4;
    meVc.pageVc.progressViewCornerRadius = 1.2;
    meVc.pageVc.progressViewBottomSpace = 2;
    meVc.pageVc.progressViewIsNaughty = YES;
    
    // modal方式
    meVc.isModal = YES;
    UINavigationController *nav = [[UINavigationController alloc]initWithRootViewController:meVc];
    [self presentViewController:nav animated:YES completion:nil];;
}
```

#### 更多
个人博客：[sujiansong.com](http://www.sujiansong.com)
联系方式：[CocoaChina主页](http://www.cocoachina.com/bbs/u.php?action=feed&uid=471816)
