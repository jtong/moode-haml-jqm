require "moode-haml-jqm/version"
require "moode-haml-jqm/load_template"

require 'haml'

def load_component_template(component_name)
  return File.read("component/_#{component_name}.haml")
end

def link_button(args)
  template = load_component_template(:link_button)
  if(!args[:handle])
    args[:handle]=""
  else
    args[:handle]="onclick=\"#{args[:handle]}\""
  end
  template = template.gsub("@{handle}", args[:handle])
  template = template.gsub("@href", ( args[:href] ? "\"" + args[:href] + "\"" : "\"javascript:void(0)\"" ) )
  if(!args[:raw_property])
    args[:raw_property]=''
  end
  template = template.gsub("@{raw_property}", args[:raw_property])

  Haml::Engine.new(template).render Object.new, args
end

def head_bar(args)
  args[:back] = "Back" unless args[:back]
  args[:href] = "\"javascript:void(0)\"" unless args[:href]
  template = load_component_template(:head_bar).gsub("@{title_id}", args[:title_id]?("#"+args[:title_id]):"")
  template = template.gsub("@handler", ( args[:handler] ? "onclick=\"" + args[:handler] + "\"" : "" ) )
  template = template.gsub("@{position}", args[:position]?("data-position=\"#{args[:position]}\""):"")
  Haml::Engine.new(template).render Object.new, args
end

def input_box(args)
  if(!args[:id])
    args[:id] = args[:name]
  end
  if(!args[:raw_property])
    args[:raw_property]=''
  end
  args[:type] = "text" unless args[:type]
  template = load_component_template(:input_box).gsub("@{id}", "#"+args[:id])
  template = template.gsub("@{raw_property}", args[:raw_property])
  Haml::Engine.new(template).render Object.new, args
end

def input_area(args)
  if(!args[:id])
    args[:id] = args[:name]
  end
  template = load_component_template(:input_area).gsub("@{id}", "#"+args[:id])
  Haml::Engine.new(template).render Object.new, args
end

def input_checkbox(args)
  if(!args[:id])
    args[:id] = args[:name]
  end
  if(args[:handle])
    args[:handle]="onchange=\"#{args[:handle]}\""
  else
    args[:handle] = ""
  end
  template = load_component_template(:input_checkbox).gsub("@{id}", "#"+args[:id])
  template = template.gsub("@{handle}", args[:handle])
  template = template.gsub("@{checked}", ( args[:checked] ? args[:checked] : "") )
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

def survey_input(args)
  template = load_component_template(:survey_input)
  Haml::Engine.new(template).render Object.new, args
end

def survey_type(args)
  template = load_component_template(:survey_type)
  Haml::Engine.new(template).render Object.new, args
end

def nav_bar(args)
  args[:model].each do |name, mod|
    unless mod[:href]
      args[:model][name][:href] = "#" + name.to_s + "_page"
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

def input_radio_button(args)
  args[:id] = args[:name] unless args[:id]
  if args[:handle]
    args[:handle] = "onchange=\"#{args[:handle]}\""
  else
    args[:handle] = ""
  end
  args[:checked] = "" unless args[:checked]

  template = load_component_template(:input_radio_button)
  template.gsub!("@{id}", "#" + args[:id])
  template.gsub!("@{class}", "." + args[:clazz]) if args[:clazz]
  template.gsub!("@{handle}", args[:handle])
  template.gsub!("@{checked}", args[:checked])
  Haml::Engine.new(template).render Object.new, args
end

