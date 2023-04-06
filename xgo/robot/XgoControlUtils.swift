//
//  FindControlUtils.swift
//  findx
//
//  Created by lzx on 2018/8/10.
//  Copyright © 2018年 wulianedu. All rights reserved.
//

import Foundation
import UIKit


final class FindControlUtil {
    
    typealias CallBack = (_ data : [UInt8]) -> Void
    
    //MARK:写指令-通用
    class func addWriteMsg(data:[UInt8]){
       
    }
    
    //MARK:读指令-通用
    class func addReadMsg(data:[UInt8],delegate:@escaping CallBack){
    
    }
    
    //MARK:状态信息
    class func workState(delegate:@escaping CallBack) {//工作状态
        let result:[UInt8] = [0x00,0x00];
        addReadMsg(data: result, delegate: delegate)
    }
    class func readPower(delegate:@escaping CallBack) {//电池电量
        let result:[UInt8] = [0x01,0x01];
        addReadMsg(data: result, delegate: delegate)
    }
    class func readVersion(delegate:@escaping CallBack) {//XGO版本 0x00 MINI | 0x01 Lite | 0x02 PRO
        let result:[UInt8] = [0x02,0x01];
        addReadMsg(data: result, delegate: delegate)
    }
    class func showMode(needRepeat:Bool) {//表演模式 0x00正常控制模式 | 0x01循环做动作
        let result:[UInt8] = [0x03,needRepeat ? 0x01 : 0x00];
        addWriteMsg(data: result)
    }
    
    class func setMode(delegate:@escaping CallBack) {//标定模式
        let result:[UInt8] = [0x04,0x00];
        addWriteMsg(data: result)
    }
    //MARK:蓝牙信息 (暂不支持)
    class func test(delegate:@escaping CallBack) {//向后 0x00 - 向前0xff  默认 0x80
        let result:[UInt8] = [0x00,0x00];
        addReadMsg(data: result, delegate: delegate)
    }
    //MARK:调试模式
    class func unInstallServo(delegate:@escaping CallBack) {//0x00舵机处于正常工作状态，0x01卸载所有舵机，0x11-0x14依次卸载1-4号腿，0x21-0x24依次恢复1-4号腿
        let result:[UInt8] = [0x20,0x00];
        addReadMsg(data: result, delegate: delegate)
    }
    class func setServo(delegate:@escaping CallBack) {//所有舵机记录当前位置为零位
        let result:[UInt8] = [0x21,0x00];
        addWriteMsg(data: result)
    }
    //MARK:整机运动
    class func moveX(speed:UInt8) {//向后 0x00 - 向前0xff  默认 0x80
        let result:[UInt8] = [0x30,speed];
        addWriteMsg(data: result)
    }
    
    class func moveY(speed:UInt8) {//向左 0x00 - 向右0xff  默认 0x80
        let result:[UInt8] = [0x31,speed];
        addWriteMsg(data: result)
    }
    
    class func stopX() {
        let result:[UInt8] = [0x30,0x80];
        addWriteMsg(data: result)
    }
    
    class func stopY() {
        let result:[UInt8] = [0x31,0x80];
        addWriteMsg(data: result)
    }
    
    class func turnClockwise(speed:UInt8) {//顺时针旋转 def:0x80
        let result:[UInt8] = [0x32,speed];
        addWriteMsg(data: result)
    }
    
    class func trunkMoveX(position:UInt8) {//四足接触点不动,身体扭动 def:0x80
        let result:[UInt8] = [0x33,position];
        addWriteMsg(data: result)
    }
    
    class func trunkMoveY(position:UInt8) {//四足接触点不动,身体扭动 def:0x80
        let result:[UInt8] = [0x34,position];
        addWriteMsg(data: result)
    }
    
    class func heightSet(height:UInt8) {//身体高度 def:0x80
        let result:[UInt8] = [0x35,height];
        addWriteMsg (data: result)
    }
    
    class func trunByX(angle:UInt8) {//身体绕X旋转角度 def:0x80
        let result:[UInt8] = [0x36,angle];
        addWriteMsg(data: result)
    }
    
    class func trunByY(angle:UInt8) {//身体绕Y旋转角度 def:0x80
        let result:[UInt8] = [0x37,angle];
        addWriteMsg(data: result)
    }
    
