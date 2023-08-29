class Device < ApplicationRecord

    enum :status_dev, [:Undefined, :Ok, :Warning, :Error]
    
    belongs_to :restaurant
end