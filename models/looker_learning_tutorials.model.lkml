connection: "the_look"

# include all the views
include: "/views/orders.view"


datagroup: looker_learning_tutorials_default_datagroup {
  max_cache_age: "1 hour"
}

persist_with: looker_learning_tutorials_default_datagroup

explore: users {}

explore: orders {}

explore: orders_two {
  from: orders
  join: users {
    type: left_outer
    sql_on: ${orders.user_id} = ${users.id} ;;
    relationship: many_to_one
  }
}
