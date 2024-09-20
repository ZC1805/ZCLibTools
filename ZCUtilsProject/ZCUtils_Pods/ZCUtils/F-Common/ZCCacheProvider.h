//
//  ZCCacheProvider.h
//  LibTYTools
//
//  Created by zjy on 2023/10/30.
//

#import "ZCService.h"

NS_ASSUME_NONNULL_BEGIN

@interface ZCCacheProvider : ZCService  /**< 数据持久化 */

@property (nonatomic, assign) CGFloat cache_status_bar_hei;  /**< 取值不会为nil 赋值时传递nil则代表下次赋值或取值必是从磁盘中存取 */

@end

NS_ASSUME_NONNULL_END
