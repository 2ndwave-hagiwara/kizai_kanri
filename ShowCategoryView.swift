//
//  ShowCategoryView.swift
//  kizai_kanri
//
//  Created by 仲吉一馬 on 2021/05/12.
//  Copyright © 2021 hagiwara. All rights reserved.
//

import Foundation
import SwiftUI

struct ShowCategoryView: View {
    @State private var showingModal = false
    let categories = ["PC", "キーボード", "マウス", "モニター", "ACアダブタ", "電源コード", "ディスプレイケーブル", "外付けHDD・SSD", "USBメモリ", "ライトニングケーブル", "ダブレット", "スマホ", "その他機器"]
        var body: some View {
            HStack(spacing: 50){
    //            Text("新規作成")
                Spacer()
                Button("+", action: {
                    self.showingModal.toggle()
                }).padding().sheet(isPresented: $showingModal) {
                    EquipmentModalView()
                }
            }
            List {
                ForEach(0 ..< categories.count) { index in
                    Text(categories[index])
                }
            }
        }
}

struct CategoryModalView: View {
    var body: some View {
        Text("Modal View")
    }
}

//struct ModalView_Previews: PreviewProvider {
//    static var previews: some View {
//        EquipmentModalView()
//    }
//}
