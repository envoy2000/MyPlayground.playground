// Playground - noun: a place where people can play

import UIKit

class CheckCalculator {
    
    
    var total:Double
    
    var totalByProduct:[Double]
    
    
    
    
    
    /**
    
    * Constructor
    
    */
    
    init() {
        
        self.total = 0
        
        self.totalByProduct = [0, 0, 0, 0]
        
    }
    
    
    
    func update(sum:Double, type prodType:ProductType)->Double {
        
        total += sum
        
        addByProduct(sum, type: prodType)
        //println(total)
        return total
        
    }
    
    
    
    func addProductType() {
        
        totalByProduct.append(0)
        
    }
    
    
    
    private func addByProduct(sum:Double, type:ProductType)->Double {
        
        totalByProduct[type.toRaw()] += sum
        
        //println(totalByProduct)
        return totalByProduct[type.toRaw()]
       
        
    }
    
}



// Product enumeration

enum ProductType:Int {
    
    case Food = 0
    
    case Cloth = 1
    
    case Plant = 2
    
    case iPhone = 3
    
    case Car = 4
    
}



// Test

let calc = CheckCalculator()

println("************************************")
 println("ГИПЕРМАРКЕТ №1   г.Санкт-Петербург")
 println("Покупатель: Иванов И.И.")
 println("код: 001400005343")
 println("                     ")
 println("            ЧЕК ПРОДАЖИ")
 println("-----------------------------------")
 
for i in 0...5 {
    let productType = Int(arc4random_uniform(5))
    let productPrice = Double(arc4random_uniform(1000))
    if productType > 3 {
        calc.addProductType()
        calc.update(productPrice, type: ProductType.fromRaw(productType)!)
    } else
    {
        calc.update(productPrice, type: ProductType.fromRaw(productType)!)
    }
    
    if productType == 0 {
    println("Еда = \(productPrice) у.е")
    }
    if productType == 1 {
    println("Одежда = \(productPrice) у.е")
    }
    if productType == 2 {
    println("Цветы = \(productPrice) у.е")
    }
    if productType == 3 {
    println("Телефоны = \(productPrice) у.е")
    }
    
}

println("-----------------------------------")
println("ИТОГО ПО ВИДАМ В % к ОБЩ.СУММЕ")
println("Еда = \((Float((calc.addByProduct(0, type: ProductType.Food)))*100.00)/(Float(calc.update(0, type: ProductType.Food)))) %")
println("Одежда = \((Float((calc.addByProduct(0, type: ProductType.Cloth)))*100.00)/(Float(calc.update(0, type: ProductType.Cloth)))) %")
println("Цветы = \((Float((calc.addByProduct(0, type: ProductType.Plant)))*100.00)/(Float(calc.update(0, type: ProductType.Plant)))) %")
println("Телефоны = \((Float((calc.addByProduct(0, type: ProductType.iPhone)))*100.00)/(Float(calc.update(0, type: ProductType.iPhone)))) %")


println("-----------------------------------")

println("ККМ 00045678 ИНН 007801022345 #5434")
println("23.10.2014 20:00           КАССИР 1")
println("ПРОДАЖА                       №2145")
println("ИТОГ                        = \(calc.update(0, type: ProductType.Cloth))")
println("НАЛИЧНЫМИ                   = \(calc.update(0, type: ProductType.Cloth))")

println("**************** ФП ****************")






