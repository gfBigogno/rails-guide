FactoryBot.define do
  factory :article do
    title { "Artigo Factory" }
    body { "Est laboris cupidatat ullamco qui labore eu incididunt nostrud mollit pariatur aliqua consequat. Excepteur eu officia consequat proident enim non et esse enim magna fugiat cupidatat consequat et. Cillum do anim cillum magna aute incididunt Lorem cillum magna eu proident dolore. Excepteur et eu et ipsum est. Nulla magna ex reprehenderit minim culpa quis minim enim fugiat magna exercitation ea pariatur aliquip." }
    status { "public" }
    user { build_stubbed(:user) }
  end
end
