//
//  CatPortrait.swift
//  CatPortrait
//
//  Created by Daegeon Choi on 2021/09/14.
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
        var entries: [SimpleEntry] = []

        // Generate a timeline consisting of five entries an hour apart, starting from the current date.
        let currentDate = Date()
        for hourOffset in 0 ..< 5 {
            let entryDate = Calendar.current.date(byAdding: .hour, value: hourOffset, to: currentDate)!
            let entry = SimpleEntry(date: entryDate, configuration: configuration)
            entries.append(entry)
        }

        let timeline = Timeline(entries: entries, policy: .atEnd)
        completion(timeline)
    }
}

struct SimpleEntry: TimelineEntry {
    let date: Date
    let configuration: ConfigurationIntent
}

//MARK: - Body
struct CatPortraitEntryView : View {
    var entry: Provider.Entry

    var body: some View {
        ZStack {
            
            Image("popcat_closed")
                .resizable(resizingMode: .stretch)
                .padding(.all, 5.0)
                .scaledToFit()
                
            
        }.foregroundColor(Color("BgColor"))
    }
}

//MARK: - Main
@main
struct CatPortrait: Widget {
    let kind: String = "CatPortrait"

    var body: some WidgetConfiguration {
        IntentConfiguration(kind: kind, intent: ConfigurationIntent.self, provider: Provider()) { entry in
            CatPortraitEntryView(entry: entry)
        }
        .configurationDisplayName("Cat Portrait".localized)
        .description("Cat invaded outside of your app!".localized)
    }
}

struct CatPortrait_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            CatPortraitEntryView(entry: SimpleEntry(date: Date(), configuration: ConfigurationIntent()))
                .previewContext(WidgetPreviewContext(family: .systemSmall))
            
            CatPortraitEntryView(entry: SimpleEntry(date: Date(), configuration: ConfigurationIntent()))
                .previewContext(WidgetPreviewContext(family: .systemMedium))
            
            CatPortraitEntryView(entry: SimpleEntry(date: Date(), configuration: ConfigurationIntent()))
                .previewContext(WidgetPreviewContext(family: .systemLarge))

        }
    }
}