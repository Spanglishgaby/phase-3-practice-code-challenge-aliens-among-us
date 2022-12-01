class Alien < ActiveRecord::Base
    has_many :visitations
    has_many :earthlings, through: :visitations
    def visit(earthling) 
        #takes in an instance of an earthling and creates a visitation linking
        #that earthling and alien for today's date
        Visitation.create(date: Date.today,alien_id: self.id ,earthling_id: earthling.id)
    end 
    def total_light_years_traveled 
        #returns the light years from the alien's home planet multiplied by the number of 
        #visitations for that alien ... times two (because they have to travel both ways right?)
        self.light_years_to_home_planet * self.visitations.length * 2
    end
    def self.most_frequent_visitor 
        #returns the alien with the most visitations
        self.all.max_by { |alien| alien.visitations.size }
    end
    def self.average_light_years_to_home_planet 
        #returns the average distance for all aliens to their home planets
        self.average(:light_years_to_home_planet).to_i
        # self.all.sum(:light_years_to_home_planet) / self.all.length
    end
end
