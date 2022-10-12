//  -- CRIB for Enum -- //

/*
 https://docs.swift.org/swift-book/LanguageGuide/Enumerations.html
 https://swiftbook.ru/content/languageguide/enumerations/
 https://www.raywenderlich.com/7320-getting-to-know-enum-struct-and-class-types-in-swift#toc-anchor-009

 https://www.youtube.com/watch?v=
    HwIpixzeRAQ // MadiSpace / good
    9Sr3GaC0dmY // SwiftBook.ru / Associated Values / good
    GcwRnyCMLXU // super easy dev / несистемно, но полезно
    0ZU_8cXQkj8 // Ian Solomein / Чуть больше, чем поверхностно
    pBMIMD3xXIY // Swift Lab / Associated Values / поверхностно
    qMpR7HbDWdk // iCode School / поверхностно
*/

enum A {
    case a
    case b
}
A.self                 // __lldb_expr_xxx.A.Type
A.Type.self            // __lldb_expr_xxx.A.Type.Type
var v: A
v = .a                  // a
//v = .c                // error: type 'A' has no member 'red'
v                       // a
v.self                  // a
v.hashValue             // -4474799016961292877
//v.rawValue            // error: value of type 'A' has no member 'rawValue'

enum AS: String { case a = "a a", b = "b b", c = "c c" }
var vs = AS.a
    vs.rawValue                     // "a a"
    vs = .b                         // b
    vs.rawValue                     // "b b"

enum AC: Character { case tab = "\t", lineFeed = "\n", carriageReturn = "\r" }
var vc = AC.tab                     // tab
    vc.rawValue                     // "    "

enum AI1: Int { case a, b, c }
var vi1 = AI1.b                     // b
    vi1.rawValue                    // 1

enum AI2: Int { case a=2, b, c }
var v21 = AI2.b                     // b
    v21.rawValue                    // 3
//  v21 = AI2(rawValue: 3)          // Value of optional type 'AI2?' must be unwrapped to a value of type 'AI2'
    v21 = AI2(rawValue: 3)!         // b
//  v21 = AI2(rawValue: 9)!         // Fatal error: Unexpectedly found nil while unwrapping an Optional value
    v21 = AI2(rawValue: 3) ?? .a    // b
// Implicitly Assigned Raw Values
var v22 = AI2(rawValue: 2)          // a
    v22 = AI2(rawValue: 9)          // nil
    v22 = .b                        // c
switch(v22) {
case .a: print(v22!)                // a
case .b: print(v22!.rawValue)       // 3
default: print("OK")
}
for positionToFind in 1...5 {
    print("\(positionToFind):", terminator: " ")
    if let c = AI2(rawValue: positionToFind) {
        switch c {
        case .a: print("A")         // for 2
        case .b: print("B")         // for 3
        default: print("Default")   // for 4
        }
    } else {
        print("There isn't one at position \(positionToFind)")      // for 1 and 5
    }
}

enum ACI: String, CaseIterable { case a, b, c }
ACI.allCases.count                  // 3
for v in ACI.allCases { print(v) }  // a, b, c


enum AA {
    case a(a: AS)                   // enum AS: String { case a = "a a", b = "b b", c = "c c" }
    case b(a: Int, b: Int, c: Int)
}

extension AA {
    init(d: Int) {
        self = .b(a: d, b: d*2, c: d*3) // b(a: 1, b: 1, c: 1)
    }
}

extension AA {
    var v: String {
        switch self {
        case .a(let a):           return a.rawValue
        case .b(let a, let b, _): return String("\(a), \(b)")
        }
    }
}

let aa1 = AA.a(a: .a)               // a(a: __lldb_expr_87.AS.a)
let aa2 = AA.a(a: .b)               // a(a: __lldb_expr_114.AS.b)
let aa3 = AA.b(a: 9, b: 8, c: 7)    // b(a: 9, b: 8, c: 7)
let aa4 = AA(d: 1)                  // b(a: 1, b: 2, c: 3)
aa1.v                               // "a a"
aa2.v                               // "b b"
aa3.v                               // 9, 8, 7
aa4.v                               // "1, 2"

// Recursive Enumerations
enum a {
    case number(Int)
    indirect case addition(a, a)
    indirect case multiplication(a, a)
}
// or
indirect enum b {
    case number(Int)
    case addition(b, b)
    case multiplication(b, b)
}
// (5 + 4) * 2
var result = b.multiplication(b.addition(b.number(5), b.number(4)), b.number(2))
func evaluate(_ expression: b) -> Int {
    switch expression {
    case let .number(value):               return value
    case let .addition(left, right):       return evaluate(left) + evaluate(right)
    case let .multiplication(left, right): return evaluate(left) * evaluate(right)
    }
}
print(evaluate(result))            // 18

enum ColorName6: Int {
    case black, silver, red
    var label: String {
        switch self {
        case .black:  return "Black color"
        case .silver: return "Silver color"
        case .red:    return "Red color"
        }
    }
    var int: Int { return 5 }
    enum E{case a,b}
    init?(_ value: String) {
        switch value {
        case "Black color": self = .black
        case "Silver color": self = .silver
        case "Red color":  self = .red
        default: return nil
        }
    }
    func printLabel() {
        print( self.label )
    }
}
let color61 = ColorName6("Silver color")
let color62 = ColorName6("Silver")
color61!.printLabel()

