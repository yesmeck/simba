require 'rake/sprocketstask'
require 'coffee-script'
require 'sass'
require 'sprockets-sass'
require 'sprockets-helpers'
require File.dirname(__FILE__) + '/../../config/assets.rb'

Rake::SprocketsTask.new do |t|
  t.environment = Assets::App
  t.output = "./public"
  t.assets = begin
    img_assets = Dir.glob('app/assets/img/**/*.*')
    css_assets = Dir.glob('app/assets/css/*.*').map{|f| f.sub /(\.\w+)+/, '.css'}
    js_assets  = Dir.glob('app/assets/js/*.*').map{|f| f.sub /(\.\w+)+/, '.js'}
    (img_assets + css_assets + js_assets).select do |f|
      f.sub! 'app/assets/', ''
      ! File.basename(f).start_with?('_')
    end
  end
end
