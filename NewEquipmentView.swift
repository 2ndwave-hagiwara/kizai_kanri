//
//  NewEquipmentView.swift
//  kizai_kanri
//
//  Created by 仲吉一馬 on 2021/05/14.
//  Copyright © 2021 hagiwara. All rights reserved.
//

import Foundation
import SwiftUI

struct NewEquipmentView: View {
    @Environment(\.managedObjectContext) private var context

    @FetchRequest(
        entity: User.entity(),
        sortDescriptors: [NSSortDescriptor(keyPath: \User.objectID, ascending: true)],
        predicate: nil
    ) private var users: FetchedResults<User>
    
    @FetchRequest(
        entity: Maker.entity(),
        sortDescriptors: [NSSortDescriptor(keyPath: \User.objectID, ascending: true)],
        predicate: nil
    ) private var makers: FetchedResults<Maker>
    
    var categoryName: String = ""
    @State var managementNumber = ""
    @State var modelName = ""
    @State var equipmentType = ""
    @State var macAddress = ""
    @State var hostName = ""
    @State var usage = ""
    @State var note = ""
    @State var purchaseDate = Date()
    @State var os = ""
    @State var name = ""
    @State var userSelected = ""
    @State var makerSelected = ""
    
    var body: some View {
        NavigationView {
            Form {
                TextField("管理番号", text: $managementNumber)
                Picker(selection: $makerSelected,
                       label: Text("メーカー")) {
                    ForEach(makers, id: \.self) { maker in
                        Text("\(maker.makerName!)")
                    }
                }
                TextField("モデル名", text: $modelName)
                TextField("種別", text: $equipmentType)
                Picker(selection: $userSelected,
                       label: Text("使用者")) {
                    ForEach(users, id: \.self) { user in
                        Text("\(user.firstName!)" + "\(user.lastName!)")
                    }
                }
                TextField("用途", text: $usage)
                TextField("メモ・備考", text: $note)
                DatePicker(selection: $purchaseDate,
                           label: {Text("購入日")})
                
                Button(action: {}) {
                    Text("確定")
                }
            }
            .navigationBarTitle(categoryName)
        }
    }
}

