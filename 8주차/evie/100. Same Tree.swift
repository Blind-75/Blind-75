// BFS

class Solution {
    func isSameTree(_ p: TreeNode?, _ q: TreeNode?) -> Bool {
        var val: Int
        var left: TreeNode?
        var right: TreeNode?
        var queue: [(TreeNode?, TreeNode?)] = [(p, q)]
        
        while !queue.isEmpty {
            let (node1, node2) = queue.removeFirst()
            
            if node1 == nil && node2 == nil {
                continue
            }
            
            if node1 == nil || node2 == nil || node1?.val != node2?.val {
                return false
            }
            
            queue.append((node1?.left, node2?.left))
            queue.append((node1?.right, node2?.right))
        }
        
        return true
    }
}