//
//  Threeshin.swift
//  XiaoLiuren
//
//  Created by Suoie on 2022/9/24.
//

import SwiftUI

struct Threeshin: View {
    let vm:ThreeShinModel
    var body: some View {
        VStack{
            HStack {
                VStack{
                    Text("輔助")
                    Text(vm.supper)
                        .font(.system(size:30))
                }
                VStack{
                    Text("客體")
                    Text(vm.guest)
                        .font(.system(size:30))
                }
                VStack{
                    Text("主體")
                    Text(vm.mainBody)
                        .font(.system(size:30))
                }
            }
            
        }.padding()
        
    }
}

struct Threeshin_Previews: PreviewProvider {
    
    static var previews: some View {
        
        Threeshin(vm: ThreeShinModel())
    }
}
