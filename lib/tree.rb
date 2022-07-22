require_relative 'node'
require_relative 'queue'
class Tree
  def initialize(arr)
    @data = arr.sort.uniq
    @root = build_tree(@data)
  end

  attr_reader :root

  def build_tree(array)
    return nil if array.empty?

    middle = (array.size - 1) / 2
    root_node = Node.new(array[middle])

    root_node.left_child = build_tree(array[0...middle])
    root_node.right_child = build_tree(array[(middle + 1)..-1])

    root_node
  end

  def insert(value, node = @root)
    return Node.new(value) if node.nil?

    if value < node.data
      node.left_child = insert(value, node.left_child)
    else
      node.right_child = insert(value, node.right_child)
    end
    node
  end

  def rebuilder(left_tree, right_tree)
    return left_tree if right_tree.nil?

    if left_tree.data < right_tree.data
      right_tree.left_child = rebuilder(left_tree, right_tree.left_child)
    else
      right_tree.right_child = rebuilder(left_tree, right_tree.right_child)
    end
    right_tree
  end

  def delete(value, node = @root)
    return node if node.nil?

    if value == node.data
      return rebuilder(node.left_child, node.right_child) if !node.left_child.nil? && !node.right_child.nil?
      return node.right_child if node.left_child.nil?
      return node.left_child if node.right_child.nil?
    end

    if value < node.data
      node.left_child = delete(value, node.left_child)
    else
      node.right_child = delete(value, node.right_child)
    end
    node
  end

  def find(value, node = @root)
    return node if value == node.data

    if value < node.data
      find(value, node.left_child)
    else
      find(value, node.right_child)
    end
  end

  def show_tree(node, prefix = '', is_left = true)
    show_tree(node.right_child, "#{prefix}#{is_left ? '│   ' : '    '}", false) if node.right_child
    puts "#{prefix}#{is_left ? '└── ' : '┌── '}#{node.data}"
    show_tree(node.left_child, "#{prefix}#{is_left ? '    ' : '│   '}", true) if node.left_child
  end
end
