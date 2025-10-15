User.destroy_all
List.destroy_all
Todo.destroy_all


u = User.create!(
  name: "Demo User",
  email: "demo@example.com",
  password: "password",
  password_confirmation: "password"
)


l1 = u.lists.create!(title: "Pessoal")
l2 = u.lists.create!(title: "Trabalho")


l1.todos.create!(title: "Comprar pão", description: "Ir na padaria")
l1.todos.create!(title: "Ligar para mãe")

l2.todos.create!(title: "Implementar API", description: "Criar endpoints de tasks")
l2.todos.create!(title: "Revisar documentação")
