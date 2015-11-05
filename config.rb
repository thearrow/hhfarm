###
# Compass
###

# Change Compass configuration
# compass_config do |config|
#   config.output_style = :compact
# end

###
# Page options, layouts, aliases and proxies
###

# Per-page layout changes:
#
# With no layout
# page "/path/to/file.html", :layout => false
#
# With alternative layout
# page "/path/to/file.html", :layout => :otherlayout
#
# A path which all have the same layout
# with_layout :admin do
#   page "/admin/*"
# end

# Proxy pages (https://middlemanapp.com/advanced/dynamic_pages/)
# proxy "/this-page-has-no-template.html", "/template-file.html", :locals => {
#  :which_fake_page => "Rendering a fake page with a local variable" }

# Automatic image dimensions on image_tag helper
# activate :automatic_image_sizes

# Reload the browser automatically whenever files change
configure :development do
  activate :livereload
end

# Methods defined in the helpers block are available in templates
helpers do
  def nav_link text, url, options = {}
    options[:class] ||= ""
    if url == "/#{request.path.chomp '/index.html'}" or
       (url == "/" and request.path == "index.html")
      options[:class] << " active"
    end
    link_to text, url, options
  end
end

set :css_dir, 'stylesheets'
set :js_dir, 'javascripts'
set :images_dir, 'images'
activate :directory_indexes

# Build-specific configuration
configure :build do
  activate :minify_css
  activate :relative_assets
  # activate :minify_javascript
  # activate :asset_hash
end

activate :deploy do |deploy|
  deploy.build_before = true
  deploy.method = :git
end
