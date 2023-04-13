class Article < ApplicationRecord

    include Visible

    # dependent -> DELETE CASCADE
    has_many :comments, dependent: :destroy
    belongs_to :user

    # 
    accepts_nested_attributes_for :comments, reject_if: :all_blank, allow_destroy: true

    # Validações dos atributos
    validates :title, presence: true
    validates :body, presence: true, length: {minimum: 10}

    def self.ransackable_attributes(auth_object = nil)
        %w[title]
    end

end
