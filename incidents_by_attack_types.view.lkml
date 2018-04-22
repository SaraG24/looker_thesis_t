view: incidents_by_attack_types {
  derived_table: {
    sql:
      select attacktype1_txt,count(*) as count from [magnetic-planet-167816:Thesis.global_terrorism] group by 1 order by 2 desc
       ;;
  }

  dimension: attacktype1_txt {
    label: "Attack Type"
    type: string
    sql: ${TABLE}.attacktype1_txt ;;
  }

  measure: count{
    label: "Number of Incidents"
    type: sum
    sql: ${TABLE}.count ;;
  }

  set: detail {
    fields: [attacktype1_txt, count]
  }
}
