class Visitation < ActiveRecord::Base
    belongs_to :earthling
    belongs_to :alien
    #alien returns the alien involved in the visitation
    #earthling returns the earthling involved in the visitation
end
