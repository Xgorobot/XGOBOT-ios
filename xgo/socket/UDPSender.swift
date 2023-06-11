//
//  UDPBroadCaster.swift
//  xgo
//
//  Created by wenlin.yuan on 2023/6/11.
//

import Foundation
import CocoaAsyncSocket

class UDPSender {
    let socket: GCDAsyncUdpSocket
    
    init() {
        socket = GCDAsyncUdpSocket(delegate: nil, delegateQueue: DispatchQueue.main)
        do {
            try socket.enableBroadcast(true)
        } catch {
            print("Error enabling broadcast: \(error.localizedDescription)")
        }
    }
    
    func sendUDPMessage(message: String) {
        let data = message.data(using: .utf8)!
        socket.send(data, toHost: "255.255.255.255", port: 6001, withTimeout: -1, tag: 0)
    }
}
