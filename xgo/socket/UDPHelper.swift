//
//  UDPHelper.swift
//  xgo
//
//  Created by wenlin.yuan on 2023/6/11.
//

import Foundation
import SwiftSocket

class UDPBroadcastTool {
    
    func sendBroadcast(message: String) {
        let client = UDPClient(address: "255.255.255.255", port: 6001)
        let result = client.send(string: message)
    }
}
