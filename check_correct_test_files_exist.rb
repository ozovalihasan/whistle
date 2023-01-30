def correct_test_files_exist?
  files = Dir.glob("app/views/**/*").grep(/.*\/[^_\/]*\.(turbo_stream|html).erb$/)
  files.reject! {|file| file.include?("/devise/") || (file.include? "/layouts/")}
  files.map! do |file| 
    file[...4] = "" if file[...4] == "app/"
    file
  end

  test_files = Dir.glob("spec/views/**/*").grep(/.*\/[^_\/]*\.(turbo_stream|html).erb_spec.rb$/)
  
  test_files.map! do |file| 
    file[...5] = "" if file[...5] == "spec/"
    file
  end

  files.reject! do |file|
    test_files.include? (file + "_spec.rb")
  end

  files.each {|file| p file }
end

def correct_files_exist?
  files = Dir.glob("app/views/**/*").grep(/.*\/[^_\/]*\.(turbo_stream|html).erb$/)
  files.reject! {|file| file.include?("/devise/") || (file.include? "/layouts/")}
  files.map! do |file| 
    file[...4] = "" if file[...4] == "app/"
    file
  end

  test_files = Dir.glob("spec/views/**/*").grep(/.*\/[^_\/]*\.(turbo_stream|html).erb_spec.rb$/)

  test_files.map! do |file| 
    file[...5] = "" if file[...5] == "spec/"
    file
  end

  test_files.reject! do |test_file|
    files.include?( test_file.delete_suffix("_spec.rb") )
  end

  test_files.each {|file| p file }
end

def test_files_has_correct_describe_block?
  files = {}
  test_files = Dir.glob("spec/views/**/*").grep(/.*\/[^_\/]*\.(turbo_stream|html).erb_spec.rb$/)

  test_files.map! {|test_file| files[test_file] = File.open(test_file).read}

  files.reject! do |file_name, file_texts|
    file_name = file_name.delete_prefix("spec/views/")
    file_name = file_name.delete_suffix(".erb_spec.rb")
    file_name = file_name.delete_suffix(".html")

    next true if file_texts.match? /RSpec.describe (\"|\')#{file_name}(\"|\'), type: :view do/
    
  end

  files.each do |(file_name)|
    p file_name
  end
end

p "The following files doesn't have a test suite"
correct_test_files_exist?

p '================='
p "The following test doesn't test an used file"
correct_files_exist?

p '================='
p "The following test files describe isn't correct"
test_files_has_correct_describe_block?