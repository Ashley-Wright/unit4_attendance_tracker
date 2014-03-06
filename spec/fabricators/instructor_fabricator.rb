Fabricator(:instructor) do
  name{ sequence(:name) { |i| "name#{i}" } }
  email{ sequence(:email) { |i| "name#{i}@example.com" } }
  password "password"
  password_confirmation "password"
end