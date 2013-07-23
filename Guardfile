# A sample Guardfile
# More info at https://github.com/guard/guard#readme
#
# Lancer avec la commande "guard -n f" pour éviter les notifications
# qui ne fonctionnent pas sous MacOS
#

#notification :growl_notify
#notification :gntp
#notification :growl
group :frontend do

  guard :bundler do
    watch('Gemfile')
  end
end
 
guard :rspec, :bundler => true, :all_after_pass => false, :all_on_start => false, :keep_failed => false  do #, :spec_paths => "spec"
  watch(%r{^spec/.+_spec\.rb$})
  watch(%r{^controllers/(.+)\.rb$})     { |m| "spec/controllers/#{m[1]}_spec.rb" }
  watch(%r{^helpers/(.+)\.rb$})     { |m| "spec/helpers/#{m[1]}_spec.rb" }
  watch('spec/spec_helper.rb')  { "spec" }
  
#  watch %r{^db/scripts/.+_million_of_data\.rb$} do |m|
#    system("ruby #{m[0]}")
#  end

end

