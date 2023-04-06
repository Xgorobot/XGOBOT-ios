//
//  StringUtils.swift
//  findx
//  String 进制转换
//  Created by yuanwenlin on 2018/8/10.
//  Copyright © 2018年 wulianedu. All rights reserved.
//

import Foundation
final class StringUtils {
    
    // MARK: - 十进制转二进制
    class func decTobin(number:Int) -> String {
        var num = number
        var str = ""
        while num > 0 {
            str = "\(num % 2)" + str
            num /= 2
        }
        return str
    }
    
    // MARK: - 二进制转十进制
    class func binTodec(number num: String) -> Int {
        var sum: Int = 0
        for (_ , value) in num.enumerated(){
            let str = String(value)
            sum = sum * 2 + Int(str)!
        }
        return sum
    }
    
    // MARK: - 十六位十进制转十六进制
    class func int16To2Lenhex(number:Int16) -> String {
        var result = String(format: "%02X", number)
        if ((number >= 256) && (number < 4096)){
            if (result.count == 3){
                result = result.suffix(2) + "0" + result.prefix(1)
            }
        }else if ((number >= 4096)&&(number <= Int16.max)){
            result = String(result.suffix(2) + result.prefix(2))
        }else if(number > Int16.max){
            result = String(format: "%02X", Int16.max)
        }
        
        return result
    }
    
    // MARK: - 十六位十进制转4位十六进制
    class func int16To4Lenhex(number:Int16) -> String {
        let dataSuffix = String(format: "%02X", number/256)
        let dataPrefix = String(format: "%02X", number%256)
        return "\(dataPrefix)\(dataSuffix)"
    }
    
    // MARK: - 十六进制转十进制
    class func hexTodec(number num:String) -> Int {
        let str = num.uppercased()
        var sum = 0
        for i in str.utf8 {
            sum = sum * 16 + Int(i) - 48 // 0-9 从48开始
            if i >= 65 {                 // A-Z 从65开始，但有初始值10，所以应该是减去55
                sum -= 7
            }
        }
        return sum
    }
    
    //将十六进制字符串转化为 Data
    func data(from hexStr: String) -> Data {
        let bytes = self.bytes(from: hexStr)
        return Data(bytes: bytes)
    }
    
    // 将16进制字符串转化为 [UInt8]
    // 使用的时候直接初始化出 Data
    // Data(bytes: Array<UInt8>)
    func bytes(from hexStr: String) -> [UInt8] {
        assert(hexStr.count % 2 == 0, "输入字符串格式不对，8位代表一个字符")
        var bytes = [UInt8]()
        var sum = 0
        // 整形的 utf8 编码范围
        let intRange = 48...57
        // 小写 a~f 的 utf8 的编码范围
        let lowercaseRange = 97...102
        // 大写 A~F 的 utf8 的编码范围
        let uppercasedRange = 65...70
        for (index, c) in hexStr.utf8CString.enumerated() {
            var intC = Int(c.byteSwapped)
            if intC == 0 {
                break
            } else if intRange.contains(intC) {
                intC -= 48
            } else if lowercaseRange.contains(intC) {
                intC -= 87
            } else if uppercasedRange.contains(intC) {
                intC -= 55
            } else {
                assertionFailure("输入字符串格式不对，每个字符都需要在0~9，a~f，A~F内")
            }
            sum = sum * 16 + intC
            // 每两个十六进制字母代表8位，即一个字节
            if index % 2 != 0 {
                bytes.append(UInt8(sum))
                sum = 0
            }
        }
        return bytes
    }
    
}


extension String {
    /*
     *去掉首尾空格
     */
    var removeHeadAndTailSpace:String {
        let whitespace = NSCharacterSet.whitespaces
        return self.trimmingCharacters(in: whitespace)
    }
    /*
     *去掉首尾空格 包括后面的换行 \n
     */
    var removeHeadAndTailSpacePro:String {
        let whitespace = NSCharacterSet.whitespacesAndNewlines
        return self.trimmingCharacters(in: whitespace)
    }
    /*
     *去掉所有空格
     */
    var removeAllSapce: String {
        return self.replacingOccurrences(of: " ", with: "", options: .literal, range: nil)
    }
    /*
     *去掉首尾空格 后 指定开头空格数
     */
    func beginSpaceNum(num: Int) -> String {
        var beginSpace = ""
        for _ in 0..<num {
            beginSpace += " "
        }
        return beginSpace + self.removeHeadAndTailSpacePro
    }
    
    
    //HexString 转 data
    func hexadecimal() -> Data? {
        var data = Data(capacity: self.count / 2)
        
        let regex = try! NSRegularExpression(pattern: "[0-9a-f]{1,2}", options: .caseInsensitive)
        regex.enumerateMatches(in: self, range: NSMakeRange(0, utf16.count)) { match, flags, stop in
            let byteString = (self as NSString).substring(with: match!.range)
            var num = UInt8(byteString, radix: 16)!
            data.append(&num, count: 1)
        }
        
        guard data.count > 0 else { return nil }
        
        return data
    }
    
    
    //返回不带后缀的文件名 例如 fileA.xml 返回fileA
    func getFileNameNoXML() -> String!{
        if self.count<=4{
            return self
        }
        
        if self.contains(".xml") {
            let endpoint = self.index(self.startIndex, offsetBy: self.count-5)
            let result:String = String(self[...endpoint])
            return result
        }
        return self
    }
}
