# Un-hide and use this explore, or copy the joins into another explore, to get all the fully nested relationships from this view


explore: products_670518068 {
  hidden: yes
    join: products_670518068__issues {
      view_label: "Products 670518068: Issues"
      sql: LEFT JOIN UNNEST(${products_670518068.issues}) as products_670518068__issues ;;
      relationship: one_to_many
    }
    join: products_670518068__destinations {
      view_label: "Products 670518068: Destinations"
      sql: LEFT JOIN UNNEST(${products_670518068.destinations}) as products_670518068__destinations ;;
      relationship: one_to_many
    }
    join: products_670518068__additional_image_links {
      view_label: "Products 670518068: Additional Image Links"
      sql: LEFT JOIN UNNEST(${products_670518068.additional_image_links}) as products_670518068__additional_image_links ;;
      relationship: one_to_many
    }
    join: products_670518068__additional_product_types {
      view_label: "Products 670518068: Additional Product Types"
      sql: LEFT JOIN UNNEST(${products_670518068.additional_product_types}) as products_670518068__additional_product_types ;;
      relationship: one_to_many
    }
    join: products_670518068__issues__applicable_countries {
      view_label: "Products 670518068: Issues Applicable Countries"
      sql: LEFT JOIN UNNEST(${products_670518068__issues.applicable_countries}) as products_670518068__issues__applicable_countries ;;
      relationship: one_to_many
    }
    join: products_670518068__google_product_category_ids {
      view_label: "Products 670518068: Google Product Category Ids"
      sql: LEFT JOIN UNNEST(${products_670518068.google_product_category_ids}) as products_670518068__google_product_category_ids ;;
      relationship: one_to_many
    }
    join: products_670518068__destinations__pending_countries {
      view_label: "Products 670518068: Destinations Pending Countries"
      sql: LEFT JOIN UNNEST(${products_670518068__destinations.pending_countries}) as products_670518068__destinations__pending_countries ;;
      relationship: one_to_many
    }
    join: products_670518068__destinations__approved_countries {
      view_label: "Products 670518068: Destinations Approved Countries"
      sql: LEFT JOIN UNNEST(${products_670518068__destinations.approved_countries}) as products_670518068__destinations__approved_countries ;;
      relationship: one_to_many
    }
    join: products_670518068__destinations__disapproved_countries {
      view_label: "Products 670518068: Destinations Disapproved Countries"
      sql: LEFT JOIN UNNEST(${products_670518068__destinations.disapproved_countries}) as products_670518068__destinations__disapproved_countries ;;
      relationship: one_to_many
    }
}
# The name of this view in Looker is "Products 670518068"
view: products_670518068 {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `gke-for-ops.alehop_merchant_center.Products_670518068` ;;

  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: _partitiondate {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}._PARTITIONDATE ;;
  }

  dimension_group: _partitiontime {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}._PARTITIONTIME ;;
  }
  # This field is hidden, which means it will not show up in Explore.
  # If you want this field to be displayed, remove "hidden: yes".

  dimension: additional_image_links {
    hidden: yes
    sql: ${TABLE}.additional_image_links ;;
  }
    # Here's what a typical dimension looks like in LookML.
    # A dimension is a groupable field that can be used to filter query results.
    # This dimension will be called "Additional Product Types" in Explore.

  dimension: additional_product_types {
    hidden: yes
    sql: ${TABLE}.additional_product_types ;;
  }

  dimension: adult {
    type: yesno
    sql: ${TABLE}.adult ;;
  }

  dimension: age_group {
    type: string
    sql: ${TABLE}.age_group ;;
  }

  dimension: aggregator_id {
    type: number
    sql: ${TABLE}.aggregator_id ;;
  }

  dimension: availability {
    type: string
    sql: ${TABLE}.availability ;;
  }

  dimension_group: availability {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.availability_date ;;
  }

  dimension: brand {
    type: string
    sql: ${TABLE}.brand ;;
  }

  dimension: channel {
    type: string
    sql: ${TABLE}.channel ;;
  }

  dimension: color {
    type: string
    sql: ${TABLE}.color ;;
  }

  dimension: condition {
    type: string
    sql: ${TABLE}.condition ;;
  }

  dimension: content_language {
    type: string
    sql: ${TABLE}.content_language ;;
  }

  dimension: custom_labels__label_0 {
    type: string
    sql: ${TABLE}.custom_labels.label_0 ;;
    group_label: "Custom Labels"
    group_item_label: "Label 0"
  }

  dimension: custom_labels__label_1 {
    type: string
    sql: ${TABLE}.custom_labels.label_1 ;;
    group_label: "Custom Labels"
    group_item_label: "Label 1"
  }

  dimension: custom_labels__label_2 {
    type: string
    sql: ${TABLE}.custom_labels.label_2 ;;
    group_label: "Custom Labels"
    group_item_label: "Label 2"
  }

  dimension: custom_labels__label_3 {
    type: string
    sql: ${TABLE}.custom_labels.label_3 ;;
    group_label: "Custom Labels"
    group_item_label: "Label 3"
  }

  dimension: custom_labels__label_4 {
    type: string
    sql: ${TABLE}.custom_labels.label_4 ;;
    group_label: "Custom Labels"
    group_item_label: "Label 4"
  }

  dimension: description {
    type: string
    sql: ${TABLE}.description ;;
  }

  dimension: destinations {
    hidden: yes
    sql: ${TABLE}.destinations ;;
  }

  dimension_group: expiration_date {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.expiration_date ;;
  }

  dimension: feed_label {
    type: string
    sql: ${TABLE}.feed_label ;;
  }

  dimension: gender {
    type: string
    sql: ${TABLE}.gender ;;
  }

  dimension: google_brand_id {
    type: string
    sql: ${TABLE}.google_brand_id ;;
  }

  dimension_group: google_expiration {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.google_expiration_date ;;
  }

  dimension: google_product_category {
    type: number
    sql: ${TABLE}.google_product_category ;;
  }

  dimension: google_product_category_ids {
    hidden: yes
    sql: ${TABLE}.google_product_category_ids ;;
  }

  dimension: google_product_category_path {
    type: string
    sql: ${TABLE}.google_product_category_path ;;
  }

  dimension: gtin {
    type: string
    sql: ${TABLE}.gtin ;;
  }

  dimension: image_link {
    type: string
    sql: ${TABLE}.image_link ;;
  }

  dimension: issues {
    hidden: yes
    sql: ${TABLE}.issues ;;
  }

  dimension: item_group_id {
    type: string
    sql: ${TABLE}.item_group_id ;;
  }

  dimension: link {
    type: string
    sql: ${TABLE}.link ;;
  }

  dimension: material {
    type: string
    sql: ${TABLE}.material ;;
  }

  dimension: merchant_id {
    type: number
    sql: ${TABLE}.merchant_id ;;
  }

  dimension: mobile_link {
    type: string
    sql: ${TABLE}.mobile_link ;;
  }

  dimension: mpn {
    type: string
    sql: ${TABLE}.mpn ;;
  }

  dimension: offer_id {
    type: string
    sql: ${TABLE}.offer_id ;;
  }

  dimension: pattern {
    type: string
    sql: ${TABLE}.pattern ;;
  }

  dimension: price__currency {
    type: string
    sql: ${TABLE}.price.currency ;;
    group_label: "Price"
    group_item_label: "Currency"
  }

  dimension: price__value {
    type: number
    sql: ${TABLE}.price.value ;;
    group_label: "Price"
    group_item_label: "Value"
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_price__value {
    type: sum
    sql: ${price__value} ;;  }
  measure: average_price__value {
    type: average
    sql: ${price__value} ;;  }

  dimension_group: product_data_timestamp {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.product_data_timestamp ;;
  }

  dimension: product_id {
    type: string
    sql: ${TABLE}.product_id ;;
  }

  dimension: product_type {
    type: string
    sql: ${TABLE}.product_type ;;
  }

  dimension: sale_price__currency {
    type: string
    sql: ${TABLE}.sale_price.currency ;;
    group_label: "Sale Price"
    group_item_label: "Currency"
  }

  dimension: sale_price__value {
    type: number
    sql: ${TABLE}.sale_price.value ;;
    group_label: "Sale Price"
    group_item_label: "Value"
  }

  dimension_group: sale_price_effective_end {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.sale_price_effective_end_date ;;
  }

  dimension_group: sale_price_effective_start {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.sale_price_effective_start_date ;;
  }

  dimension: target_country {
    type: string
    sql: ${TABLE}.target_country ;;
  }

  dimension: title {
    type: string
    sql: ${TABLE}.title ;;
  }
  measure: count {
    type: count
  }
}

