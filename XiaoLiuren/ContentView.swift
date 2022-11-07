//
//  ContentView.swift
//  XiaoLiuren
//
//  Created by Suoie on 2022/8/25.
//

import SwiftUI


struct ContentView: View {
    
    @State  var sin = solarToLunar.lunarDate(date: Date())
    @State var mainBody = ""
    @State var guest = ""
    @State var supper = ""
    @StateObject var vm = ThreeShinModel()
    
    

    
    var body: some View {
//        Threeshin(sin:1)
        VStack {
            Button {
                vm.splitNowYunShin()
            } label: {
                RoundedRectangle(cornerRadius: 10)
                    .frame(height: 100)
                    .foregroundStyle(.black)
                    .overlay {
                        Threeshin(mainBody: vm.mainBody, guest: vm.guest, supper: vm.supper)
                            .foregroundColor(.white)
                    }
            }

            
            EasyBodyInfo(nowModel: vm.mainBody)
                .foregroundColor(.gray)
                .padding()
                .overlay {
                    Capsule(style: .continuous)
                        .stroke(Color.brown, style: StrokeStyle(lineWidth: 5))
                }

        }
        .padding()
    }
    
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
