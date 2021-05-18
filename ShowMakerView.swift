//
//  ShowMakerView.swift
//  kizai_kanri
//
//  Created by 仲吉一馬 on 2021/05/14.
//  Copyright © 2021 hagiwara. All rights reserved.
//

import Foundation
import SwiftUI

struct ShowMakerView: View {
    @Environment(\.managedObjectContext) private var context

    @FetchRequest(
        entity: Maker.entity(),
        sortDescriptors: [NSSortDescriptor(keyPath: \Maker.objectID, ascending: true)],
        predicate: nil
    ) private var makers: FetchedResults<Maker>
    
    
    @State private var showingModal = false
    var body: some View {
        NavigationView {
            List {
                ForEach(makers) { maker in
                    Text("\(maker.makerName!)")
                }
                .onDelete(perform: deleteCategory)
            }
            .navigationBarItems(trailing: Button(action: {
                self.showingModal.toggle()
            }, label: {
                Text("+")
            }).sheet(isPresented: $showingModal) {
                MarkerModalView()
            })
        }
    }

    func deleteCategory(offsets: IndexSet) {
        for index in offsets {
            context.delete(makers[index])
        }
        try? context.save()
    }
}

struct MarkerModalView: View {
    @Environment(\.managedObjectContext) private var context
    @Environment(\.presentationMode) var presentationMode
    @State private var name = ""
    var body: some View {
        NavigationView {
            Form {
                Section() {
                    TextField("メーカーを入力", text: $name)
                }
            }
            .navigationBarTitle("メーカーを追加")
            .navigationBarItems(
                leading:  Button("戻る") {
                    self.presentationMode.wrappedValue.dismiss()
                },
                trailing: Button("保存") {
                    let newMaker = Maker(context: self.context)
                    newMaker.makerName = self.name
                    try? self.context.save()
                    self.presentationMode.wrappedValue.dismiss()
                
            })
        }
    }
}
