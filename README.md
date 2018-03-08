
![](https://github.com/Liulinzhe17/LLZStatusBarAlertView/master/iPhone8.png)

![](https://github.com/Liulinzhe17/LLZStatusBarAlertView/master/iPhoneX.png)

### 使用方法

#### 弹出提示框
 * 可以传入提示文字、背景色、文字颜色、提示框展示时间

` 
[[LLZStatusBarAlertView sharedView]showWithStatus:@"hello" textColor:[UIColor redColor] barColor:[UIColor blueColor] delay:2];
`

 * 也有便捷的初始方法如：

`[[LLZStatusBarAlertView sharedView]showErrorWithStatus:@"hello"];
`
  
#### 手动消失提示框

`[[LLZStatusBarAlertView sharedView]dismiss];`
#### 可以改变的属性

* 设置消失提示框的动画时间

`[[LLZStatusBarAlertView sharedView]setDismissTransitTime:0.7];`

* 设置弹出提示框的动画时间

`[[LLZStatusBarAlertView sharedView]setShowTransitTime:2.0];`

