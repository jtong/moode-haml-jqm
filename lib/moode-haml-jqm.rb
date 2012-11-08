require "moode-haml-jqm/version"

require 'haml'

def load_component_template(component_name)
  template_path = File.expand_path('../', __FILE__)
  return File.read("#{template_path}/moode-haml-jqm/_#{component_name}.haml")
end

def link_button(args)
  template = load_component_template(:link_button)
  if(!args[:handle])
    args[:handle]="onclick=\"$(location).attr('href', '#{args[:href]}')\""
  else
    args[:handle]="onclick=\"#{args[:handle]}\""
  end
  template = template.gsub("@{handle}", args[:handle])

  if(!args[:raw_property])
    args[:raw_property]=''
  end
  template = template.gsub("@{raw_property}", args[:raw_property])

  Haml::Engine.new(template).render Object.new, args
end

def head_bar(args)
  template = load_component_template(:head_bar).gsub("@{title_id}", args[:title_id]?("#"+args[:title_id]):"")
  template = template.gsub("@{position}", args[:position]?("data-position=\"#{args[:position]}\""):"")
  Haml::Engine.new(template).render Object.new, args
end

def input_box(args)
  if(!args[:id])
    args[:id] = args[:name]
  end
  template = load_component_template(:input_box).gsub("@{id}", "#"+args[:id])
  Haml::Engine.new(template).render Object.new, args
end

def input_disabled(args)
  if(!args[:id])
    args[:id] = args[:name]
  end
  template = load_component_template(:input_disabled).gsub("@{id}", "#"+args[:id])
  Haml::Engine.new(template).render Object.new, args
end

def input_hidden(args)
  if(!args[:id])
    args[:id] = args[:name]
  end
  template = load_component_template(:input_hidden).gsub("@{id}", "#"+args[:id])
  Haml::Engine.new(template).render Object.new, args
end

def nav_bar(args)
  args[:model].each do |name, mod|
    if (!mod[:href])
      args[:model][name][:href] = "##{name}_page"
    end
    if (mod[:selected])
      args[:model][name][:raw_property] = 'class="ui-btn-active ui-state-persist"'
    else
      args[:model][name][:raw_property] = ''
    end
  end

  template = load_component_template(:nav_bar)
  Haml::Engine.new(template).render Object.new, args
end

