view: top_50_terrorist_groups {
  derived_table: {
    sql: SELECT gname,count(*) FROM [magnetic-planet-167816:Thesis.global_terrorism] where gname !='Unknown' group by gname order by 2 desc LIMIT 50
      ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: gname {
    type: string
    sql: ${TABLE}.gname ;;
  }

  dimension: f0_ {
    type: number
    sql: ${TABLE}.f0_ ;;
  }

  set: detail {
    fields: [gname, f0_]
  }
}
