module Api::Controllers
  Dir[File.join(__dir__, 'controllers', '*')]
    .select(&File.method(:directory?))
    .each do |f|
      module_name = File.basename(f).capitalize
      Api::Controllers.const_set(module_name, Module.new)
    end
end
