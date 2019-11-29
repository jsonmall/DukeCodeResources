

Apple出品的操作系统的可执行文件格式几乎都是mach-o，iOS当然也不例外。 mach-o可以大致的分为三部分：

* Header 头部，包含可以执行的CPU架构，比如x86,arm64
* Load commands 加载命令，包含文件的组织架构和在虚拟内存中的布局方式
* Data，数据，包含load commands中需要的各个段(segment)的数据，每一个Segment都得大小是Page的整数倍



哪些名词指的是Mach-o
* Executable 可执行文件，OS 应用程序的主要二进制文件
* Dylib 动态库
* Bundle 无法被连接的动态库，只能通过dlopen()加载
* Image 指的是Executable，Dylib或者Bundle的一种，
* Framework 动态库和对应的头文件和资源文件的集合，note：framework也可以包含静态库，但静态库不是Macho-O

App启动过程:

pre-main过程:


main过程：

Per_main启动:
①解析Info.plist 
加载相关信息，例如闪屏
沙箱建立、权限检查
②Mach-O加载 (main函数之前)
如果是胖二进制文件，寻找合适当前CPU架构的部分
加载所有依赖的Mach-O文件（递归调用Mach-O加载的方法）

大致的过程如下：
加载dyld到App进程

加载动态库（包括所依赖的所有动态库）

Rebase

Bind

初始化Objective C Runtime

其它的初始化代码
1.什么是dyld? 
它的全称，是dynamic loader， 它的作用是加载一个进程所需要的image     为了提升系统的安全性，很多系统库文件都被打包到一个缓存的文件当中即dyld缓存，也是共享缓存。
静态库：链接时，静态库会被完整地复制到可执行文件中，被多次使用就有多份冗余拷贝
系统动态库：链接时不复制，程序运行时由系统动态加载到内存，供程序调用，系统只加载一次，多个程序共用。它的优点：节省内存，易于维护，减少可执行文件体积：相比静态链接，动态链接在编译时不需要打进去，所以可执行文件的体积要小很多。
  动态链接库的加载过程主要由dyld来完成，dyld是苹果的动态链接器
2.Load Dylibs
  在每个动态库的加载过程中， dyld需要：
1. 
1.分析所依赖的动态库
2. 2.找到动态库的mach-o文件
3. 3.打开文件
4. 4.验证文件
5. 5.在系统核心注册文件签名
6. 6.对动态库的每一个segment调用mmap()
加载系统的 dylib 很快，但加载内嵌（embedded）的 dylib 文件很占时间，所以尽可能把多个内嵌 dylib 合并成一个来加载。
针对这一步骤的优化有：
1. 减少非系统库的依赖；
2. 使用静态库而不是动态库；
3. 合并非系统动态库为一个动态库；
3.这里先来讲讲为什么要Rebase？
有两种主要的技术来保证应用的安全：ASLR（地址空间布局随机化）和Code Sign （加密哈希不是针对于整个文件，而是针对于每一个Page的。这就保证了在dyld进行加载的时候，可以对每一个page进行独立的验证）
由于可执行文件和动态链接库在虚拟内存中的加载地址每次启动都不固定，所以需要这2步来修复镜像中的资源指针，来指向正确的地址。 rebase修复的是指向当前镜像内部的资源指针； 而bind指向的是镜像外部的资源指针
4.Binding

Binding：将指针指向镜像外部的内容，binding就是将这个二进制调用的外部符号进行绑定的过程。比如我们objc代码中需要使用到NSObject, 即符号_OBJC_CLASS_$_NSObject，但是这个符号又不在我们的二进制中，在系统库 Foundation.framework中，因此就需要binding这个操作将对应关系绑定到一起；
针对这部分的优化：
             1. 所以减少指针数量才会减少这部分工作的耗时。
             2. 对于 ObjC 来说就是减少 Class,selector 和 category ，把未使用的类和函数都可以删掉 。
            3. 减少c++虚函数的数量
             3. 从编码原则和设计模式之类的理论都会鼓励大家多写精致短小的类和方法，并将每部分方法独立出一个类别，其实这会增加启动时间
5.Objective C

主要做以下几件事来完成Objc Setup:

1、读取二进制文件的 DATA 段内容，找到与 objc 相关的信息
1. 2.注册 Objc 类，ObjC Runtime 需要维护一张映射类名与类的全局表。当加载一个 dylib 时，其定义的所有的类都需要被注册到这个全局表中； 
2. 3.读取 protocol 以及 category 的信息，把category的定义插入方法列表 (category registration)， 
3. 4.确保 selector 的唯一
Objective C是动态语言，所以在执行main函数之前，需要把类的信息注册到一个全局的Table中

