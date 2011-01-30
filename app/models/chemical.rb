class Chemical < ActiveRecord::Base

  has_many :chemical_names, :dependent => :destroy
  belongs_to :recommended_name, :class_name => "ChemicalName"
  has_many :units
  
  validates_format_of :casrn, :with => /[0-9]+-[0-9]+-[0-9]+/ , :allow_blank => true
  validates :recommended_name_id, :presence => true, :uniqueness => true

  after_update :save_names

  def new_name_attributes=(name_attributes)
    name_attributes.each do |attributes|
      
      if ! attributes[:name].blank?
        name = chemical_names.build(attributes)
        name.save!
        self.recommended_name_id = attributes[:recommended] == 0 ? name.id : attributes[:recommended] if (attributes[:recommended] != nil)
      else 
        if (! attributes[:recommended].nil? && Integer(attributes[:recommended]) > 0 )
          self.recommended_name_id = attributes[:recommended]
        end
      end
    end
  end

  def existing_name_attributes=(name_attributes)
    chemical_names.reject(&:new_record?).each do |name|
      attributes = name_attributes[name.id.to_s]
      if attributes
        name.attributes = attributes
      else
        name.delete(name)
      end
    end
  end

  def save_names
    chemical_names.each do |name|
      name.save(:validate => false)
    end
  end

end
