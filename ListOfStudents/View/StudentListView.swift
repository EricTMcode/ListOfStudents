//
//  StudentListView.swift
//  ListOfStudents
//
//  Created by Eric on 29/04/2023.
//

import SwiftUI

struct StudentListView: View {
    @EnvironmentObject var studentsVM: StudentsViewModel
    
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
            }
            .font(.title2)
            .listStyle(.plain)
            .navigationTitle("Swifters!")
        }
    }
}

struct StudentListView_Previews: PreviewProvider {
    static var previews: some View {
        StudentListView()
            .environmentObject(StudentsViewModel())
    }
}
