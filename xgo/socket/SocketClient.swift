//
//  SocketClient.swift
//  xgo
//
//  Created by wenlin.yuan on 2023/4/1.
//

import Foundation
import libSwiftSocket

class SocketClient: ChannelObserver{
    var client: ClientChannel!
    var isConnected = false

    func connect(){
        client = ClientChannel(observer: self)
        client.connect(host: "192.168.201.146", port: 6066)
    }
    
    func sendMsg(data:String){
        client.write(data: data.data(using: .utf8)!)
    }
    
    func isConnected() -> Bool {
        return isConnected
    }
    
    func channel(_ client: ClientChannel, didDisconnect error: ChannelError?) {
        print("connect err: \(String(describing: error))")
        isConnected = false
    }
    
    func channel(_ client: ClientChannel, didConnect host: String, port: Int) {
        print("connect \(host):\(port) successed ")
        isConnected = true
        client.enableHeartBeat(interval: 10, resetOnRead: true, resetOnWrite: true)
        
        print("local: \(client.localAddress)")
        print("remote: \(client.remoteAddress)")
    }
    
    func channel(_ client: ClientChannel, didRead buffer: ByteBuffer) {
        let str = String(data: buffer.toData(), encoding: .utf8) ?? "NULL"
        print("\(client)  read: \(buffer.count) \(str)")
        client.write(data: "rcv: \(str)".data(using: .utf8)!)
    }
    
    func channel(_ client: ClientChannel, didWrite buffer: ByteBuffer, userInfo: [String: Any]?) {
        print("\(client)  write: \(buffer.count)")
    }
    
    func channelHeartBeat(_ client: ClientChannel) {
        client.write(data: "heart beat\n".data(using: .utf8)!)
    }
}
