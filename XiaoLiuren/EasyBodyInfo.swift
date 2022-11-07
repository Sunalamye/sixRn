//
//  EasyBodyInfo.swift
//  XiaoLiuren
//
//  Created by Suoie on 2022/9/25.
//

import SwiftUI

struct EasyBodyInfo: View {
    let model = NSModel()
    var nowModel: String
    var body: some View {
        Text(model.getModel(Str: nowModel))
    }
}

struct EasyBodyInfo_Previews: PreviewProvider {
    static var previews: some View {
        EasyBodyInfo(nowModel: "大安")
    }
}
