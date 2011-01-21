class ChemicalName < ActiveRecord::Base
  belongs_to :chemical
  has_one :chemical
  validates_presence_of :language
  validates_presence_of :name
  validates_uniqueness_of :name
  attr_accessor :recommended
  after_initialize :set_default_values

  def new
    parent.new
    @@myid = @@myid ? @@myid += 1 : 1
  end

  def self.myid
    @@myid ? @@myid : 0
  end

  def set_default_values
    return unless new_record?
    self.language = "de"
    create_recommended
  end
    
  def create_recommended
    self.recommended = SecureRandom.base64
  end
  
end
