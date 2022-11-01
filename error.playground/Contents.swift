struct S1: Error {}
struct S2: Error {let a:Int; let b:Int}

enum E1: Error {
    case a
    case b (p: Int)
}

struct S3: Error {let e:E1}
struct S4: Error {let a:Int; let e:E1}

var n = 0
switch n {
case 1: throw S1()
case 2: throw E1.a
case 3: throw E1.b(p: 2)
case 4: throw S2(a: 1, b: 2)
case 5: throw S3(e: .a)
case 6: throw S3(e: .b(p: 3))
case 7: throw S4(a: 1, e: .b(p: 4))
default:
    print("такого n \(n) нет")
}


//var v1 = try S1()

func f1(){}
func f2() throws {}
func f3()        -> String {return "a"}
func f4() throws -> String {return "a"}


// MARK: - -

enum   E5: Error { case a; case b(i: Int); case c }
struct S5        { var a:Int; var b:Int }
class  C5 {
    var n1 = 0
    var n2 = 0
    var inventory = [
        "a1": S5(a: 12, b:  7),
        "a2": S5(a: 10, b:  4),
        "a3": S5(a:  7, b: 11)
    ]

    func vend(_ name: String) throws {
        guard let item = inventory[name]    else { throw E5.a}
        guard     item.a <= n1              else { throw E5.b(i: item.a - n)}
        guard     item.b >  n2              else { throw E5.c}

        print("Проверки пройдены для: \(name)")
    }
}

var c5   = C5()
var item = String()
func     f5(_ p: C5) throws { try p.vend(item) }

item = "aa"
c5.n1 =  8
c5.n2 = 18
do { try f5(     c5) }
catch E5.a        { print("Ошибка выбора.") }
catch E5.b(let i) { print("Недостаточно средств. Пожалуйста вставьте еще \(i) монетки.") }
catch E5.c        { print("Нет в наличии.") }
catch             { print("Неожиданная ошибка: \(error).") }

item = "a3"
c5.n1 = 11
c5.n2 = 22
do { try f5(     c5) }
catch E5.a        { print("Ошибка выбора.") }
catch E5.b(let i) { print("Недостаточно средств. Пожалуйста вставьте еще \(i) монетки.") }
catch E5.c        { print("Нет в наличии.") }
catch             { print("Неожиданная ошибка: \(error).") }

c5.n2 = 1
do { try f5(     c5) }
catch E5.a        { print("Ошибка выбора.") }
catch E5.b(let i) { print("Недостаточно средств. Пожалуйста вставьте еще \(i) монетки.") }
catch E5.c        { print("Нет в наличии.") }
catch             { print("Неожиданная ошибка: \(error).") }


func nourish(with item: String) throws {
    do {
        try c5.vend(item)
    } catch is E5 {
        print("Некорректный вывод, нет в наличии или недостаточно денег.")
    }
}

do {
    try nourish(with: "Beet-Flavored Chips")
} catch {
    print("Unexpected non-vending-machine-related error: \(error)")
}
//func someThrowingFunction() throws -> Int {
//    // ...
//}

//let x = try? someThrowingFunction()
//
//let y: Int?
//do {
//    y = try someThrowingFunction()
//} catch {
//    y = nil
//}
//func fetchData() -> Data? {
//    if let data = try? fetchDataFromDisk() { return data }
//    if let data = try? fetchDataFromServer() { return data }
//    return nil
//}

// MARK: - Запрет на передачу ошибок
//func processFile(filename: String) throws {
//    if exists(filename) {
//        let file = open(filename)
//        defer {
//            close(file)
//        }
//        while let line = try file.readline() {
//            // работаем с файлом.
//        }
//        // close(file) вызывается здесь, в конце зоны видимости.
//    }
//}
