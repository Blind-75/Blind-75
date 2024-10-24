class Solution {
    func maxProduct(_ nums: [Int]) -> Int {
        var prefixes: [Int] = []
        var prefix = 1
        
        for num in nums {
          //num이 0일 때는 prefix sum이 계속 0이 될 것이므로, 대신에 분기점으로 삼고 reset해준다.
            if num == 0 {
                prefix = 1
                prefixes.append(prefix)
                continue
            }
            
            prefix *= num
            prefixes.append(prefix)
        }
        
        //마이너스 숫자의 개수의 홀수 정보를 담고 있는 마스크가 필요함
        var maxVal = -Int.max
        var mydict: [Int: Int] = [:]
        var mask = 0
        for (i, num) in nums.enumerated() {
            //num이 0일 때는 prefix sum이 계속 0이 될 것이므로, 대신에 분기점으로 삼고 reset해준다.
            if num == 0 {
                if mydict[0] != nil {
                    mydict.removeValue(forKey: 0)
                }
                if mydict[1] != nil {
                    mydict.removeValue(forKey: 1)
                }
                //0도 maxVal이 될 수 있다
                maxVal = max(maxVal, num)
                continue
            }
            
            //음수일 때 mask를 업데이트해 줘야 함
            if num < 0 {
                mask = mask ^ 1
            }
            if mydict[mask] == nil {
                mydict[mask] = i
            }
            
            //현재 마스크와 동일한 마스크를 가진 곳의 인덱스를 찾기
            //음수 % 음수 = 양수, 양수 % 양수 = 양수
            let start_index = mydict[mask]
            let end_index = i
            
            if start_index == end_index {
                maxVal = max(maxVal, prefixes[i])
                continue
            }
            
            let dividend = prefixes[end_index]
            let modulo = prefixes[start_index!]
            
            //modulo로 나누는 것조차 필요하지 않은 경우가 있다. (nums의 가장 처음 값을 포함하는 prefix의 경우)
            maxVal = max(maxVal, dividend / modulo, prefixes[end_index])
        }
        return maxVal
    }
}
