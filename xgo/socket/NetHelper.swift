//
//  NetHelper.swift
//  xgo
//
//  Created by wenlin.yuan on 2023/4/5.
//

import Foundation
import Starscream
import Alamofire
import CoreLocation


class NetHelper{
    
    //简单的网络访问，用于请求网络权限
    func makeLogon() {
        // 构建URL
        let url:URL = URL(string: "https://www.baidu.com")!
        // 发送HTTP请求的的session对象
        let session = URLSession.shared
        // 构建请求request
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        // 发一个get请求
        let task = session.dataTask(with: request as URLRequest) {(
            data, response, error) in
            
            guard let data = data, let _:URLResponse = response, error == nil else {
                print("error")
                return
            }
            let dataString =  String(data: data, encoding: String.Encoding.utf8)
            print(dataString! as String)
        }
        task.resume()
    }
    
    func socketLogon() {
        //https://echo.websocket.org
        var request = URLRequest(url: URL(string: "ws://192.168.201.146:6066")!) //https://localhost:8080
        request.timeoutInterval = 5
        var socket: WebSocket!
        socket = WebSocket(request: request)
        socket.delegate = socketDelegate()
        socket.connect()
    }
    
    class socketDelegate:WebSocketDelegate{
        func didReceive(event: Starscream.WebSocketEvent, client: Starscream.WebSocket) {
            return
        }
    }
}
