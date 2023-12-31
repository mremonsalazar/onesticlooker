# The name of this view in Looker is "Ads Ad Basic Stats 3189496491"
view: ads_ad_basic_stats_3189496491 {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `gke-for-ops.alehop_ads.ads_AdBasicStats_3189496491`
    ;;
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: _data {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}._DATA_DATE ;;
  }

  dimension_group: _latest {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}._LATEST_DATE ;;
  }

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Ad Group Ad Ad Group" in Explore.

  dimension: ad_group_ad_ad_group {
    type: string
    sql: ${TABLE}.ad_group_ad_ad_group ;;
  }

  dimension: ad_group_ad_ad_id {
    type: number
    sql: ${TABLE}.ad_group_ad_ad_id ;;
  }

  dimension: ad_group_base_ad_group {
    type: string
    sql: ${TABLE}.ad_group_base_ad_group ;;
  }

  dimension: ad_group_id {
    type: number
    sql: ${TABLE}.ad_group_id ;;
  }

  dimension: campaign_base_campaign {
    type: string
    sql: ${TABLE}.campaign_base_campaign ;;
  }

  dimension: campaign_id {
    type: number
    sql: ${TABLE}.campaign_id ;;
  }

  dimension: customer_id {
    type: number
    sql: ${TABLE}.customer_id ;;
  }

  dimension: metrics_clicks {
    type: number
    sql: ${TABLE}.metrics_clicks ;;
  }

  dimension: metrics_conversions {
    type: number
    sql: ${TABLE}.metrics_conversions ;;
  }

  dimension: metrics_conversions_value {
    type: number
    sql: ${TABLE}.metrics_conversions_value ;;
  }

  dimension: metrics_cost_micros {
    type: number
    sql: ${TABLE}.metrics_cost_micros ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_metrics_cost_micros {
    type: sum
    sql: ${metrics_cost_micros} ;;
  }

  measure: average_metrics_cost_micros {
    type: average
    sql: ${metrics_cost_micros} ;;
  }

  dimension: metrics_impressions {
    type: number
    sql: ${TABLE}.metrics_impressions ;;
  }

  dimension: metrics_interaction_event_types {
    type: string
    sql: ${TABLE}.metrics_interaction_event_types ;;
  }

  dimension: metrics_interactions {
    type: number
    sql: ${TABLE}.metrics_interactions ;;
  }

  dimension: metrics_view_through_conversions {
    type: number
    sql: ${TABLE}.metrics_view_through_conversions ;;
  }

  dimension: segments_ad_network_type {
    type: string
    sql: ${TABLE}.segments_ad_network_type ;;
  }

  dimension_group: segments {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.segments_date ;;
  }

  dimension: segments_device {
    type: string
    sql: ${TABLE}.segments_device ;;
  }

  dimension: segments_slot {
    type: string
    sql: ${TABLE}.segments_slot ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
