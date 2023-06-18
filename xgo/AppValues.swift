//
//  AppValues.swift
//  xgo
//
//  Created by wenlin.yuan on 2023/4/1.
//

import Foundation
import UIKit


var SOCKETMANAGER:SocketClient?
var UDPSENDER:UDPSender?

//DataHelper
public let START: Int8 = 0x24 // $的ASCII码值
public let END: Int8 = 0x23 // #的ASCII码值

public var ROBOT_height: Int8 = 60 // $的ASCII码值
public var ROBOT_stepLength: Int8 = 60 // #的ASCII码值
public var ROBOT_balance: Bool = false // $的ASCII码值
public var ROBOT_speed: Int8 = 1 // #的ASCII码值
