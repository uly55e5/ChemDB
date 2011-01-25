class ChemicalName < ActiveRecord::Base
  belongs_to :chemical
  has_one :chemical

  validates :name, :presence => true, :uniqueness => true
  validates_size_of :name, :minimum => 2, :message => (I18n.t :name_to_short_error)
  validates :language, :presence => true
  validates_size_of :language, :is => 2
  validates_numericality_of :recommended, :only_integer => true, :allow_nil => true

  attr_accessor :recommended
  after_initialize :set_default_values


  def set_default_values
    return unless new_record?
    self.language = "de"
  end
  
end
