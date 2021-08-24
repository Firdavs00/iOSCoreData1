//
//  Details.swift
//  iOSCoreData1
//
//  Created by MacBook Pro on 24/08/21.
//

import SwiftUI

struct Details: View {
    @Environment(\.presentationMode) var presenration
    
    @Environment(\.managedObjectContext) var moc
    
    @State var firstName: String = ""
    @State var lastName: String = ""
    @State var phone: String = ""
    @State var email: String = ""
    @State var address: String = ""
    @State var gender: String = ""
    let genders = ["Male", "Female"]
    
    func saveStuds(firstNmae: String, lastName: String, gender: String, phonenum: String, email: String, address:String){
        let stud = Student(context: self.moc)
        stud.id = UUID()
        stud.firstName = firstName
        stud.lastName = lastName
        stud.gender = gender
        stud.phoneNum = phonenum
        stud.email = email
        stud.address = address
        try? self.moc.save()
        
    }
    var body: some View {
        NavigationView{
            Form{
                Section{
                    TextField("Firstname", text: $firstName)
                    TextField("Lastname", text: $lastName)
                    Picker("Gender", selection: $gender){
                        ForEach(genders, id: \.self){
                            Text($0)
                        }
                    }
                }
                Section{
                    TextField("Phone", text: $phone)
                    TextField("Email", text: $email)
                    TextField("Address", text: $address)
                }
            }
            .navigationBarTitle("Add Student", displayMode: .inline)
            .navigationBarItems(trailing:
                                    Button(action: {
                                        saveStuds(firstNmae: firstName, lastName: lastName, gender: gender, phonenum: phone, email: email, address: address)
                                        presenration.wrappedValue.dismiss()
                                    }, label: {
                                        Text("Add")
                                    }))
        }
    }
}

struct Details_Previews: PreviewProvider {
    static var previews: some View {
        Details()
    }
}
