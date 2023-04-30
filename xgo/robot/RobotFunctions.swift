//
//  RobotFunctions.swift
//  xgo
//
//  Created by wenlin.yuan on 2023/4/30.
//

import Foundation

public class RobotFunction {
    private static let TAG = "RobotFunction"
    
    public static func setSpeed(speed: Int) {
        let datas: [UInt8] = [UInt8(speed), 0x00]
        let sendData = DataHelper.getSendBytes(id: RobotConstants.TYPE_DEFAULT, funcName: RobotConstants.SET_BFPL, data: datas)
        SOCKETMANAGER?.sendMsg(data: sendData)
    }

    public static func setStepLength(length: Int) {
        let datas: [UInt8] = [UInt8(length), 0x00]
        let sendData = DataHelper.getSendBytes(id: RobotConstants.TYPE_DEFAULT, funcName: RobotConstants.SET_BFKD, data: datas)
        SOCKETMANAGER?.sendMsg(data: sendData)
    }

    public static func btnControl(direction: Int) {
        let datas: [UInt8] = [UInt8(direction), 0x00]
        let sendData = DataHelper.getSendBytes(id: RobotConstants.TYPE_DEFAULT, funcName: RobotConstants.SET_AJKZ, data: datas)
        SOCKETMANAGER?.sendMsg(data: sendData)
    }

    public static func getWebUrl() -> String {
        let hostIp = UserDefaultsManager.shared.host
        let cameraPort = UserDefaultsManager.shared.cameraPort
        return "\(hostIp ?? "172.0.0.1"):\(cameraPort)/video_feed"
    }

    public static func autoBalance(enable: Bool) {
        let datas: [UInt8] = [enable ? 1 : 0, 0x00]
        let sendData = DataHelper.getSendBytes(id: RobotConstants.TYPE_DEFAULT, funcName: RobotConstants.SET_ZWDMS, data: datas)
        SOCKETMANAGER?.sendMsg(data: sendData)
    }

    public static func servoControl(legID: Int, up: Int, middle: Int, down: Int) {
        let datas: [UInt8] = [UInt8(legID), UInt8(up), UInt8(middle), UInt8(down), 0x00]
        let sendData = DataHelper.getSendBytes(id: RobotConstants.TYPE_DEFAULT, funcName: RobotConstants.SET_KZDJ, data: datas)
        SOCKETMANAGER?.sendMsg(data: sendData)
    }

    public static func xyzControl(z: Int) {
        heightControl(height: z)
        print("xyzControl: z Control \(z)")
    }

    public static func rollControl(roll: Int) {
        let datas: [UInt8] = [UInt8(roll), 0x00]
        let sendData = DataHelper.getSendBytes(id: RobotConstants.TYPE_DEFAULT, funcName: RobotConstants.SET_KZROLL, data: datas)
        SOCKETMANAGER?.sendMsg(data: sendData)
        print("rollControl: roll Control \(roll)")
    }

    public static func pitchControl(pitch: Int) {
        let datas: [UInt8] = [UInt8(pitch), 0x00]
        let sendData = DataHelper.getSendBytes(id: RobotConstants.TYPE_DEFAULT, funcName: RobotConstants.SET_KZPITCH, data: datas)
        SOCKETMANAGER?.sendMsg(data: sendData)
        print("pitchControl: pitch Control \(pitch)")
    }

    public static func yawControl(yaw: Int) {
        let datas: [UInt8] = [UInt8(yaw), 0x00]
        let sendData = DataHelper.getSendBytes(id: RobotConstants.TYPE_DEFAULT, funcName: RobotConstants.SET_KZYAW, data: datas)
        SOCKETMANAGER?.sendMsg(data: sendData)
        print("yawControl: yaw Control \(yaw)")
    }
    
    public static func legControl(legID: Int, x: Int, y: Int, z: Int) {
        var xValue = min(35, x)
        xValue = max(-35, xValue)
        var yValue = min(18, y)
        yValue = max(-18, yValue)
        var zValue = min(115, z)
        zValue = max(75, zValue)
        let datas: [UInt8] = [UInt8(legID), UInt8(xValue), UInt8(yValue), UInt8(zValue), 0x00]
        let sendData = DataHelper.getSendBytes(id: RobotConstants.TYPE_DEFAULT, funcName: RobotConstants.SET_KZDT, data: datas)
        SOCKETMANAGER?.sendMsg(data: sendData)
    }

