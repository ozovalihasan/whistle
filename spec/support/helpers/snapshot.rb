# frozen_string_literal: true

module Helpers::Snapshot
  def expect_snapshot_match(snapshot_name = nil, config = {})
    case RSpec.current_example.metadata[:type]
    when :view
      view_file_match, view_type = RSpec.current_example.metadata[:file_path].match(%r{([^/]*)\.(html|turbo_stream)\.erb_spec.rb})[1..2]
      snapshot_name = if snapshot_name
                        '/' << snapshot_name
                      else
                        '/default'
                      end

      expect(rendered).to match_snapshot(view_file_match << '/' << view_type << snapshot_name, config)

    when :component

      component_file_match = RSpec.current_example.metadata[:file_path].match(%r{([^/]*)_spec.rb})[1]
      snapshot_name = 'default' if snapshot_name.nil?
      expect(rendered_content).to match_snapshot(component_file_match << '/' << snapshot_name, config)

    else
      raise StandardError, "This method is not used for this(#{RSpec.current_example.metadata[:type]}) type"
    end
  end
end