由于iOS开发时基于Cocoa Touch的，所以绝大多数的类起始都是系统类，所以大多数的Runtime初始化起始在Rebase和Bind中已经完成。
由于之前2步骤的优化，这一步实际上没有什么可做的。
6.Initializers
以上三步属于静态调整，都是在修改__DATA segment中的内容，而这里则开始动态调整，开始在堆和栈中写入内容。
主要工作有：
* Objc的+load方法。
* C++的构造函数属性函数 如attribute((constructor)) void DoSomeInitializationWork()
非基本类型的C++静态全局变量的创建(通常是类或结构体)(non-trivial initializer) 比如一个全局静态结构体的构建
如果在构造函数中有繁重的工作，那么会拖慢启动速度
这一步可以做的优化有：
（1）使用 +initialize 来替代 +load
区别就是，load是在类装载的时候执行，所有的+load 方法都在启动的时候调用，而initialize对应 Class 第一次使用的时候调用。+load方法已经被弃用了，如果你用Swift开发
           （2）不要使用 atribute((constructor)) 将方法显式标记为初始化器，而是让初始化方法调用时才执行。比如使用 dispatch_once(),pthread_once() 或 std::once()。也就是在第一次使用时才初始化，推迟了一部分工作耗时。也尽量不要用到C++的静态对象
    
通过在工程的scheme中,添加环境变量 DYLD_PRINT_STATISTICS_DETAILS 为ture,可以查看pre-main的耗时详情
总结pre-main的可以优化点：
 1.减少依赖不必要的库，不管是动态库还是静态库；如果可以的话，把动态库改造成静态库；如果必须依赖动态库，则把多个非系统的动态库合并成一个动态库；
 2.检查下 framework应当设为optional和required，如果该framework在当前App支持的所有iOS系统版本都存在，那么就设为required，否则就设为optional，因为optional会有些额外的检查。
3.合并或者删减一些OC类和函数；关于清理项目中没用到的类，使用工具AppCode代码检查功能，查到当前项目中没有用到的类。
  ->什么工具检查没有使用的图片？链接： https://github.com/tinymind/LSUnusedResources
  ->什么工具检查没有使用的类？ 链接：https://github.com/CatchZeng/CATClearProjectTool
4.删减一些无用的静态变量，删减没有被调用到或者已经废弃的方法
5.将不必须在+load方法中做的事情延迟到+initialize中，尽量不要用C++虚函数(创建虚函数表有开销)
6.类和方法名不要太长：iOS每个类和方法名都在__cstring段里都存了相应的字符串值，所以类和方法名的长短也是对可执行文件大小是有影响的，因还是object-c的动态特性，因为需要通过类/方法名反射找到这个类/方法进行调用
7.用dispatch_once( )代替所有的 attribute((constructor)) 函数、C++静态对象初始化、ObjC的+load函数，也就是在第一次使用时才初始化，推迟了一部分工作耗时，其次dispatch_once可以简化代码且保证线程安全，无需担心加锁或同步。
Main阶段

我们首先来分析下，从main函数开始执行，到你的第一个界面显示，这期间一般会做哪些事情。
* 执行AppDelegate的代理方法，主要是didFinishLaunchingWithOptions
* 初始化Window，初始化基础的ViewController结构(一般是UINavigationController+UITabViewController)
* 获取数据(Local DB／Network)，展示给用户。

AppDelegate

通常我们会在AppDelegate的代理方法里进行初始化工作，主要包括了两个方法：
* didFinishLaunchingWithOptions
* applicationDidBecomeActive


优化这些初始化的核心思想就是：
能延迟初始化的尽量延迟初始化，不能延迟初始化的尽量放到后台初始化。不要卡主线程的启动时间，启动阶段多用多线程进行初始化，加载首页使用纯代码而非Xib
这些工作主要可以分为几类：
* 三方SDK初始化，比如Crash统计; 像分享之类的，可以等到第一次调用再出初始化。
* 初始化某些基础服务，比如WatchDog，远程参数。
* 启动相关日志，日志往往涉及到DB操作，一定要放到后台去做
* 业务方初始化，这个交由每个业务自己去控制初始化时间。

各个业务的初始化，可以通过以下方式检测各个业务的初始化时间

@interface AppDelegate ()
//业务方需要的生命周期回调
@property (strong, nonatomic) NSArray<id<UIApplicationDelegate>> * eventQueues;
//主框架负责的生命周期回调
@property (strong, nonatomic) id<UIApplicationDelegate> basicDelegate;
@end

各个业务，在各个有实现UIApplicationDelegate方法的类中，你会得到一个非常干净的AppDelegate文件
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    for (id<UIApplicationDelegate> delegate in self.eventQueues) {
        [delegate application:application didFinishLaunchingWithOptions:launchOptions];
    }
    return [self.basicDelegate application:application didFinishLaunchingWithOptions:launchOptions];
}


Main阶段总结：
  
  1.能延迟执行的就延迟执行。比如SDK的初始化，界面的创建。
 
  2.不能延迟执行的，尽量放到后台执行。比如数据读取，原始JSON数据转对象，日志发送


这里放一张驾考通的延迟执行的任务截图：


