class Solution {
    func kthSmallest(_ root: TreeNode?, _ k: Int) -> Int {
        func traverse(_ root: TreeNode?) -> [Int]{
            guard let root = root else {return []}
            return traverse(root.left) + [root.val] + traverse(root.right)
        }
        return traverse(root)[k-1]
    }
}