module ApplicationHelper

  def url_to_images(s)
    s.gsub! /\s(https:\/\/.*?\.(png|jpg))\s/,
               '<img src="\1"/>'
    s.to_s.html_safe
  end

  def url_to_link(s)

  end
end
