//
//  Extension : func.swift
//  erweiterter Taschenrechner
//
//  Created by Tom Kumschier on 24.02.15.
//  Copyright (c) 2015 Tom Kumschier. All rights reserved.
//

import Foundation


extension Array {
    mutating func replace (withArray: [T], var atIndex: Int) {
        self.removeAtIndex(atIndex)
        for (key, value) in enumerate(withArray) {
            self.insert(value, atIndex: atIndex)
            atIndex += 1
        }
    }
    func valueOf(Index: Int) -> T? {
        for (key, value) in enumerate(self) {
            if key == Index {
                return value
            }
        }
        return nil
    }
    mutating func addierValue(mitStartwert value: T){
        var temp = 0
        for (key, value) in enumerate(self) {
            temp = (value as Int) + 1
            self.removeAtIndex(key)
            self.insert(temp as T, atIndex: key)
        }
    }
}



func parser(#stringZuParsen: String, mitWelchemSeparator separator: String, berechne:Bool = false) ->[String] {
    var stringZuParsenGeparst = stringZuParsen.componentsSeparatedByString(separator)
    if berechne {
        var temp = 0
        var ergebnis: Int?
        var wert = stringZuParsenGeparst.valueOf(0)
        //var wertInt = wert!.toInt()
        for wertInt in stringZuParsenGeparst {
            switch separator {
            case "x":
                if ergebnis == nil {
                    ergebnis = wert!.toInt()!
                } else {
                    ergebnis! *= wertInt.toInt()!
                }
            case ":":
                if ergebnis == nil {
                    ergebnis = wert!.toInt()!
                } else {
                    ergebnis! /= wertInt.toInt()!
                }
            default: ergebnis! = 0
            }
        }
        return ["\(ergebnis!)"]
    } else {
        return stringZuParsenGeparst
    }
}