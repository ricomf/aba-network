# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

## Foi adicionado a Gem Devise na branch main
Com ela foi adicionado algumas features:

* database_authenticatable: Responsável por autenticar o usuário usando e-mail e senha. Armazena a senha criptografada no banco de dados e verifica as credenciais durante o login.
* registerable: Permite que os usuários se registrem, atualizem e excluam suas contas. Também gerencia o fluxo de registro de novos usuários.
* recoverable: Fornece a funcionalidade de recuperação de senha, enviando e-mails com instruções para redefinir a senha esquecida.
* rememberable: Permite que os usuários sejam lembrados por um determinado período sem precisar fazer login novamente. Isso é feito através de cookies seguros.
* validatable: Realiza a validação automática de e-mail e senha ao registrar ou atualizar um usuário, garantindo que as credenciais estejam no formato correto.
* encrypted_password: É o campo no banco de dados que armazena a senha do usuário de forma criptografada, garantindo segurança no armazenamento das senhas.
