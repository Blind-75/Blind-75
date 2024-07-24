class Solution {
    func hasCycle(_ head: ListNode?) -> Bool {
        var p1 = head 
        var p2 = head?.next 

        while p1 != nil, p2 != nil, p1 !== p2 {
            p1 = p1?.next
            p2 = p2?.next?.next
        }
        if p1 != nil, p2 != nil, p1 === p2 {
            return true
        }else{
            return false
        }
    }
}