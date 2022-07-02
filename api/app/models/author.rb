class Author < ApplicationRecord
  def coordinates
    [rand(max=90), rand(max=90)]
  end

  def publication_years
    (1..rand(max=10)).to_a.map { 1900 - rand(max=100) }
  end
end
