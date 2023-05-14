//
//  SocketClient.swift
//  xgo
//
//  Created by wenlin.yuan on 2023/4/1.
//

import Foundation
import Starscream
import Alamofire
import CoreLocation


class WebSocketClient:WebSocketDelegate{
    var socket: WebSocket!
    var isConnected = false
    let host = "192.168.31.82"
    let port = 6000
    
    // MARK: - WebSocketDelegate
    func didReceive(event: WebSocketEvent, client: WebSocket) {
        switch event {
        case .connected(let headers):
            isConnected = true
            print("websocket is connected: \(headers)")
        case .disconnected(let reason, let code):
            isConnected = false
            print("websocket is disconnected: \(reason) with code: \(code)")
        case .text(let string):
            print("Received text: \(string)")
        case .binary(let data):
            print("Received data: \(data.count)")
        case .ping(_):
            break
        case .pong(_):
            break
        case .viabilityChanged(_):
            break
        case .reconnectSuggested(_):
            break
        case .cancelled:
            isConnected = false
        case .error(let error):
            isConnected = false
            handleError(error)
        }
    }
    
//
    
        // MARK:初始化
    init() {
    }
    
    func connect() {
        //https://echo.websocket.org
        var request = URLRequest(url: URL(string: "ws://192.168.201.146:6066")!) //https://localhost:8080
        request.timeoutInterval = 5
        socket = WebSocket(request: request)
        socket.delegate = self
        socket.connect()
    }
    
    func handleError(_ error: Error?) {
        if let e = error as? WSError {
            print("websocket encountered an error: \(e.message)")
        } else if let e = error {
            print("websocket encountered an error: \(e.localizedDescription)")
        } else {
            print("websocket encountered an error")
        }
    }
    
    func writeText() {
        socket.write(string: "hello there!")
    }
    
    
    func disconnect() {
        if isConnected {
            print("connect")
            socket.disconnect()
        } else {
            print("Disconnect")
            socket.connect()
        }
    }
    
//    ///判断网络是否有权限
//        private func isNetworkPermissions() -> Bool {
//            var isNetworkPermissions:Bool = false
//            let cellularData = CTCellularData()
//            ///线程信号量
//            let semaphore = DispatchSemaphore(value: 0)
//
//            cellularData.cellularDataRestrictionDidUpdateNotifier = { state in
//                if state == .notRestricted {
//                    isNetworkPermissions = true
//
//                } else  {
//                    isNetworkPermissions = false
//                }
//
//                semaphore.signal()
//            }
//
//            semaphore.wait()
//            return isNetworkPermissions
//        }
}
