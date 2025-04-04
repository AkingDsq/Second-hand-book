# Second-hand book trading platform
 二手书交易平台
## 下载Qt

`https://mirrors.tuna.tsinghua.edu.cn/qt/official_releases/online_installers/qt-online-installer-windows-x64-online.exe`

选择组件： 

![Qt组件3](https://github.com/AkingDsq/Second-hand-book-trading-platform/blob/main/images/Qt组件3.png)
![Qt组件4](https://github.com/AkingDsq/Second-hand-book-trading-platform/blob/main/images/Qt组件4.png)
![Qt组件1](https://github.com/AkingDsq/Second-hand-book-trading-platform/blob/main/images/Qt组件1.png) 

## 下载GithubDesktop 

`https://central.github.com/deployments/desktop/desktop/latest/win32` 

### 汉化程序已上传至群文件，运行汉化即可 

## 下载加速软件加速Github 

`https://gitee.com/rmbgame/SteamTools/releases/download/3.0.0-rc.16/Steam%20%20_v3.0.0-rc.16_win_x64.exe`

## 克隆项目 

![githubDesktop1](https://github.com/AkingDsq/Second-hand-book-trading-platform/blob/main/images/githubDesktop1.png)  
![githubDesktop2](https://github.com/AkingDsq/Second-hand-book-trading-platform/blob/main/images/githubDesktop2.png) 


## 打开项目(建议根据下面的步骤配置好Qt安卓环境后再打开防止出错，直接打开也可以但是如果没有安卓环境会报错，配置完环境后重新进入也可) 

打开QtCreater，选择打开项目，选择此项目文件夹中的CMakeLists.txt即可 

![打开项目](https://github.com/AkingDsq/Second-hand-book-trading-platform/blob/main/images/打开项目.png) 

## 配置Qt安卓环境 

### 初查 

1.查看编辑-preferences-构建套件中是否含有安卓相关套件 

2.查看编辑-preferences-SDKs中是否配置安卓环境 

![安卓环境2](https://github.com/AkingDsq/Second-hand-book-trading-platform/blob/main/images/安卓环境2.png)  
![安卓环境3](https://github.com/AkingDsq/Second-hand-book-trading-platform/blob/main/images/安卓环境3.png)  
![安卓环境1](https://github.com/AkingDsq/Second-hand-book-trading-platform/blob/main/images/安卓环境1.png)  

### 配置OpenSSL 

OpenSSL下载源文件是国外资源，下载速度慢而且容易中断，已上传群文件以及本项目根目录images文件夹中，解压配置位置即可 

![android_openssl-master.png](https://github.com/AkingDsq/Second-hand-book-trading-platform/blob/main/images/android_openssl-master.png)  

### SDK管理器 

查补缺漏即可 

![安卓环境2](https://github.com/AkingDsq/Second-hand-book-trading-platform/blob/main/images/SDK管理器2.png)  

![SDK管理器1](https://github.com/AkingDsq/Second-hand-book-trading-platform/blob/main/images/SDK管理器1.png)  

## 测试 

### 实机测试（手机型号不同可能无法运行程序，主要针对arm64-v8a架构） 

### 打开手机开发者模式 

#### 手机：“设置-关于手机-XX版本”（此例中为HarmonyOS版本），多次点击进入开发者模式，在”设置-系统和更新“中会出现新的选项（开发人员选项），进入，打开调试中的USB调试

![实机测试](https://github.com/AkingDsq/Second-hand-book-trading-platform/blob/main/images/实机测试.jpg)  

![实机测试2](https://github.com/AkingDsq/Second-hand-book-trading-platform/blob/main/images/实机测试2.jpg)  

#### 使用USB连接手机与电脑（如果有手机弹窗，选择传输文件） 

选择你的手机设备与构建套件以及构建版本，点击左下角的运行按钮（或者点击ctrl+R）即可在手机上安装安卓程序 

![实机测试3](https://github.com/AkingDsq/Second-hand-book-trading-platform/blob/main/images/实机测试3.png)  

### 画面预览 

![画面预览](https://github.com/AkingDsq/Second-hand-book-trading-platform/blob/main/images/画面预览.png)  
