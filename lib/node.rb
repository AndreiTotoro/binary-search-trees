class Node
  def initialize(data = nil, left_child = nil, right_child = nil)
    @data = data
    @left_child = left_child
    @right_child = right_child
  end

  attr_accessor :data, :left_child, :right_child
end

class QueueNode
  def initialize(data = nil, next_node = nil)
    @data = data
    @next_node = next_node
  end

  attr_accessor :data, :next_node
end