# The name of this view in Looker is "Products 670518068 Issues"
view: products_670518068__issues {

  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # This field is hidden, which means it will not show up in Explore.
  # If you want this field to be displayed, remove "hidden: yes".

  dimension: applicable_countries {
    hidden: yes
    sql: applicable_countries ;;
  }
    # Here's what a typical dimension looks like in LookML.
    # A dimension is a groupable field that can be used to filter query results.
    # This dimension will be called "Attribute Name" in Explore.

  dimension: attribute_name {
    type: string
    sql: attribute_name ;;
  }

  dimension: code {
    type: string
    sql: code ;;
  }

  dimension: destination {
    type: string
    sql: destination ;;
  }

  dimension: detailed_description {
    type: string
    sql: detailed_description ;;
  }

  dimension: documentation {
    type: string
    sql: documentation ;;
  }

  dimension: products_670518068__issues {
    type: string
    hidden: yes
    sql: products_670518068__issues ;;
  }

  dimension: resolution {
    type: string
    sql: resolution ;;
  }

  dimension: servability {
    type: string
    sql: servability ;;
  }

  dimension: short_description {
    type: string
    sql: short_description ;;
  }
}

# The name of this view in Looker is "Products 670518068 Destinations"
view: products_670518068__destinations {

  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # This field is hidden, which means it will not show up in Explore.
  # If you want this field to be displayed, remove "hidden: yes".

  dimension: approved_countries {
    hidden: yes
    sql: approved_countries ;;
  }
    # Here's what a typical dimension looks like in LookML.
    # A dimension is a groupable field that can be used to filter query results.
    # This dimension will be called "Disapproved Countries" in Explore.

  dimension: disapproved_countries {
    hidden: yes
    sql: disapproved_countries ;;
  }

  dimension: name {
    type: string
    sql: name ;;
  }

  dimension: pending_countries {
    hidden: yes
    sql: pending_countries ;;
  }

  dimension: products_670518068__destinations {
    type: string
    hidden: yes
    sql: products_670518068__destinations ;;
  }

  dimension: status {
    type: string
    sql: status ;;
  }
}

