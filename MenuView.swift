//
//  MenuView.swift
//  kizai_kanri
//
//  Created by 仲吉一馬 on 2021/05/12.
//  Copyright © 2021 hagiwara. All rights reserved.
//

//import Foundation
import SwiftUI

struct MenuView: View {
    var body: some View {
        NavigationView {
            VStack(alignment: .leading) {
                Text("メニュー")
                    .font(.largeTitle)
                Text("機材管理システム")
                    .font(.caption)
                Divider()
                ScrollView (.vertical, showsIndicators: true) {
                    HStack {
                        Text("機材一覧")
                        Spacer()
                    }
                    HStack {
                        
                            NavigationLink(destination: ShowCategoryView()) {
                                Text("新規登録")
                            }

    //                    Text("新規登録")
                        Spacer()
                    }
                    HStack {
                        Text("メーカー一覧")
                        Spacer()
                    }
                    HStack {
                        Text("使用者一覧")
                        Spacer()
                    }
                }
                Divider()
            }
            .padding(.horizontal, 20)
           
        }
    }
}
//struct SecondView: View {
//    var body: some View {
//        Text("SecondView")
//    }
//}

struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView()
    }
}
