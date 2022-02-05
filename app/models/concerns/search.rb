# module Search

#   def search_specified_pattern(search_pattern)
#     case search_pattern
#     when "perfect"
#       where("#{search_column} LIKE ?","#{@search_words}")
#     when "prefix"
#       where("#{search_column} LIKE ?", "%#{@search_words}")
#     when "backward"
#       where("#{search_column} LIKE ?", "#{@search_words}%")
#     when "partial"
#       where("#{search_column} LIKE ?", "%#{@search_words}%")
#     end
#   end

# end