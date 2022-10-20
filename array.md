#  Collection -> Array
  [] - is Collection

## Инициализация
var aString1: [String]                  // Коллекция показывается квадратными скобками, а тип коллекции синтаксисом.
var aString2: [String] = []             // как 1, но ещё явно указав пустой массив. Избыточно. Используется, если массив не пустой.
var aString3: Array<String>             // Явно указывается тип коллекции и тип её элементов. Красиво, но длиннее 1.
var aString4: Array<String> = Array()   // Не практично. Только для коллекции вариантов.
var aString5 = [String]()               // Квадратные скобки обозначают коллекцию, синтаксис обозначает массив, а круглые скобки пустой инициализатор.
var aString6 = [String]               // Квадратные скобки обозначают коллекцию, синтаксис обозначает массив, а круглые скобки пустой инициализатор.

var aString11     = ["a","bb","c","c","d"]     // Тип автоматически
var aInt11        = [3,2,5]                    // Тип автоматически
var aInt21: [Int] = [1,2]                   
var aInt31: Array<Int> = [4,5,1]
var aInt51 = [Int]()
// var a = [Int](1,2)       // Error: No exact matches in call to initializer
// var a = [Int](5,1,2)     // Error: Missing argument label 'arrayLiteral:' in call
// var a = [Int][1,2,3]     // Error: Extra arguments at positions #2, #3 in call
// var a: Int = [1,2]       // Error: Cannot convert value of type '[Int]' to specified type 'Int'
var a6 = Array(arrayLiteral: 5,3,2) // 5,3,2


// MARK: - Доступ
//a1[0]     // error
a3[0]       // a
a4[1]       // 2
//a5[9]     // error
a3.first    // "a"
a4.last     // 2

// MARK: - Adding Elements
a4.append(5)        // добавление в конец   // [1, 2, 5]
// a4 += 6          // Cannot convert value of type 'Int' to expected argument type 'Array<Int>'
a4 += [6]           // добавление в конец   // [1, 2, 5, 6]
a4 += [9,11]        // добавление в конец   // [1, 2, 5, 6, 9, 11]
a4[0] = 2           // Замена элемента      // 2   // [2, 2, 5, 6, 9, 11]
a4.insert(1, at: 3) // Вставка во внутрь    // [2, 2, 5, 1, 6, 9, 11]

// MARK: - Removing Elements
a4.remove(at: 3)    // удаление по индексу с возвратом удалённого
// removeFirst, removeLast - удаление первого и последнего
a4.removeAll(where: { $0 > 6 }) // удаляет по условия и ничего не возвращает // 7 times
a4                              // [2, 2, 5, 6]

a5.removeAll()      // удалить все элементы так
a5 += [1,2,3]
a5 = []             // или так

// MARK: - Finding Elements

a3.contains("b")
a3.contains(where: {$0 == "bb"})     // true
a3.contains(where: {$0 == "e"})      // false
a3.allSatisfy({$0.count >= 1})       // true
a3.allSatisfy({$0.count == 2})       // false

//print(a["aa"]) // No exact matches in call to subscript

if let b = a3.first(where: {$0.count == 1}) {print(b)} else {print("no")}    // a
if let b = a3.first(where: {$0.count >  1}) {print(b)} else {print("no")}    // bb
if let b = a3.last(where: {$0.count == 1}) {print(b)} else {print("no")}     // d
if let b = a3.last(where: {$0.count >  1}) {print(b)} else {print("no")}     // bb

// if let i = a3.index(of: "c") {print(i)} else {print("no")}
//             'index(of:)' is deprecated: renamed to 'firstIndex(of:)'

if let i = a3.firstIndex(of: "c") {print(i)} else {print("no")}  // 2
if let i = a3.lastIndex(of: "c") {print(i)} else {print("no")}   // 3

if let i = a3.firstIndex(where: {$0.count == 1}) {print(i)} else {print("no")}  // 0
if let i = a3.lastIndex(where: {$0.count == 1}) {print(i)} else {print("no")}   // 4

a3.min()     // a
a3.max()     // d

// a.min(by: ); a.max(by: )

// MARK: - Excluding Elements
var b = ["a","a","b","b","c"]
var c = b.dropFirst(2)
print(b,c)  // ["a", "a", "b", "b", "c"] ["b", "b", "c"]
b = ["a","a","b","b","c"]
c = b.dropLast(2)
print(b,c)  // ["a", "a", "b", "b", "c"] ["a", "a", "b"]
b = ["a","a","b","b","c"]
c = b.drop(while: {$0 != "c"})
print(b,c)  // ["a", "a", "b", "b", "c"] ["c"]
b = ["a","aa","b","bb","c"]
c = b.drop(while: {$0.count == 1})
print(b,c)  // ["a", "aa", "b", "bb", "c"] ["aa", "b", "bb", "c"]
b = ["a","aa","b","bb","c"]
c = b.drop(while: {$0.count != 0})
print(b,c)  // ["a", "aa", "b", "bb", "c"] []


// MARK: - Полезное
a4.count            // 4
a4.isEmpty          // false
a4.shuffle()        // перемешивает // [5, 6, 2, 2]
a4.shuffle()                        // [5, 2, 6, 2]
a4.randomElement()  // отдаёт случайный // 5
a2 = a4.filter{$0 < 6}                  // 5 times // a2 [5, 2, 2] // a4 [5, 2, 6, 2]
a2 = a4.sorted(by: >)                   // a2 [6, 5, 2, 2] // a4 [5, 2, 6, 2]
a4.sorted()                             // [6, 5, 2, 2]
a2 = a4.map{ $0 * 2 } // по всем элементам // [4, 4, 10, 12]




// Iterating Over an Array’s Elements

a3.forEach { item in
    print(item)
}
