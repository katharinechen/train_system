class Train

  attr_reader :line_id, :start_time

  def initialize(attributes)
    @line_id = attributes[:line_id]
    @start_time = attributes[:start_time]
  end


end
