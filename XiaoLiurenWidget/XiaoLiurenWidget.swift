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
//        var entries: [SimpleEntry] = []

        // Generate a timeline consisting of five entries an hour apart, starting from the current date.
        let currentDate = Date()
//        for hourOffset in 0 ..< 5 {
//            let entryDate = Calendar.current.date(byAdding: .hour, value: hourOffset, to: currentDate)!
//            let entry = SimpleEntry(date: entryDate, configuration: configuration)
//            entries.append(entry)
//        }
//
//        let timeline = Timeline(entries: entries, policy: .atEnd)
//        completion(timeline)
        
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
    @State var sin = solarToLunar.lunarDate(date: Date())
    @Environment(\.widgetFamily) var family
    
    
    var body: some View {
        
        switch family{
        case .accessoryRectangular:
            Threeshin(NowYunShin: $sin)
        case .accessoryCircular:
            ThreeshinCircular(NowYunShin: $sin)
        case .systemSmall:
            ZStack{
                ContainerRelativeShape()
                    .fill(.gray.gradient)
                Threeshin(NowYunShin: $sin)
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


struct Threeshin: View {
    @Binding var NowYunShin: String
    
    func splitNowYunShin(_ int:Int)->String{
        let strList = NowYunShin.components(separatedBy: "-")
        let one = Int(strList[1]) ?? 1
        let two = Int(strList[2]) ?? 1
        let three = Int(strList[3]) ?? 1
        switch int{
        case 1:return sixRe(intValue: one%6).rawValue
        case 2:return sixRe(intValue: (one+two-1)%6).rawValue
        case 3:
            let SH = shichen(intValue: three).intValue
            return sixRe(intValue: (one+two+SH-2)%6).rawValue
        default:return ""
        }
    }
    var body: some View {
        
        HStack {
            VStack{
                Text("??????")
                    .font(.system(size:15))
                Text(splitNowYunShin(1))
            }
            VStack{
                Text("??????")
                    .font(.system(size:15))
                Text(splitNowYunShin(2))
            }
            VStack{
                Text("??????")
                    .font(.system(size:15))
                Text(splitNowYunShin(3))
            }
        }
    }
}

struct Threeshin_Previews: PreviewProvider {
    
    static var previews: some View {
        
        Threeshin(NowYunShin: .constant(solarToLunar.lunarDate(date: Date())))
    }
}


struct ThreeshinCircular: View {
    @Binding var NowYunShin: String
    
    @Environment(\.widgetFamily) var family
    func splitNowYunShin(_ int:Int)->String{
        let strList = NowYunShin.components(separatedBy: "-")
        let one = Int(strList[1]) ?? 1
        let two = Int(strList[2]) ?? 1
        let three = Int(strList[3]) ?? 1
        switch int{
        case 1:return sixRe(intValue: one%6).rawValue
        case 2:return sixRe(intValue: (one+two-1)%6).rawValue
        case 3:
            let SH = shichen(intValue: three).intValue
            return sixRe(intValue: (one+two+SH-2)%6).rawValue
        default:return ""
        }
    }
    var body: some View {
        Text(splitNowYunShin(3))
    }
}

struct ThreeshinCircular_Previews: PreviewProvider {
    
    static var previews: some View {
        
        ThreeshinCircular(NowYunShin: .constant(solarToLunar.lunarDate(date: Date())))
    }
}







class solarToLunar  {
    // ????????????????????????????????????????????????????????????
    static func lunarDate(date: Date) -> String {
        let formatter = DateFormatter()
        formatter.calendar = Calendar(identifier: .chinese)
        formatter.locale = Locale(identifier: "zh_CN")
        formatter.dateFormat = "yyyy-M-d-H"
        let nowLunarDate = formatter.string(from: date)
        
        return nowLunarDate
    }

}

enum shichen: String, CaseIterable, RawRepresentable {
    init(intValue: Int) {
        switch intValue {
        case 23, 24, 0: self = .???
        case 1, 2: self = .???
        case 3, 4: self = .???
        case 5, 6: self = .???
        case 7, 8: self = .???
        case 9, 10: self = .???
        case 11, 12: self = .???
        case 13, 14: self = .???
        case 15, 16: self = .???
        case 17, 18: self = .???
        case 19, 20: self = .???
        case 21, 22: self = .???
        default: self = .???
        }
    }
    
    var intValue: Int {
        switch self {
        case .???: return 1
        case .???: return 2
        case .???: return 3
        case .???: return 4
        case .???: return 5
        case .???: return 6
        case .???: return 7
        case .???: return 8
        case .???: return 9
        case .???: return 10
        case .???: return 11
        case .???: return 12
        }
    }

    case ???, ???, ???, ???, ???, ???, ???, ???, ???, ???, ???, ???
}

enum sixRe: String{
    case ??????,??????,??????,??????,??????,??????
    init(intValue: Int){
        switch intValue{
            case 1:self = .??????
            case 2:self = .??????
            case 3:self = .??????
            case 4:self = .??????
            case 5:self = .??????
            case 0:self = .??????
        default:self = .??????
        }
    }
}
