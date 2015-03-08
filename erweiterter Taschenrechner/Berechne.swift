//
//  Berechne.swift
//  erweiterter Taschenrechner
//
//  Created by Tom Kumschier on 02.03.15.
//  Copyright (c) 2015 Tom Kumschier. All rights reserved.
//

import Foundation

func berechne(var stringZumBerechnen str: String) -> Int! {
    println("### Berechnung start")
    var str2 = componentsSeparatetByStrings(inString: str, separators: ["+", "-"])
    
    for (key, var value) in enumerate(str2.numbers) {
        if (value.isInString(thisChar: "x")) || (value.isInString(thisChar: ":")) {
            str2.numbers[key] = componentsSeparatetByStringsWitchCalc(inString: value, separators: ["x", ":"])
        }
    }
    
    //    println(str2)
    for number in 1..<str2.numbers.count {
        var ergebnis = 0
        if str2.parameter[0] == "+" {
            ergebnis = str2.numbers[0].toInt()! + str2.numbers[1].toInt()!
            str2.numbers.removeAtIndex(0)
            str2.numbers[0] = "\(ergebnis)"
            str2.parameter.removeAtIndex(0)
            //            println(str2)
        }else {
            ergebnis = str2.numbers[0].toInt()! - str2.numbers[1].toInt()!
            str2.numbers.removeAtIndex(0)
            str2.numbers[0] = "\(ergebnis)"
            str2.parameter.removeAtIndex(0)
            //            println(str2)
        }
    }
    return str2.numbers[0].toInt()!
}
