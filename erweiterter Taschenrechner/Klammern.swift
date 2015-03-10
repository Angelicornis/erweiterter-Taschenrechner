//
//  Klammern.swift
//  erweiterter Taschenrechner
//
//  Created by Tom Kumschier on 04.03.15.
//  Copyright (c) 2015 Tom Kumschier. All rights reserved.
//

import Foundation

func berechnungKlammerII (var inString stringToParse: String, separators separatoren: [Character])
    ->(String,Bool) {
        var description = false
        
        if description {println("Startstring: \n \(stringToParse)")}
        
        var ursprungsString = stringToParse
        var StringAsArray: [String] = []
        var place: [Int] = []
        var key = 0
        var closure = 0
        var startstring = stringToParse
        var anzahlDerKlammerAuf = 0
        var positionKlammerAuf = 0
        var startWertDerKlammern = 0
        var anzahlDerKlammerZu = 0
        var zählerStringArray = 0
        var tempKey = 0
        var StringAsArrayReverse:[String] = []
        var längeDesStrings: [Int] = []
        var stringVorDerKlammer = ""
        /*
        //MARK: Auflösung der Klammer auf
        Auflösung der Klammer
        Von Klammer auf bis Ende des Strings
        Speichern von jeder Klammer auf bis Ende in einem Array
        */
        ende: for (var keyy, var value) in enumerate(stringToParse) {
            if anzahlDerKlammerAuf == anzahlDerKlammerZu && anzahlDerKlammerAuf != 0 && anzahlDerKlammerZu != 0{
                break ende
            }else if value == "(" {
                if anzahlDerKlammerAuf == 0 {
                    stringVorDerKlammer = stringToParse.gibStringZurück(0...key-1)
                }
                //                println("String vor (: \n \(StringAsArray)")
                stringToParse.removeRange(stringToParse.convertRange(0...key))
                StringAsArray.append(stringToParse)
                if StringAsArray.count == 1 {
                    place.append(key)
                } else {
                    key = place[tempKey - 1] + key + 1
                    place.append(key)
                }
                key = 0
                ++anzahlDerKlammerAuf
                ++tempKey
                //                println("String nach (: \n \(StringAsArray) \n")
                
            }else if value == ")" {
                var positionDerKlammerZu = 0
                StringAsArrayReverse = StringAsArray.reverse()
                //                println("String vor ): \n \(StringAsArrayReverse) \n")
                var stringArray = StringAsArrayReverse[zählerStringArray]
                outer: for (key2, char) in enumerate(stringArray) {
                    if char == ")" && anzahlDerKlammerZu == positionDerKlammerZu {

                        StringAsArrayReverse[anzahlDerKlammerZu] = stringArray.stringByPaddingToLength(key2, withString: "", startingAtIndex: 0)
                        längeDesStrings.append(StringAsArrayReverse[anzahlDerKlammerZu].lenght())
                        anzahlDerKlammerZu += 1
                        break outer
                    } else if char == ")" {
                        ++positionDerKlammerZu
                    }
                }
                ++zählerStringArray
                StringAsArray = StringAsArrayReverse.reverse()
            }else{
                key += 1
            }
        }
        var ursprungsStringAlsArray = StringAsArray
        ursprungsStringAlsArray.insert(stringVorDerKlammer, atIndex: 0)
        if description {println("String nach dem Parsen: \n \(StringAsArray)")}
        //        println("String nach dem Parsen: \n \(StringAsArray) \nplace: \(place) \nlänge \(längeDesStrings.reverse())")
        
        
        
        
        
        
        /* Das berechnete Ergebnis in den Ursprungsstring einfügen
        Berechnung der einzelnen Klammer
        */
        if description {println("\n\nStart: Berechnung\n")}
        var zähler = 0
        var tempZwischenergebnis = ""
        var länge = 0
        if description {println("Array: \(StringAsArrayReverse)")}
        for (key, value) in enumerate(StringAsArrayReverse) {
            if description {println("Value: \(value)")}
            if zähler == 0 {
                tempZwischenergebnis = "\(berechne(stringZumBerechnen: value))"
                StringAsArrayReverse[0] = tempZwischenergebnis
                länge = value.lenght()
                zähler += 1
            } else {
                var ortDerKlammer = 0
                for c in value {
                    ++ortDerKlammer
                    if c == "(" {
                        break
                    }
                }
                --ortDerKlammer
                if description {println("Aktueller String: \(StringAsArray[zähler])")}
                if description {println("Startindex: \(ortDerKlammer)")}
                var endIndex = längeDesStrings[zähler - 1] + ortDerKlammer + 1
                if description {println("Endindex \(endIndex)")}
                
                StringAsArrayReverse[zähler].removeRange(StringAsArrayReverse[zähler].convertRange(ortDerKlammer...endIndex))
                var tempString = StringAsArrayReverse[zähler]
                tempString.insertString(tempZwischenergebnis, atIndex: ortDerKlammer)
                StringAsArrayReverse[zähler] = tempString
                
                tempZwischenergebnis = String(berechne(stringZumBerechnen: StringAsArrayReverse[zähler]))
                StringAsArrayReverse[zähler] = tempZwischenergebnis
                
                zähler += 1
            }
            if description {println("Zwischenergebnis: \(tempZwischenergebnis)\n")}
        }
        
        
        place.reverse()

        
        var tempCounterFürEinsetzen = 1
        var längeDesStringsOriginal = längeDesStrings
        for (key, value) in enumerate(StringAsArrayReverse) {
            var placeAktuellReverse = place.reverse()[key]
            var längeDesStringsAktuell = längeDesStrings[key] + placeAktuellReverse
            ursprungsString.removeRange(ursprungsString.convertRange(placeAktuellReverse...längeDesStringsAktuell + 1))
            ursprungsString.insertString(StringAsArrayReverse[key], atIndex: placeAktuellReverse)
            if key + 1 != StringAsArrayReverse.count {
                längeDesStrings[key + 1] = längeDesStrings[key + 1] - längeDesStringsOriginal[key] + StringAsArrayReverse[key].lenght() - 2
            }
        }
        if anzahlDerKlammerAuf == 0 {
            return (ursprungsString, true)
        } else {
            return (ursprungsString, false)
        }
}

func berechnungKlammer ( inString stringToParse: String, separators separatoren: [Character])
    ->String  {
        var (temp, status) = (stringToParse, false)
        outer: for nummer in 0...100 {
            (temp, status) = berechnungKlammerII(inString: temp, separators: separatoren)
            if status {
                break outer
            }
        }
        return temp
}

