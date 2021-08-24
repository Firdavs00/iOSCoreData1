//
//  StudentCell.swift
//  iOSCoreData1
//
//  Created by MacBook Pro on 24/08/21.
//

import SwiftUI

struct StudentCell: View {
    @Environment(\.managedObjectContext) var moc
    var stud: Student
    var body: some View {
        
            VStack(alignment: .leading, spacing: 10){
                HStack{
                    Text(stud.firstName!).fontWeight(.bold)
                    Text(stud.lastName!).fontWeight(.bold)
                    Spacer()
                    Text(stud.gender!).foregroundColor(.red)
                        Button(action: {
                            moc.delete(stud)
                        }, label: {
                            Image("trash")
                        })
                }
                HStack(spacing:10){
                    Text(stud.phoneNum!)
                    Text("|")
                    Text(stud.email!)
                }
                Text(stud.address!)
            }
            
        
    }
}

struct StudentCell_Previews: PreviewProvider {
    static var previews: some View {
        StudentCell(stud: Student())
    }
}
