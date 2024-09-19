//
//  ArrayAdditional.swift
//  ZCSwiftKit
//
//  Created by zjy on 2022/12/27.
//

import Foundation

//public extension Array {
//    public func isValidIntIndexInt(_ index: Int?) -> Bool {
//        if let nindex = index, nindex >= 0, nindex < self.count {
//            return true
//        }
//        return false
//    }
//    
//    public func arrayItemFor(_ index: Int?) -> [Element?] {
//        var aimItem: [Element?] = []
//        if isValidIntIndexInt(index) {
//            let obj = self[index!]
//            if let xobj = obj as? [Element?] {
//                aimItem = xobj
//            }
//        }
//        return aimItem
//    }
//    
//    public func sequItemFor(_ index: Int?) -> [SequEle] {
//        var aimItem: [SequEle] = []
//        if isValidIntIndexInt(index) {
//            let obj = self[index!]
//            if let xobj = obj as? [SequEle] {
//                aimItem = xobj
//            }
//        }
//        return aimItem
//    }
//    
//    public func dictionaryItemFor(_ index: Int?) -> [AnyHashable : Any?] {
//        var aimItem: [AnyHashable : Any?] = [:]
//        if isValidIntIndexInt(index) {
//            let obj = self[index!]
//            if let xobj = obj as? [AnyHashable : Any?] {
//                aimItem = xobj
//            }
//        }
//        return aimItem
//    }
//    
//    public func jsonKvItemFor(_ index: Int?) -> JsonKv {
//        var aimItem: JsonKv = [:]
//        if isValidIntIndexInt(index) {
//            let obj = self[index!]
//            if let xobj = obj as? JsonKv {
//                aimItem = xobj
//            }
//        }
//        return aimItem
//    }
//    
//    public func stringItemFor(_ index: Int?, defaultItem: String = "") -> String { //异常做四舍五入处理
//        var aimItem: String = defaultItem
//        if isValidIntIndexInt(index) {
//            let obj = self[index!]
//            if let xobj = obj as? String {
//                aimItem = Global.isNull(xobj, isNumNotCheck: true) ? defaultItem : xobj
//            }
//            else if let xobj = obj as? Bool {
//                aimItem = xobj ? "1" : "0"
//            }
//            else if let xobj = obj as? Int {
//                aimItem = String(xobj)
//            }
//            else if let xobj = obj as? UInt {
//                aimItem = String(xobj)
//            }
//            else if let xobj = obj as? Int64 {
//                aimItem = String(xobj)
//            }
//            else if let xobj = obj as? Int32 {
//                aimItem = String(xobj)
//            }
//            else if let xobj = obj as? UInt64 {
//                aimItem = String(xobj)
//            }
////            else if let xobj = obj as? (any FixedWidthInteger & SignedInteger) {
////                aimItem = String(xobj)
////            }
////            else if let xobj = obj as? (any FixedWidthInteger & UnsignedInteger) {
////                aimItem = String(xobj)
////            }
//            else if let xobj = obj as? Double {
//                aimItem = xobj.stringRound(abnormalResult: defaultItem)
//            }
//            else if let xobj = obj as? Float {
//                aimItem = xobj.stringRound(abnormalResult: defaultItem)
//            }
//            else if let xobj = obj as? Character {
//                aimItem = String(xobj)
//            }
//            else if let xobj = obj as? Substring {
//                aimItem = Global.isNull(xobj, isNumNotCheck: true) ? defaultItem : String(xobj)
//            }
//            else if let xobj = obj as? CGFloat {
//                aimItem = xobj.stringRound(abnormalResult: defaultItem)
//            }
//            else if let xobj = obj as? NSNumber {
//                aimItem = xobj.stringRound(abnormalResult: defaultItem)
//            }
//            else if let xobj = obj as? NSAttributedString {
//                aimItem = Global.isNull(xobj, isNumNotCheck: true) ? defaultItem : xobj.string
//            }
//        }
//        return aimItem
//    }
//    
//    public func intItemFor(_ index: Int?, defaultItem: Int = 0) -> Int { //异常做截取整数处理
//        var aimItem: Int = defaultItem
//        if isValidIntIndexInt(index) {
//            let obj = self[index!]
//            if let xobj = obj as? Int {
//                aimItem = xobj
//            }
//            else if let xobj = obj as? UInt {
//                if xobj <= Int.max && xobj >= Int.min {
//                    aimItem = Int(xobj)
//                }
//            }
//            else if let xobj = obj as? Int64 {
//                if xobj <= Int.max && xobj >= Int.min {
//                    aimItem = Int(xobj)
//                }
//            }
//            else if let xobj = obj as? Int32 {
//                if xobj <= Int.max && xobj >= Int.min {
//                    aimItem = Int(xobj)
//                }
//            }
//            else if let xobj = obj as? UInt64 {
//                if xobj <= Int.max && xobj >= Int.min {
//                    aimItem = Int(xobj)
//                }
//            }
////            else if let xobj = obj as? (any FixedWidthInteger & SignedInteger) {
////                aimItem = xobj.intConvert(abnormalResult: defaultItem)
////            }
////            else if let xobj = obj as? (any FixedWidthInteger & UnsignedInteger) {
////                aimItem = xobj.intConvert(abnormalResult: defaultItem)
////            }
//            else if let xobj = obj as? Bool {
//                aimItem = xobj ? 1 : 0
//            }
//            else if let xobj = obj as? Double {
//                aimItem = xobj.intRound(abnormalResult: defaultItem, isUseRound: false)
//            }
//            else if let xobj = obj as? Float {
//                aimItem = xobj.intRound(abnormalResult: defaultItem, isUseRound: false)
//            }
//            else if let xobj = obj as? String {
//                aimItem = xobj.intRound(abnormalResult: defaultItem, isUseRound: false)
//            }
//            else if let xobj = obj as? Character {
//                aimItem = String(xobj).intRound(abnormalResult: defaultItem, isUseRound: false)
//            }
//            else if let xobj = obj as? Substring {
//                aimItem = String(xobj).intRound(abnormalResult: defaultItem, isUseRound: false)
//            }
//            else if let xobj = obj as? CGFloat {
//                aimItem = xobj.intRound(abnormalResult: defaultItem, isUseRound: false)
//            }
//            else if let xobj = obj as? NSNumber {
//                aimItem = xobj.intRound(abnormalResult: defaultItem, isUseRound: false)
//            }
//            else if let xobj = obj as? NSAttributedString {
//                aimItem = xobj.string.intRound(abnormalResult: defaultItem, isUseRound: false)
//            }
//        }
//        return aimItem
//    }
//    
//    public func doubleItemFor(_ index: Int?, defaultItem: Double = 0) -> Double { //异常暂不做处理
//        var aimItem: Double = defaultItem
//        if isValidIntIndexInt(index) {
//            let obj = self[index!]
//            if let xobj = obj as? Double {
//                aimItem = xobj
//            }
//            else if let xobj = obj as? Float {
//                aimItem = Double(xobj)
//            }
//            else if let xobj = obj as? Bool {
//                aimItem = xobj ? 1.0 : 0.0
//            }
//            else if let xobj = obj as? Int {
//                aimItem = Double(xobj)
//            }
//            else if let xobj = obj as? UInt {
//                aimItem = Double(xobj)
//            }
//            else if let xobj = obj as? Int64 {
//                aimItem = Double(xobj)
//            }
//            else if let xobj = obj as? Int32 {
//                aimItem = Double(xobj)
//            }
//            else if let xobj = obj as? UInt64 {
//                aimItem = Double(xobj)
//            }
////            else if let xobj = obj as? (any FixedWidthInteger & SignedInteger) {
////                aimItem = Double(xobj)
////            }
////            else if let xobj = obj as? (any FixedWidthInteger & UnsignedInteger) {
////                aimItem = Double(xobj)
////            }
//            else if let xobj = obj as? String {
//                aimItem = Double(xobj) ?? defaultItem
//            }
//            else if let xobj = obj as? Character {
//                aimItem = Double(String(xobj)) ?? defaultItem
//            }
//            else if let xobj = obj as? Substring {
//                aimItem = Double(String(xobj)) ?? defaultItem
//            }
//            else if let xobj = obj as? CGFloat {
//                aimItem = Double(xobj)
//            }
//            else if let xobj = obj as? NSNumber {
//                aimItem = (xobj as? Double) ?? defaultItem
//            }
//            else if let xobj = obj as? NSAttributedString {
//                aimItem = Double(xobj.string) ?? defaultItem
//            }
//        }
//        if (aimItem.isInfinite || aimItem.isNaN) && !aimItem.isEqual(to: defaultItem) {
//            aimItem = defaultItem
//        }
//        return aimItem
//    }
//    
//    public func boolItemFor(_ index: Int?, defaultItem: Bool = false) -> Bool { //异常做截取整数处理
//        var aimItem: Bool = defaultItem
//        if isValidIntIndexInt(index) {
//            let obj = self[index!]
//            if let xobj = obj as? Bool {
//                aimItem = xobj
//            }
//            else if let xobj = obj as? Int {
//                aimItem = xobj != 0 ? true : false
//            }
//            else if let xobj = obj as? UInt {
//                aimItem = xobj != 0 ? true : false
//            }
//            else if let xobj = obj as? Int64 {
//                aimItem = xobj != 0 ? true : false
//            }
//            else if let xobj = obj as? Int32 {
//                aimItem = xobj != 0 ? true : false
//            }
//            else if let xobj = obj as? UInt64 {
//                aimItem = xobj != 0 ? true : false
//            }
////            else if let xobj = obj as? (any FixedWidthInteger & SignedInteger) {
////                aimItem = xobj.intConvert(abnormalResult: defaultItem ? 1 : 0) != 0 ? true : false
////            }
////            else if let xobj = obj as? (any FixedWidthInteger & UnsignedInteger) {
////                aimItem = xobj.intConvert(abnormalResult: defaultItem ? 1 : 0) != 0 ? true : false
////            }
//            else if let xobj = obj as? Double {
//                aimItem = xobj.intRound(abnormalResult: defaultItem ? 1 : 0, isUseRound: false) != 0 ? true : false
//            }
//            else if let xobj = obj as? Float {
//                aimItem = xobj.intRound(abnormalResult: defaultItem ? 1 : 0, isUseRound: false) != 0 ? true : false
//            }
//            else if let xobj = obj as? String {
//                if xobj == "true" || xobj == "TRUE" || xobj == "yes" || xobj == "YES" || xobj == "1" || xobj == "y" || xobj == "Y" {
//                    aimItem = true
//                }
//                else if xobj == "false" || xobj == "FALSE" || xobj == "no" || xobj == "NO" || xobj == "0" || xobj == "n" || xobj == "N" {
//                    aimItem = false
//                }
//                else {
//                    aimItem = xobj.intRound(abnormalResult: defaultItem ? 1 : 0, isUseRound: false) != 0 ? true : false
//                }
//            }
//            else if let xobj = obj as? Character {
//                aimItem = String(xobj).intRound(abnormalResult: defaultItem ? 1 : 0, isUseRound: false) != 0 ? true : false
//            }
//            else if let xobj = obj as? Substring {
//                aimItem = String(xobj).intRound(abnormalResult: defaultItem ? 1 : 0, isUseRound: false) != 0 ? true : false
//            }
//            else if let xobj = obj as? CGFloat {
//                aimItem = xobj.intRound(abnormalResult: defaultItem ? 1 : 0, isUseRound: false) != 0 ? true : false
//            }
//            else if let xobj = obj as? NSNumber {
//                aimItem = xobj.intRound(abnormalResult: defaultItem ? 1 : 0, isUseRound: false) != 0 ? true : false
//            }
//            else if let xobj = obj as? NSAttributedString {
//                aimItem = xobj.string.intRound(abnormalResult: defaultItem ? 1 : 0, isUseRound: false) != 0 ? true : false
//            }
//        }
//        return aimItem
//    }
//}
//
//
//
//public extension Array {
//    public static func validArray(_ arr: Any?) -> [Element?] {
//        var aimValue: [Element?] = []
//        if let xobj = arr as? [Element?] {
//            aimValue = xobj
//        }
//        return aimValue
//    }
//    
//    public static func validSequ(_ sequ: Any?) -> [SequEle] {
//        var aimValue: [SequEle] = []
//        if let xobj = sequ as? [SequEle] {
//            aimValue = xobj
//        }
//        return aimValue
//    }
//    
//    public func randomItem() -> Element? {
//        if self.count > 0 {
//            let index = Int(arc4random_uniform(UInt32(self.count)))
//            return self[index]
//        }
//        return nil
//    }
//    
//    public func itemOrNilAt(_ index: Int) -> Element? {
//        if index >= 0 && index < self.count {
//            return self[index]
//        }
//        return nil
//    }
//    
//    public func jsonString(abnormalResult: String = "", isFormat: Bool = false) -> String {
//        var aimStr = abnormalResult
//        if JSONSerialization.isValidJSONObject(self) {
//            var ops: JSONSerialization.WritingOptions = JSONSerialization.WritingOptions(rawValue: 0)
//            if isFormat { ops = .prettyPrinted }
//            if let data = try? JSONSerialization.data(withJSONObject: self, options: ops) {
//                aimStr = String(data: data, encoding: .utf8) ?? abnormalResult
//            }
//        }
//        return aimStr
//    }
//}
