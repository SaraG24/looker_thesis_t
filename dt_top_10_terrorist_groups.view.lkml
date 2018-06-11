view: dt_top_10_terrorist_groups {
  derived_table: {
    sql: SELECT
        gname  AS group_name,
        COUNT(*) AS incident_count,
        round(sum( nkill)) as total_casualties,
        sum( case when ransom > 0 then ransom end) as top_50_terrorist_groups_ranson,
        sum( ransomamt) as asked_sum,
        sum( ransompaidus) as paid_us_sum,
        count( case when success=1 then 1 else null end) as incident_success_count,
        sum(suicide) as incident_sucide_count,
        count( distinct attacktype1 ) as top_50_terrorist_groups_distinct_attack_types
        FROM [magnetic-planet-167816:Thesis.global_terrorism]
        where gname !='Unknown'
      GROUP BY 1
      ORDER BY 2 desc
      LIMIT 10
 ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: group_name {
    type: string
    sql: ${TABLE}.group_name ;;
    link: {
      label: "Search for it"
      url: "https://www.google.ie/search?q= {{ value }}"
      icon_url: "https://d30y9cdsu7xlg0.cloudfront.net/png/582402-200.png"
  }}

  dimension: incident_count {
    type: number
    sql: ${TABLE}.incident_count ;;
  }

  measure: count_incident {
    type: sum
    sql: ${incident_count} ;;
  }

  dimension: total_casualties {
    type: number
    sql: ${TABLE}.total_casualties ;;
  }

  measure: casualties_total {
    type: sum
    sql: ${total_casualties} ;;
  }



  dimension: top_50_terrorist_groups_ranson {
    type: number
    sql: ${TABLE}.top_50_terrorist_groups_ranson ;;
  }

  dimension: asked_sum {
    type: number
    sql: ${TABLE}.asked_sum ;;
  }


#   dimension: test_dinamic {
#     type: number
#     sql:  ${TABLE}.{% parameter sum_asked_amount %};;
#   }

  measure: test_dinamic {
    type: sum
    sql:  ${TABLE}.{% parameter sum_asked_amount %};;
  }


  parameter: sum_asked_amount {
    type: unquoted
    allowed_value: {
      label: "mucho dinero"
      value: "8,057,703"
    }
#     allowed_value: {
#       label: "a loooot"
#       value: "100"
#     }
#     allowed_value: {
#       label: "far too much"
#       value: "150"
#     }
  }

  dimension: paid_us_sum {
    type: number
    sql: ${TABLE}.paid_us_sum ;;
  }

  dimension: incident_success_count {
    type: number
    sql: ${TABLE}.incident_success_count ;;
  }

  dimension: incident_sucide_count {
    type: number
    sql: ${TABLE}.incident_sucide_count ;;
  }

  dimension: distinct_attack_types {
    type: number
    sql: ${TABLE}.distinct_attack_types ;;
  }

  set: detail {
    fields: [
      group_name,
      incident_count,
      total_casualties,
      top_50_terrorist_groups_ranson,
      asked_sum,
      paid_us_sum,
      incident_success_count,
      incident_sucide_count,
      distinct_attack_types
    ]
  }
}
