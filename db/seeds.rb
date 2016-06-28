p "Create users"
users = User.create(
    [{name: 'Takamichi'},
     {name: 'Kan'},
     {name: 'Risako'},
     {name: 'Hiro'}]
)

p "Create resources"

Resource.create(
    [{name: 'Udacity'},
     {name: 'Udemy'}]
)
