# ZYLoggingAPI

日志组件统一API,目前所有组件全部支持ZYLoggingAPI

### CocoaPods 安装
    pod ZYLoggingAPI
    
### 要求
* ARC支持
* iOS 5.0+

### 使用方法

error > warn > info > debug > verbose

```objective-c
	#import "ZYLoggingMacros.h"

	ZYLogError(frmt, ...);
	ZYLogWarn(frmt, ...);
	ZYLogInfo(frmt, ...)
	ZYLogDebug(frmt, ...)
	ZYLogVerbose(frmt, ...)
	
```
