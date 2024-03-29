# frozen_string_literal: true

class UsersSpreadsheet < BaseSpreadsheet
  def body(user)
    [
      user.name,
      user.email,
      user.level,
      user.office&.city,
      user.role,
      user.specialty,
      translate_enumerize(user.occupation),
      user.contract_type,
      user.github,
      user.skills.pluck(:title).join(', ')
    ]
  end

  def header
    %w[
      name
      email
      level
      office
      role
      specialty
      occupation
      contract_type
      github
      skills
    ].map { |attribute| User.human_attribute_name(attribute) }
  end
end
