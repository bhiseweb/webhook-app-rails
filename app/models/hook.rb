class Hook
  include Mongoid::Document    
  include Mongoid::Timestamps
  
  field :data, type: Hash
  
  def data_as_object
    Hashie::Mash.new self.data
  end
  
end
