require File.dirname(__FILE__) + '/../trousers'

module Trousers
  class Pants < Thor
    default_task :list
    map "-l" => :list, "-c" => :add, "-x" => :del
    namespace :trousers
    desc "add NAME", "Add a new Pocket to your trousers"
    def add name
      setup!
      pocket = Trousers.fetch name
      pocket.persist
    end

    desc "del NAME", "Remove an existing Pocket from your trousers"
    def del name
      setup!
      pocket = Trousers.fetch name
      pocket.empty! unless pocket.new_record?
    end

    desc "list", "Show me what you got in your pants!"
    def list
      setup!
      Pocket.all.each do |p|
        say p.name
        mapped = p.things.map {|name, t| [t["at"], name, t["content"]] }
        print_table mapped
      end
    end

    private

    def setup!
      Pocket.setup?
    end
  end

  class Pockets < Thor
    map "-c" => :add, "-l" => :list
    desc "add POCKET NAME", "Add something to an existing Pocket"
    def add pocket, name 
      setup!
      pocket = Trousers.fetch pocket
      pocket.lose name do
        ask "What is this #{name}"
      end
      pocket.persist
    end

    desc "list POCKET", "List contents of POCKET"
    def list pocket
      setup!

      p = Trousers.fetch(pocket)

      say p.name
      mapped = p.things.map {|name, t| [t["at"], name, t["content"]] }
      print_table mapped
    end

    private

    def setup!
      Pocket.setup?
    end
  end

  def self.fetch name
    begin
      Pocket.find name
    rescue Pocket::Missing
      Pocket.new name
    end
  end
end

# vim: ft=ruby
