# Base AR class for all other
class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
end
