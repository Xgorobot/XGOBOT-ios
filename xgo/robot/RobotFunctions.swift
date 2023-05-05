//
//  RobotFunctions.swift
//  xgo
//
//  Created by wenlin.yuan on 2023/4/30.
//

import Foundation

public class RobotFunction {
    private static let TAG = "RobotFunction"
    
    //速度：默认为中速2。1为低速，3为高速。
    public static func setSpeed(speed: Int) {
        let datas: [UInt8] = [UInt8(speed), 0x00]
        let sendData = DataHelper.getSendBytes(id: RobotConstants.TYPE_DEFAULT, funcName: RobotConstants.SET_BFPL, data: datas)
        SOCKETMANAGER?.sendMsg(data: sendData)
    }

    //步幅
    public static func setStepLength(length: Int) {
        let datas: [UInt8] = [UInt8(length), 0x00]
        let sendData = DataHelper.getSendBytes(id: RobotConstants.TYPE_DEFAULT, funcName: RobotConstants.SET_BFKD, data: datas)
        SOCKETMANAGER?.sendMsg(data: sendData)
    }

    //方向：0=停止，1=向前，2=向后，3=向左，4=向右，5=左旋，6=右旋
    public static func btnControl(direction: Int) {
        let datas: [UInt8] = [UInt8(direction), 0x00]
        let sendData = DataHelper.getSendBytes(id: RobotConstants.TYPE_DEFAULT, funcName: RobotConstants.SET_AJKZ, data: datas)
        SOCKETMANAGER?.sendMsg(data: sendData)
    }

    //遥控界面中间的webview视频地址
    public static func getWebUrl() -> String {
        let hostIp = UserDefaultsManager.shared.host
        let cameraPort = UserDefaultsManager.shared.cameraPort
        return "\(hostIp ?? "172.0.0.1"):\(cameraPort)/video_feed"
    }

    //陀螺仪开关 遥控页面右上角设置菜单里有
    public static func autoBalance(enable: Bool) {
        let datas: [UInt8] = [enable ? 1 : 0, 0x00]
        let sendData = DataHelper.getSendBytes(id: RobotConstants.TYPE_DEFAULT, funcName: RobotConstants.SET_ZWDMS, data: datas)
        SOCKETMANAGER?.sendMsg(data: sendData)
    }

    //舵机设置
        //腿ID：=1左前腿，=2右前腿，=3右后腿，4=左后腿。
        //舵机限制：上[-31, 31]，中[-66, 93], 下[-73, 57]
    public static func servoControl(legID: Int, up: Int, middle: Int, down: Int) {
        let datas: [UInt8] = [UInt8(legID), UInt8(up), UInt8(middle), UInt8(down), 0x00]
        let sendData = DataHelper.getSendBytes(id: RobotConstants.TYPE_DEFAULT, funcName: RobotConstants.SET_KZDJ, data: datas)
        SOCKETMANAGER?.sendMsg(data: sendData)
    }

    //位姿模式 遥控页面左侧X轴设置
    public static func setXTrans(length: Int) {
        var lengthValue = max(-35, length)
        lengthValue = min(35, lengthValue)
        let datas: [UInt8] = [UInt8(lengthValue), 0x00]
        let sendData = DataHelper.getSendBytes(id: RobotConstants.TYPE_DEFAULT, funcName: RobotConstants.SET_XZPY, data: datas)
        SOCKETMANAGER?.sendMsg(data: sendData)
        print("setXTrans: \(lengthValue)")
    }

    //位姿模式 遥控页面左侧Y轴设置
    public static func setYTrans(length: Int) {
        var lengthValue = max(-18, length)
        lengthValue = min(18, lengthValue)
        let datas: [UInt8] = [UInt8(lengthValue), 0x00]
        let sendData = DataHelper.getSendBytes(id: RobotConstants.TYPE_DEFAULT, funcName: RobotConstants.SET_YZPY, data: datas)
        SOCKETMANAGER?.sendMsg(data: sendData)
        print("setYTrans: \(lengthValue)")
    }

    
    //位姿模式 遥控页面左侧Z轴设置
    public static func xyzControl(z: Int) {
        heightControl(height: z)
        print("xyzControl: z Control \(z)")
    }

    
    //xyz滚动 页面右侧的x控制
    public static func rollControl(roll: Int) {
        let datas: [UInt8] = [UInt8(roll), 0x00]
        let sendData = DataHelper.getSendBytes(id: RobotConstants.TYPE_DEFAULT, funcName: RobotConstants.SET_KZROLL, data: datas)
        SOCKETMANAGER?.sendMsg(data: sendData)
        print("rollControl: roll Control \(roll)")
    }

