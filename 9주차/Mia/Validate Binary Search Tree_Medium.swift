class Solution {
    func isValidBST(_ root: TreeNode?) -> Bool {
        var min = Int.min
        var max = Int.max

        return checkBST(root, min, max)

        func checkBST(_ root: TreeNode?, _ min: Int, _ max: Int) -> Bool{
            guard let root = root else {return true}
            guard root.val > min && root.val < max else {return false}
            return checkBST(root.left, min, root.val) && checkBST(root.right, root.val, max)
        }

    }
}