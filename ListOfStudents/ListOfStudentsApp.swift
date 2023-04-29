//
//  ListOfStudentsApp.swift
//  ListOfStudents
//
//  Created by Eric on 29/04/2023.
//

import SwiftUI

@main
struct ListOfStudentsApp: App {
    @StateObject var studentsVM = StudentsViewModel()
    
    var body: some Scene {
        WindowGroup {
            StudentListView()
                .environmentObject(studentsVM)
        }
    }
}
