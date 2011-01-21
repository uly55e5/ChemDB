module ChemicalsHelper

  def add_name_link(name)
    link_to_function name do |page|
      page.insert_html :bottom, :names, :partial => 'chemical_names/collection_form', :as => :chemical_name, :object => ChemicalName.new,
        :locals => {:myid =>  @myid += 1 }
    end 
  end

end
