//
//  Threeshin.swift
//  XiaoLiuren
//
//  Created by Suoie on 2022/9/24.
//

import SwiftUI

struct Threeshin: View {
    let vm:ThreeShinModel
    var fontSize:CGFloat = 30
    var titleFontSize:CGFloat{
        return if fontSize > 17{
            17
        }else{
            12
        }
    }
    var body: some View {
//        VStack{
            HStack {
                VStack{
                    Text("輔助")
                        .font(.system(size: titleFontSize))
                    Text(vm.supper)
                        .font(.system(size:fontSize))
                }
                VStack{
                    Text("客體")
                        .font(.system(size: titleFontSize))
                    Text(vm.guest)
                        .font(.system(size:fontSize))
                }
                VStack{
                    Text("主體")
                        .font(.system(size: titleFontSize))
                    Text(vm.mainBody)
                        .font(.system(size:fontSize))
                }
//            }
        }.padding()
        
    }
}

struct Threeshin_Previews: PreviewProvider {
    
    static var previews: some View {
        
        Threeshin(vm: ThreeShinModel())
    }
}
