//
//  StudentsViewModel.swift
//  ListOfStudents
//
//  Created by Eric on 29/04/2023.
//

import Foundation

class StudentsViewModel: ObservableObject {
    @Published var studentArray: [Student] = []
    
    init() {
        loadData()
    }
    
    func saveStudent(student: Student) {
        if student.id == nil {
            var newStudent = student
            newStudent.id = UUID().uuidString
            studentArray.append(newStudent)
        } else {
            if let index = studentArray.firstIndex(where: { $0.id == student.id }) {
                studentArray[index] = student
            }
        }
        saveData()
    }
    
    func deleteStudent(indexSet: IndexSet) {
        studentArray.remove(atOffsets: indexSet)
        saveData()
    }
    
    func moveStudent(fromOffsets: IndexSet, toOffset: Int) {
        studentArray.move(fromOffsets: fromOffsets, toOffset: toOffset)
        saveData()
    }
    
    //MARK: - DOCUMENTS DIRECTORY
    
    let path = URL.documentsDirectory.appending(component: "studentArray")
    
    func saveData() {
        let data = try? JSONEncoder().encode(studentArray)
        do {
            try data?.write(to: path)
        } catch {
            print("😡 ERROR: Could not save data \(error.localizedDescription)")
        }
    }
    
    func loadData() {
        guard let data = try? Data(contentsOf: path) else { return }
        do {
            studentArray = try JSONDecoder().decode([Student].self, from: data)
        } catch {
            print("😡 ERROR: Could not load data \(error.localizedDescription)")
        }
    }
}
