view: incidents_by_attack_types {
  derived_table: {
    sql: select gname, attacktype1_txt,count(*) as count from [global_terrorism] group by 1,2 order by 2 desc
    ;;
  }
  dimension: gname {
    type: string
    sql: ${TABLE}.gname ;;
  }

  dimension: attacktype1_txt {
    label: "Attack Type"
    type: string
    sql: ${TABLE}.attacktype1_txt ;;
  }

  dimension: iyear {
    label: "Incident Year"
    type: string
    sql: ${TABLE}.iyear;;
#     hidden: yes
  }

  measure: count{
    label: "Number of Incidents"
    type: sum
    sql: ${TABLE}.count ;;
  }

  set: detail {
    fields: [gname, attacktype1_txt, count]
  }
}
