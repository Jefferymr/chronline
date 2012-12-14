FactoryGirl.define do
  factory :article do
    title { Faker::Lorem.words(5).join(' ') }
    subtitle "Oak arrives just in time"
    teaser "Ash becomes new Pokemon Champion."
    body "**Pikachu** wrecks everyone. The End."
    section "/news/university"

    factory :article_with_authors do
      ignore { authors_count 2 }

      after(:create) do |article, evaluator|
        FactoryGirl.create_list(:author, evaluator.authors_count, articles: [article])
      end
    end
  end
end

FactoryGirl.define do
  factory :author do
    name { Faker::Name.name }
    affiliation "PokeTrainer"
    tagline "Wanna be the very best"
    twitter "pokefan"
    columnist false
    biography "The best Pokemon trainer ever."
  end
end
