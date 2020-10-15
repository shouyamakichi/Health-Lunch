FactoryBot.define do
  factory :protein do
    after(:build) do |protein|
      protein.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end

    name        {"弁当"}
    price       {500}
    energy      {2}
    prote       {2}
    Lipid       {2}
    salt        {2}
    carbo       {2}
    first       {"魚"}
    second       {"魚"}
    third       {"魚"}
    forth       {"魚"}
  end
end
