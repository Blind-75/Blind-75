class Solution {
    func levelOrder(_ root: TreeNode?) -> [[Int]] {
        var result: [[Int]] = []
        var queue: [TreeNode] = []
        guard let root = root else {return []}

        queue.append(root)

        while !queue.isEmpty{
            var levelSize = queue.count
            var level: [Int] = []

            for i in 0..<levelSize{
                var currentNode = queue.removeFirst()
                level.append(currentNode.val)
                if let left = currentNode.left{
                    queue.append(left)
                }
                if let right = currentNode.right{
                    queue.append(right)
                }
            }
            result.append(level)
        }
        return result
    }
}