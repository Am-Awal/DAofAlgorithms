//
//  ContentView.swift
//  DAofAlgorithms
//
//  Created by Awal Amadou on 8/27/22.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var BVM: BarViewModel
    
    var body: some View {
        
        CanvasTest()
        
//        BarView()
//            .environmentObject(BVM)
            
    }
}

//struct ContentView: View {
//
//    @StateObject var maxVal = NumbersOnly()
//    @State var randArray = [Int]()
//    @State var maxNumber: Int = 10
//    @State var loc = 0
//    @State var nSwaps = 0
//    @State var sortingStack: [Sorting] = []
//    @State var sortingAlgName = "Unknown"
//
//    static let srt: Sorting = {
//        let srt = Sorting()
//        srt.update(newConfig: sortingIntsTest)
//        return srt
//    }()
//
////    @State var barView: BarView = BarView(sorting: srt)
//
//    @EnvironmentObject var sorting: Sorting
//
//
//    var body: some View {
//        ScrollView
//        {
//            BarView()
//                .environmentObject(sorting)
////            barView
////                .onAppear {
////                    selectionSort()
////                    for i in sortingStack {
////                        barView.sorting = i
////                        usleep(100000)
////                    }
////
////                }
//
//            inputBox
//            Spacer()
//            HStack {
//                selectionBtn
//                insertionBtn
//            }
//
//            Text("\(sortingAlgName), \(nSwaps) swaps").padding()
//
////            ScrollView(.horizontal) {
////                animateSorts
////            }
//        }
//
//
//
//    }
//
//    var insertionBtn: some View {
//        Button {
//            if maxVal.value == ""  { return }
//            if Int(maxVal.value)! > 1000 || Int(maxVal.value)! <= 1{
//                maxNumber = 100
//            } else { maxNumber = Int(maxVal.value)! }
//
//            sortingStack = []
//
//            insertionSort()
//            print("Insertion sort, \(nSwaps) swaps")
//        } label: {
//            Text("Sort by Insertion")
//                .font(.subheadline)
//                .foregroundColor(.black)
//                .padding()
//                .background(RoundedRectangle(cornerRadius: 30, style: .continuous).fill(Color.blue.opacity(0.4)))
//                .background(.ultraThinMaterial)
//                .mask(RoundedRectangle(cornerRadius: 30, style: .continuous))
//        }
//    }
//
//    var selectionBtn: some View {
//        Button {
//            if maxVal.value == ""  { return }
//            if Int(maxVal.value)! > 1000 || Int(maxVal.value)! <= 1{
//                maxNumber = 100
//            } else { maxNumber = Int(maxVal.value)! }
//
//            sortingStack = []
//
//            selectionSort()
//            print("Selection sort, \(nSwaps) swaps")
//        } label: {
//            Text("Sort by Selection")
//                .font(.subheadline)
//                .foregroundColor(.black)
//                .padding()
//                .background(RoundedRectangle(cornerRadius: 30, style: .continuous).fill(Color.green.opacity(0.4)))
//                .background(.ultraThinMaterial)
//                .mask(RoundedRectangle(cornerRadius: 30, style: .continuous))
//        }
//    }
//
//    var inputBox: some View {
//        TextField("Max value (100 or below)", text: $maxVal.value)
//            .padding()
////                .keyboardType(.decimalPad)
//            .background(RoundedRectangle(cornerRadius: 30, style: .continuous).stroke(Color.gray))
//            .background(.ultraThinMaterial)
//            .mask(RoundedRectangle(cornerRadius: 30, style: .continuous))
//            .padding()
//    }
//
//    var animateSortCard: some View {
//        SortCard()
//    }
//
////    var animateSorts: some View {
//////        TabView {
//////            ForEach( sortStack ){srt in
//////
//////                BarView(vals: srt)
//////                    .frame(maxWidth: 500)
//////                    .frame(maxWidth: .infinity)
////////                    .frame(width: 300, height: 400, alignment: .bottom)
//////
//////            }
//////        }
//////        .tabViewStyle(.page(indexDisplayMode: .never))
//////        .frame(height: 300)
//////        .padding()
////
////        HStack {
////            ForEach( sortStack ){srt in
////
////                BarView(vals: srt)
////                        .frame(width: 300, height: 400, alignment: .bottom)
////
////
////            }
////        }
////
////
////    }
//
//
//    func setUpVals() {
////            randArray = Array(1...maxNumber).shuffled()
//        randArray = Array(1...maxNumber)
//
//    }
//
//    func insertionSort() {
//        nSwaps = 0
//        setUpVals()
//        var maxNum = maxNumber
//        maxNum = maxNum - 1
//
//        print("\(randArray)")
//        // bounds check
//        for i in 1...maxNum {
//            //            if i == maxNum{ break}
////            let strt = i + 1
//
//            let j = i
//            for k in Array(1...j).reversed() {
//                if randArray[k] < randArray[k-1]  {
//                    swap(a: k, b: k-1)
//
//                } else {break}
//            }
//        }
//        sortingAlgName = "Insertion Sort"
//        print("\(randArray)")
//    }
//
//    func selectionSort() {
//        nSwaps = 0
//        setUpVals()
//        var maxNum = maxNumber
//        maxNum = maxNum - 2
//
//        print("\(randArray)")
//        // assume first element (i.e arr[0] ) is the min,
//        // then iterate to update min
//        for i in 0...maxNum {
//            // bounds check
////            if i == maxNum{ break}
//            let strt = i + 1
//
//            var min = i
//            // find index of smallest after arr[i]
//            for j in strt...(maxNum+1) {
//                if randArray[j] < randArray[min]  { min = j }
//            }
//            // place the i'th min at its position
//            swap(a: i, b: min)
//
//        }
//        sortingAlgName = "Selection Sort"
//        print("\(randArray)")
//    }
//
//    func addToStack(a: Int, b: Int, randColr: Color) {
//
//        var newArr: [SortingInt] = []
//
//        for z in 0...(maxNumber-1) {
//            if (z == a || z == b) {
//                newArr.append(SortingInt(id: UUID(), item: randArray[z], bgcolor: randColr))
//            }
//            else {
//                newArr.append(SortingInt(id: UUID(), item: randArray[z], bgcolor: Color.blue))
//            }
//        }
//
//        sorting.update(newConfig: newArr)
//        sortingStack.append(sorting)
////        usleep(10000)
////        print("Current status changed.")
//    }
//
//    func swap(a: Int, b: Int) {
//
//        //        usleep(100000)
//        let randColr = Color(
//            red: .random(in: 0...1),
//            green: .random(in: 0...1),
//            blue: .random(in: 0...1))
//
//        addToStack(a: a, b: b, randColr: randColr)
////        usleep(1000000)
//
//        //        Main swap logic
//        let tmp = randArray[a]
//        randArray[a] = randArray[b]
//        randArray[b] = tmp
//        //        end swap logic
//        nSwaps += 1
//
//
//        addToStack(a: a, b: b, randColr: randColr)
////        usleep(1000000)
//
//
//    }
//}

//struct ContentView_Previews: PreviewProvider {
//    static let srt: Sorting = {
//        let srt = Sorting()
//        srt.update(newConfig: sortingIntsTest)
//        return srt
//    }()
//    static var previews: some View {
//        ContentView()
//            .environmentObject(srt)
//    }
//}
