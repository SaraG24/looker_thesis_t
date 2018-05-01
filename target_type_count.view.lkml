view: target_type_count {
  derived_table: {
    sql: --SELECT * FROM [magnetic-planet-167816:Thesis.global_terrorism] LIMIT 10


      select  targtype1_txt, count(*) from [magnetic-planet-167816:Thesis.global_terrorism] group by 1 order by 2 desc limit 10

      --select targtype1_txt, count(*) from [magnetic-planet-167816:Thesis.global_terrorism] group by 1
       ;;
  }

  measure: count_other {
    type: count
    hidden: yes
    drill_fields: [detail*]
  }

  dimension: entity_target{
    type: string
    sql: ${TABLE}.targtype1_txt ;;
  }

  dimension: f0_ {
    type: number
    hidden: yes
    sql: ${TABLE}.f0_ ;;
  }

  measure: count_of_targets {
    type: sum
    sql: ${f0_} ;;
  }


  set: detail {
    fields: [entity_target, f0_]
  }
}
