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
            
            Text("Major:")
                .bold()
            TextField("Enter major", text: $student.major)
                .textFieldStyle(.roundedBorder)
            
            Text("Hometown:")
                .bold()
            TextField("Enter hometown", text: $student.homeTown)
                .textFieldStyle(.roundedBorder)
            
            HStack {
                Text("Year")
                    .bold()
                
                Spacer()
                
                Picker("Select Year", selection: $student.year) {
                    ForEach(Year.allCases, id: \.self) { year in
                        Text(year.rawValue.capitalized)
                    }
                }
            }
            
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
                    studentVM.saveStudent(student: student)
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
