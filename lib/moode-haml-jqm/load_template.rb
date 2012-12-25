
def load_component_template(component_name)
  file_name = "_#{component_name}.haml"
  file_relative_path = "component/#{file_name}"
  if File.exist? file_relative_path
    return File.read(file_relative_path)
  end

  template_path = File.expand_path('../', __FILE__)
  return File.read("#{template_path}/#{file_name}")
end