// DFS

class Solution {
    func maxDepth(_ root: TreeNode?) -> Int {
        var val: Int
        var left: TreeNode?
        var right: TreeNode?
        guard let node = root else { return 0 }
        return 1 + max(maxDepth(node.left), maxDepth(node.right))
    }
}