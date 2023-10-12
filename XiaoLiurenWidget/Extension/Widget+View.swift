//
//  Widget+View.swift
//  XiaoLiuren
//
//  Created by Suoie on 2023/10/12.
//

import WidgetKit
import SwiftUI
import Intents

extension View {
    func widgetBackground(_ backgroundView: some View) -> some View {
        if #available(iOS 17.0, *) {
            return containerBackground(for: .widget) {
                backgroundView
            }
        } else {
            return background(backgroundView)
        }
    }
}
