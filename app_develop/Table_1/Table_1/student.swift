//
//  student.swift
//  Table_1
//
//  Created by 🐴的 on 2023/11/2.
//

import UIKit

class Student : NSObject{
    var name : String
    var score : Int
    var id : Int
    
    init(name : String, score : Int, id : Int){
        self.name = name
        self.score = score
        self.id = id
        super.init()
    }
}
