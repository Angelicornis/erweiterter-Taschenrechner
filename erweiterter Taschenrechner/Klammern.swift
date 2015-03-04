//
//  Klammern.swift
//  erweiterter Taschenrechner
//
//  Created by Tom Kumschier on 04.03.15.
//  Copyright (c) 2015 Tom Kumschier. All rights reserved.
//

import Foundation

func klammern (var #ursprünglicherString: String) -> Int {
    println("Startwert\n \(ursprünglicherString) \n")
    
    var a = parser(stringZuParsen: ursprünglicherString, mitWelchemSeparator: "(")
    //println("Startwert\n \(a)")
    a.removeAtIndex(0)
    //println("Nach Entfernen\n \(a)")
    
    var b: [String] = []
    for (key, value) in enumerate(a) {
        b += (parser(stringZuParsen: value, mitWelchemSeparator: ")"))
        b.removeAtIndex(key + 1)
    }
    //println("Nach Parsen \n \(b)")
    
    
    for (key, value) in enumerate(b) {
        var zwischenergebnis = 0
        zwischenergebnis = berechnung(StringZumBerechnen: value)
        b[key] = "\(zwischenergebnis)"
    }
    
    
    a = parser(stringZuParsen: ursprünglicherString, mitWelchemSeparator: "(")
    var key1 = 0
    for (var key, value) in enumerate(a) {
        println("key: \(key1)")
        println(key1)
        var aA = parser(stringZuParsen: value, mitWelchemSeparator: ")")
        if aA.count > 1 {
            aA[0] = "\(berechnung(StringZumBerechnen: aA[0]))"
        }
        println("aA: \(aA)")
        a.replace(aA, atIndex: key1)
        if aA.count > 1 {
            for number in 0..<aA.count {
                key1 += 1
            }
        } else {
            key1 += 1
        }
        println(key1)
        println("replace: \(a) \n \n")
    }
    ursprünglicherString = ""
    for (key, value) in enumerate(a) {
        ursprünglicherString += value
        println(ursprünglicherString)
    }
    
    return berechnung(StringZumBerechnen: ursprünglicherString)
    
}
