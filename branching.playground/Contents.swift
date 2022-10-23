/*
 SWIFT // 2022-10-23
 Cheat Sheet for:
 branching - ветвление
*/
// MARK: - вспомогательные переменные
var condition, c1, c2: Bool // condition - условие
var i1, i2: Int
c1 = true; c2 = false
i1 = 0; i2 = 2

// MARK: - условие
condition = c1
condition = !c1
condition = c1 == c1
condition = c1 && c1
condition = c1 || c1
condition = i1 > i2     // <
condition = i1 >= i2    // <=

// MARK: - branching

if (condition) {} else if (condition) {} else {}

switch i1 {
case  0: i2 = 3; fallthrough
case  1: i2 = 1
case  2: i2 = 2
case 1,2: break
case 1...4: break
case 3...: break
// case condition: break // Error. Type.
default: i2 = 0
}
i2 // 1


