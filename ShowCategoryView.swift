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
    @Environment(\.managedObjectContext) private var context
  
     /// データ取得処理
    @FetchRequest(
            entity: Category.entity(),
            sortDescriptors: [NSSortDescriptor(keyPath: \Category.objectID, ascending: true)],
            predicate: nil
        ) private var categories: FetchedResults<Category>
    @State private var showingModal = false
        var body: some View {
            HStack(spacing: 50){
                Spacer()
                Button("+", action: {
                    self.showingModal.toggle()
                }).padding().sheet(isPresented: $showingModal) {
                    CategoryModalView()
                }
            }

            List {
                ForEach(categories) { category in
                    Text("\(category.categoryName!)")
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
            .navigationBarItems(
                leading:  Button("戻る") {
                    presentationMode.wrappedValue.dismiss()
                },
                trailing: Button("保存") {
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
