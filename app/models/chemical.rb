class Chemical < ActiveRecord::Base
  has_many :chemical_names, :dependent => :destroy
  belongs_to :recommended_name, :class_name => "ChemicalName"
  after_update :save_names

  def new_name_attributes=(name_attributes)
    name_attributes.each do |attributes|
      name = chemical_names.build(attributes)
      recommended_name = name if attributes[name] == :recommended
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
