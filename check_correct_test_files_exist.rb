require 'active_support/inflector'
require 'fileutils'

def correct_test_component_files_exist?
  files = Dir.glob("app/components/**/*_component.rb")
  
  remove_suffix_and_prefix_from_file_names(files, "app/", ".rb")

  test_files = Dir.glob("spec/components/**/*_component_spec.rb")
  
  remove_suffix_and_prefix_from_file_names(test_files, "spec/", "_spec.rb")

  files.reject! do |file|
    test_files.include? file
  end

  p '================='
  p "The following component files doesn't have a test suite"
  files.each {|file| p file }
end

def correct_test_files_exist?
  files = Dir.glob("app/views/**/[!_]*.{turbo_stream,html}.erb")
  files.reject! {|file| file.include?("/devise/") || (file.include? "/layouts/")}
  
  remove_suffix_and_prefix_from_file_names(files, "app/", "")
  
  test_files = Dir.glob("spec/views/**/*.{turbo_stream,html}.erb_spec.rb")
  remove_suffix_and_prefix_from_file_names(test_files, "spec/", "_spec.rb")

  p '================='
  p "The following files doesn't have a test suite"
  
  files.reject do |file|
    test_files.include?( file )
  end.each {|file| p file }

  p '================='
  p "The following test doesn't test a used file"
  test_files.reject do |test_file|
    files.include?( test_file )
  end.each {|test_file| p test_file }
end

def test_files_has_correct_describe_block?
  files = {}
  test_files = Dir.glob("spec/views/**/*.{turbo_stream,html}.erb_spec.rb")
  test_files.map! {|test_file| files[test_file] = File.open(test_file).read}

  files.reject! do |file_name, file_texts|
    file_name = file_name.delete_prefix("spec/views/")
    file_name = file_name.delete_suffix(".erb_spec.rb")
    file_name = file_name.delete_suffix(".html")

    next true if file_texts.match? /RSpec.describe (\"|\')#{file_name}(\"|\'), type: :view do/
    
  end

  p '================='
  p "The following test files describe isn't correct"
  files.keys do |file_name|
    p file_name
  end
end

def remove_suffix_and_prefix_from_file_names(files, prefix, suffix)
  files.each do |file| 
    file.delete_prefix! prefix  if file.start_with? prefix
    file.delete_suffix! suffix  if file.end_with? suffix 
  end
end

correct_test_files_exist?

test_files_has_correct_describe_block?

correct_test_component_files_exist?

def remove_snap_files
  
  Dir.glob("spec/views/**/__snapshots__").each do |f|
    FileUtils.remove_dir(f)
  end  
end

remove_snap_files