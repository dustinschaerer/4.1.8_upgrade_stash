class QuoteProduct < ActiveRecord::Base
	
	has_many :lines

	before_destroy :ensure_not_referenced_by_any_line

	private

	  def ensure_not_referenced_by_any_line
        if lines.empty?
          return true
        else
          errors.add(:base, 'Lines present')	
          return false
        end
	  end
	
end