    class func trunByZ(angle:UInt8) {//身体绕Z旋转角度 def:0x80
        let result:[UInt8] = [0x38,angle];
        addWriteMsg(data: result)
    }
    
    class func trunByXRepeat(speed:UInt8) {//身体绕X旋转角度 def:0x00
        let result:[UInt8] = [0x39,speed];
        addWriteMsg(data: result)
    }
    
    class func trunByYRepeat(speed:UInt8) {//身体绕Y旋转角度 def:0x00
        let result:[UInt8] = [0x3A,speed];
        addWriteMsg(data: result)
    }
    
    class func trunByZRepeat(speed:UInt8) {//身体绕Z旋转速度 def:0x00
        let result:[UInt8] = [0x3B,speed];
        addWriteMsg(data: result)
    }
    
    class func steps(height:UInt8) {//原地踏步 def:0x00
        let result:[UInt8] = [0x3C,height];
        addWriteMsg(data: result)
    }
    
    class func setSpeed(type:UInt8) {//0x00常速 0x01低速 0x02高速
        let result:[UInt8] = [0x3D,type];
        addWriteMsg(data: result)
    }
    
    class func actionType(type:UInt8) {
        /*运动模式 动作指令表，1-N为各个动作(0-N为十进制)
         0为默认站姿，1趴下，2站起，3匍匐前进，4转圈，5原地踏步，6蹲起，7转动Roll，
         8转动Pitch，9转动Yaw，10三轴转动，11撒尿，12坐下，13招手，14伸懒腰，15波浪，
         16左右摇摆，17求食，18找食物，19握手*/
        let result:[UInt8] = [0x3E,type];
        addWriteMsg(data: result)
    }
    
    class func translateXRepeat(speed:UInt8) {//身体绕X旋转速度 def:0x00
        let result:[UInt8] = [0x3C,speed];
        addWriteMsg(data: result)
    }
    
    class func translateYRepeat(speed:UInt8) {//身体绕Y旋转速度 def:0x00
        let result:[UInt8] = [0x3C,speed];
        addWriteMsg(data: result)
    }
    
    class func translateZRepeat(speed:UInt8) {//身体绕Z旋转速度 def:0x00
        let result:[UInt8] = [0x3C,speed];
        addWriteMsg(data: result)
    }
    
    //MARK:单腿模式
    class func setLeg(leg:UInt8,xyz:String,speed:UInt8) {
        switch leg {
        case 0x00:
            if xyz == "x" {
                legLFX(speed: speed)
            }else if xyz == "y"{
                legLFY(speed: speed)
            }else if xyz == "z"{
                legLFZ(speed: speed)
            }
            break
        case 0x01:
            if xyz == "x" {
                legRFX(speed: speed)
            }else if xyz == "y"{
                legRFY(speed: speed)
            }else if xyz == "z"{
                legRFZ(speed: speed)
            }
            break
        case 0x02:
            if xyz == "x" {
                legLBX(speed: speed)
            }else if xyz == "y"{
                legLBY(speed: speed)
            }else if xyz == "z"{
                legLBZ(speed: speed)
            }
            break
        case 0x03:
            if xyz == "x" {
                legRBX(speed: speed)
            }else if xyz == "y"{
                legRBY(speed: speed)
            }else if xyz == "z"{
                legRBZ(speed: speed)
            }
            break
        default:
            break
        }
    }
    
    class func legLFX(speed:UInt8) {//left front x方向单腿控制 def:0x80  0x00-0xff 坐标系同机器人
        let result:[UInt8] = [0x40,speed];
        addWriteMsg(data: result)
    }
    class func legLFY(speed:UInt8) {//参考上 略
        let result:[UInt8] = [0x41,speed];
        addWriteMsg(data: result)
    }
    class func legLFZ(speed:UInt8) {//参考上 略
        let result:[UInt8] = [0x42,speed];
        addWriteMsg(data: result)
    }
    class func legRFX(speed:UInt8) {//参考上 略
        let result:[UInt8] = [0x43,speed];
        addWriteMsg(data: result)
    }
    class func legRFY(speed:UInt8) {//参考上 略
        let result:[UInt8] = [0x44,speed];
        addWriteMsg(data: result)
    }
    class func legRFZ(speed:UInt8) {//参考上 略
        let result:[UInt8] = [0x45,speed];
        addWriteMsg(data: result)
    }
    class func legLBX(speed:UInt8) {//参考上 略
        let result:[UInt8] = [0x46,speed];
        addWriteMsg(data: result)
    }
    class func legLBY(speed:UInt8) {//参考上 略
        let result:[UInt8] = [0x47,speed];
        addWriteMsg(data: result)
    }
    class func legLBZ(speed:UInt8) {//参考上 略
        let result:[UInt8] = [0x48,speed];
        addWriteMsg(data: result)
    }
    class func legRBX(speed:UInt8) {//参考上 略
        let result:[UInt8] = [0x49,speed];
        addWriteMsg(data: result)
    }
    class func legRBY(speed:UInt8) {//参考上 略
        let result:[UInt8] = [0x4A,speed];
        addWriteMsg(data: result)
    }
    class func legRBZ(speed:UInt8) {//参考上 略
        let result:[UInt8] = [0x4B,speed];
        addWriteMsg(data: result)
    }
    
