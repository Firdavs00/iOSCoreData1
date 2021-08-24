//
//  ContentView.swift
//  iOSCoreData1
//
//  Created by MacBook Pro on 24/08/21.
//

import SwiftUI

struct ContentView: View {
    @FetchRequest(entity: Student.entity(), sortDescriptors: []) var studs: FetchedResults<Student>
    @State var isModel: Bool = false
    var body: some View {
        NavigationView{
            List{
                ForEach(studs, id: \.id){ stud in
                    StudentCell(stud: stud)
                }
            }
            .navigationBarTitle("Student List", displayMode: .inline)
            .navigationBarItems(trailing:
                                    Button(action: {
                                        self.isModel = true
                                    }, label: {
                                        Text("Add")
                                    }).sheet(isPresented: $isModel, content: {
                                        Details()
                                    })
            )
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
