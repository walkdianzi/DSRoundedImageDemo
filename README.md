# DSRoundedImageDemo

[![License MIT](https://img.shields.io/badge/license-MIT-green.svg?style=flat)](https://github.com/walkdianzi/DSRoundedImageDemo/blob/master/LICENSE)&nbsp;

Best Rounded Image without Off-Screen Rendering

#两种方式
1. 圆角图片覆盖
2. SDWebImage中Core Graphics绘制圆角并缓存

#如何使用
1. 圆角覆盖方式

```objectivec
#import "DSRoundImageView.h"
#import "UIImageView+WebCache.h"
DSRoundImageView *imageView = [[DSRoundImageView alloc]initWithFrame:CGRectMake(100, 100, 50, 50)];
```

2. SDWebImage中Core Graphics绘制圆角并缓存方式

```objectivec
#import "UIImageView+WebCache.h"

UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(100, 100, 50, 50)];
NSURL *url = [NSURL URLWithString:@"http://pic.meizitu.com/wp-content/uploads/2015a/11/11/01.jpg"];
[imageView setIsRound:YES withSize:CGSizeMake(50, 50)];
[imageView sd_setImageWithURL:url];
```
修改SDWebImage这个库里的代码，根据[imageView setIsRound:YES withSize:CGSizeMake(50, 50)];这句
使存入缓存内的是已经绘制为圆角的image。
SDWebImage中新加入的代码为有 **//!!!: 绘制圆角** 注释部分的代码

#最后
- 如果我的项目对你有帮助欢迎 Star  
- 如果在使用过程中遇到BUG，希望你能Issues我
- 如果在使用过程中发现功能不够用或者想交流的，希望你能Issues我，或者联系我QQ：398411773
- 如果你想为DSRoundedImage输出代码，请拼命Pull Requests我
