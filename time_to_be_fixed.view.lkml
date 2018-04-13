view: time_to_be_fixed {
  derived_table: {
    sql: SELECT
      gname,
      lag(iyear) over (partition by gname order by iyear,imonth,iday) as years_since_last_attack
      --imonth - lag(imonth) over (partition by gname order by iyear,imonth,iday ) as months_since_last_attack,
      --iday - lag(iday) over (partition by gname order by iyear,imonth,iday ) as days_since_last_attack
      FROM [magnetic-planet-167816:Thesis.global_terrorism] LIMIT 10
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

  dimension: years_since_last_attack {
    type: number
    sql: ${TABLE}.years_since_last_attack ;;
  }

  set: detail {
    fields: [gname, years_since_last_attack]
  }
}
