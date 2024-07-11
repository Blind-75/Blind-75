// https://medium.com/@lukuoyu/leetcode-572-subtree-of-another-tree-tree-easy-868f7e69bbaa

class Solution {
    func isSameTree(_ p: TreeNode?, _ q: TreeNode?) -> Bool {
        var val: Int
        var left: TreeNode?
        var right: TreeNode?
        if p == nil && q == nil {
            return true
        }
        if p == nil || q == nil || p!.val != q!.val {
            return false
        }
        return isSameTree(p!.left, q!.left) && isSameTree(p!.right, q!.right)
    }

    func isSubtree(_ root: TreeNode?, _ subRoot: TreeNode?) -> Bool {
        if subRoot == nil {
            return true
        }
        if root == nil {
            return false
        }
        return isSameTree(root, subRoot) || isSubtree(root!.left, subRoot) || isSubtree(root!.right, subRoot)
    }
}