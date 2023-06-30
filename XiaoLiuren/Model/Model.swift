//
//  SolarToLunar.swift
//  XiaoLiuren
//
//  Created by Suoie on 2022/9/23.
//

import Foundation
import SwiftUI

// 根据公历年、月、日获取对应的农历日期信息
extension Date {
    // 根据公历年、月、日获取对应的农历日期信息
    func lunarDate() -> String {
        let formatter = DateFormatter()
        formatter.calendar = Calendar(identifier: .chinese)
        formatter.locale = Locale(identifier: "zh_CN")
        formatter.dateFormat = "yyyy-M-d-H"
        let nowLunarDate = formatter.string(from: self)
        
        return nowLunarDate
    }
}


enum shichen: String, CaseIterable, RawRepresentable {
    init(intValue: Int) {
        switch intValue {
        case 23, 24, 0: self = .子
        case 1, 2: self = .丑
        case 3, 4: self = .寅
        case 5, 6: self = .卯
        case 7, 8: self = .辰
        case 9, 10: self = .巳
        case 11, 12: self = .午
        case 13, 14: self = .未
        case 15, 16: self = .申
        case 17, 18: self = .酉
        case 19, 20: self = .戌
        case 21, 22: self = .亥
        default: self = .午
        }
    }
    
    var intValue: Int {
        switch self {
        case .子: return 1
        case .丑: return 2
        case .寅: return 3
        case .卯: return 4
        case .辰: return 5
        case .巳: return 6
        case .午: return 7
        case .未: return 8
        case .申: return 9
        case .酉: return 10
        case .戌: return 11
        case .亥: return 12
        }
    }

    case 子, 丑, 寅, 卯, 辰, 巳, 午, 未, 申, 酉, 戌, 亥
}

enum SixRe: String{
    case 大安,留連,速喜,赤口,小吉,空亡
    init(intValue: Int){
        switch intValue{
            case 1:self = .大安
            case 0:self = .留連
            case 5:self = .速喜
            case 4:self = .赤口
            case 3:self = .小吉
            case 2:self = .空亡
        default:self = .大安
        }
    }
}

class ThreeShinModel: ObservableObject{
    
    init(){
        splitNowYunShin()
    }
    @Published var mainBody: String = ""
    @Published var guest: String = ""
    @Published var supper: String = ""
    
    
    func splitNowYunShin(_ time:String = Date().lunarDate()){
        let strList = time.components(separatedBy: "-")
        let one = Int(strList[1]) ?? 1
        let two = Int(strList[2]) ?? 1
        let three = Int(strList[3]) ?? 1
        supper = SixRe(intValue: one%6).rawValue
        guest = SixRe(intValue: (one+two-1)%6).rawValue
        
        let SH = shichen(intValue: three).intValue
        mainBody = SixRe(intValue: (one+two+SH-2)%6).rawValue
        
       
    }
    
}


extension Bundle {
    func decode<T: Codable>(_ file: String) -> [T] {
        
        guard let url = Bundle.main.url(forResource: file, withExtension: "json") else {
            fatalError("沒有在項目裡面找到\(file)文件")
        }
        guard let data = try? Data(contentsOf: url) else {
            fatalError("加載\(file)文件失敗")
        }
        
        let decoder = JSONDecoder()
        guard let datas = try? decoder.decode([T].self, from: data) else {
            fatalError("\(file)文件JSON解碼失敗")
        }
        
        return datas
    }
}

class NSModel{
    let model: [NjSi]
    
    init(){
        self.model = Bundle.main.decode("nqjsi")
        
    }
    func getModel(Str:String) ->NjSi{
        for item in model{
            if item.model == Str{
                return item
            }
        }
        return .init(model: "", explain: "", illustrate: "", ex: "", chance: "", wealth: "", emotion: "", cause: "", body: "", godAndGhost: "", people: "")
    }
     
}

struct NjSi: Codable {
    var model, explain, illustrate, ex: String
    var chance, wealth, emotion, cause: String
    var body, godAndGhost, people: String

    enum CodingKeys: String, CodingKey {
        case model, explain, illustrate
        case ex = "Ex"
        case chance, wealth, emotion, cause, body, godAndGhost, people
    }
}
