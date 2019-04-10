def campaign_attributes(overrides = {})
    {
        name: 'Test',
        description: 'description',
        category: "MotW"
    }.merge(overrides)
end
  
def user_attributes(overrides = {})
    {
        name: "Example User",
        email: "user@example.com",
        password: "secret",
        password_confirmation: "secret"
    }.merge(overrides)
end