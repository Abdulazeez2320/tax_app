# README

- Ruby version : 3.0.5

- Rails version : 7.1.3

## installation

first run the command `bundle install`.
For database creation run the command `rails db:setup`.
Then start rails server with `rails s`.

## End points

- Create employee `POST : http://127.0.0.1:3000/employees`
- Show employee `GET: http://127.0.0.1:3000/employees/:id`
- Employee Index `GET: http://127.0.0.1:3000/employees/1`
- Employee Update `PATCH : http://127.0.0.1:3000/employees/:id`
- Employee Delete `DELETE : http://127.0.0.1:3000/employees/:id`
- Employee tax `GET : http://127.0.0.1:3000/employees/tax_deduction`
