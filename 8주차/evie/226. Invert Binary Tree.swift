// https://cool-developer.tistory.com/87

// BFS
// Root를 시작으로 왼쪽 하단으로 이동하고 순서를 바꿔준다.

class Solution {
    func invertTree(_ root: TreeNode?) -> TreeNode? {
        var val: Int
        var left: TreeNode?
        var right: TreeNode?

        guard let root = root else { return nil }

        var queue: [TreeNode] = [root]

        while !queue.isEmpty {
            let node = queue.removeFirst()
            (node.left, node.right) = (node.right, node.left)
            
            if let leftNode = node.left {
                queue.append(leftNode)
            }
            if let rightNode = node.right {
                queue.append(rightNode)
            }
        }

        return root
    }
}
