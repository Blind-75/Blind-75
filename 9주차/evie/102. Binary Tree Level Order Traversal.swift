class Solution {
    func levelOrder(_ root: TreeNode?) -> [[Int]] {
        var result: [[Int]] = []
        guard let root = root else {
            return result
        }
        
        var queue: [TreeNode] = [root]
        
        while !queue.isEmpty {
            var level: [Int] = []
            for _ in 0..<queue.count {
                let node = queue.removeFirst()
                level.append(node.val)
                if let left = node.left {
                    queue.append(left)
                }
                if let right = node.right {
                    queue.append(right)
                }
            }
            result.append(level)
        }
        
        return result
    }
}
