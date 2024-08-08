class Solution {
    func maxPathSum(_ root: TreeNode?) -> Int {
        var maxSum = -1001
        dfs(root)

        func dfs(_ root: TreeNode?) -> Int{
            guard let root = root else {return 0}
            var left = dfs(root.left)
            var right = dfs(root.right)
            var pathOfThree = root.val + left + right 
            var pathOfLeft = root.val + left 
            var pathOfRight = root.val + right 

            maxSum = Swift.max(maxSum, pathOfThree, pathOfLeft, pathOfRight, root.val)

            return Swift.max(pathOfLeft, pathOfRight, root.val)
        }
        return maxSum
    }
}