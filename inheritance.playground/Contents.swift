//
// MARK: - inheritanse - наследование
//
// https://docs.swift.org/swift-book/LanguageGuide/Inheritance.html
// https://swiftbook.ru/content/languageguide/inheritance/

class   BaseClass{}
class    SubClass: BaseClass{}
class SubSubClass:  SubClass{}

// MARK: //
// NSObject (https://developer.apple.com/documentation/objectivec/nsobject)
// The root class of most Objective-C class hierarchies, from which subclasses inherit a basic interface to the runtime system and the ability to behave as Objective-C objects.

// Properties // Свойства
class BaseClass1 {var a=0}
class SubClass1: BaseClass1{var b=1} // add property
var two1 = SubClass1()
two1.a // 0
two1.b // 1

//class ErrClass: BaseClass1{override a=1} // Cannot override with a stored property 'a'
class BaseClass3 {var a:Int{return 0}}
class SubClass3: BaseClass3{override var a: Int{return super.a + 1}}

// Metods
class BaseClass4{func foo(){}}
class SubClass4: BaseClass4{override func foo(){super.foo()};func foo5(){}}

// init
// designated // назначенный // обязательный
// convenience // удобство, преимущество // необязательный
// инициализаторы обязательно должны ссылаться друг на друга вплодь до верхнего класса
class BaseClass5 {
    var a:Int
    init(a:Int){
        self.a = a
    }
}
final class SubClass5: BaseClass5 {
    override init(a:Int){
        super.init(a:a)
    }
    convenience init(b: Int, c: Int) {
        self.init(a: b * c)
    }
}
var a: SubClass5
a = SubClass5(a: 2) // override.init
a.a // 2
a = SubClass5(b: 3, c: 5) // convenience.init
a.a // 15

// class ErrClass: SubClass5{} // Inheritance from a final class 'SubClass5'
