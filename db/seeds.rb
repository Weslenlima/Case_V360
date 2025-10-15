User.destroy_all
List.destroy_all
Task.destroy_all


u = User.create!(name: "Demo User", email: "demo@example.com", password: "password", password_confirmation: "password")


l1 = u.lists.create!(title: "Pessoal")
l2 = u.lists.create!(title: "Trabalho")


l1.tasks.create!(title: "Comprar pão", description: "Ir na padaria", user: u)
proj = l2.tasks.create!(title: "Implementar API", description: "Criar endpoints de tasks", user: u)
proj.subtasks.create!(title: "Escrever specs", parent: proj, user: u)