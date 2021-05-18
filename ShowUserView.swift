//
//  ShowUserView.swift
//  kizai_kanri
//
//  Created by 仲吉一馬 on 2021/05/14.
//  Copyright © 2021 hagiwara. All rights reserved.
//

import Foundation
import SwiftUI

struct ShowUserView: View {
    @Environment(\.managedObjectContext) private var context

    @FetchRequest(
        entity: User.entity(),
        sortDescriptors: [NSSortDescriptor(keyPath: \User.objectID, ascending: true)],
        predicate: nil
    ) private var users: FetchedResults<User>
    
    
    @State private var showingModal = false
    let userName = ""
    var body: some View {
        return AnyView(HStack(spacing: 50){
            Spacer()
            Button("+", action: {
                self.showingModal.toggle()
            }).padding().sheet(isPresented: $showingModal) {
                UserModalView()
            }
        })

        return AnyView(List {
            ForEach(users) { user in
                ViewBuilder.buildBlock(
                    Text("\(user.firstName!)" + "\(user.lastName!)"),
                    Text("\(user.email!)")
                )
            }
            .onDelete(perform: deleteCategory)
        })
    }

    func deleteCategory(offsets: IndexSet) {
        for index in offsets {
            context.delete(users[index])
        }
        try? context.save()
    }
}

struct UserModalView: View {
    @Environment(\.managedObjectContext) private var context
    @Environment(\.presentationMode) var presentationMode
    @State private var lastName = ""
    @State private var firstName = ""
    @State private var email = ""
    var body: some View {
        NavigationView {
            Form {
                Section() {
                    TextField("名字を入力", text: $firstName)
                    TextField("名前を入力", text: $lastName)
                    TextField("メール", text: $email)
                }
            }
            .navigationBarTitle("ユーザー追加")
            .navigationBarItems(
                leading:  Button("戻る") {
                    self.presentationMode.wrappedValue.dismiss()
                },
                trailing: Button("保存") {
                    let newUser = User(context: self.context)
                    newUser.firstName = self.firstName
                    newUser.lastName = self.lastName
                    newUser.email = self.email
                    try? self.context.save()
                    self.presentationMode.wrappedValue.dismiss()
                
            })
        }
    }
}
