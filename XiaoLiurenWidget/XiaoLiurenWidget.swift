//
//  XiaoLiurenWidget.swift
//  XiaoLiurenWidget
//
//  Created by Suoie on 2022/9/24.
//

import WidgetKit
import SwiftUI
import Intents

struct Provider: IntentTimelineProvider {
    func placeholder(in context: Context) -> SimpleEntry {
        SimpleEntry(date: Date(), configuration: ConfigurationIntent())
    }

    func getSnapshot(for configuration: ConfigurationIntent, in context: Context, completion: @escaping (SimpleEntry) -> ()) {
        let entry = SimpleEntry(date: Date(), configuration: configuration)
        completion(entry)
    }

    func getTimeline(for configuration: ConfigurationIntent, in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
        let currentDate = Date()
        
        let refreshDate = Calendar.current.date(byAdding: .minute, value: 5, to: currentDate)!
            var arr:[SimpleEntry] = []
            var tempDate = Date()
                for idx in 0...300 {
                    tempDate = Calendar.current.date(byAdding: .second, value: idx, to: currentDate)!
                    let tempEntry = SimpleEntry(date: tempDate, configuration: configuration)
                    arr.append(tempEntry)
                }
                let timeline = Timeline(entries: arr, policy: .after(refreshDate))
                completion(timeline)
    }
}

struct SimpleEntry: TimelineEntry {
    let date: Date
    let configuration: ConfigurationIntent
}

struct XiaoLiurenWidgetEntryView : View {
    var entry: Provider.Entry
    @StateObject var vm = ThreeShinModel()
    @Environment(\.widgetFamily) var family
    
    
    var body: some View {
        
        switch family{
        case .accessoryRectangular:
            
            Threeshin(vm: vm)
        case .accessoryCircular:
            ThreeshinCircular(vm: vm)
        case .systemSmall:
            ZStack{
                ContainerRelativeShape()
                    .fill(.gray.gradient)
                Threeshin(vm: vm)
                    .foregroundColor(.indigo)
            }
        default:
            Text("")
        }
        
        
        
//        Text(entry.date, style: .time)
    }
}

@main
struct XiaoLiurenWidget: Widget {
    let kind: String = "XiaoLiurenWidget"
    var body: some WidgetConfiguration {
        IntentConfiguration(kind: kind, intent: ConfigurationIntent.self, provider: Provider()) { entry in
            XiaoLiurenWidgetEntryView(entry: entry)
        }
        .configurationDisplayName("My Widget")
        .description("This is an example widget.")
        .supportedFamilies([.accessoryRectangular,.accessoryCircular,.systemSmall])
    }
}

struct XiaoLiurenWidget_Previews: PreviewProvider {
    static var previews: some View {
        XiaoLiurenWidgetEntryView(entry: SimpleEntry(date: Date(), configuration: ConfigurationIntent()))
            .previewContext(WidgetPreviewContext(family: .systemSmall))
    }
}



struct ThreeshinCircular: View {
    
    let vm:ThreeShinModel
    var body: some View {
        Text(vm.mainBody)
    }
}







//
//class SolarToLunar  {
//    // 根据公历年、月、日获取对应的农历日期信息
//    static func lunarDate(date: Date) -> String {
//        let formatter = DateFormatter()
//        formatter.calendar = Calendar(identifier: .chinese)
//        formatter.locale = Locale(identifier: "zh_CN")
//        formatter.dateFormat = "yyyy-M-d-H"
//        let nowLunarDate = formatter.string(from: date)
//        
//        return nowLunarDate
//    }
//
//}
//
//enum shichen: String, CaseIterable, RawRepresentable {
//    init(intValue: Int) {
//        switch intValue {
//        case 23, 24, 0: self = .子
//        case 1, 2: self = .丑
//        case 3, 4: self = .寅
//        case 5, 6: self = .卯
//        case 7, 8: self = .辰
//        case 9, 10: self = .巳
//        case 11, 12: self = .午
//        case 13, 14: self = .未
//        case 15, 16: self = .申
//        case 17, 18: self = .酉
//        case 19, 20: self = .戌
//        case 21, 22: self = .亥
//        default: self = .午
//        }
//    }
//    
//    var intValue: Int {
//        switch self {
//        case .子: return 1
//        case .丑: return 2
//        case .寅: return 3
//        case .卯: return 4
//        case .辰: return 5
//        case .巳: return 6
//        case .午: return 7
//        case .未: return 8
//        case .申: return 9
//        case .酉: return 10
//        case .戌: return 11
//        case .亥: return 12
//        }
//    }
//
//    case 子, 丑, 寅, 卯, 辰, 巳, 午, 未, 申, 酉, 戌, 亥
//}
//
//enum SixRe: String{
//    case 大安,留連,速喜,赤口,小吉,空亡
//    init(intValue: Int){
//        switch intValue{
//        case 1:self = .大安
//        case 0:self = .留連
//        case 5:self = .速喜
//        case 4:self = .赤口
//        case 3:self = .小吉
//        case 2:self = .空亡
//        default:self = .大安
//        }
//    }
//}


