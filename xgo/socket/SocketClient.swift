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
    private weak var observer: ChannelObserver?
    var isConnected = false

    func connect(host:String){
        client = ClientChannel(observer: self)
        client.connect(host: host, port: 6000)
        print("start connect: \(host)")
    }
    
    func setObserver(observer: ChannelObserver?) {
        self.observer = observer
    }
    
    func sendMsg(data:String){
        client.write(data: data.data(using: .utf8)!)
    }
    
    func isConnect() -> Bool {
        return isConnected
    }
    
    func channel(_ client: ClientChannel, didDisconnect error: ChannelError?) {
        print("connect err: \(String(describing: error))")
        isConnected = false
        observer?.channel(client, didDisconnect: error)
    }
    
    func channel(_ client: ClientChannel, didConnect host: String, port: Int) {
        print("connect \(host):\(port) successed ")
        isConnected = true
        client.enableHeartBeat(interval: 10, resetOnRead: true, resetOnWrite: true)
        observer?.channel(client, didConnect: host, port: port)
        print("local: \(client.localAddress)")
        print("remote: \(client.remoteAddress)")
    }
    
    func channel(_ client: ClientChannel, didRead buffer: ByteBuffer) {
        let str = String(data: buffer.toData(), encoding: .utf8) ?? "NULL"
        print("\(client)  read: \(buffer.count) \(str)")
        client.write(data: "rcv: \(str)".data(using: .utf8)!)
        observer?.channel(client, didRead: buffer)
    }
    
    func channel(_ client: ClientChannel, didWrite buffer: ByteBuffer, userInfo: [String: Any]?) {
        print("\(client)  write: \(buffer.count)")
    }
    
    func channelHeartBeat(_ client: ClientChannel) {
        let datas: [UInt8] = [0x01, 0x00]
        let sendData = DataHelper.getSendBytes(id: RobotConstants.TYPE_DEFAULT, funcName: RobotConstants.GET_POWER, data: datas)
        sendMsg(data: sendData)
    }
}
