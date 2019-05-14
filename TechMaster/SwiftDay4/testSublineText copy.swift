func test(){ 
        let N: Int = 20
        let K: Int = 5
        
        var intArray: [Int] = Array(0...N)
        print(intArray)
        
        //let index = Int.random(in: 0..<N)
        //print(index)
        
        for _ in 1...K {
            let index = Int.random(in: 0 ..< intArray.count)
            var result = [Int]()
            result.append(intArray[index])
            print(result)
            
            intArray.remove(at: index)
        }
}
for _ in 1...5{
    test()
}
