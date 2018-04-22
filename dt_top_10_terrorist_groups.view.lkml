view: dt_top_10_terrorist_groups {
  derived_table: {
    sql: SELECT
        gname  AS top_50_terrorist_groups_name,
        COUNT(*) AS top_50_terrorist_groups_incident_count,
        round(sum( nkill)) as top_50_terrorist_groups_kill_sum,
        sum( case when ransom > 0 then ransom end) as top_50_terrorist_groups_ranson,
        sum( ransomamt) as top_50_terrorist_groups_ransom_asked_sum,
        sum( ransompaidus) as top_50_terrorist_groups_ransom_paid_us_sum,
        count( case when success=1 then 1 else null end) as top_50_terrorist_groups_incident_success_count,
        sum(suicide) as top_50_terrorist_groups_incident_sucide_count,
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

  dimension: top_50_terrorist_groups_name {
    type: string
    sql: ${TABLE}.top_50_terrorist_groups_name ;;
  }

  dimension: top_50_terrorist_groups_incident_count {
    type: number
    sql: ${TABLE}.top_50_terrorist_groups_incident_count ;;
  }

  dimension: top_50_terrorist_groups_kill_sum {
    type: number
    sql: ${TABLE}.top_50_terrorist_groups_kill_sum ;;
  }

  dimension: top_50_terrorist_groups_ranson {
    type: number
    sql: ${TABLE}.top_50_terrorist_groups_ranson ;;
  }

  dimension: top_50_terrorist_groups_ransom_asked_sum {
    type: number
    sql: ${TABLE}.top_50_terrorist_groups_ransom_asked_sum ;;
  }

  dimension: top_50_terrorist_groups_ransom_paid_us_sum {
    type: number
    sql: ${TABLE}.top_50_terrorist_groups_ransom_paid_us_sum ;;
  }

  dimension: top_50_terrorist_groups_incident_success_count {
    type: number
    sql: ${TABLE}.top_50_terrorist_groups_incident_success_count ;;
  }

  dimension: top_50_terrorist_groups_incident_sucide_count {
    type: number
    sql: ${TABLE}.top_50_terrorist_groups_incident_sucide_count ;;
  }

  dimension: top_50_terrorist_groups_distinct_attack_types {
    type: number
    sql: ${TABLE}.top_50_terrorist_groups_distinct_attack_types ;;
  }

  set: detail {
    fields: [
      top_50_terrorist_groups_name,
      top_50_terrorist_groups_incident_count,
      top_50_terrorist_groups_kill_sum,
      top_50_terrorist_groups_ranson,
      top_50_terrorist_groups_ransom_asked_sum,
      top_50_terrorist_groups_ransom_paid_us_sum,
      top_50_terrorist_groups_incident_success_count,
      top_50_terrorist_groups_incident_sucide_count,
      top_50_terrorist_groups_distinct_attack_types
    ]
  }
}
