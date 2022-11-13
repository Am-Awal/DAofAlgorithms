//
//  BarView.swift
//  DAofAlgorithms
//
//  Created by Awal Amadou on 8/27/22.
//
import SwiftUI

struct BarView: View {
    //    @State var rotation = 0.0
    //    @State var scaleXY = 1.0
    @State var randArray = Array(1...10).shuffled()
    @StateObject var maxVal = NumbersOnly()
    @State private var offset: CGFloat = 350.0
    //    @State var vals: BarViewModel = barViewTest
//    @ObservedObject var srt: Sorting
    @State var maxNumber: Int = 10
    @EnvironmentObject var BVM: BarViewModel
//    var arrayConfig: [SortingInt]  {BVM.arrayConfig[0] }
    @State var nSwaps = 0
//    @State var sorting: Sorting
//    init() {
//        setUpVals()
//        randArray = Array(1...maxNumber).shuffled()
//        print(randArray)
//        selectionSort()
//
//    }
    
    var body: some View {
        ScrollView
        {
            TimelineView(.periodic(from: .now, by: 0.1)) { timeline in
                BarViewCanvas(BVM: BVM, date: timeline.date)
            }.onAppear {
                setUpVals()
                randArray = Array(1...maxNumber).shuffled()
                print(randArray)
                selectionSort()
                
            }

        }
        
    }
    struct BarViewCanvas: View {
        @StateObject var BVM: BarViewModel
        @State var index: Int = 0
        var arrayConfig: [SortingInt]  {BVM.arrayConfig[index] }
        let date: Date

        var body: some View {
//            Canvas(renderer: renderer)
            Canvas() {_,_ in 
                // Column views tagged as Canvas symbols
                
                GeometryReader { geometry in
                    HStack(alignment: .bottom, spacing: 0) {
                        
                        ForEach(arrayConfig, id: \.id){ val in
                            
                            let maxItem = arrayConfig.max(by: { a, b in
                                a.item < b.item
                            })
                            
                            let gmHt = geometry.size.height/2
                            let gmWdth = geometry.size.width*0.9
                            
                            let unit = gmHt / CGFloat(maxItem!.item)
                            let maxHt = unit*CGFloat(val.item)
                            let width = gmWdth/CGFloat(arrayConfig.count)
                            
                            BarView_Column(maxHt: maxHt, width: width, val: val)
//                                .environmentObject(sorting)
                        }
                        
                    }
                    .frame(maxWidth: (geometry.size.width), maxHeight: geometry.size.height, alignment: .center)
                }
//                .background(RoundedRectangle(cornerRadius: 30, style: .continuous).fill(Color.gray.opacity(0.1)))
                .background(.ultraThinMaterial)
                .shadow(radius: 30)
                .mask(RoundedRectangle(cornerRadius: 30, style: .continuous))
                .frame(width: 300, height: 400, alignment: .bottom)

            }
//            .onChange(of: date) { (date: Date) in
//                // Add columns progressively, every `addColumnRate` seconds, up to a maximum of `maxColumns`
//                if index < (BVM.arrayConfig.count - 1) && Date().timeIntervalSinceReferenceDate > BVM.lastAddDate.addingTimeInterval(BarViewModel.addColumnRate).timeIntervalSinceReferenceDate {
//                    index += 1
//                } else {
//                    index = 0
//                }
//                
//            }
//            .environmentObject(BVM)
        }
        
//        func renderer(context: inout GraphicsContext, size: CGSize) {
//
//            // Draw every column
//            for column in arrayConfig.sorted(by: { $0.item > $1.item }) {
//                context.drawLayer { context in
//                    let maxItem = arrayConfig.max(by: { a, b in
//                        a.item < b.item
//                    })
//
//                    let gmHt = CGFloat(700/2)
//                    let gmWdth = CGFloat(300*0.9)
//
//                    let unit = gmHt / CGFloat(maxItem!.item)
//                    let maxHt = unit*CGFloat(column.item)
//                    let width = gmWdth/CGFloat(arrayConfig.count)
//
//                    if let bar = BarView_Column(maxHt: maxHt, width: width, val: column){
//                        
//                    }
//                    let pt = CGPoint(x: 10 * size.width,
//                                     y: 10 * size.height)
//
//                    context.draw(bar, at: pt, anchor: .top)
//
////                    if let resolved = context.resolveSymbol(id: column.id) {
////
////                        // Column location
////                        let pt = CGPoint(x: 10 * size.width,
////                                         y: 10 * size.height)
////
////                        // Blur and scale effect, based on column's depth
//////                        context.addFilter(.blur(radius: column.z * 3))
////                        context.scaleBy(x: 1 - column.z * 0.3, y: 1 - column.z * 0.3)
////
////                        // Draw column
////                        context.draw(bar, at: pt, anchor: .top)
////                    }
//                }
//            }
//        }
    }
    
    
//    func renderer(context: inout GraphicsContext, size: CGSize) {
//
//        // Draw every column
//        for element in arrayConfig {
//            context.drawLayer { context in
//
//                if let resolved = context.resolveSymbol(id: column.id) {
//
//                    // Column location
//                    let pt = CGPoint(x: column.origin.x * size.width,
//                                     y: column.origin.y * size.height + column.offset)
//
//                    // Blur and scale effect, based on column's depth
//                    context.addFilter(.blur(radius: column.z * 3))
//                    context.scaleBy(x: 1 - column.z * 0.3, y: 1 - column.z * 0.3)
//
//                    // Draw column
//                    context.draw(resolved, at: pt, anchor: .top)
//                }
//            }
//        }
//    }
    
    var btn: some View {
        HStack {
            Button {
                if maxVal.value == ""  { return }
                if Int(maxVal.value)! > 100 || Int(maxVal.value)! <= 1{
                    maxNumber = 100
                } else { maxNumber = Int(maxVal.value)! }
//                    sortStack = []
                //                    sortStackInts = []
                setUpVals()
                selectionSort()
            } label: {
                Text("Sort by Selection")
                    .font(.subheadline)
                    .foregroundColor(.black)
                    .padding()
                //                .keyboardType(.decimalPad)
                    .background(RoundedRectangle(cornerRadius: 30, style: .continuous).fill(Color.green.opacity(0.4)))
                    .background(.ultraThinMaterial)
                    .mask(RoundedRectangle(cornerRadius: 30, style: .continuous))
                //                        .padding()
            }

        }
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
        BVM.arrayConfig.append(newArr)
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

//struct BarView_Previews: PreviewProvider {
//    static let srt: Sorting = {
//        let srt = Sorting()
//        srt.update(newConfig: sortingIntsTest)
//        return srt
//    }()
//    static var previews: some View {
//        
////        BarView(sorting: srt)
//        BarView()
//            .environmentObject(srt)
//    }
//}
