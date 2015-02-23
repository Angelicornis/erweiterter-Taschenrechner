//
//  ViewController.swift
//  erweiterter Taschenrechner
//
//  Created by Tom Kumschier on 22.02.15.
//  Copyright (c) 2015 Tom Kumschier. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func ArrayWertAusgabe<T>(vonWelchemArray ausgewähltesArray: [T], index: Int) ->T? {
        var ergebnis: T?
        for (key, value) in enumerate(ausgewähltesArray) {
            if key == index {
                ergebnis = value
            }
        }
        return ergebnis
    }
    
    func parser(#stringZuParsen: String, mitWelchemSeparator separator: String, berechne:Bool = false) ->[String] {
        var stringZuParsenGeparst = stringZuParsen.componentsSeparatedByString(separator)
        if berechne {
            var temp = 0
            var ergebnis: Int?
            var wert = ArrayWertAusgabe(vonWelchemArray: stringZuParsenGeparst, index: 0)
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
    
    
    var anzeigeWährendBerechnung = ""
    var zahlenstring2 = ""

    @IBOutlet weak var anzeigeEinheit: UILabel!
    @IBOutlet weak var ergebnissAnzeige: UILabel!

    @IBAction func zahl1() {
        anzeigeWährendBerechnung += "1"
        anzeigeEinheit.text = anzeigeWährendBerechnung
    }
    
    @IBAction func zahl2() {
        anzeigeWährendBerechnung += "2"
        anzeigeEinheit.text = anzeigeWährendBerechnung
    }
    
    @IBAction func zahl3() {
        anzeigeWährendBerechnung += "3"
        anzeigeEinheit.text = anzeigeWährendBerechnung
    }
    
    @IBAction func aktionPlus() {
        anzeigeWährendBerechnung += "+"
        anzeigeEinheit.text = anzeigeWährendBerechnung
    }

    @IBAction func aktionMal() {
        anzeigeWährendBerechnung += "x"
        anzeigeEinheit.text = anzeigeWährendBerechnung
    }
    
    @IBAction func aktionGeteilt() {
        anzeigeWährendBerechnung += ":"
        anzeigeEinheit.text = anzeigeWährendBerechnung
    }
    @IBAction func aktionLöscheLetzteZahl() {
        var anzeigeWährendBerechnungArray = [String]()
        for c in anzeigeWährendBerechnung{
            println(c)
            anzeigeWährendBerechnungArray.append("\(c)")
        }
        anzeigeWährendBerechnungArray.removeLast()
        anzeigeWährendBerechnung = ""
        for nummer in 0..<(anzeigeWährendBerechnungArray.count) {
            anzeigeWährendBerechnung += (ArrayWertAusgabe(vonWelchemArray: anzeigeWährendBerechnungArray, index: nummer))!
        }
        anzeigeEinheit.text = anzeigeWährendBerechnung
    }

    
    @IBAction func aktionErgebnis() {
        

        var arrayOfWords = parser(stringZuParsen: anzeigeWährendBerechnung, mitWelchemSeparator: "+")
        println("Ergebniss1: \n \(arrayOfWords)\n")
        
        
        var arrayOfWords2 = [String]()
        var temparray = [Int]()
        for (index1, wort1) in enumerate(arrayOfWords) {
            for c in wort1 {
                if c == "x" {
                    println ("String vor dem zweiten Parsen * \n \(wort1)\n")
                    arrayOfWords2 = (parser(stringZuParsen: wort1, mitWelchemSeparator: "x", berechne: true))
                    temparray.append(index1)
                    for i in arrayOfWords2 {
                        arrayOfWords.removeAtIndex(index1)
                        arrayOfWords.insert(i, atIndex: index1)
                    }
                } else if c == ":" {
                    println ("String vor dem zweiten Parsen : \n \(wort1)\n")
                    arrayOfWords2 = (parser(stringZuParsen: wort1, mitWelchemSeparator: ":", berechne: true))
                    temparray.append(index1)
                    for i in arrayOfWords2 {
                        arrayOfWords.removeAtIndex(index1)
                        arrayOfWords.insert(i, atIndex: index1)
                    }
                }
            }
        }
        println("Ergebniss2: \n \(arrayOfWords)\n")
        
        println("Das letzte Vorergebnis Lautet: \n \(arrayOfWords)\n")
        var ergebnis = 0
        for i in arrayOfWords {
            ergebnis += i.toInt()!
        }
        println("Das Ergebnis Lautet: \n \(ergebnis)\n")
        
        ergebnissAnzeige.text = "Ergebnis: \(ergebnis)"
    }
    
}

