//
// MARK: - inheritanse - наследование
//
// https://docs.swift.org/swift-book/LanguageGuide/Inheritance.html
// https://swiftbook.ru/content/languageguide/inheritance/
// https://youtu.be/1D-DFsNS1tY - MadiSpace - 22 дек. 2021 г. - чуть больше минимума
// https://youtu.be/70wPY4QbSzY - Ian Solomein - 17 июл. 2020 г. - необходимый минимум
// https://youtu.be/rC8IRPsgPa4 - justaSid - минимум
// https://youtu.be/ldWWugGV1fg28 - The Swift Developers (Evgeny Zverik) - 28 февр. 2017 г. - интерфейс устраревает, но суть остаётся
// https://youtu.be/PWDx6z0wnoY - Alex Skutarenko - 17 мар. 2015 г.


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
final class SubClass4: BaseClass4{override func foo(){super.foo()};func foo5(){}}
// class ErrClass: SubClass4{} // Inheritance from a final class ...

// https://swiftbook.ru/content/languageguide/initialization/
// designated // назначенный // обязательный
// convenience // удобство, преимущество // необязательный
// инициализаторы обязательно должны ссылаться друг на друга вплодь до верхнего класса
class BaseClass5 {
    var a:Int
    init(a:Int){
        self.a = a
    }
}

class SubClass5: BaseClass5 {
    override init(a:Int) {
        super.init(a:a)
    }
    convenience init(_ bb: Int, _ cc: Int) {
        self.init(a: bb * cc)
    }
}
var a: SubClass5
a = SubClass5(a: 2) // designated.init
a.a // 2
a = SubClass5(3, 5) // convenience.init
a.a // 15

class SubClass51: BaseClass5 {
    var b:Int
    init(a:Int,b:Int) {
        self.b = b
        super.init(a:a)
    }
    convenience init(_ bb: Int, _ cc: Int, _ dd: Int) {
        self.init(a: bb * cc, b: dd)
    }
}
var b: SubClass51
b = SubClass51(a: 2, b: 3) // designated.init
b.a // 2
b.b // 3
b = SubClass51(3, 5, 2) // convenience.init
b.a // 15
b.b // 2

