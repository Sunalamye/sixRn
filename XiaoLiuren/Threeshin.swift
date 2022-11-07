//
//  Threeshin.swift
//  XiaoLiuren
//
//  Created by Suoie on 2022/9/24.
//

import SwiftUI

struct Threeshin: View {
    
    var mainBody: String
    var guest: String
    var supper: String
    
    
    var body: some View {
        VStack{
            HStack {
                VStack{
                    Text("輔助")
                    Text(supper)
                        .font(.system(size:30))
                }
                VStack{
                    Text("客體")
                    Text(guest)
                        .font(.system(size:30))
                }
                VStack{
                    Text("主體")
                    Text(mainBody)
                        .font(.system(size:30))
                }
            }
            
        }.padding()
    }
}

struct Threeshin_Previews: PreviewProvider {
    
    static var previews: some View {
        
        Threeshin(mainBody: "1", guest: "1", supper: "1")
    }
}
