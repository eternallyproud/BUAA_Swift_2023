import Foundation
struct Questions{
    var questionNum : Int
    var questions : [Question]
    mutating func SetUp(_ questionKind : String){
        switch(questionKind){
        case "预言家":
            questionNum = 7
            questions = [
                Question(question: "预言家在夜晚可以：", answer: ["查看一名玩家属于好人阵营还是狼人阵营","选择一名玩家并向其投掷水晶球","偷偷睁开眼睛看哪几位玩家是狼人"],right: 1),
                Question(question: "当你作为真预言家被抗推出局时，应该怎么办？", answer: ["“还是那句话，我是狼人我就吃桌子”","生气走人","用真诚的发言和认真分析的态度感动好人回头"],right: 3),
                Question(question: "下列有关预言家的观点，哪一项是正确的？", answer: ["预言家首夜必须要查验身边的人","预言家在上警过程中最好给出自己的警徽流","预言家的警徽流应该包括自己查验过的玩家"],right: 2),
                Question(question: "当预言家验人时以下哪一种验人结果是可能发生的？", answer: ["“TA是狼人”","“TA是平民”","“TA是白狼王”"],right: 1),
                Question(question: "你首夜查验出2号位是狼人，白天2号在前置位起跳猎人，你：", answer: ["认为法官给出错误的信息，相信2号玩家的猎人身份","声明自己是预言家，查验2号玩家是狼人","编造一个假的验人信息告诉大家"],right: 2),
                Question(question: "被预言家查验为好人玩家被称作：", answer: ["金水","银水","铜水"],right: 1),
                Question(question: "关于预言家查验结果的说法，正确的是：", answer: ["在所有的板子里，预言家的查验结果一定为真","预言家可以查验出玩家是否为第三方","预言家查验暗恋者的身份一定为好人"],right: 3)
            ]
        case "猎人":
            questionNum = 5
            questions = [
                Question(question: "猎人的技能是？", answer: ["在夜间选择一名玩家进行捕猎，使其出局","选择一名玩家并用枪的手势对其比划","出局后可以对一名玩家捕猎，使其一并出局"],right: 3),
                Question(question: "猎人第二夜被女巫毒死后可以：", answer: ["发动技能","发表遗言","拍案泄愤"],right: 3),
                Question(question: "2号被查杀后跳猎人，被放逐后没有开枪，那么他大概率是？", answer: ["猎人","狼人","狼王"],right: 2),
                Question(question: "认刀认推不认毒可能指的是？", answer: ["白痴或猎人","女巫或预言家","猎人或守卫"],right: 1),
                Question(question: "首夜1、10倒牌，1号猎人带走了3号，遗言顺序是？", answer: ["1、3、10","1、10、3","3、1、10"],right: 1)
            ]
        case "守卫":
            questionNum = 6
            questions = [
                Question(question: "守卫的技能是？", answer: ["在夜间选择守护一名玩家，防止其被狼猎杀","夜间挡住一位玩家的号码牌，防止其被狼人猎杀","在夜间抱紧一名玩家，防止其害怕"],right: 1),
                Question(question: "下列关于守护技能，正确的是？", answer: ["可以两晚连续守护一名玩家","可以守住女巫的毒药","可以守住狼人自刀"],right: 3),
                Question(question: "奶穿指的是？", answer: ["一位玩家的酸奶洒衣服上了","守卫守护了被女巫解救的目标导致其死亡","女巫把毒药当解药用了"],right: 2),
                Question(question: "守卫的哪种行为不会被容忍", answer: ["第一夜空守，导致自己死亡","守护站边的预言家，但该玩家是狼人","记错守护信息"],right: 3),
                Question(question: "守卫不合理的守护策略是：", answer: ["双药女巫>解药女巫>起跳后的自己","预言家>站错边的猎人>站对边的猎人","未跳身份的自己>其他神职"],right: 3),
                Question(question: "被守卫成功守护的玩家被称作：", answer: ["金水","银水","铜水"],right: 3)
            ]
        case "白痴":
            questionNum = 5
            questions = [
                Question(question: "白痴的技能是？", answer: ["在不想发言时装白痴跳过自己的发言阶段","被放逐后翻牌，免除这次放逐效果","在捋不清逻辑的时候可以直接问法官"],right: 2),
                Question(question: "下列关于白痴，正确的是？", answer: ["技能发动一次后还可以再次发动","被放逐后狼人需要追刀才能使其死亡","技能发动后可以参与投票"],right: 2),
                Question(question: "下列哪位不属于强神？", answer: ["白痴","猎人","女巫"],right: 1),
                Question(question: "下列有关警长的说法错误的是？", answer: ["白痴作为警长被放逐后，可以不移交警徽","警长放逐投票时记1.5票","警长可以决定发言顺序"],right: 1),
                Question(question: "拿到了白痴牌，不可以：", answer: ["隐藏身份，扰乱狼人刀口","谎报身份替神/民挡刀","因为可以发动技能，所以随意发言"],right: 3)
            ]
        case "女巫":
            questionNum = 5
            questions = [
                Question(question: "女巫的技能不包括？", answer: ["给邻座吃坏掉的食物，使该玩家频繁前往卫生间","在夜间使用解药救活一名被狼人猎杀的玩家","在夜间使用毒药毒死一名玩家"],right: 1),
                Question(question: "场上剩下狼人、女巫与平民，狼人刀女巫，女巫毒狼人，游戏结果是？", answer: ["狼人胜利","好人胜利","平局"],right: 1),
                Question(question: "下列哪项规则是正确的？", answer: ["女巫每晚最多使用一瓶药","女巫在使用解药后仍然可以知道死亡信息","女巫总是可以自救"],right: 1),
                Question(question: "女巫最合理的撒毒目标是：", answer: ["你判断为悍跳女巫的1号玩家","公认悍跳预言家的2号","你判断为穿女巫身份自保的平民牌"],right: 1),
                Question(question: "被女巫救活的玩家被称作：", answer: ["金水","银水","铜水"],right: 2)
            ]
        case "骑士":
            questionNum = 5
            questions = [
                Question(question: "骑士的技能是？", answer: ["大喊“向我求救，我就会伸出援手”","白天放逐发言时，可以翻牌与一名玩家决斗","白天放逐发言时，可以翻牌随机杀死一名狼人"],right: 2),
                Question(question: "有关决斗技能，哪个说法是不正确的？", answer: ["决斗目标是狼人则决斗成功，狼人死亡","决斗目标是好人则决斗失败，骑士死亡","决斗技能发动成功后继续发言"],right: 3),
                Question(question: "下列哪项规则是不正确的？", answer: ["骑士决斗失败后从被打断的玩家开始重新发言","骑士决斗成功之后无法获知被杀死的狼人身份","骑士决斗失败直接进入黑夜"],right: 3),
                Question(question: "下列骑士的决斗优先级不合理的是", answer: ["狼美人/白狼王>普通狼人","水平很高的玩家>刚来的小白","自己站边的预言家的对跳玩家>其他玩家"],right: 2),
                Question(question: "有关骑士技能发动的时间，正确的是", answer: ["放逐发言过程中骑士可以发动技能","警长竞选环节骑士可以发动技能","放逐投票后的平票发言骑士可以发动技能"],right: 1)
            ]
        case "狼人":
            questionNum = 5
            questions = [
                Question(question: "狼人的技能是？", answer: ["在夜间各个狼人分别睁眼，猎杀一名玩家","在夜间共同猎杀一位玩家","在旁边的人闭眼的时候偷摸给ta一拳"],right: 2),
                Question(question: "负责冒充预言家的狼被称为？", answer: ["悍跳狼","金刚狼","倒钩狼"],right: 1),
                Question(question: "负责站边真预言家以换取好人信任的狼被称为？", answer: ["悍跳狼","倒钩狼","冲锋狼"],right: 2),
                Question(question: "未悍跳预言家但站边悍跳狼的狼人被称为？", answer: ["深水狼","悍跳狼","冲锋狼"],right: 3),
                Question(question: "有关狼人自爆，不正确的是：", answer: ["自爆时可以带走一名玩家","自爆后该狼人死亡，并直接进入黑夜","存在上警环节时，有单/双爆吞警徽的规则"],right: 1)
            ]
        case "白狼王":
            questionNum = 3
            questions = [
                Question(question: "白狼王的特殊技能是什么？", answer: ["每晚可以查验一位玩家的身份是平民还是神职","被女巫撒毒时，毒药会反弹给女巫","自爆时可以带走一名玩家"],right: 3),
                Question(question: "白狼王最理想的自爆目标是：", answer: ["双药女巫","无警徽预言家","守卫"],right: 1),
                Question(question: "白狼王的合理自爆策略不包括", answer: ["双药女巫≥带警徽预言家≥解药女巫>毒药女巫","抿出自爆目标身份时尽早自爆","当深水倒钩狼，自爆技能一直捏着不放"],right: 3)
            ]
        case "狼王":
            questionNum = 4
            questions = [
                Question(question: "狼王的特殊技能是什么？", answer: ["出局后可使用狼王爪技能带走一名玩家","被女巫撒毒时，毒药会反弹给女巫","自爆时可以带走一名玩家"],right: 1),
                Question(question: "狼王最理想的带人目标是：", answer: ["带警徽预言家","带毒女巫","守卫"],right: 1),
                Question(question: "狼王的合理带人策略不包括", answer: ["不抿身份，只带真预言家","不让好人抿出自己身份，防止被毒开不出技能","双药女巫≥带警徽预言家≥解药女巫>毒药女巫"],right: 1),
                Question(question: "狼王在下列哪种情况下可以发动技能？", answer: [" 自爆后","被女巫毒杀后","在夜间自刀后"],right: 3)
            ]
        case "石像鬼":
            questionNum = 4
            questions = [
                Question(question: "石像鬼的特殊技能是什么？", answer: ["可以查验一名玩家的具体身份","被预言家查验时，预言家直接死亡","自爆时可以带走一名玩家"],right: 1),
                Question(question: "石像鬼什么时候拥有狼人技能？", answer: ["第一晚","第二晚","其他狼人全部出局后"],right: 3),
                Question(question: "下列有关石像鬼的说法不正确的是：", answer: ["石像鬼与其他狼人不见面","石像鬼无法自爆","石像鬼可以重复查验一名玩家的身份"],right: 3),
                Question(question: "在有石像鬼的板子中，下列做法不正确的是：", answer: [" 石像鬼在不被好人发现的同时向队友递话","狼人在抿好人身份的同时寻找石像鬼","石像鬼不向队友做任何表示"],right: 3)
            ]
        case "隐狼":
            questionNum = 4
            questions = [
                Question(question: "隐狼的特殊技能是什么？", answer: ["在夜间可以找借口离开并藏起来","被预言家查验时，预言家直接死亡","被预言家查验始终为好人"],right: 3),
                Question(question: "隐狼什么时候拥有狼人技能？", answer: ["第一晚","第二晚","其他狼人全部出局后"],right: 3),
                Question(question: "下列有关隐狼的说法不正确的是：", answer: ["其他狼人不知道哪位玩家是隐狼","隐狼不知道哪些玩家是狼人","隐狼不可以自爆"],right: 2),
                Question(question: "最不适合隐狼的策略是：", answer: [" 替队友冲锋","悍跳预言家","当深水倒钩狼，且不给队友递话"],right: 3)
            ]
        case "狼美人":
            questionNum = 1
            questions = [
                Question(question: "狼美人的特殊技能是什么？", answer: ["在夜间可以离间两名男性角色","每晚参与行动后，可单独睁眼魅惑一名玩家","被预言家查验始终为好人"],right: 2),
                Question(question: "隐狼什么时候拥有狼人技能？", answer: ["第一晚","第二晚","其他狼人全部出局后"],right: 3),
                Question(question: "下列有关隐狼的说法不正确的是：", answer: ["其他狼人不知道哪位玩家是隐狼","隐狼不知道哪些玩家是狼人","隐狼不可以自爆"],right: 2),
                Question(question: "最不适合隐狼的策略是：", answer: [" 替队友冲锋","悍跳预言家","当深水倒钩狼，且不给队友递话"],right: 3)
            ]
        case "咒狐":
            questionNum = 4
            questions = [
                Question(question: "咒狐的技能不包括：", answer: ["无法被狼人猎杀","若狼人/好人满足胜利条件且咒狐存活，则咒狐胜利","被预言家查验后，预言家死亡"],right: 3),
                Question(question: "下列关于咒狐的说法不正确的是：", answer: ["咒狐被预言家查验后直接出局","同夜出局咒狐出局在后，与死亡顺序无关","预言家查验咒狐结果为狼人"],right: 3),
                Question(question: "咒狐被狼猎杀，女巫选择使用解药，结果不包括:", answer: ["咒狐存活","咒狐死亡","女巫解药数量-1"],right: 2),
                Question(question: "咒狐在场时通常会出现：", answer: [" 狼人阵营与好人阵营优先寻找咒狐","狼人猎杀时不考虑咒狐","预言家只寻找狼人不寻找咒狐"],right: 1)
            ]
        case "暗恋者":
            questionNum = 4
            questions = [
                Question(question: "暗恋者的技能是：", answer: ["可以暗恋场上的一名玩家并在结束后加微信","在第一夜最开始选择一名玩家成为暗恋对象","在第一夜最开始选择一名玩家暗恋自己"],right: 2),
                Question(question: "下列关于暗恋者的说法正确的是：", answer: ["暗恋者的胜利条件与被暗恋者相同","暗恋狼人时，狼人全部出局后可能取得胜利","暗恋者可以选择自己作为暗恋对象"],right: 1),
                Question(question: "下列关于暗恋者胜利条件的说法正确的是：", answer: ["暗恋狼人时，狼人屠民需要击杀暗恋者","暗恋狼人时，狼人屠民不需要击杀暗恋者","暗恋好人时，狼人屠神需要击杀暗恋者"],right: 1),
                Question(question: "下列关于暗恋者身份正确的是", answer: [" 暗恋狼人时被预言家查验为狼人","暗恋狼人时身份为狼人","暗恋者身份等同于平民"],right: 3)
            ]
        case "丘比特":
            questionNum = 4
            questions = [
                Question(question: "丘比特与其选择的恋人成为第三方的条件是：", answer: ["两个恋人分别属于狼人阵营与好人阵营","两个恋人都属于狼人阵营","两个恋人都属于好人阵营"],right: 1),
                Question(question: "下列关于丘比特选中的恋人，不正确的是", answer: ["恋人一方死亡，另一方殉情","因殉情而出局的猎人/狼王可以发动技能","丘比特胜利的条件与恋人相同"],right: 2),
                Question(question: "下列哪种情况丘比特可能获得胜利？", answer: ["丘比特属于狼人阵营：狼人全部出局","丘比特属于第三方：恋人出局","丘比特属于好人阵营：丘比特死亡"],right: 3),
                Question(question: "丘比特存在时好人的胜利条件是：", answer: [" 形成第三方：狼人出局+恋人出局","形成第三方：狼人出局+丘比特出局","未形成第三方：狼人出局+恋人出局"],right: 1)
            ]
        default: break
        }
    }
}
