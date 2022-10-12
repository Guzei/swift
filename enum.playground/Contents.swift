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

