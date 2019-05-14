import Cocoa

func test_logic() {
	let N: Int = 20
	let K: Int = 5

	var intArray: [Int] = Array(0...N)
	print("------------")
	for i in 1...K {
	    let index = Int.random(in: 0 ..< N-i)
	    var result = [Int]()
	    result.append(intArray[index])
	    print("\(intArray[index])")
	    intArray.remove(at: index) //Xóa phần tự đã được chọn để không bị lặp lại
	}
}
// Tra ve mang Int
func test_logic2(intArray: [Int], k: Int) -> [Int] {
	let N = intArray.count
	var result = [Int]()
	if k > N {
		return result
	}
	var temp = intArray //Do mình không thể sửa được mảng intArray do đó 
	//phải gán vào biến tạm cục bộ trong temp

	for i in 1...k {
	    let index = Int.random(in: 0 ..< N-i)	    
	    result.append(temp[index])
	    temp.remove(at: index) //Xóa phần tự đã được chọn để không bị lặp lại
	}

	return result
}

// Cách này không cần mảng temp, không phải xóa phần tử
func test_logic3(intArray: [Int], k: Int) -> Set<Int> {
	let N = intArray.count
	var result = Set<Int>()
	if k > N {
		return result
	}
	

	while result.count < k {
	    let index = Int.random(in: 0 ..< N)
	    result.insert(intArray[index])
	    
	}

	return result
}

var intArray: [Int] = Array(0...50)

func bench_logic2() {
	for _ in 0...100000 {
		let _ = test_logic2(intArray: intArray, k: 49)
	}
}
func bench_logic3() {
	for _ in 0...100000 {
		let _ = test_logic3(intArray: intArray, k: 49)
	}
}


func measure<A>(name: String = "", _ block: () -> A) {
    let startTime = CACurrentMediaTime()
    let _ = block()
    let timeElapsed = CACurrentMediaTime() - startTime
    print("Time: \(name) - \(timeElapsed)")
}
measure { bench_logic2() }

measure { bench_logic3() }