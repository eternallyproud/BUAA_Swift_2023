//
//  studentInfo.swift
//  Table_1
//
//  Created by 🐴的 on 2023/11/2.
//

import UIKit

class StudentInfo{
    var students = [Student]()
    
    init() {
        let studentA = Student(name: "Harry", score: 120, id: 2237001)
        let studentB = Student(name: "Ron", score: 137, id: 2237002)
        let studentC = Student(name: "Dean", score: 108, id: 2237003)
        students.append(studentA)
        students.append(studentB)
        students.append(studentC)
    }
    func add() -> Student {
        let student = Student(name: "Tom", score: 233, id: 22371000)
        students.append(student)
        return student
    }
    func delet(student : Student) {
        if let index = students.firstIndex(of: student){
            students.remove(at: index)
        }
    }
    func transe(from : Int, to : Int) {
        let student = students[from]
        students.remove(at:from)
        students.insert(student, at: to)
    }
}
