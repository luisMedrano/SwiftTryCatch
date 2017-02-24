//
//  TryCatchSample.swift
//  entrevista
//
//The MIT License (MIT)
//Copyright (c) 2017 Luis Medrano-Zaldivar
//Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"),
//to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense,
//and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
//The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
//
//THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
//WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.


import Foundation

class TryCatchSample {
    
    func sample(){
        
        let arrayNumbers = [Int]()
        var result:Int = 0
        // Generic way to handle catch:
        do{
            result = try self.doSomethingWithTheArray(arrayNumbers)
            print(result)
        }catch let error as arrayToProcessError{
            print(error.description)
        }catch{
            print("Some other error!")
        }
        //handling catch case by case:
        do{
            result = try self.doSomethingWithTheArray(arrayNumbers)
            print(result)
        }catch arrayToProcessError.equalCero{
            print("The array has cero elements")
        }catch arrayToProcessError.lessThanTwo{
            print("The array needs to have at least 2 elements in the array")
        }catch{
            print("")
        }
        
    }
    
    enum arrayToProcessError: Error, CustomStringConvertible {
        
        case equalCero
        var localizedDescription: String{
            return "The array is empty"
        }
        case lessThanTwo
        var description: String {
            return "At leasts 2 elements in the array"
        }
    }
    
    func doSomethingWithTheArray(_ arrayToProcess: [Int]) throws -> Int {
        
        if arrayToProcess.count == 0 {
            throw arrayToProcessError.equalCero
        }
        if arrayToProcess.count < 2 {
            throw arrayToProcessError.lessThanTwo
        }
        
        return arrayToProcess[0]
    }
}


