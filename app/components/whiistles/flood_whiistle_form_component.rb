# frozen_string_literal: true

class Whiistles::FloodWhiistleFormComponent < ApplicationComponent
  def initialize(flood_form:, main_form:)
    @flood_form = flood_form
    @main_form = main_form
  end

end
