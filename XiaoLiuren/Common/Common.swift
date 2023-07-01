//
//  Common.swift
//  XiaoLiuren
//
//  Created by Suoie on 2023/7/1.
//

import Foundation

func isInWidget() -> Bool {
    guard let extesion = Bundle.main.infoDictionary?["NSExtension"] as? [String: String] else { return false }
    guard let widget = extesion["NSExtensionPointIdentifier"] else { return false }
    return widget == "com.apple.widgetkit-extension"
}
