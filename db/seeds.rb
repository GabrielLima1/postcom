# Criando nossos Users --- OBS: Depois que adicionarmos o devise precisamos incluir o email e senha dos users
User.create name: 'José', status: :active, kind: :client, email: 'client@teste.com', password: 123456
User.create name: 'Manuel', status: :active, kind: :client, email: 'client2@teste.com', password: 123456
User.create name: 'Marcos', status: :active, kind: :manager, email: 'manager@teste.com', password: 123456

# Criando alguns produtos de exemplo
# Company.create name: 'Pagoate', description:'Empresa de venda Online ...', user_id:1
# Company.create name: 'Jujubijoux', description:'Empresa que vende bijuterias ...', user_id:2

# Criando um desconto de exemplo
#Desire.create title: 'Postagem dia dos Pais', description: 'Quero uma falimia se abraçando!', status: 'Processando', kind: :porcent, status: :active
