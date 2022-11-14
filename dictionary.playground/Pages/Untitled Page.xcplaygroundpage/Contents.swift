/*
 SWIFT // 2022-10-23
 Cheat Sheet for Collection -> Dictionary
 Словарь - коллекция с ключами любого одинакового типа
*/
// MARK: - Вспомогательные переменные
var b: Bool
var i: Int
var j: Int?
var st: String
var sto: String?
var dd: Dictionary<Int, String>.Element?

// MARK: - Объявление словаря
// Коллекция показывается квадратными скобками, а тип коллекции синтаксисом.
var d11: [Int:String]                   // Без инициализации. Вообще ничего нельзя делать пока. Даже isEmpty.
var d21: Dictionary<Int,String>         // Без инициализации. Явно указывается тип коллекции и тип её элементов.

var d12: [Int:String] = [:]                     // Как d11, но с инициализацией
var d13: [Int:String] = Dictionary()            // как d11, но с инициализацией
var d22: Dictionary<Int,String> = [:]           // Как d21, но с инициализацией
var d23: Dictionary<Int,String> = Dictionary()  // Как d21, но с инициализацией
// var d = [Int:String]   // Error: Expected member name or constructor call after type name // требуется инициализитор как в 3.
var d = [Int:String]()   // Квадратные скобки обозначают коллекцию, синтаксис обозначает словарь, а круглые скобки инициализуют пустой словарь.
d.isEmpty   // true

d = [1:"b", 2:"a", 5:"d d"]
d.isEmpty   // false
d.count     // 3

// MARK: - Доступ
dd = d.first    // (key 2, value "dd                  // var dd: Dictionary<Int, String>.Element?
//d.last            // Error
sto = d[2]          // "a"
sto = d[0]          // nil
d[0] = "01"         // add
d[0] = "02"         // upd
d                   // [0: "02", 5: "d d", 1: "b", 2: "a"]
sto = d.updateValue("03", forKey: 0)    // "02" // предыдущее значени
sto = d.updateValue("03", forKey: 9)    // nil  // предыдущего не было. Это вставка нового элемента.
d[0] = nil          // удаление элемента по улючу // [2: "a", 1: "b", 5: "d d", 9: "03"]
st = d[0,default:"x"]   // значение для несуществующего ключа
dd = d.randomElement()  // (key 1, value "b")
dd = d.randomElement()  // (key 5, value "d d")

for (i,s) in d {}
for i in d.keys {}
for s in d.values {}
