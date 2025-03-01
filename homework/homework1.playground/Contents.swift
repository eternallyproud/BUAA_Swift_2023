import UIKit

var greeting = "Hello, playground"

//元组型
let studentInfo = (studentNumber:22371448,studentName:"马亦翚",politicalStatus:"共青团员")
let (num,name,status) = studentInfo


print(studentInfo.studentNumber)
print(studentInfo.1)
print(status)
print("- - - - -")

//可选型
var myHobby,hisHobby: String?
myHobby = "swimming"
hisHobby = nil

var parseStringToInt = Int("10")
parseStringToInt = Int("Picasso")//Int?

var Name = "Tommy"
var hobby: String?
print(Name)
if hobby != nil {
    print(hobby!)
}
else {
    print("nil")
}

var membership: String?
membership = "IEEE senior member"
if let membership = membership {
    print("someone is a \(membership)")//let String is the one printed
}
else{
    print("error!")
}

hobby = "soccer"
if let membership = membership, let hobby = hobby//逗号相当于 且
{
    print("Tommy's hobby is \(hobby), and he is a(an) \(membership)")
}
else
{
    print("We don't know much about Tommy")
}

var getHobby,getMembership: String
getHobby = hobby ?? "No Hobby"
getMembership = membership ?? "No membership"
print(getHobby)
print(getMembership)
hobby = nil
membership = nil
getHobby = hobby ?? "No Hobby"
getMembership = membership ?? "No membership"
print(getHobby)
print(getMembership)

//字符和字符串
var schoolName,houseName: String
schoolName = ""
houseName = String()

if houseName.isEmpty{
    print("empty")
}
else{
    print(houseName)
}
schoolName = "buaa"
if schoolName.isEmpty{
    print("void")
}
else{
    print(schoolName)
}

var MyUniversity = schoolName
print("MyUniversity is \(MyUniversity), and schoolName is \(schoolName)")
MyUniversity = "Tsinghua University"
print("MyUniversity is \(MyUniversity), and schoolName is \(schoolName)")

//字符串操作
var countFor = 0
var myHobbies = "swimming programming eating"
for ch in myHobbies {
    print(ch)
    countFor += 1
}

let countCh = myHobbies.count
print(countCh)

var str1 = String("My hobbies")
var str2 = "are"
var space = " "
let info = str1 + space + str2 + space + myHobbies
print(info)

print("upper : \(info.uppercased())")
print("lower : \(info.lowercased())")

let first = info.startIndex
let last = info.index(before: info.endIndex)
print("the first character is \(info[first]), and the last character is \(info[last])")
var secondHobby = info.index(info.startIndex, offsetBy: 24)
print(info[secondHobby])
secondHobby = info.index(info.endIndex, offsetBy: -18)
print(info[secondHobby])

let space0 = info.index(info.startIndex, offsetBy: 14)
let space1 = info.index(info.startIndex, offsetBy: 23)
let space2 = info.index(info.startIndex, offsetBy: 35)
var hobby1 = info.substring(with: info.index(after:space0) ..< space1)
var hobby2 = info.substring(with: info.index(after:space1) ..< space2)
var hobby3 = info.substring(with: info.index(after:space2) ..< info.endIndex)
print("three hobbies: \(hobby1), \(hobby2), \(hobby3)")

if hobby1 == hobby2 {
    print("they are the same!")
}
else {
    print("they are different")
}
if hobby1.hasPrefix("swim") {
    print("swim")
}
if hobby2.hasSuffix("ing") {
    print("doing")
}
