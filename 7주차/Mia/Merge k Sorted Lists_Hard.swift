class Solution {
    func mergeKLists(_ lists: [ListNode?]) -> ListNode? {
        var lists = lists
        var index = -1
        var minNode: ListNode? = nil
        
        for i in 0..<lists.count{
            if let node = lists[i]{
                if minNode == nil || node.val <= minNode!.val{
                    minNode = node
                    index = i
                }
            }
        }
        
        if minNode == nil{
            return nil 
        }else{
            lists[index] = minNode?.next
            minNode?.next = mergeKLists(lists)
            return minNode
        }
    }
}