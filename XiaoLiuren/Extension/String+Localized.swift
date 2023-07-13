//
//  String+Localized.swift
//  XiaoLiuren
//
//  Created by Suoie on 2023/7/13.
//

import Foundation

extension String{
    /// 用來本地化的 直接在字串後面 "String".localized
    func localized(_ args: CVarArg...) -> String {
        return String(format: self.localized, args)
    }

    /// 直接本地化沒有多餘的變數 使用方法 String().localized
    var localized: String {
        return NSLocalizedString(self, comment: "")
    }
}
