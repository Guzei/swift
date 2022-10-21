// #  Collection -> Set
//  [] - is Collection

var b: Bool
var i: Int
var j: Int?

// MARK: - Объявление множества
// Без инициализации. Вообще ничего нельзя делать пока. Даже isEmpty.
var s1: Set<Int>              // Явно указывается тип коллекции и тип её элементов.
var s2: Set<Int>.SubSequence  // ПодПоследовательность. Такой тип образуется при получении части множества. См. drop
// С инициализацией. С множеством сразу можно работать. .count, .isEmpty ...
var s3: Set<Int> = Set()    // Полная форма
// инициализация
s1 = .init()                    // {}
s1 = .init(minimumCapacity: 33)
s1 = .init(arrayLiteral: 1, 2)  // {2,1}
s3 = Set()
s3 = Set(2...4)

// Ловим ошибки
//s = .init(1)              // Error
//var s: Set = [Int]        // Error. Массив не множество.
//var s = Set()             // Error. Нет типа.

// MARK: - с этим множеством будем работать далее -
var s: Set = [5,1,2]    // Тип из контекста, порядок произвольный // {5, 1, 2}

// MARK: - Доступ
j = s.first         // 5
j = s3.first        // nil
s.randomElement()  // отдаёт случайный // 5

// MARK: - Finding Elements
// наличие элемента по значению
b = s.contains(3)   // false
b = s.contains(1)   // true
b = s.contains(where: { $0 > 2 })     // true
b = s.contains(where: { $0 > 9 })     // false
s.min()     // 1
s.max()     // 5
j = s.randomElement()
j = s3.randomElement()
var ss = s.firstIndex(of: 2) // {{{offset 2}, age -199116565}}
    ss = s.firstIndex(of: 9) // nil

// MARK: - Adding Elements
// s.append(5)      // Error
// s += 6           // Error += не приминимо к множесту
(b, i) = s.insert(7)   //  (true, 7) // {1, 2, 7, 5}
(b, i) = s.insert(7)   // (false, 7) // {1, 2, 7, 5}
s.update(with: 2)       // 2

// MARK: - Removing Elements
i = s.removeFirst()             // 7?            {2, 5, 1}
j = s.remove(2)                 // 2 || nil

// MARK: - Combining Sets
s = s1.union(s3) // Объединение
s1.formUnion(s3) // Объединение
s = s1.intersection(s3) // Пересечение
s = s1.symmetricDifference(s3) // Симметричная разность (ни там, ни там)
s1.subtract(s3) // Вычетание

// MARK: - Разное
s3.count     // 3           // {2, 3, 4}
s3.isEmpty   // false
s = s3.filter{$0 < 4}       // {2, 3}

var a = s.map{$0 * 2}       // [4, 6]
i = s.reduce(0,+)           // 5
a = s.sorted()              // [2,3]
a = s.sorted(by: >)         // [3,2]
a = s.shuffled()            // перемешиваем и отдаём массив
