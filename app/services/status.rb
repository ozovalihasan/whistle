class Status < ApplicationService
  attr_reader :completed, :message
  
  def initialize(completed, message)
    @completed = completed
    @message = message
  end

  alias :success? :completed

end