    //xyz滚动 页面右侧的y控制
    public static func pitchControl(pitch: Int) {
        let datas: [UInt8] = [UInt8(pitch), 0x00]
        let sendData = DataHelper.getSendBytes(id: RobotConstants.TYPE_DEFAULT, funcName: RobotConstants.SET_KZPITCH, data: datas)
        SOCKETMANAGER?.sendMsg(data: sendData)
        print("pitchControl: pitch Control \(pitch)")
    }

    //xyz滚动 页面右侧的z控制
    public static func yawControl(yaw: Int) {
        let datas: [UInt8] = [UInt8(yaw), 0x00]
        let sendData = DataHelper.getSendBytes(id: RobotConstants.TYPE_DEFAULT, funcName: RobotConstants.SET_KZYAW, data: datas)
        SOCKETMANAGER?.sendMsg(data: sendData)
        print("yawControl: yaw Control \(yaw)")
    }
    
    //单腿控制，好像暂时没有？
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

    //设置高度
    //高低范围：75-115。
    public static func heightControl(height: Int) {
        var heightValue = max(75, height)
        heightValue = min(115, heightValue)
        let datas: [UInt8] = [UInt8(heightValue), 0x00]
        let sendData = DataHelper.getSendBytes(id: RobotConstants.TYPE_DEFAULT, funcName: RobotConstants.SET_KZGDZT, data: datas)
        SOCKETMANAGER?.sendMsg(data: sendData)
    }

    //步态调整
    //0 trot 1 walk 遥控页面下面两个按钮
    public static func setStepState(state: Int) {
        guard state == 1 || state == 0 else { return }
        let datas: [UInt8] = [UInt8(state), 0x00]
        let sendData = DataHelper.getSendBytes(id: RobotConstants.TYPE_DEFAULT, funcName: RobotConstants.SET_BTTZ, data: datas)
        SOCKETMANAGER?.sendMsg(data: sendData)
    }

    //演示模式的代码
    public static func showMode(state: Int) {
        let datas: [UInt8] = [UInt8(state), 0x00]
        let sendData = DataHelper.getSendBytes(id: RobotConstants.TYPE_DEFAULT, funcName: RobotConstants.SET_KZDZ, data: datas)
        SOCKETMANAGER?.sendMsg(data: sendData)
    }

    //演示模式的动作轮播
    public static func showRepeat(enable: Bool) {
        let datas: [UInt8] = [enable ? 1 : 0, 0x00]
        let sendData = DataHelper.getSendBytes(id: RobotConstants.TYPE_DEFAULT, funcName: RobotConstants.SET_DZLB, data: datas)
        SOCKETMANAGER?.sendMsg(data: sendData)
    }

    //设置标定模式 DEBUGMODE 有个开发者选项，开发者模式的代码
    public static func setDebugMode(enable: Bool) {
        let datas: [UInt8] = [enable ? 1 : 0, 0x00]
        let sendData = DataHelper.getSendBytes(id: RobotConstants.TYPE_DEFAULT, funcName: RobotConstants.SET_DJXZ, data: datas)
        SOCKETMANAGER?.sendMsg(data: sendData)
    }

    //上中下抓取对应 128 129 130参数，遥控页面的上中下抓取按钮
    public static func grap(state: Int) {
        let datas: [UInt8] = [UInt8(state), 0x00]
        let sendData = DataHelper.getSendBytes(id: RobotConstants.TYPE_DEFAULT, funcName: RobotConstants.SET_KZDZ, data: datas)
        SOCKETMANAGER?.sendMsg(data: sendData)
    }

    //开启摄像头 1标准模式 2 全屏模式 进入遥控模式的时候发一次标准模式即可
    public static func startCamera(state: Int) {
        let datas: [UInt8] = [UInt8(state), 0x00]
        let sendData = DataHelper.getSendBytes(id: RobotConstants.TYPE_DEFAULT, funcName: RobotConstants.SET_SPKZ, data: datas)
        SOCKETMANAGER?.sendMsg(data: sendData)
    }
   
    //进入设置页时调用一次这个代码
    public static func loadDeviceVersion() {
        let datas: [UInt8] = [0x01, 0x00]
        let sendData = DataHelper.getSendBytes(id: RobotConstants.TYPE_DEFAULT, funcName: RobotConstants.SET_DQBBH, data: datas)
        SOCKETMANAGER?.sendMsg(data: sendData)
    }

    // The translation assumes that the
}
