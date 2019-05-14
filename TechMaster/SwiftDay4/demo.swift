// func test(){ 
//         let N: Int = 20
//         let K: Int = 5
        
//         var intArray: [Int] = Array(0...N)
//         print(intArray)
        
//         //let index = Int.random(in: 0..<N)
//         //print(index)
        
//         for _ in 1...K {
//             let index = Int.random(in: 0 ..< intArray.count)
//             var result = [Int]()
//             result.append(intArray[index])
//             print(result)
            
//             intArray.remove(at: index)
//         }
// }

// func test2(intArray: [Int], k: Int) -> [Int] { 
//         let N: intArray.count
//         var result = [Int]()
//         if k > N
//         {
//             return result
//         }
//         var teamp = intArray

//         for i in 1...K {
//             let index = Int.random(in: 0 ..< teamp.count)
//             result.append(teamp[index])
//             print(result)
            
//             intArray.remove(at: index)
//         }
//         return result
// }
// var intArray: [Int] = Array(0...20)
// print(test2(intArray: intArray, k: 4))


//for _ in 1...5{
//   test()
//}


func test3(intArray: [Int], k: Int) -> [Int] { 
        let N: intArray.count
        var result = Set<Int>()
        if k > N
        {
            return result
        }

        while result.count < k {

            let index = Int.random(in: 0 ..< intArray.count)
            
            result.insert(intArray[index])
        }
        return result
}
var intArray: [Int] = Array(0...20)
print(test3(intArray: intArray, k: 4))

// var result = Set<Int>()
// result.insert(3)
// result.insert(5)
// result.insert(3)

// print(result)



// var intArray: [Int] = Array(0...20)
// print(test3(intArray: intArray, k: 4))