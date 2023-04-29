//
//  DetailView.swift
//  ListOfStudents
//
//  Created by Eric on 29/04/2023.
//

import SwiftUI

struct DetailView: View {
    @EnvironmentObject var studentVM: StudentsViewModel
    @Environment(\.dismiss) var dismiss
    @State var student: Student
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Developer's Name:")
                .bold()
            TextField("Enter student name", text: $student.name)
                .textFieldStyle(.roundedBorder)
            
            Spacer()
        }
        .padding()
        .font(.title)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button("Cancel") {
                    dismiss()
                }
            }
            ToolbarItem(placement: .navigationBarTrailing) {
                Button("Save") {
                    dismiss()
                }
            }
        }
        .navigationBarBackButtonHidden()
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            DetailView(student: Student(name: "Eric TM Code."))
                .environmentObject(StudentsViewModel())
        }
    }
}
