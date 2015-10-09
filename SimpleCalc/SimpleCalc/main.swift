//
//  main.swift
//  SimpleCalc
//
//  Created by Vikram Thirumalai on 10/7/15.
//  Copyright (c) 2015 Vikram Thirumalai. All rights reserved.
//

import Foundation

func input() -> String {
    let keyboard = NSFileHandle.fileHandleWithStandardInput()
    let inputData = keyboard.availableData
    let result = NSString(data: inputData, encoding:NSUTF8StringEncoding) as! String
    return result.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet())
}

func convert(incoming:String) -> Double {
    return (NSNumberFormatter().numberFromString(incoming) as? Double) ?? 0
}

func count(incoming:[String]) {
    print(incoming.count - 1)
}

func avg(incoming:[String]) {
    var total = 0.0
    var count = Double(incoming.count - 1)
    for var i = 0; i < incoming.count-1; i++ {
        total = total + Double(convert(incoming[i]))
    }
    print(total / count)
}

func fact(incoming:[String]) {
    var factorial = 1;
    if(incoming.count != 2) {
        print("enter one number and type fact!")
    } else {
        for var i = Int(convert(incoming[0])); i > 0; i-- {
            factorial = factorial * i;
        }
        print(factorial);
    }
}

print("Enter an expression separated by returns: \n")
var firstNum = input()
var operatorVar = input()
var secondNum = input()

let number1 = convert(firstNum)
let number2 = convert(secondNum)
var result: Double = 0.0;
switch operatorVar {
case "+":
    result = number1 + number2
case "-":
    result = number1 - number2
case "*":
    result = number1 * number2
case "/":
    result = number1 / number2
case "%":
    result = number1 % number2
default:
    print("invald input")
}
print("Result: \(result) \n")
print("Enter numbers for your next operation: \n")
let nextOperation = input();
let c = nextOperation.componentsSeparatedByString(" ");
switch c[c.count-1] {
case "count":
    count(c)
case "avg":
    avg(c)
case "fact":
    fact(c)
default:
    print("invalid input");
}


