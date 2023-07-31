class Badge < ApplicationRecord
   has_many :users, dependent: :destroy
end
