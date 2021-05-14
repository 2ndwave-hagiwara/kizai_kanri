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
                    CategoryModalView()
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
    @Environment(\.managedObjectContext) private var context
    @Environment(\.presentationMode) var presentationMode
    @State private var name = ""
    var body: some View {
        NavigationView {
            Form {
                Section() {
                    TextField("カテゴリを入力", text: $name)
                }
            }
            .navigationBarTitle("タスク追加")
            .navigationBarItems(leading: Button("保存") {
                /// タスク新規登録処理
                let newCategory = Category(context: context)
                newCategory.categoryName = name
                
                try? context.save()

                /// 現在のViewを閉じる
                presentationMode.wrappedValue.dismiss()
            })
        }
        }
}

//struct ModalView_Previews: PreviewProvider {
//    static var previews: some View {
//        EquipmentModalView()
//    }
//}
