//
//  ZCGlobal.h
//  ZCKit
//
//  Created by admin on 2018/9/18.
//  Copyright © 2018 Squat in house. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

@class ZCViewController;

NS_ASSUME_NONNULL_BEGIN

@interface ZCGlobal : NSObject  /**< 全局管理类 */

#pragma mark - Misc1
+ (CGFloat)ratio;  /**< 适配的单位比例点 */

+ (CGFloat)roundScreenPointsForUIPoints:(CGFloat)uiPoints;  /**< 适配的单位比例点，四舍五入 */

+ (CGFloat)ceilScreenPointsForUIPoints:(CGFloat)uiPoints;  /**< 适配的单位比例点，向上取整 */

+ (CGFloat)minScreenPoints;  /**< 最小屏幕点，默认0.01 */

+ (CGFloat)obtainDeviceStatusBarHei;  /**< 设备状态栏的固定高度 */

+ (BOOL)isiPhoneX;  /**< 是否是刘海屏手机 */

+ (BOOL)isLandscape;  /**< 当前手机是否是横屏状态 */

+ (BOOL)isValidStr:(nullable NSString *)str;  /**< 非空长度 & 不只首尾空格和换行 & 非<null> */

+ (BOOL)isExplicitArr:(nullable NSArray *)array elementClass:(Class)elementClass;  /**< 判断数组是否是指定元素类型的数组，空数组时返回YES */

#pragma mark - Misc2
+ (nullable UIImage *)imageForName:(nullable NSString *)name;  /**< 获取图片，优先从mainBundle读取 */

+ (nullable NSString *)resourcePath:(nullable NSString *)name ext:(nullable NSString *)ext;  /**< 获取资源文件路径，优先从mainBundle读取 */

#pragma mark - Misc3
+ (nullable UIViewController *)topController;  /**< 顶控制器 */

+ (nullable UIViewController *)rootController;  /**< 根控制器 */

+ (nullable ZCViewController *)lastZCController;  /**< 最后的内容控制器 */

@end

NS_ASSUME_NONNULL_END
