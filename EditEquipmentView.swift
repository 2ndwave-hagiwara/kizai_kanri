//
//  EditEquipmentView.swift
//  kizai_kanri
//
//  Created by 仲吉一馬 on 2021/05/24.
//  Copyright © 2021 hagiwara. All rights reserved.
//

import Foundation
import SwiftUI
import CoreData

struct EditEquipmentView: View {
    @Environment(\.managedObjectContext) private var context
    @Environment(\.presentationMode) var presentationMode

    @FetchRequest(
        entity: User.entity(),
        sortDescriptors: [NSSortDescriptor(keyPath: \User.objectID, ascending: true)],
        predicate: nil
    ) private var users: FetchedResults<User>
    
    @FetchRequest(
        entity: Maker.entity(),
        sortDescriptors: [NSSortDescriptor(keyPath: \Maker.objectID, ascending: true)],
        predicate: nil
    ) private var makers: FetchedResults<Maker>
    
    @FetchRequest(
        entity: Equipment.entity(),
        sortDescriptors: [NSSortDescriptor(keyPath: \Equipment.objectID, ascending: true)],
        predicate: nil
    ) private var equipments: FetchedResults<Equipment>
    var equipment: Equipment
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
    @State var categorySelected = Category()
    @State var userSelected = User()
    @State var makerSelected = Maker()
    @State var equipmentSelected = Equipment()
    
    @State private var image = UIImage()
    @State private var isShowPhotoLibrary = false

    @State private var loadFlg = true

    var body: some View {
            Form {
                VStack {
                   Image(uiImage: self.image)
                       .resizable()
                       .scaledToFill()
                       .frame(minWidth: 0, maxWidth: .infinity)
                       .edgesIgnoringSafeArea(.all)
                   Button(action: {
                       self.isShowPhotoLibrary = true
                   }, label: {
                       Text("アルバムから選択")
                           .padding()
                   })
               }
               .sheet(isPresented: $isShowPhotoLibrary, content: {
                   ImagePicker(sourceType: .photoLibrary, selectedImage: self.$image)
               })
                Section(header: Text("必須項目")){
                    TextField("管理番号", text: $managementNumber)
                    Picker(selection: $makerSelected,
                           label: Text("メーカー")) {
                        ForEach(makers, id: \.self) { (maker: Maker) in
                            Text(maker.makerName!)
                        }
                    }
                    TextField("モデル名", text: $modelName)
                }
                Section (header: Text("任意")){
                    TextField("種別", text: $equipmentType)
                    TextField("MACアドレス", text: $macAddress)
                    TextField("ホスト名", text: $hostName)
                   
                    Picker(selection: $userSelected,
                           label: Text("使用者")) {
                        ForEach(users, id: \.self) { (user: User) in
                            Text("\(user.firstName!)" + "\(user.lastName!)")
                        }
                    }
                    TextField("用途", text: $usage)
                    TextField("メモ・備考", text: $note)
                    DatePicker(selection: $purchaseDate,
                               label: {Text("購入日")})
                    Picker(selection: $equipmentSelected,
                           label: Text("関連機器")) {
                        ForEach(equipments, id: \.self) { (equipment: Equipment) in
                            Text(String(equipment.managementNumber))
                        }
                    }
                    TextField("OS", text: $os)
                }
                
                Button(action: {
                    let Equipment = Equipment(context: context)
                    Equipment.managementNumber = Int16(managementNumber) ?? 0
                    Equipment.modelName = modelName
                    Equipment.equipmentType = equipmentType
                    Equipment.macAddress = macAddress
                    Equipment.hostName = hostName
                    Equipment.usage = usage
                    Equipment.note = note
                    Equipment.purchaseDate = purchaseDate
                    Equipment.category = categorySelected
                    Equipment.maker = makerSelected
                    Equipment.user = userSelected
                    Equipment.os = os
                    presentationMode.wrappedValue.dismiss()
                    self.presentationMode.wrappedValue.dismiss()
                    
                }) {
                    Text("確定")
                    
                }
//            .navigationBarTitle(categoryName)
            }.onAppear(perform: {
                if self.loadFlg == false {
                    return
                } else {
                    self.loadFlg = false
                }
                self.managementNumber = String(self.equipment.managementNumber)
                self.modelName = self.equipment.modelName!
                self.equipmentType = self.equipment.equipmentType!
                self.macAddress = self.equipment.macAddress!
                self.hostName = self.equipment.hostName!
                self.usage = self.equipment.usage!
                self.note = self.equipment.note!
                self.purchaseDate = self.equipment.purchaseDate!
                self.categorySelected = self.equipment.category!
                self.makerSelected = self.equipment.maker!
                self.userSelected = self.equipment.user!
                self.os = self.equipment.os!
            })
        .navigationBarTitle(Text(categorySelected.categoryName ?? ""), displayMode: .inline)
    }
}

