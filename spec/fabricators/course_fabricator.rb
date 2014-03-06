Fabricator(:course) do
  title{ sequence(:title) { |i| "Class#{i}" } }
  instructor
end