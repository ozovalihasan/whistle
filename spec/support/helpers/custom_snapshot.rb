module Helpers
  module Snapshot
    def match_custom_snapshot(snapshot_name, config = {})
      component_file_match = RSpec.current_example.metadata[:file_path].match(/([^\/]*)_spec.rb/)[1]
      match_snapshot(component_file_match << "/" << snapshot_name, config)
    end
  end
end