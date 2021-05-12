//
//  ShowEquipmentView.swift
//  kizai_kanri
//
//  Created by 仲吉一馬 on 2021/05/12.
//  Copyright © 2021 hagiwara. All rights reserved.
//

//import Foundation
import SwiftUI
struct ShowEquipmentView: View {
    var body: some View {
//        NavigationView {
            Form {
                HStack {
                    Text("新規作成")
                    Spacer()
                    Button("+", action: {})
                }
                Section(header: Text("機材一覧")) {
                    ScrollView(.vertical) {
                        Text("機材一覧が来る予定").frame(height: 32)
                        Text("機材一覧が来る予定").frame(height: 32)
                        Text("機材一覧が来る予定").frame(height: 32)
                        Text("機材一覧が来る予定").frame(height: 32)
                        Text("機材一覧が来る予定").frame(height: 32)
                        Text("機材一覧が来る予定").frame(height: 32)
                        Text("機材一覧が来る予定").frame(height: 32)
                        Text("機材一覧が来る予定").frame(height: 32)
                        Text("機材一覧が来る予定").frame(height: 32)
                        Text("機材一覧が来る予定").frame(height: 32)
                    }
                }
            }

//            }
//        ScrollView(showsIndicators: false) {
//            ForEach(0..<10) {
//                Text("\($0)").font(.title)
//            }
//        }.frame(width: 100, height: 100)
//            .navigationBarTitle("機材一覧")
//        }
    }
}
