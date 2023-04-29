//
//  Student.swift
//  ListOfStudents
//
//  Created by Eric on 29/04/2023.
//

import Foundation

enum Year: CaseIterable, Codable {
    case freshman, sophomore, junior, senior
}

struct Student: Codable {
    var name = ""
    var major = ""
    var homeTown = ""
    var year: Year = .freshman
}
