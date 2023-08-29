class Restaurant < ApplicationRecord

    enum :status_rest, [:Undefined, :Ok, :Warning, :Error]
    
    has_many :devices
end