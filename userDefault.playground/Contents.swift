//
// SWIFT // 2022-11-14
// Cheat Sheet for userDefault
//

// MARK: - userDefault -

import Foundation

let db = UserDefaults.standard

// MARK: - Int
print("-- Int --")
// min
var i0: Int{ get{ return db.integer(forKey: "ki0") }}
db.set(1, forKey: "ki0")                                    // set in   DB
print("i0:", i0)                                            // get from DB

var i1: Int
{
    get{ return db.integer(           forKey: "ki1") }
    set{        db.set(     newValue, forKey: "ki1") }
}
print("i1:", i1)                                            // get from DB
i1 = 1                                                      // set in   DB

// a little more
var i2: Int {
    get {
        let c1 = db.integer(forKey: "ki2" )
        let c2 = db.integer(forKey: "kiNo")                 // 0 -- is default value for Int
        print("i2: in DB for ki2:" , c1)
        print("i2: in DB for kiNo:", c2)
        return c1
    }
    set {
        print("i2: New value for ki2 is:", newValue)
        db.set(newValue, forKey: "ki2")
    }
}
print(i2)                                                   // get from DB
i2 = 2                                                      // set in   DB

// MARK: - String
print("\nSTRING")
// min
var s0: String{ get{ return db.string(forKey: "ks0") ?? "no data for key \"ks0\"" } }
db.set("a", forKey: "ks0")                                  // set in   DB
print("s0:", s0)                                            // get from DB

var s1: String
{
    get{ return db.string(           forKey: "ks1") ?? "no data for key ks1" }
    set{        db.set(    newValue, forKey: "ks1") }
}
print("s1:", s1)                                            // get from DB
s1 = "ab"                                                   // set in   DB

var s2: String {
    get {
        let c1 = db.string(forKey: "ks2" ) ?? "no data for key ks2"
        let c2 = db.string(forKey: "ksNo") ?? "no data for key ksNo"
        print("s2: in DB for ks2:" , c1)
        print("s2: in DB for ksNo:", c2)
        return c1
    }
    set {
        print("s2: New value for ks2 is:", newValue)
        db.set(newValue, forKey: "ks2")
    }
}
print("s2:", s2)                                            // get from DB
s2 = "s2a"                                                  // set in   DB

var s3: String! {
    get {
        let c1 = db.string(forKey: "ks3" ) ?? "no data for key ks3"
        let c2 = db.string(forKey: "ksNo") ?? "no data for key ksNo"
        print("s3: in DB for ks3:" , c1)
        print("s3: in DB for ksNo:", c2)
        return c1
    }
    set {
        if let nv = newValue {
            print("s3: New value for ks3 is:", nv)
            db.set(nv, forKey: "ks3")
        }
        else {
            print("s3 set: Error")                          // TODO: catch this error
        }
    }
}
print("s3", s3!)                                            // get from DB
s3 = "aa"                                                   // set in   DB

// MARK: - Dictionary
print("\n-- Dictionary --")
// no min
var d0: Dictionary<String, Int> { get{ return db.dictionary(forKey: "kd0") as? [String:Int] ?? ["":0] }}
//d0 = ["a":1, "b":2]  // Cannot assign to value: 'd0' is a get-only property

var d1: Dictionary<String, Int>
{
    get{ return db.dictionary(forKey: "kd1") as? [String:Int] ?? ["":0] }
    set{ db.set(    newValue, forKey: "kd1") }
}
print("d1:", d1)                                            // get from DB
d1 = ["a":1, "b":2, "c":3]                                  // set in   DB

var d2: Dictionary<String,Int> {
    get {
        let c1 = db.dictionary(forKey: "kd2" ) as? [String:Int] ?? ["":0]
        let c2 = db.dictionary(forKey: "kdNo") as? [String:Int] ?? ["":0]
        print("d2: in DB for kd2:" , c1)
        print("d2: in DB for kdNo:", c2)
        return c1
    }
    set {
        print("d2: New value for kd2 is:", newValue)
        db.set(newValue, forKey: "kd2")
    }
}
print("d2:", d2)                                            // get from DB
d2 = ["a":2]                                                // set in   DB


// MARK: - Enum
print("\n-- Enum --")
enum Colors: String {
    case red, green, blue, noColor
}

// no min
var e0: Colors {get {return Colors(rawValue: db.string(forKey: "ke0") ?? "noColor") ?? .noColor}}
//e0 = .red // Cannot assign to value: 'e0' is a get-only property

var e1: Colors
{
    get{ return Colors(rawValue: db.string(forKey: "ke1") ?? "noColor") ?? .noColor }
    set{        db.set( newValue.rawValue, forKey: "ke1") }
}
print("e1:", e1)                                            // get from DB
e1 = .green                                                 // set in   DB

var e2: Colors {
    get {
        let c1 = db.string(forKey: "ke2" ) ?? "noColor"
        let c2 = db.string(forKey: "keNo") ?? "noColor"
        print("e2: in DB for ke2:" , c1)
        print("e2: in DB for keNo:", c2)
        return Colors(rawValue: c1) ?? .noColor
    }
    set {
        let nv = newValue.rawValue
        print("e2: New value for ke2 is:", nv)
        db.set(nv, forKey: "ke2")
    }
}
print("e2:", e2)                                            // get from DB
e2 = .red                                                   // set in   DB

// MARK: - Dictionary + Enum
print("\n-- Dictionary + Enum --")

var de: Dictionary<Colors, Int> {
    get {
        var dei: Dictionary<Colors, Int> = [:]
        if let dsi = db.dictionary(forKey: "kde") as? [String:Int] {
            print("de: dsa", dsi)
            for (s,i) in dsi {
                let e = Colors(rawValue: s) ?? .noColor     // convert String to Enum
                dei[e] = i
            }
        } else {
            print("no data for key \"kde\"")
            dei = [.noColor:0]
        }
        return dei
    }
    set {
        print("de: New value for kde is:", newValue)
        var d: Dictionary<String, Int> = [:]
        for (e,i) in newValue { d[e.rawValue] = i }
        // newValue.map { (e: Colors, i: Int) in d[e.rawValue] = i }  // another word
        print("de: New value for kde converted is:", d)
        db.set(d, forKey: "kde")
    }
}
print("de: current value is:", de)
de = [.green:2, .red:3]
