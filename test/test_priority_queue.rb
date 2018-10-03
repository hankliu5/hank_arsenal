require_relative '../lib/hank_arsenal'
require 'minitest/autorun'

class PriorityQueueTest < Minitest::Test
  def setup
    @priority_queue = PriorityQueue.new
  end

  def test_adds_element_in_correct_order
    @priority_queue << 2
    @priority_queue << 1
    @priority_queue << 3

    assert_equal [1, 2, 3], @priority_queue.elements
  end

  def test_removes_top_element
    @priority_queue << 2
    @priority_queue << 1
    @priority_queue << 3

    assert_equal 1, @priority_queue.pop
    assert_equal [2, 3], @priority_queue.elements
  end
end
