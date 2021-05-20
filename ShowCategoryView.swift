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

    @FetchRequest(
        entity: Category.entity(),
        sortDescriptors: [NSSortDescriptor(keyPath: \Category.objectID, ascending: true)],
        predicate: nil
    ) private var categories: FetchedResults<Category>

    @State private var showingModal = false
        var body: some View {
            NavigationView {
                List {
                    ForEach(categories, id: \.self) { category in
                        NavigationLink(destination: NewEquipmentView(categorySelected: category)) {
                            Text("\(category.categoryName!)")
                        }
                    }
                    .onDelete(perform: deleteCategory)
                }
                .navigationBarTitle(Text(""), displayMode: .inline)
                .navigationBarItems(trailing: Button(action: {
                    self.showingModal.toggle()
                }, label: {
                    Text("+")
                }).sheet(isPresented: $showingModal) {
                    CategoryModalView()
                })
            }
            
        }
    
    func deleteCategory(offsets: IndexSet) {
        for index in offsets {
            context.delete(categories[index])
        }
        try? context.save()
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
            .navigationBarTitle("カテゴリ追加")
            .navigationBarItems(
                leading:  Button("戻る") {
                    self.presentationMode.wrappedValue.dismiss()
                },
                trailing: Button("保存") {
                    let newCategory = Category(context: self.context)
                    newCategory.categoryName = self.name
                    try? self.context.save()
                    self.presentationMode.wrappedValue.dismiss()
                
            })
        }
    }
}

//struct ModalView_Previews: PreviewProvider {
//    static var previews: some View {
//        EquipmentModalView()
//    }
//}
