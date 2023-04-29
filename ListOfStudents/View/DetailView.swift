//
//  DetailView.swift
//  ListOfStudents
//
//  Created by Eric on 29/04/2023.
//

import SwiftUI

struct DetailView: View {
    @State var studentName: String
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Developer's Name:")
                .bold()
            TextField("Enter student name", text: $studentName)
                .textFieldStyle(.roundedBorder)
            
            Spacer()
        }
        .padding()
        .font(.title)
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(studentName: "Eric TM Code.")
    }
}
