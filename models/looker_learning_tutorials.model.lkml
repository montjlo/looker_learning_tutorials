connection: "the_look"

# include all the views
include: "/views/billion_orders.view"
include: "/views/events.view"
include: "/views/flights.view"
include: "/views/inventory_items.view"
include: "/views/order_items.view"
include: "/views/orders.view"
include: "/views/products.view"
include: "/views/schema_migrations.view"
include: "/views/ten_million_orders.view"
include: "/views/user_data.view"
include: "/views/users.view"

datagroup: looker_learning_tutorials_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: looker_learning_tutorials_default_datagroup

explore: billion_orders {}

explore: events {
  join: users {
    type: left_outer
    sql_on: ${events.user_id} = ${users.id} ;;
    relationship: many_to_one
  }
}

explore: flights {}

explore: inventory_items {
  join: products {
    type: left_outer
    sql_on: ${inventory_items.product_id} = ${products.id} ;;
    relationship: many_to_one
  }
}

explore: order_items {
  join: orders {
    type: left_outer
    sql_on: ${order_items.order_id} = ${orders.id} ;;
    relationship: many_to_one
  }

  join: inventory_items {
    type: left_outer
    sql_on: ${order_items.inventory_item_id} = ${inventory_items.id} ;;
    relationship: many_to_one
  }

  join: users {
    type: left_outer
    sql_on: ${orders.user_id} = ${users.id} ;;
    relationship: many_to_one
  }

  join: products {
    type: left_outer
    sql_on: ${inventory_items.product_id} = ${products.id} ;;
    relationship: many_to_one
  }
}

explore: ten_million_orders {
  join: orders {
    type: left_outer
    sql_on: ${ten_million_orders.order_id} = ${orders.id} ;;
    relationship: many_to_one
  }

  join: users {
    type: left_outer
    sql_on: ${orders.user_id} = ${users.id} ;;
    relationship: many_to_one
  }
}

explore: user_data {
  join: users {
    type: left_outer
    sql_on: ${user_data.user_id} = ${users.id} ;;
    relationship: many_to_one
  }
}

explore: products {}

explore: schema_migrations {}

explore: users {}

explore: tests {}

explore: orders {}

explore: orders_two {
  from: orders
  join: users {
    type: left_outer
    sql_on: ${orders.user_id} = ${users.id} ;;
    relationship: many_to_one
    fields: [users.id]
  }
}
