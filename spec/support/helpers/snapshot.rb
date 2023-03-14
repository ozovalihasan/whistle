module Helpers
  module Snapshot
    def match_custom_snapshot(snapshot_name = nil, config = {})

      if RSpec.current_example.metadata[:type] == :view
        view_file_match, view_type = RSpec.current_example.metadata[:file_path].match(/([^\/]*)\.(html|turbo_stream)\.erb_spec.rb/)[1..2]
        if snapshot_name
          snapshot_name = "/" << snapshot_name 
        else
          snapshot_name = "/default"
        end

        match_snapshot(view_file_match << "/" << view_type << snapshot_name, config)
      elsif RSpec.current_example.metadata[:type] == :component
        
        component_file_match = RSpec.current_example.metadata[:file_path].match(/([^\/]*)_spec.rb/)[1]
        snapshot_name = "default" if snapshot_name.nil?
        match_snapshot(component_file_match << "/" << snapshot_name, config)

      else
        raise StandardError.new "This method is not used for this(#{RSpec.current_example.metadata[:type]}) type"
      end
      
    end
  end
end