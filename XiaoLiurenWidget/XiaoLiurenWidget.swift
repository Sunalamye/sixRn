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
        
        let nextHourDate = Calendar.current.date(bySetting: .minute, value: 0, of: currentDate)!
        let nextHourDateRoundedUp = Calendar.current.date(byAdding: .hour, value: 1, to: nextHourDate)!
        
        let entry1 = SimpleEntry(date: currentDate, configuration: configuration)
        let entry2 = SimpleEntry(date: nextHourDateRoundedUp, configuration: configuration)
        
        let timeline = Timeline(entries: [entry1, entry2], policy: .after(nextHourDateRoundedUp))
        
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
            
            Threeshin(vm: vm,fontSize: 14)
        case .accessoryCircular:
            HStack {
                Text(vm.nowTime)
                Text(vm.mainBody)
            }
        case .systemSmall:
            ZStack{
                ContainerRelativeShape()
                    .fill(.gray.gradient)
                Threeshin(vm: vm,fontSize: 14)
                    .foregroundColor(.indigo)
            }
        default:
            Text("")
        }
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

