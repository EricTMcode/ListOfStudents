//
//  StudentListView.swift
//  ListOfStudents
//
//  Created by Eric on 29/04/2023.
//

import SwiftUI

struct StudentListView: View {
    let students = ["Holt B.",
                    "Luke B.",
                    "Michael B.",
                    "Milan C.",
                    "Russell C.",
                    "Gabriela C.",
                    "Kevin C.",
                    "Charles C.",
                    "Matthew C.",
                    "Gleidson D.",
                    "Jack D.",
                    "John G.",
                    "Matthew Gr.",
                    "Matthew Gu.",
                    "William H.",
                    "Shane J.",
                    "Connor J.",
                    "Andy J.",
                    "Christopher K.",
                    "Dylan K.",
                    "Riya K.",
                    "Aakash K.",
                    "Benjamin L.",
                    "Dilan L.",
                    "Anthony M.",
                    "Tyler M.",
                    "Annie M.",
                    "Avery M.",
                    "Emily M.",
                    "Addison M.",
                    "Dylan M.",
                    "Owen O.",
                    "Zachary P.",
                    "Gabriella P.",
                    "William P.",
                    "Caitlin P.",
                    "Syed R.",
                    "William R.",
                    "Lauren S.",
                    "George S.",
                    "Astrid S.",
                    "Thomas S.",
                    "Hailey S.",
                    "Jasmine T.",
                    "Michael V.",
                    "Jonathan W.",
                    "Theodore W.",
                    "Andrew Y."
    ]
    
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
