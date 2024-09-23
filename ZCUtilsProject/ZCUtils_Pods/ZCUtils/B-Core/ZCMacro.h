//
//  ZCMacro.h
//  ZCKit
//
//  Created by admin on 2018/9/6.
//  Copyright © 2018 Squat in house. All rights reserved.
//

#ifndef ZCMacro_h
#define ZCMacro_h


#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import "UIColor+ZC.h"
#import "UIImage+ZC.h"
#import "ZCGlobal.h"


/**< --- normal --- */
#define kZIsiPad                (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)      /**< 是否是iPad */
#define kZIsiPhone              (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)    /**< 是否是iPhone */
#define kZIsiPhoneX             [ZCGlobal isiPhoneX]                                        /**< 当前是否是iPhoneX */
#define kZIslandscape           [ZCGlobal isLandscape]                                      /**< 当前是否是横屏 */


/**< --- misc --- */
#define kZArrNonnil(arr)         ((NSArray *)((arr && [arr isKindOfClass:NSArray.class]) ? arr : @[]))              /**< 返回非nil数组类型，用@[]替换nil或非arr类型数据 */
#define kZStrNonnil(str)         ((NSString *)((str && [str isKindOfClass:NSString.class]) ? str : @""))            /**< 返回非nil字符串型，用@""替换nil或非str类型数据 */
#define kZDicNonnil(dic)         ((NSDictionary *)((dic && [dic isKindOfClass:NSDictionary.class]) ? dic : @{}))    /**< 返回非nil字典类型，用@{}替换nil或非dic类型数据 */
#define kZStrIsValid(str)        [ZCGlobal isValidStr:str]                                                       /**< 返回布尔型，判断字符串是否有效 & 非空格 */
#define kZUrlStr(str)            ((NSURL *)[NSURL URLWithString:kZStrNonnil(str)])                                  /**< 返回非nilRUL类型  */
#define kZStrFormat(fmt, ...)    ((NSString *)[NSString stringWithFormat:fmt, ##__VA_ARGS__])                       /**< 返回格式化字符串 */
#define kZArrExplicit(arr, ele)  ((NSArray *)([ZCGlobal isExplicitArr:arr elementClass:ele] ? arr : @[]))         /**< 若原arr为nil或非数组或元素类型不同，则返回@[] */


/**< --- color --- */
#define kZCClear                [UIColor clearColor]                       /**< 透明 */
#define kZCWhite                [UIColor colorFormHex:0xFFFFFF alpha:1.0]  /**< 白色 */
#define kZCBlack                [UIColor colorFormHex:0x000000 alpha:1.0]  /**< 黑色 */
#define kZCBlack30              [UIColor colorFormHex:0x303030 alpha:1.0]  /**< 0x30灰 */
#define kZCBlack80              [UIColor colorFormHex:0x808080 alpha:1.0]  /**< 0x80灰 */
#define kZCBlackA6              [UIColor colorFormHex:0xA6A6A6 alpha:1.0]  /**< 0xA8灰 */
#define kZCBlackDE              [UIColor colorFormHex:0xDEDEDE alpha:1.0]  /**< 0xDC灰 */
#define kZCPad                  [UIColor colorFormHex:0xF7F7F8 alpha:1.0]  /**< 背景的Pad颜色 */
#define kZCSplit                [UIColor colorFormHex:0xEAEAEA alpha:1.0]  /**< 分割线Split颜色 */
#define kZCHolder               [UIColor colorFormHex:0xAEAEAE alpha:0.7]  /**< 占位的Holder颜色 */


