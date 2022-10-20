// #  Collection -> Array
//  [] - is Collection

var b: Bool
var i: Int
var j: Int?

// MARK: - Объявление массива
// Без инициализации. Вообще ничего нельзя делать пока. Даже isEmpty.
var a1: [Int]                   // Коллекция показывается квадратными скобками, а тип коллекции синтаксисом.
var a3: Array<Int>              // Явно указывается тип коллекции и тип её элементов.
var a9: Array<Int>.SubSequence  // ПодПоследовательность. Такой тип образуется при получении части массива. См. drop
// С инициализацией. С массивом сразу можно работать. .count, .isEmpty ...
var a5 = [Int]()                // Квадратные скобки обозначают коллекцию, синтаксис обозначает массив, а круглые скобки инициализуют пустой массив.
var a2: [Int] = []              // Как a1, но с инициализацией
var a4: Array<Int> = Array()    // Полная форма

// Ловим ошибки
// var a = [Int]            // Error: Expected member name or constructor call after type name // требуется инициализитор как в 5.
// var a = [Int](1,2)       // Error: No exact matches in call to initializer // так инициализатор массива не вызвать
// var a = [Int](5,1,2)     // Error: Missing argument label 'arrayLiteral:' in call // просто другая ругань
// var a = [Int][1,2,3]     // Error: Extra arguments at positions #2, #3 in call // и массив так не присвоить
// var a: Int = [1,2]       // Error: Cannot convert value of type '[Int]' to specified type 'Int' // просто инту массив не присвоить

// MARK: - с этим массивом будем работать далее -
var a = [3,2,5,2]   // Тип присваивается автоматически

// MARK: - Доступ
a[0]       // 3
a.first    // 3
a[1]       // 2
a.last     // 5
// a[9]     // error: Execution was interrupted // нельзя обращаться к несущесвующим элементам

// MARK: - Finding Elements

// наличие элемента по значению
b = a.contains(3)   // true
b = a.contains(1)   // false
b = a.contains(where: { $0 > 2 })     // true  // 2 times
b = a.contains(where: { $0 > 9 })     // false // 5 times

// поиск индекса элемента
j = a.firstIndex(of: 2) ?? nil  // 1
j = a.firstIndex(of: 9) ?? nil  // nil
// j = a.contains("aa") // нет тот тип // error: Instance method 'contains' requires the types 'Int' and 'String.Element' (aka 'Character') be equivalent

if let i = a.firstIndex(of: 2) {i} else {j}  // 2
if let i = a.firstIndex(of: 9) {i} else {j}  // nil
if let i =  a.lastIndex(of: 5) {i} else {j}  // 3

// поиск элемента
j = a.first(where: { $0 > 3 })          // 5        // 4 times
j = a.first(where: { $0 > 9 }) ?? nil   // nil      // 5 times
j = a.first
// j = a1.first     // Variable 'a1' used before being initialized  // a1 только объявлен, но не инициализирован.
j = a2.first        // nil
j = a5.first        // nil
j = a.last
j = a.last(where: { $0 > 9 }) ?? nil   // nil      // 5 times

// MARK: - Adding Elements
a.append(5)        // добавление в конец   // [3, 2, 5, 2, 5]
// a += 6          // 6 - не массив. // Cannot convert value of type 'Int' to expected argument type 'Array<Int>'
a += [6]           // добавление в конец   // [3, 2, 5, 2, 5, 6]
a += [9,11]        // добавление в конец   // [3, 2, 5, 2, 5, 6, 9, 11]
a[0] = 2           // Замена элемента #0   // 2   // [2, 2, 5, 2, 5, 6, 9, 11]
a.insert(1, at: 3) // Вставка во внутрь    // [2, 2, 5, 1, 2, 5, 6, 9, 11]
a += Array(arrayLiteral: 5,3,2)
a += Array(2...5)
a += Array(repeating: 0, count: 5)

// MARK: - Removing Elements
a = [2, 2, 5, 1, 2, 5, 6, 9, 11]
i = a.remove(at: 3)         // 1 // 2, 2, 5, 2, 5, 6, 9, 11]
// i = a.remove(at: 9)      // если нет индекса // error: Execution was interrupted
i = a.removeFirst()         // 2  // [2, 5, 2, 5, 6, 9, 11]
// i = a1.removeFirst()         // Error. a5 is empty
a.removeFirst(2)            //             [2, 5, 6, 9, 11]
i = a.removeLast()          // 11 //       [2, 5, 6, 9]
a.removeAll(where: { $0 > 5 })    //       [2, 5]           // 7 times
a += [5]
a.removeAll()               // []
a = []                      // или так

// MARK: - Excluding Elements
a += [9,8,7,1,2,3]              // [9, 8, 7, 1, 2, 3]
a9 = a.dropFirst(2)             //       [7, 1, 2, 3]
a9 = a.dropLast(2)              // [9, 8, 7, 1]

// работает до первого false
a9 = a.drop(while: {$0 > 2})    //          [1, 2, 3]       // 5 times  // 1 < 2 - первая false
a9 = a.drop(while: {$0 > 0})    //          ArraySlice([])  // 7 times  // all > 0 => пропускаем всё.
a9 = a.drop(while: {$0 > 8})    //    [8, 7, 1, 2, 3]       // 3 times  // 8 > 8 - первая false
a9 = a.drop(while: {$0 == 7})   // [9, 8, 7, 1, 2, 3]       // 2 times  // 9 == 7 false сходу. Нет пропусков.

// MARK: - Разное
a.count     // 6
a.isEmpty   // false
a.min()     // 1
a.max()     // 9
a.shuffle()        // перемешивает // [1, 3, 7, 9, 2, 8]
a.shuffle()                        // [3, 8, 2, 9, 7, 1]
a.randomElement()  // отдаёт случайный // 9
a1 = a.filter{$0 < 6}                           // [2, 3, 1]                // 7 times
a1 = a.sorted(by: >)                            // [9, 8, 7, 3, 2, 1]
a.sort()                                        // [1, 2, 3, 7, 8, 9]
a1 = a.map{ $0 * 2 } // по всем элементам       // [2, 4, 6, 14, 16, 18]    // 7 times
a.forEach { element in
    i = element * 2
}                                            // 6 times
a.forEach { element in     i = element * 2 } // 7 times  // TODO: Как так? Почему 7, если записать в одну строку?
for         element in a { i = element * 2 } // 6 times
