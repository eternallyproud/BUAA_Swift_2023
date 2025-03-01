import Foundation
class Properties{
    var poison = 0
    var poisoned = false
    var antidote = 0
    var protected = 0
    var voted = false
    init(character : String) {
        if(character == "女巫"){
            poison = 1
            antidote = 1
        }
    }
}