/**< --- color --- */
#define kZCA(color, a)          [color colorFromAlpha:a]                                        /**< 返回指定透明度颜色 */
#define kZCS(hex_str)           [UIColor colorFromHexString:hex_str alpha:1.0]                  /**< 十六进制颜色#&0x& */
#define kZCSA(hex_str, a)       [UIColor colorFromHexString:hex_str alpha:a]                    /**< 十六进制颜色#&0x& */
#define kZCRGB(hex_rgb)         [UIColor colorFormHex:hex_rgb alpha:1.0]                        /**< 十六进制颜色0x开头 */
#define kZCRGBA(hex_rgb, a)     [UIColor colorFormHex:hex_rgb alpha:a]                          /**< 十六进制颜色0x开头 & 透明度 */
#define kZCRGBV(r, g, b, a)     [UIColor colorFormRad:(int)r green:(int)g blue:(int)b alpha:a]  /**< 十进制颜色 & 透明度 */


/**< --- adapt --- */
#define kZSA(radix)             ((radix) * [ZCGlobal ratio])                /**< 按比例适配计算值 */
#define kZSWid                  ([UIScreen mainScreen].bounds.size.width)   /**< 屏幕宽 */
#define kZSHei                  ([UIScreen mainScreen].bounds.size.height)  /**< 屏幕高 */
#define kZSScreen               (CGRectMake(0, 0, kZSWid, kZSHei))          /**< 全屏幕 */
#define kZSPixel                (1.0 / [UIScreen mainScreen].scale)         /**< 最小显示像素点 */
#define kZSNaviBarHei           ([ZCGlobal isiPhoneX] ? 44.0 : 44.0)        /**< 导航栏高，竖屏值 */
#define kZSNaviHei              ([ZCGlobal isiPhoneX] ? 88.0 : 64.0)        /**< 导航栏高，竖屏值 */
#define kZSTabBarHei            ([ZCGlobal isiPhoneX] ? 49.0 : 49.0)        /**< 标签栏高，竖屏值 */
#define kZSTabHei               ([ZCGlobal isiPhoneX] ? 83.0 : 49.0)        /**< 标签栏高，竖屏值 */
#define kZSStuBarHei            ([ZCGlobal isiPhoneX] ? 44.0 : 20.0)        /**< 状态栏高，竖屏值 */
#define kZSBomResHei            ([ZCGlobal isiPhoneX] ? 34.0 : 00.0)        /**< 底预留高，竖屏值 */
#define kZSBomSafeHei           ([ZCGlobal isiPhoneX] ? 34.0 : 20.0)        /**< 底安全高，竖屏值 */


/**< --- image --- 仅供外部用 */
#define kZIN(image_name)        [UIImage imageNamed:(image_name)]                                           /**< 获取图片，缓存 */
#define kZIA(image, _a)         [image imageWithAlpha:_a]                                                   /**< 返回指定透明度的图片 */
#define kZIC(image_hex_color)   [UIImage imageWithColor:kZCRGB(image_hex_color)]                            /**< 返回指定颜色图片1px */
#define kZIF(image_file_name)   [UIImage imageWithContentsOfFile:kZFilePath(nil, image_file_name, @"png")]  /**< 获取图片 */


/**< --- float --- 仅供外部用 */
#define kZFZero(a)              (fabs((a)) < FLT_EPSILON)                      /**< a等于0 */
#define kZFEqual(a, b)          (fabs((a) - (b)) < FLT_EPSILON)                /**< a等于b */
#define kZFAbove(a, b)          (fabs((a) - (b)) >= FLT_EPSILON && (a) > (b))  /**< a大于b */
#define kZFBelow(a, b)          (fabs((a) - (b)) >= FLT_EPSILON && (a) < (b))  /**< a小于b */


/**< --- 文件路径 --- */
#define kZFilePath(fileName, extName) [ZCGlobal resourcePath:fileName ext:extName]  /**< 文件路径 */


/**< --- 打印日志 --- */
#ifdef DEBUG
#define kZLog(format, ...) fprintf(stderr, "%s\n", [[NSString stringWithFormat:format, ##__VA_ARGS__] UTF8String]);  /**< 打印数据 */
#else
#define kZLog(...)
#endif


#endif /* ZCMacro_h */






















//
//  ZCConstant.h
//  Pods
//
//  Created by zjy on 2023/10/27.
//

