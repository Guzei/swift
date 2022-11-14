import Foundation

let db = UserDefaults.standard

// MARK: - Int
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
        let c2 = db.integer(forKey: "kiNo")
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
print("\n")
// min
var s0: String{ get{ return db.string(forKey: "ks0") ?? "no data for key \"ks0\"" } }
db.set("a", forKey: "ks0")                                  // set in   DB
print("s0:", s0)                                            // get from DB

var s1: String
{
    get{ return db.string(           forKey: "ks1") ?? "no data" }
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

