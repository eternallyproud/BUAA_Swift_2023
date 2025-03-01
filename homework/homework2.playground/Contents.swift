import UIKit

//array
var majorCom = [String]()
majorCom.append("数据结构")
majorCom.append("计算机组成")
majorCom.append("计算机网络")
var majorSel : [String]=["iOS应用开发实践","swift程序设计","人工智能"]
var liberal = [String](repeating: "音乐", count: 1)
liberal.append("美术")
liberal.append("文学")

var courses : [Array<String>] = [majorCom,majorSel,liberal]
var Courses = majorCom + majorSel + liberal

Courses[0] = "离散数学"
Courses.insert("移动应用开发与实践", at: 3)
Courses.remove(at:8)

for (index,course) in Courses.enumerated() {
    print(index,course)
}

var arraySlice = Courses[3...6]
var partOfCourses = Array(arraySlice)
print(arraySlice)
print(partOfCourses)
arraySlice.remove(at: 3)
print(arraySlice)
print(partOfCourses)

partOfCourses.swapAt(0,3)
print(partOfCourses)

partOfCourses.sort()
print(partOfCourses)

if partOfCourses.contains("swift程序设计"){
    print("we have swift程序设计")
}
else {
    print("we don't have swift程序设计")
}
if partOfCourses.contains("Swift Programming"){
    print("we have Swift Programming")
}
else {
    print("we don't have Swift Programming")
}

//Set
var gradeOfTheory = Set<String>()
if gradeOfTheory.isEmpty {
    print("empty")
    gradeOfTheory = ["Fail","Pass","Good","Excellent"]
}
else {
    print("not empty")
}

var gradeOfExperiment = gradeOfTheory
gradeOfExperiment.remove("Common")
gradeOfExperiment.remove("Good")
gradeOfExperiment.remove("Excellent")
if gradeOfExperiment.contains("Fail")&&gradeOfExperiment.contains("Pass") {
    print("Yes")
}
else {
    print("No")
}

for member in gradeOfTheory {
    print(member)
}
for member in gradeOfExperiment {
    print(member)
}

gradeOfTheory.sorted()
gradeOfExperiment.sorted()
print(gradeOfTheory)
print(gradeOfExperiment)
print(gradeOfTheory.intersection(gradeOfExperiment))
print(gradeOfTheory.union(gradeOfExperiment))
print(gradeOfTheory.subtracting(gradeOfExperiment))//有返回值 Set更像是形参
gradeOfTheory.subtract(gradeOfExperiment)//直接作用在调用它的Set上 无返回值
print(gradeOfTheory)

//dictionary
var house = Dictionary<Int,String>()
house = [1:"computer",2:"software",3:"automation",4:"artificial",5:"economic",6:"mathematics"]
house[3] = "revisedSchool"
house.updateValue("updateschool", forKey: 4)

house[7] = "Mechanism"
house.updateValue("Management", forKey: 8)

for (key,value) in house {
    print(key,value)
}

let arrayKey = Array(house.keys)
let arrayValue = Array(house.values)
for key in arrayKey {
    print(key)
}
for value in arrayValue {
    print(value)
}

//flow
var sum = 0
for i in 1...100 {
    sum += i;
}
print(sum)
var i = 0;
sum = 0
while i<=100 {
    sum += i;
    i += 1
}
print(sum)
i = 0;sum = 0;
repeat {
    sum += i;
    i += 1
}while i<=100
print(sum)

var score = 79
if score >= 90 {
    print("Excellent")
}
else if score >= 80 {
    print("Good")
}
else if score >= 70 {
    print("Common")
}
else if score >= 60 {
    print("Pass")
}
else {
    print("Fail")
}

var grade:String
switch score {
case 0...59 : grade = "Fail"
case 60...69 : grade = "Pass"
case 70...79 : grade = "Common"
case 80...89 : grade = "Good"
case 90...100 :grade = "Excellent"
default:
    grade = "not a score"
}

var subject = "Math"
grade = "Excellent"
var subjectInfo = (grade,subject)
switch subjectInfo {
case ("Pass",_) : print("Pass")
case ("Fail",_) : print("Fail")
case ("Excellent","Math") : print("Math gets Excellent")
case ("Excellent","Physics") : print("Physics gets Excellent")
default : print("nope")
}




