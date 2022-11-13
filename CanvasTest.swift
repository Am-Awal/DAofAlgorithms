//
//  CanvasTest.swift
//  DAofAlgorithms
//
//  Created by Awal Amadou on 9/1/22.
//

import SwiftUI

struct CanvasTest: View {

    @State var randArray = Array(1...10).shuffled()
    @StateObject var maxVal = NumbersOnly()
    @State var maxNumber: Int = 10
    @State var nSwaps = 0
    @State var configIndex = 0
    
    @State var BVM: BarViewModel =  BarViewModel()
    
    let cornerSz = CGSize(width: 0, height: 0)
    
    @State var arrayConfig: [SortingInt] = sortingIntsTest
    
    var body: some View {
        
        ScrollView {
            
            inputBox
            HStack {
                insertionBtn
                selectionBtn
            }.padding()
//            Spacer()
            TimelineView(.animation) {timeline in
                let now = timeline.date.timeIntervalSinceReferenceDate
//                let angle = Angle.degrees(now.remainder(dividingBy: 3) * 120)
//                let x = Int(abs(cos(angle.radians))*18)
                
                let pos = Int(abs(now.remainder(dividingBy: Double(BVM.nSwaps*2))))
                let arrayConfig = BVM.arrayConfig[pos]
                
                
                    Canvas { context, size in
                        
                        
                        let maxItem = arrayConfig.max(by: { a, b in
                            a.item < b.item
                        })
                            
                            var xLoc: CGFloat = 0.0
                        var yLoc: CGFloat = 0
                        
                        for val in arrayConfig {
                        
                        
                            let gmHt = size.height * 0.75
                        let gmWdth = size.width
                        
                        let unit = gmHt / CGFloat(maxItem!.item)
                        let maxHt = unit*CGFloat(val.item)
                        let width = gmWdth/CGFloat(arrayConfig.count)
                            yLoc = size.height - maxHt
                            
                            context.fill(
                                Path(roundedRect: CGRect(x: xLoc, y: yLoc, width: width , height: maxHt), cornerSize: cornerSz, style: .continuous), with: .color(val.bgcolor)
                                    
                                
                            )
                            xLoc += width
                            
                            
                        }
//                        context.draw(Text("\(x)"), at: CGPoint(x: 100, y: 100))
//                        context.draw(Text("\(angle.degrees)"), at: CGPoint(x: 200, y: 100))
//                        context.draw(Text("\(Int(abs(now.remainder(dividingBy: 36))))"), at: CGPoint(x: 200, y: 200))
                        
                        
                }
    //            .frame(width: 300, height: 400, alignment: .bottom)
            }
            .background(.ultraThinMaterial)
            .shadow(radius: 30)
            .mask(RoundedRectangle(cornerRadius: 0, style: .continuous))
            .frame(width: 300, height: 400, alignment: .center)
        }
        //.ignoresSafeArea()
    }
    
    var insertionBtn: some View {
        Button {
            if maxVal.value == ""  { return }
            if Int(maxVal.value)! > 1000 || Int(maxVal.value)! <= 1{
                maxNumber = 100
            } else { maxNumber = Int(maxVal.value)! }

            setUpVals()

            insertionSort()
            print("Insertion sort, \(BVM.nSwaps) swaps")
        } label: {
            Text("Sort by Insertion")
                .font(.subheadline)
                .foregroundColor(.black)
                .padding()
                .background(RoundedRectangle(cornerRadius: 30, style: .continuous).fill(Color.blue.opacity(0.4)))
                .background(.ultraThinMaterial)
                .mask(RoundedRectangle(cornerRadius: 30, style: .continuous))
        }
    }

    var selectionBtn: some View {
        Button {
            if maxVal.value == ""  { return }
            if Int(maxVal.value)! > 1000 || Int(maxVal.value)! <= 1{
                maxNumber = 100
            } else { maxNumber = Int(maxVal.value)! }

            setUpVals()
            
            selectionSort()
            print("Selection sort, \(BVM.nSwaps) swaps")
        } label: {
            Text("Sort by Selection")
                .font(.subheadline)
                .foregroundColor(.black)
                .padding()
                .background(RoundedRectangle(cornerRadius: 30, style: .continuous).fill(Color.green.opacity(0.4)))
                .background(.ultraThinMaterial)
                .mask(RoundedRectangle(cornerRadius: 30, style: .continuous))
        }
    }

    var inputBox: some View {
        TextField("Max value (100 or below)", text: $maxVal.value)
            .padding()
//                .keyboardType(.decimalPad)
            .background(RoundedRectangle(cornerRadius: 30, style: .continuous).stroke(Color.gray))
            .background(.ultraThinMaterial)
            .mask(RoundedRectangle(cornerRadius: 30, style: .continuous))
            .padding()
    }
    
    func setUpVals() {
            randArray = Array(1...maxNumber).shuffled()
        BVM.arrayConfig = []
        BVM.nSwaps = 0
        BVM.configIndex = 0
        BVM.maxNumber = maxNumber
                
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
        addToStack(a: -1, b: -1, randColr: Color.gray)
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
        addToStack(a: -1, b: -1, randColr: Color.gray)
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
        BVM.arrayConfig.append(newArr)
        BVM.nSwaps += 1
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

struct CanvasTest_Previews: PreviewProvider {
    static var previews: some View {
        CanvasTest()
    }
}
