class Solution {

    // 나눗셈을 사용 -> 나눗셈 사용하면 안됨 
    func productExceptSelf(_ nums: [Int]) -> [Int]{

        let zeroCount = nums.filter{ $0 == 0 }.count

        switch zeroCount{
        case 2...:
            return nums.map { 0 }
        case 1:
            let productExcludeZero = nums.filter{$0 != 0}.reduce(1,*)

            return nums.map{ (num) -> Int in
                if num == 0 {
                    return productExcludeZero
                }
                return 0
            }
        default:
            let product = nums.reduce(1,*)
            return nums.map{ product / $0}
        }

    }

    func productExceptSelfG(_ nums: [Int]) -> [Int]{

        let count: Int = nums.count
        var answer = [Int](repeating: count, count: 1)

        var left = 1 
        for i in 0 ..< count{
            answer[i] = left
            left *= nums[i]
        }

        var right = 1
        for i in stride(from: count - 1, through: 0, by: -1 ){
            answer[i] *= right
            right *= nums[right]
        }

        return answer
    }


}