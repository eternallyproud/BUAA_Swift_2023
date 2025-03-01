import UIKit

var greeting = "Hello, playground"

//Function
//Definition and calling
//1
func printCapitalInfo(name:String,country:String,population:Int)->(){
    print("\(name) is the capital of \(country) and its population is \(population) million.")
}
printCapitalInfo(name: "Beijing", country: "China", population: 23)

//2
func calculateCapitalInfo(name:String,country:String,population:Int)->(String,Int){
    var info = "\(name) is the capital of \(country) and its population is \(population) million."
    print(info)
    return (info,strlen(info))
}
calculateCapitalInfo(name: "Beijing", country: "China", population: 23)

//Formal parameter
//1
func computeMultiply()->(Int){
    var ans = 1;
    for i in 1...10{
        ans *= i;
    }
    return ans;
}
print(computeMultiply());

//2
func printMultiply()->(){
    var ans = 1;
    for i in 1...10{
        ans *= i;
    }
    print(ans);
}
printMultiply();

//3
func multipliers(nums:Int...)->(Int){
    var ans = 1;
    for num in nums{
        ans *= num;
    }
    return ans;
}
print(multipliers(nums:1,2,3,4,5,6,7,8,9,10))

//4
var numbers : [Int] = [7,2,1,4,9,6];
print(numbers);
func sortArray(numbers:inout [Int])->(){
    numbers.sort();
}
sortArray(numbers: &numbers)
print(numbers);

//FunctionType
//1
var printAction : ()->() = printMultiply;
var mathOperation : (Int...)->Int = multipliers;
printAction();
mathOperation(1,2,3,4,5);

//2
func multiply(a:Int,b:Int)->(Int){
    return a*b;
}
func divide(a:Int,b:Int)->(Int){
    return a/b;
}
func printMathOperation(op:(Int, Int)->Int, a:Int, b:Int)->(){
    if (a>b){
        print(op(a,b));
    }
    else{
        print(op(b,a));
    }
}
printMathOperation(op: multiply, a: 3, b: 5);
printMathOperation(op: divide, a: 3, b: 6);

//3
func multiplyOrDivideOperation(op:String)->((Int,Int)->Int){
    if(op=="Multiply"){
        return multiply;
    }
    else{
        return divide;
    }
}
var operation : (String)->((Int,Int)->Int) = multiplyOrDivideOperation;
operation("Multiply");
printMathOperation(op: operation("Multiply"), a: 3, b: 5)

//Nested Function
func multiplyOrDivideOperationNew(op:String,num1:Int,num2:Int)->Int{
    func mul(a:Int,b:Int)->(Int){
        return a*b;
    }
    func div(a:Int,b:Int)->(Int){
        if(a>b){
            return a/b;
        }
        else{
            return b/a;
        }
    }
    if(op=="Multiply"){
        return mul(a:num1,b:num2);
    }
    else{
        return div(a:num1,b:num2);
    }
}
multiplyOrDivideOperationNew(op: "Divide", num1: 1, num2: 114514)

//Closure Expression
//1
var compareClosure = {
    (a:Int,b:Int)->Bool in
    return a>b;
}
compareClosure(8,10)
compareClosure(10,8)

//2
var Numbers : [Int] = [88,128,9,3,66,16,8];
Numbers.sorted(by:compareClosure)
Numbers.sorted(by: >)
Numbers.sorted(by:{(a:Int,b:Int)->Bool in return a>b})

//3
var computeClosure =
{
    var ans = 0;
    for i in 1...100{
        ans += i;
    }
    print(ans)
}
computeClosure();

//4
Numbers.sorted(by:){(a:Int,b:Int)->Bool in return a>b}

//Closure Applications
//1
func marathonRace(speed:Int,racer:String)->()->Int{
    var remainDistance = 421950;
    let racing =
    {
        remainDistance -= speed;
        return remainDistance;
    }
    return racing;
}
var Jack = marathonRace(speed: 280, racer: "Jack"), Tom = marathonRace(speed: 315, racer: "Tom");//important!!!
var runnerTom = 421950, runnerJack = 421950;
while(runnerTom>0&&runnerJack>0){
    runnerTom = Tom();
    runnerJack = Jack();
}
if(runnerTom>0){
    print("the winner is Jack!")
}
else{
    print("the winner is Tom!")
}

//2
var capitals : [String] = ["Beijing","Tokyo","Washington","Santiago","Rome"]
//(1)
capitals.forEach()
{
    print($0)
}
//(2)
capitals.filter()
{
    return !$0.contains("o")
}
//(3)
capitals.map()
{
    $0.lowercased()
}
//(4)
capitals.reduce("Capitals are:")
{
    return $0+" "+$1;
}