#ifndef ZCConstant_h
#define ZCConstant_h


#import "ZCProxy.h"
#import "TYGlobalTool.h"
#import <PPLanguageExtensions/UIColor+PPHex.h>


#define ZC_Wid                      (UIScreen.mainScreen.bounds.size.width)
#define ZC_Hei                      (UIScreen.mainScreen.bounds.size.height)
#define ZC_1Px                      (1.0 / MAX(1.0, UIScreen.mainScreen.scale))
#define ZC_Am                       [TYGlobalTool minScreenPoints]
#define ZC_Dp(x)                    (ZC_Wid * (x) / 375.0)
#define ZC_AdJustH(x)               (ZC_Hei * (x) / 667.0)
#define ZC_SmallScreen              (ZC_Hei <= 667)
#define ZC_Ar(x)                    [TYGlobalTool roundScreenPointsForUIPoints:x]
#define ZC_StuBarHei                (TYGlobalTool.sharedInstance.obtainStatusBarHei)
#define ZC_NaviBarHei               (56.0)
#define ZC_NaviHei                  (ZC_StuBarHei + ZC_NaviBarHei)
#define ZC_SafeHei                  (ZC_IPhoneX ? 34.0 : 20.0)
#define ZC_SysTabBarHei             (ZC_IPhoneX ? 83.0 : 49.0)
#define ZC_CusTabBarHei             (ZCProxy.imp.tabBarHei)
#define ZC_App_Normal_Margin        16 //视图边距
#define ZC_LineHeight               (1.0/[UIScreen mainScreen].scale)

#define ZC_Color(x)                 [UIColor colorBuildFromHexStr:x]
#define ZC_ColorA(x, a)             [UIColor colorBuildFromColor:ZC_Color(x) alpha:a]
#define ZC_UrlStr(x)                [NSURL URLWithString:ZC_StrNonnil(x)]
#define ZC_Image(x)                 [TYGlobalTool imageForName:x]


#define ZC_FuncLimit(a, max, min)   (MIN(max, MAX(min, a)))
#define ZC_KeyWindow                UIApplication.sharedApplication.delegate.window
#define ZC_IPhoneX                  ((ZC_Hei / ZC_Wid > 2.0) ? YES : NO)
#define ZC_DicNonnil(dic)           ((dic && [dic isKindOfClass:NSDictionary.class]) ? dic : @{})
#define ZC_ArrNonnil(arr)           ((arr && [arr isKindOfClass:NSArray.class]) ? arr : @[])
#define ZC_StrNonnil(str)           ((str && [str isKindOfClass:NSString.class] && ![str isEqualToString:@"<null>"] \
                                    && ![str isEqualToString:@"(null)"]) ? str : @"")
#define ZC_StrFormat(format, ...)   [NSString stringWithFormat:format, ##__VA_ARGS__]
#define ZC_AmountStr(fen)           ZC_StrFormat(@"₦%@", [NSString amount:fen comma:YES money:YES])
#define ZC_AmountIntStr(fen)        [ZC_AmountStr(fen) stringByReplacingOccurrencesOfString:@".00" withString:@""]
#define ZC_DateStr(date, fmt)       [NSString getDateStrWithTimeStamp:date withFormat:fmt]


#define ZC_FontPPB(s375)            [UIFont fontWithName:@"PalmPayNum-Bold" size:ZC_Dp(s375)]
#define ZC_FontR(s375)              [UIFont fontWithName:@"Roboto-Regular" size:ZC_Dp(s375)]
#define ZC_FontM(s375)              [UIFont fontWithName:@"Roboto-Medium" size:ZC_Dp(s375)]
#define ZC_FontB(s375)              [UIFont fontWithName:@"Roboto-Bold" size:ZC_Dp(s375)]


