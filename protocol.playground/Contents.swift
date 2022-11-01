//
// MARK: - PROTOCOL -
//
// https://swiftbook.ru/content/languageguide/protocols/
// https://docs.swift.org/swift-book/LanguageGuide/Protocols.html
// https://developer.apple.com/documentation/swift/using-delegates-to-customize-object-behavior

// https://youtu.be/ArVRGkaqkFA ~ 2022-02-xx - MadiSpace - 49 min - и про Delegate Protocol Pattern.
// https://youtu.be/bDPJ4CiCDtM ~ 2020-xx-xx - Ian Solomein - коротко и ясно
// https://youtu.be/1-5SXsVd1zY ~ 2021-xx-xx - EN - Paul Hudson - прекрасная артикуляция. Полезно и по сути и по звучанию терминов.
// https://youtu.be/nLiU7UPMU0A - 2017-xx-xx - Евгений Зверик - о сапих протоколах. Скромно
// https://youtu.be/26QIPz9Wru0 - 2017-xx-xx - Евгений Зверик - о делегатах
// https://youtu.be/GeG8OxmRNxo ~ 2021-10-xx - iCodeSchool - минимум
// https://youtu.be/REra9weATdM ~ 2019-xx-xx - SwiftBook.ru - Protocols With Associated Types vs Generics
// https://youtu.be/71AS4rMrAVk ~ 2017-xx-xx - Александр Зимин (Alexander Zimin) - Protocol-Oriented Programming - доклад (есть критика классов: Implicit data sharing; Перегруженность)

//
//                 A protocol defines a blueprint of methods, properties, and other requirements that    suit          a particular task                 or  piece of functionality.
// Swiftbook.ru:   Протокол определяет образец       методов, свойств     или другие требования, которые соответствуют определенному конкретному заданию или какой-то функциональности.
// Apple & Google: Протокол определяет план          методов, свойств     и   других требований, которые подходят      для конкретной задачи             или части функциональности.
// Netology:       Protocol – абстрактный набор методов и свойств, задающий поведение для широкого круга типов.
/*
 ● Именование с большой буквы.
 ● Желательно, чтобы название протокола выражало описание требований, для этого следует использовать 'ing', 'able' (Equatable, Equating).
 ● В крайнем случае подставляем в качестве суффикса 'Protocol' ('NSObjectProtocol').
*/

protocol P1{}
protocol P2{}
protocol P11:P1,P2{}
struct S1:P1{}
struct S2:P1,P2{}
class C{}
class C1:C{}
class C11:C1,P1,P2{} // Superclass is first

protocol     P3 {var a:Int{get}}
//struct S3 :P3{} // Type 'S3' does not conform to protocol 'P3'
  struct S31:P3{var a:Int}
  struct S32:P3{var a:Int; var b:Int}
//class  C3 :P3{} // Type 'C3' does not conform to protocol 'P3'
//class  C3 :P3{var a:Int} // Class 'C3' has no initializers
  class  C31:P3{var a:Int=0}
  class  C32:P3{var a:Int; init(a:Int){self.a=a}}
// C31.a // Instance member 'a' cannot be used on type 'C31'; did you mean to use a value of this type instead?

protocol P3_{static var a:Int{get}}
class C3_: P3_{static var a=1}
C3_.a // 1 // static позволяет вшить в тип что-то

protocol P4{func foo()}
struct S4:P4{func foo(){}}
struct S41:P4{func foo(){};func foo1(){}}

protocol P51{var a:Int{get}}
protocol P52{var a:Int{get}}
struct S5:P51,P52{var a:Int} // таже композиция протоколов

protocol P6{
    associatedtype MyType
    func foo(a:MyType)->Int
}
struct S61:P6{
    typealias MyType = Int
    func foo(a: MyType) -> Int {return a * 2}
}
struct S62:P6{
    typealias MyType = Double
    func foo(a: MyType) -> Int {return Int(a * 3)}
}

protocol P71 {var a:Int {get} }
protocol P72 {var b:Int {get} }
func foo(a: P71 & P72) {} // входящая переменная подписана под два протокола сразу
struct S7: P71, P72 {var a:Int; var b:Int} // структура под два протокола
var v7 = S7(a:1, b:2) // переменная под два протокола
foo(a: v7) // работает!

protocol P8 {
    associatedtype V: Equatable
    var v: V {get set}
}
extension P8 {
    func isEqualTo(other: Self) -> Bool {
        return v == other.v
    }
}
struct S81: P8 {var v:Int}
var v811 = S81(v: 1)
var v812 = S81(v: 2)
var v813 = S81(v: 2)
v811.isEqualTo(other: v812) // false
v813.isEqualTo(other: v812) // true

struct S82: P8 {var v:Character}
var v821 = S82(v: "a")
var v822 = S82(v: "b")
var v823 = S82(v: "b")
v821.isEqualTo(other: v822) // false
v823.isEqualTo(other: v822) // true

  protocol    P9 {         init(a: Int)    }
  struct S9 : P9 {         init(a: Int) {} }
//class  C91: P9 {         init(a: Int) {} } // Initializer requirement 'init(a:)' can only be satisfied by a 'required' initializer in non-final class 'C91'
  class  C92: P9 {required init(a: Int) {} }

// TODO: добавить что-то изменяемое, чтобы классу потребовалась мутация
protocol    P101 {          func f()    }
protocol    P102 { mutating func f()    }
class  C101:P101 {          func f() {} }
class  C102:P102 {          func f() {} }
struct S101:P101 {          func f() {} }
struct S102:P102 {          func f() {} }

// TODO: Вам не нужно обозначать реализацию инициализаторов протокола модификатором required в классах, где стоит модификатор final, потому что конечные классы не могут иметь подклассы.
// P11

protocol         P12 { init()    }
class       C12      { init() {} }
class C12_: C12, P12 { required override init() {} }

  protocol    P13: AnyObject {}
//struct S13: P13 {} // Non-class type 'S13' cannot conform to class protocol 'P13'
  class  C13: P13 {}
var v13 = C13()
v13 is P13 // true
var b = v13 as P13
//b = v13 as? P13
//b = v13 as! P13

// TODO: Protocol extension - P8?

// MARK: - Delegate
protocol     PDelegate {func foo14()                  } // 1.  шаблон уменяия делать foo14()
struct S141: PDelegate {func foo14() {print("foo141")}} // 2a. Делегат. Умеет делать foo14 по протоколу
struct S142: PDelegate {func foo14() {print("foo142")}} // 2b. Делегат. Умеет делать foo14 по протоколу
class C14 {var v:PDelegate?}                            // 3. выбереает делегата

var s14: S141
s14 = S141()
s14.foo14()         // работает и автономно
var c14 = C14()     //  этот класс хочет передавать работу тому или иному делегату
c14.v               // nil  // сразу после создания делегат не назначен
c14.v?.foo14()      // nil  // и просить что-то сделать бесполезно
c14.v = s14         // присвоили умельца
c14.v               // проверяем. Есть.
c14.v?.foo14()      // c14 делегирует выполение работы foo14() делегату S141
c14.v = S142()      // присвоили другого умельца
c14.v?.foo14()      // c14 делегирует выполение работы foo14() делегату S142
