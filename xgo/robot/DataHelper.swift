//
//  DataHelper.swift
//  xgo
//
//  Created by wenlin.yuan on 2023/4/14.
//

import Foundation



class DataHelper {

    
    class func getSendBytes(id: Int8, funcName: Int8, data: [Int8]) -> String {
        let length: Int8 = Int8(data.count * 2 + 2)
        
        var bytes = [Int8](repeating: 0, count: data.count + 4)
        bytes[0] = Int8(id)
        bytes[1] = Int8(funcName)
        bytes[2] = Int8(length)
        data.enumerated().forEach { bytes[$0.offset + 3] = $0.element }
        
        var add: Int8 = 0x00
        for datum in bytes {
            add = add &+ datum
        }
        bytes[bytes.count - 1] = add
        
        let resultString = int8ArrayToHexString(bytes)
        print("bytesToHEX: \(resultString)")
        return "$\(resultString)#"

    }
    
    class func int8ArrayToHexString(_ int8Array: [Int8]) -> String {
        let data = Data(bytes: int8Array, count: int8Array.count)
        return data.map { String(format: "%02hhx", $0) }.joined()
    }
}

