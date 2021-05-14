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
        HStack(spacing: 50){
            Spacer()
            Button("+", action: {
                self.showingModal.toggle()
            }).padding().sheet(isPresented: $showingModal) {
                UserModalView()
            }
        }

        List {
            ForEach(users) { user in
                Text("\(user.firstName!)" + "\(user.lastName!)")
//                Text("\(user.email!)") なぜか表示できない nil??
            }
            .onDelete(perform: deleteCategory)
        }
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
                    presentationMode.wrappedValue.dismiss()
                },
                trailing: Button("保存") {
                let newUser = User(context: context)
                    newUser.firstName = firstName
                    newUser.lastName = lastName
                    newUser.email = email
                try? context.save()
                presentationMode.wrappedValue.dismiss()
                
            })
        }
    }
}