    //MARK:舵机模式
    class func setServo(servo:UInt8,xyz:String,speed:UInt8) {
        switch servo {
        case 0x00:
            if xyz == "x" {
                servoLFH(angle: speed)
            }else if xyz == "y"{
                servoLFM(angle: speed)
            }else if xyz == "z"{
                servoLFL(angle: speed)
            }
            break
        case 0x01:
            if xyz == "x" {
                servoLFH(angle: speed)
            }else if xyz == "y"{
                servoLFM(angle: speed)
            }else if xyz == "z"{
                servoLFL(angle: speed)
            }
            break
        case 0x02:
            if xyz == "x" {
                servoLFH(angle: speed)
            }else if xyz == "y"{
                servoLFM(angle: speed)
            }else if xyz == "z"{
                servoLFL(angle: speed)
            }
            break
        case 0x03:
            if xyz == "x" {
                servoLFH(angle:speed)
            }else if xyz == "y"{
                servoLFM(angle: speed)
            }else if xyz == "z"{
                servoLFL(angle: speed)
            }
            break
        default:
            break
        }
    }
    
    class func servoLFL(angle:UInt8) {//left front low 位置舵机控制 0x00-0xff 默认0x80
        let result:[UInt8] = [0x50,angle];
        addWriteMsg(data: result)
    }
    class func servoLFM(angle:UInt8) {//参考上 略
        let result:[UInt8] = [0x51,angle];
        addWriteMsg(data: result)
    }
    class func servoLFH(angle:UInt8) {//参考上 略
        let result:[UInt8] = [0x52,angle];
        addWriteMsg(data: result)
    }
    class func servoRFL(angle:UInt8) {//参考上 略
        let result:[UInt8] = [0x53,angle];
        addWriteMsg(data: result)
    }
    class func servoRFM(angle:UInt8) {//参考上 略
        let result:[UInt8] = [0x54,angle];
        addWriteMsg(data: result)
    }
    class func servoRFH(angle:UInt8) {//参考上 略
        let result:[UInt8] = [0x55,angle];
        addWriteMsg(data: result)
    }
    class func servoLBL(angle:UInt8) {//left front low 位置舵机控制 0x00-0xff 默认0x80
        let result:[UInt8] = [0x56,angle];
        addWriteMsg(data: result)
    }
    class func servoLBM(angle:UInt8) {//参考上 略
        let result:[UInt8] = [0x57,angle];
        addWriteMsg(data: result)
    }
    class func servoLBH(angle:UInt8) {//参考上 略
        let result:[UInt8] = [0x58,angle];
        addWriteMsg(data: result)
    }
    class func servoRBL(angle:UInt8) {//参考上 略
        let result:[UInt8] = [0x59,angle];
        addWriteMsg(data: result)
    }
    class func servoRBM(angle:UInt8) {//参考上 略
        let result:[UInt8] = [0x5A,angle];
        addWriteMsg(data: result)
    }
    class func servoRBH(angle:UInt8) {//参考上 略
        let result:[UInt8] = [0x5B,angle];
        addWriteMsg(data: result)
    }
    
    class func servoSpeedSet(speed:UInt8) {//设置舵机速度
        let result:[UInt8] = [0x4B,speed];
        addWriteMsg(data: result)
    }
    
    class func resetServoPosition() {//设置当前舵机位置为默认位置
        let result:[UInt8] = [0x4B,0x01];
        addWriteMsg(data: result)
    }
    
}