#define ZC_FontPP_Bold(s)           [UIFont fontWithName:@"PalmPayNum-Bold" size:s]
#define ZC_FontRoto_Regular(s)      [UIFont fontWithName:@"Roboto-Regular" size:s]
#define ZC_Font_Rototo_Medium(s)    [UIFont fontWithName:@"Roboto-Medium" size:s]
#define ZC_FontRoto_Bold(s)         [UIFont fontWithName:@"Roboto-Bold" size:s]


#define ZC_MainColor                [UIColor colorWithHexString:@"#6A35FF"]
#define ZC_SubColor                 [UIColor colorWithHexString:@"#F0ECFC"]
#define ZC_TitleColor               [UIColor colorWithHexString:@"#202046"]
#define ZC_SubTitleColor            [UIColor colorWithHexString:@"#6F7B85"]
#define ZC_AssistColor              [UIColor colorWithHexString:@"#9CA2AA"]
#define ZC_PrimaryColor             [UIColor colorWithHexString:@"#E7DEFF"]
#define ZC_KLineColor               [UIColor colorWithHexString:@"#ECECEC"]


#define ZC_UseUISDark(obj, isDark)  if (@available(iOS 13.0, *)) { obj.overrideUserInterfaceStyle = \
                                    (isDark ? UIUserInterfaceStyleDark : UIUserInterfaceStyleLight); } else { (void)obj; }


#define ZC_Dyc(lightColorHexStr)    [ZCProxy.imp dynamicLight:lightColorHexStr dark:nil]
#define ZC_Dyca(lightObject, aph)   [ZCProxy.imp dynamicLight:lightObject alpha:aph]
#define ZC_Dycld(lHexStr, dHexStr)  [ZCProxy.imp dynamicLight:lHexStr dark:dHexStr]
#define ZC_Dyclda(lc, dc, aph)      [ZCProxy.imp dynamicColor:lc darkColor:dc alpha:aph]
#define ZC_Dycmapa(lStr, isDk, aph) [ZCProxy.imp dynamicMap:lStr isDark:isDk alpha:aph]
#define ZC_Dyc_Same(cHexStr)        [UIColor colorBuildFromHexStr:cHexStr isSame:YES]
#define ZC_Dyca_Same(cHexStr, aph)  [UIColor colorBuildFromColor:ZC_Dyc_Same(cHexStr) alpha:aph]


#define _sfmt(...)                  [NSString stringWithFormat:__VA_ARGS__]
#define is_iPhoneX                  (ZC_Hei / ZC_Wid > 2.0 ? YES : NO)
#define is_smallScreen              (ZC_Hei <= 676)
#define kBottomSafeAreaHeight       (is_iPhoneX ? 34: 0) //安全区域高度

#define Weakify(x)                  typeof(x) __weak weak##x = x //建议用后面这两个
#define Strongfiy(x)                typeof(x) __strong x = weak##x

#endif /* ZCConstant_h */







#define GA_RAIN_RANDOM(range) (arc4random() % (range)) / 100.0
#define GA_File(path) [NSURL fileURLWithPath:ZC_StrNonnil(path)]

#define GA_Ar(x)                    [TYGlobalTool roundScreenPointsForAndroidUIPoints:x]
#define GA_Ac(x)                    [TYGlobalTool ceilScreenPointsForAndroidUIPoints:x]
#define GA_Dp(x)                    (ZC_Wid * (x) / 360.0)
#define GA_Edge                     GA_Dp(16)
#define GA_Ival                     GA_Dp(12)

#define GA_FontPPB(s360)            [UIFont fontWithName:@"PalmPayNum-Bold" size:GA_Dp(s360)]
#define GA_FontR(s360)              [UIFont fontWithName:@"Roboto-Regular" size:GA_Dp(s360)]
#define GA_FontM(s360)              [UIFont fontWithName:@"Roboto-Medium" size:GA_Dp(s360)]
#define GA_FontB(s360)              [UIFont fontWithName:@"Roboto-Bold" size:GA_Dp(s360)]
#define GA_FontH(s360)              [UIFont fontWithName:@"Roboto-Black" size:GA_Dp(s360)]




//字体回调给上层

