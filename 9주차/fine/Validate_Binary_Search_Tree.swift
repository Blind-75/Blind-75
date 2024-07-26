public class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    public init() { self.val = 0; self.left = nil; self.right = nil; }
    public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
    public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
        self.val = val
        self.left = left
        self.right = right
    }
}

class Solution {
    func isValidBST(_ root: TreeNode?) -> Bool {
        return isValidBTSHelper(root, min: Int.min, max: Int.max)
    }

    private func isValidBTSHelper(_ node: TreeNode?, min: Int, max: Int) -> Bool {
        guard let node = node else {return true}

        if node.val <= min || node.val >= max {
            return false
        }

        return isValidBTSHelper(node.left, min: min, max: node.val) &&
               isValidBTSHelper(node.right, min: node.val, max: max)
    }
}