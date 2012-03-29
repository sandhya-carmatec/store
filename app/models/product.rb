class Product < ActiveRecord::Base

  define_index do
    #    indexes store_name, :sortable => true
    indexes title, :sortable => true
  end
end
