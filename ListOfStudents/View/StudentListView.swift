//
//  StudentListView.swift
//  ListOfStudents
//
//  Created by Eric on 29/04/2023.
//

import SwiftUI

struct StudentListView: View {
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(students, id: \.self) { student in
                    NavigationLink {
                        DetailView(studentName: student)
                    } label: {
                        HStack {
                            Image(systemName: "swift")
                                .foregroundColor(.orange)
                            Text(student)
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
    }
}
