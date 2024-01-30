json.(course, :id, :name, :description, :duration, :price)
json.tutors course.tutors do |tutor|
  json.id tutor.id
  json.name tutor.name
  json.title tutor.title
  json.bio tutor.bio
  json.company tutor.company
end
