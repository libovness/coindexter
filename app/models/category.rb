class Category < ApplicationRecord
	has_many :networks, -> { order(name: :asc) }
	has_many :coins
	has_many :links
	extend FriendlyId
  	friendly_id :name, use: :slugged
  	include PgSearch
  	multisearchable :against => [:name]
end
