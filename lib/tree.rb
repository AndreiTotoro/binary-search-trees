require_relative 'node'

class Tree
  def initialize(arr)
    @array = arr
  end

  def build_tree(arr)
    arr = arr.sort.uniq
    low = 0
    high = arr.length - 1
    mid = (low + high) / 2
    root = Node.new(arr[mid])
    if mid == low
      return
    else
      root.left_child = build_tree(arr[low..mid])
    end

    if mid == high
      r
    else
      root.right_child = build_tree(arr[mid..high])
    end
    root
  end
end
