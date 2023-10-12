//
//  EasyBodyInfo.swift
//  XiaoLiuren
//
//  Created by Suoie on 2022/9/25.
//

import SwiftUI

struct EasyBodyInfo: View {
    let model:NjSi
    var body: some View {
        VStack(alignment: .leading, spacing:10){
            Text(model.ex)
            Text(model.illustrate)
            Text(model.chance)
            Text(model.wealth)
            Text(model.emotion)
            Text(model.cause)
            Text(model.body)
            Text(model.godAndGhost)
            Text(model.people)
        }.font(.system(size: 14))
        
    }
}

struct EasyBodyInfo_Previews: PreviewProvider {
    static var previews: some View {
        EasyBodyInfo(model: NSModel().getModel(Str: "大安"))
    }
}
