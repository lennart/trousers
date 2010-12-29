require 'couchrest'

DATABASE = CouchRest.new("localhost:5984").database!("pockets")

class Pocket
  attr_reader :doc
  def initialize name
    @doc = { "_id" => name }
    @dirty = true
  end

  def name
    doc["_id"]
  end

  def persist
    begin
      DATABASE.save_doc doc
    rescue Exception => e
      puts "something failed #{e.message}"
    end
  end

  def things
    doc["things"] ||= {} 
  end

  def things= content
    raise Invalid unless content.respond_to?(:[]=)
    doc["things"] = content
  end

  def lose key
    things[key.to_s] = { "content" => yield, "at" => Time.now }
  end

  def empty! 
    DATABASE.delete_doc doc
  end

  def empty 
    things = {}
  end

  def new_record?
    @dirty
  end
  alias :new? :new_record?

  class << self
    def find id
      begin
      doc = DATABASE.get id
      prepare doc
      rescue RestClient::ResourceNotFound
        raise Missing.new
      end
    end

    def all
      DATABASE.documents(:include_docs => true)["rows"].map do |row|
        prepare row["doc"]
      end
    end

    protected

    def prepare doc
      pocket = allocate 
      pocket.instance_variable_set "@doc", doc
      pocket.instance_variable_set "@dirty", false
      pocket
    end
  end

  class Invalid < Exception
  end

  class Missing < Exception
  end
end
