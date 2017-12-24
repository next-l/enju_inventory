FactoryBot.define do
  factory :admin, :class => User do |f|
    f.sequence(:username){|n| "admin_#{n}"}
    f.sequence(:email){|n| "admin_#{n}@example.jp"}
    f.role {Role.find_by_name('Administrator')}
    f.password 'adminpassword'
    f.password_confirmation 'adminpassword'
    f.user_group {UserGroup.first}
    f.required_role {Role.find_by_name('User')}
    f.sequence(:user_number){|n| "user_number_#{n}"}
  end

  factory :librarian, :class => User do |f|
    f.sequence(:username){|n| "librarian_#{n}"}
    f.sequence(:email){|n| "librarian_#{n}@example.jp"}
    f.role {Role.find_by_name('Librarian')}
    f.password 'librarianpassword'
    f.password_confirmation 'librarianpassword'
    f.user_group {UserGroup.first}
    f.required_role {Role.find_by_name('User')}
    f.sequence(:user_number){|n| "user_number_#{n}"}
  end

  factory :user, :class => User do |f|
    f.sequence(:username){|n| "user_#{n}"}
    f.sequence(:email){|n| "user_#{n}@example.jp"}
    f.role {Role.find_by_name('User')}
    f.password 'userpassword'
    f.password_confirmation 'userpassword'
    f.user_group {UserGroup.first}
    f.required_role {Role.find_by_name('User')}
    f.sequence(:user_number){|n| "user_number_#{n}"}
  end

  factory :invalid_user, :class => User do |f|
  end
end
