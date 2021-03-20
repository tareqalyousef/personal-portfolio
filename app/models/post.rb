class Post < ApplicationRecord
    validates :title, presence: true, uniqueness: true # we make sure title is unique to generate unique slug
    validates :description, presence: true
    validates :body, presence: true
    after_create :update_slug
    before_update :assign_slug

    def to_param
        "#{slug}"
    end

    def create_slug
        self.title.downcase.strip.gsub(' ', '-').gsub(/[^\w-]/,'')
    end
    
    def update_slug
        update_attribute(:slug, assign_slug)
    end

    private

    def assign_slug
        self.slug = create_slug
    end
    
end
