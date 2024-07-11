class Solution {
    func isSubtree(_ root: TreeNode?, _ subRoot: TreeNode?) -> Bool {

        if root == nil, subRoot == nil { return true }
        if root == nil || subRoot == nil { return false }

        return isSameTree(root, subRoot) || isSubtree(root?.left, subRoot) || isSubtree(root?.right, subRoot)

        func isSameTree(_ root: TreeNode?, _ subRoot: TreeNode?) -> Bool{
            guard let root = root, let subRoot = subRoot else {
                if root == nil && subRoot == nil{
                    return true
                }else{
                    return false 
                }
            }

            if root.val != subRoot.val{
                return false
            }

            return isSameTree(root.left, subRoot.left) && isSameTree(root.right, subRoot.right)

        }
    }
}