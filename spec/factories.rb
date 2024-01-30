FactoryBot.define do
  factory :course do
    name { Faker::Educator.course_name }
    description { Faker::Lorem.paragraph }
    price { Faker::Number.number(digits: 4) }
    duration { ['1 week', '2 weeks', '3 weeks', '4 weeks'].sample }

    factory :course_with_tutors do
      transient do
        tutors_count { 2 }
      end

      tutors do
        Array.new(tutors_count) { association(:tutor) }
      end
    end
  end

  factory :tutor do
    name { Faker::Name.name }
    title { Faker::Job.title }
    bio { Faker::Lorem.paragraph(sentence_count: 3) }
    company { Faker::Company.name }
    course
  end
end