# The name of this view in Looker is "Products 670518068 Additional Image Links"
view: products_670518068__additional_image_links {

  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

    # Here's what a typical dimension looks like in LookML.
    # A dimension is a groupable field that can be used to filter query results.
    # This dimension will be called "Products 670518068 Additional Image Links" in Explore.

  dimension: products_670518068__additional_image_links {
    type: string
    sql: products_670518068__additional_image_links ;;
  }
}

# The name of this view in Looker is "Products 670518068 Additional Product Types"
view: products_670518068__additional_product_types {

  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

    # Here's what a typical dimension looks like in LookML.
    # A dimension is a groupable field that can be used to filter query results.
    # This dimension will be called "Products 670518068 Additional Product Types" in Explore.

  dimension: products_670518068__additional_product_types {
    type: string
    sql: products_670518068__additional_product_types ;;
  }
}

# The name of this view in Looker is "Products 670518068 Issues Applicable Countries"
view: products_670518068__issues__applicable_countries {

  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

    # Here's what a typical dimension looks like in LookML.
    # A dimension is a groupable field that can be used to filter query results.
    # This dimension will be called "Products 670518068 Issues Applicable Countries" in Explore.

  dimension: products_670518068__issues__applicable_countries {
    type: string
    sql: products_670518068__issues__applicable_countries ;;
  }
}

# The name of this view in Looker is "Products 670518068 Google Product Category Ids"
view: products_670518068__google_product_category_ids {

  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

    # Here's what a typical dimension looks like in LookML.
    # A dimension is a groupable field that can be used to filter query results.
    # This dimension will be called "Products 670518068 Google Product Category Ids" in Explore.

  dimension: products_670518068__google_product_category_ids {
    type: number
    value_format_name: id
    sql: products_670518068__google_product_category_ids ;;
  }
}

# The name of this view in Looker is "Products 670518068 Destinations Pending Countries"
view: products_670518068__destinations__pending_countries {

  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

    # Here's what a typical dimension looks like in LookML.
    # A dimension is a groupable field that can be used to filter query results.
    # This dimension will be called "Products 670518068 Destinations Pending Countries" in Explore.

  dimension: products_670518068__destinations__pending_countries {
    type: string
    sql: products_670518068__destinations__pending_countries ;;
  }
}

# The name of this view in Looker is "Products 670518068 Destinations Approved Countries"
view: products_670518068__destinations__approved_countries {

  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

    # Here's what a typical dimension looks like in LookML.
    # A dimension is a groupable field that can be used to filter query results.
    # This dimension will be called "Products 670518068 Destinations Approved Countries" in Explore.

  dimension: products_670518068__destinations__approved_countries {
    type: string
    sql: products_670518068__destinations__approved_countries ;;
  }
}

# The name of this view in Looker is "Products 670518068 Destinations Disapproved Countries"
view: products_670518068__destinations__disapproved_countries {

  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

    # Here's what a typical dimension looks like in LookML.
    # A dimension is a groupable field that can be used to filter query results.
    # This dimension will be called "Products 670518068 Destinations Disapproved Countries" in Explore.

  dimension: products_670518068__destinations__disapproved_countries {
    type: string
    sql: products_670518068__destinations__disapproved_countries ;;
  }
}
