//
//  BarViewModel.swift
//  DAofAlgorithms
//
//  Created by Awal Amadou on 8/29/22.
//

import SwiftUI

class BarViewModel: ObservableObject {
    @Published var arrayConfig = [[SortingInt]]()
    
    var randArray = Array(1...10).shuffled()
//    @StateObject var maxVal = NumbersOnly()
    var maxNumber: Int = 21
    var nSwaps = 0
    var configIndex = 0
    
    init() {
        setUpVals()
//        insertionSort()
        selectionSort()
    }
    
    func setUpVals() {
            randArray = Array(1...maxNumber).shuffled()
                
    }
    
    func selectionSort() {
        nSwaps = 0
        setUpVals()
        var maxNum = maxNumber
        maxNum = maxNum - 2
        
        print("\(randArray)")
        // assume first element (i.e arr[0] ) is the min,
        // then iterate to update min
        for i in 0...maxNum {
            // bounds check
//            if i == maxNum{ break}
            let strt = i + 1
            
            var min = i
            // find index of smallest after arr[i]
            for j in strt...(maxNum+1) {
                if randArray[j] < randArray[min]  { min = j }
            }
            // place the i'th min at its position
            swap(a: i, b: min)
            //        sortStack.append(nums)
            
        }
        print("\(randArray)")
    }
    
    func insertionSort() {
        nSwaps = 0
        setUpVals()
        var maxNum = maxNumber
        maxNum = maxNum - 1
        
        print("\(randArray)")
        // bounds check
        for i in 1...maxNum {
            //            if i == maxNum{ break}
            //            let strt = i + 1
            
            let j = i
            for k in Array(1...j).reversed() {
                if randArray[k] < randArray[k-1]  {
                    swap(a: k, b: k-1)
                    
                } else {break}
            }
        }
        print("\(randArray)")
    }
    

    
    func addToStack(a: Int, b: Int, randColr: Color) {
        
        var newArr: [SortingInt] = []
        
        for z in 0...(maxNumber-1) {
            if (z == a || z == b) {
                newArr.append(SortingInt(id: UUID(), item: randArray[z], bgcolor: randColr))
            }
            else {
                newArr.append(SortingInt(id: UUID(), item: randArray[z], bgcolor: Color.blue))
            }
        }
        
//        let currConfig: BarViewModel = BarViewModel(id: UUID(), arrayConfig: newArr)
//        currentStatus.bVM = currConfig
//        sorting.update(newConfig: newArr)
        arrayConfig.append(newArr)
        nSwaps += 1
//
//        usleep(10000)
//        print("Current status changed.")
//        sortStack.append(currConfig)
    }
    
    func swap(a: Int, b: Int) {
        
        //        usleep(100000)
        let randColr = Color(
            red: .random(in: 0...1),
            green: .random(in: 0...1),
            blue: .random(in: 0...1))
        
        addToStack(a: a, b: b, randColr: randColr)
//        usleep(1000000)
        
        //        Main swap logic
        let tmp = randArray[a]
        randArray[a] = randArray[b]
        randArray[b] = tmp
        //        end swap logic
        

        addToStack(a: a, b: b, randColr: randColr)
//        usleep(1000000)
                
        
    }
    
}
//var barViewTest = BarViewModel( arrayConfig:  [
//    SortingInt(id: UUID(), item: 0, bgcolor: .red),
//    SortingInt(id: UUID(), item: 1, bgcolor: .green),
//    SortingInt(id: UUID(), item: 2, bgcolor: .blue),
//    SortingInt(id: UUID(), item: 3, bgcolor: .purple),
//])
