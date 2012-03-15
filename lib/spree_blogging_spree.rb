require 'spree_core'
#require 'spree_blogging_spree_hooks'

module SpreeBloggingSpree
  class Engine < Rails::Engine  

    def self.activate  
      
      Dir.glob(File.join(File.dirname(__FILE__), "../app/**/*_decorator*.rb")) do |c|
        Rails.application.config.cache_classes ? require(c) : load(c)
      end

      Dir.glob(File.join(File.dirname(__FILE__), "../app/overrides/*.rb")) do |c|
        Rails.application.config.cache_classes ? require(c) : load(c)
      end
      
      Spree::Ability.register_ability(SpreeBloggingSpreeAbility)
    end
    
    config.autoload_paths += %W(#{config.root}/lib) 
    config.to_prepare &method(:activate).to_proc
  end
end