    public static func heightControl(height: Int) {
        var heightValue = max(75, height)
        heightValue = min(115, heightValue)
        let datas: [UInt8] = [UInt8(heightValue), 0x00]
        let sendData = DataHelper.getSendBytes(id: RobotConstants.TYPE_DEFAULT, funcName: RobotConstants.SET_KZGDZT, data: datas)
        SOCKETMANAGER?.sendMsg(data: sendData)
    }

    public static func setStepState(state: Int) {
        guard state == 1 || state == 0 else { return }
        let datas: [UInt8] = [UInt8(state), 0x00]
        let sendData = DataHelper.getSendBytes(id: RobotConstants.TYPE_DEFAULT, funcName: RobotConstants.SET_BTTZ, data: datas)
        SOCKETMANAGER?.sendMsg(data: sendData)
    }

    public static func showMode(state: Int) {
        let datas: [UInt8] = [UInt8(state), 0x00]
        let sendData = DataHelper.getSendBytes(id: RobotConstants.TYPE_DEFAULT, funcName: RobotConstants.SET_KZDZ, data: datas)
        SOCKETMANAGER?.sendMsg(data: sendData)
    }

    public static func showRepeat(enable: Bool) {
        let datas: [UInt8] = [enable ? 1 : 0, 0x00]
        let sendData = DataHelper.getSendBytes(id: RobotConstants.TYPE_DEFAULT, funcName: RobotConstants.SET_DZLB, data: datas)
        SOCKETMANAGER?.sendMsg(data: sendData)
    }

    public static func setDebugMode(enable: Bool) {
        let datas: [UInt8] = [enable ? 1 : 0, 0x00]
        let sendData = DataHelper.getSendBytes(id: RobotConstants.TYPE_DEFAULT, funcName: RobotConstants.SET_DJXZ, data: datas)
        SOCKETMANAGER?.sendMsg(data: sendData)
    }

    public static func grap(state: Int) {
        let datas: [UInt8] = [UInt8(state), 0x00]
        let sendData = DataHelper.getSendBytes(id: RobotConstants.TYPE_DEFAULT, funcName: RobotConstants.SET_KZDZ, data: datas)
        SOCKETMANAGER?.sendMsg(data: sendData)
    }

    public static func startCamera(state: Int) {
        let datas: [UInt8] = [UInt8(state), 0x00]
        let sendData = DataHelper.getSendBytes(id: RobotConstants.TYPE_DEFAULT, funcName: RobotConstants.SET_SPKZ, data: datas)
        SOCKETMANAGER?.sendMsg(data: sendData)
    }

    public static func setXTrans(length: Int) {
        var lengthValue = max(-35, length)
        lengthValue = min(35, lengthValue)
        let datas: [UInt8] = [UInt8(lengthValue), 0x00]
        let sendData = DataHelper.getSendBytes(id: RobotConstants.TYPE_DEFAULT, funcName: RobotConstants.SET_XZPY, data: datas)
        SOCKETMANAGER?.sendMsg(data: sendData)
        print("setXTrans: \(lengthValue)")
    }

    public static func setYTrans(length: Int) {
        var lengthValue = max(-18, length)
        lengthValue = min(18, lengthValue)
        let datas: [UInt8] = [UInt8(lengthValue), 0x00]
        let sendData = DataHelper.getSendBytes(id: RobotConstants.TYPE_DEFAULT, funcName: RobotConstants.SET_YZPY, data: datas)
        SOCKETMANAGER?.sendMsg(data: sendData)
        print("setYTrans: \(lengthValue)")
    }

    public static func loadDeviceVersion() {
        let datas: [UInt8] = [0x01, 0x00]
        let sendData = DataHelper.getSendBytes(id: RobotConstants.TYPE_DEFAULT, funcName: RobotConstants.SET_DQBBH, data: datas)
        SOCKETMANAGER?.sendMsg(data: sendData)
    }

    // The translation assumes that the
}
