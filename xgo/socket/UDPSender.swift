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
    // 在初始化UDPSender时，传入一个代理对象
    
    init() {
        let delegate = MyUDPSocketDelegate()
        socket = GCDAsyncUdpSocket(delegate: delegate, delegateQueue: DispatchQueue.main)

        do {
            socket.setDelegate(delegate)
            try socket.enableBroadcast(true)
        } catch {
            print("Error enabling broadcast: \(error.localizedDescription)")
        }
    }
    
    func sendUDPMessage(message: String) {
        let data = message.data(using: .utf8)!
        let host = "255.255.255.255"
        let port: UInt16 = 6001
        socket.send(data, toHost: host, port: port, withTimeout: -1, tag: 0)
        print("udpSocket send \(message)")
        
    }
}

class MyUDPSocketDelegate: NSObject, GCDAsyncUdpSocketDelegate {
    func udpSocket(_ sock: GCDAsyncUdpSocket, didSendDataWithTag tag: Int) {
        // 处理发送数据成功的回调
        print("udpSocket send success")
    }
    
func udpSocket(_ sock: GCDAsyncUdpSocket, didNotSendDataWithTag tag: Int, dueToError error: Error?)
    {
        // 处理发送数据失败的回调
        print("udpSocket send failed")
    }
    
    // 其他代理方法...
}

