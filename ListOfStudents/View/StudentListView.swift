//
//  StudentListView.swift
//  ListOfStudents
//
//  Created by Eric on 29/04/2023.
//

import SwiftUI

struct StudentListView: View {
    @EnvironmentObject var studentsVM: StudentsViewModel
    @State private var sheetIsPresented = false
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(studentsVM.studentArray) { student in
                    NavigationLink {
                        DetailView(student: student)
                    } label: {
                        HStack {
                            Image(systemName: "swift")
                                .foregroundColor(.orange)
                            Text(student.name)
                        }
                    }
                }
                .onDelete(perform: studentsVM.deleteStudent)
                .onMove(perform: studentsVM.moveStudent)
            }
            .font(.title2)
            .listStyle(.plain)
            .navigationTitle("Swifters!")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    EditButton()
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        sheetIsPresented.toggle()
                    } label: {
                        Image(systemName: "plus")
                    }
                }
            }
            .sheet(isPresented: $sheetIsPresented) {
                NavigationStack {
                    DetailView(student: Student())
                }
            }
        }
    }
}

struct StudentListView_Previews: PreviewProvider {
    static var previews: some View {
        StudentListView()
            .environmentObject(StudentsViewModel())
    }
}
