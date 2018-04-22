view: terrorism_global_table_2 {
  sql_table_name: Thesis.global_terrorism ;;

  dimension: eventid {
    type: number
    primary_key: yes
    value_format_name: id
    sql: ${TABLE}.eventid ;;
  }

  dimension: dbsource {
    type: string
    sql: ${TABLE}.dbsource ;;
  }

  dimension: gname {
    label: "Group Name"
    type: string
    sql: ${TABLE}.gname ;;
  }

  dimension: gname2 {
    label: "Group other Name"
    type: string
    sql: ${TABLE}.gname2 ;;
  }

  dimension: ingroup {
    label: "Group Size"
    type: number
    sql: ${TABLE}.ingroup ;;
  }

  dimension: iday {
    type: number
    sql: ${TABLE}.iday ;;
  }

  dimension: imonth {
    type: number
    sql: ${TABLE}.imonth ;;
  }

  dimension: iyear {
    type: number
    sql: ${TABLE}.iyear ;;
  }

  dimension_group: date {
    label: "Incident Date"
    type: time
    datatype: timestamp
    timeframes: [raw,hour,date,day_of_month,month_name, day_of_week,day_of_week_index,week,month,year]
#     sql: CAST(CONCAT(${iyear},"-",${imonth},"-",${iday}) as TIMESTAMP);;
    sql: DATE(CAST(CONCAT((STRING(${TABLE}.iyear )),"-",(STRING(${TABLE}.imonth)),"-",(STRING(${TABLE}.iday ))) as TIMESTAMP)) ;;
    drill_fields: []
  }

  dimension: latitude {
    type: number
    sql: ${TABLE}.latitude ;;
  }

  dimension: longitude {
    type: number
    sql: ${TABLE}.longitude ;;
  }

  dimension: location {
    label: "Location"
    type: location
    sql_latitude: round(${latitude},2) ;;
    sql_longitude: round(${longitude},2) ;;
  }

  dimension: country_txt {
    label: "Country Name"
    type: string
    sql: ${TABLE}.country_txt ;;
  }

  dimension: region_txt {
    label: "Region Name"
    type: string
    sql: ${TABLE}.region_txt ;;
  }

  dimension: provstate {
    type: string
    sql: ${TABLE}.provstate ;;
  }

  dimension: city {
    type: string
    sql: ${TABLE}.city ;;
  }

  dimension: success {
    label: "Successful Att"
    type: yesno
    sql: ${TABLE}.success = 1 ;;

  }

  dimension: attacktype1_txt {
    label: "Attack Type"
    type: string
    sql: ${TABLE}.attacktype1_txt ;;
  }


  dimension: targtype1_txt {
    label: "Target type 1"
    type: string
    sql: ${TABLE}.targtype1_txt ;;
  }

  dimension: targtype2_txt {
    label: "Target type 2"
    type: string
    sql: ${TABLE}.targtype2_txt ;;
  }

  dimension: targtype3_txt {
    label: "Target type 3"
    type: string
    sql: ${TABLE}.targtype3_txt ;;
  }

  dimension: propcomment {
    label: "Propperty Damage Description"
    type: string
    sql: ${TABLE}.propcomment ;;
  }

  dimension: propextent_txt {
    label: "Damage Cost Category"
    type: string
    sql: ${TABLE}.propextent_txt ;;
  }
# MEASURE??


  dimension: scite1 {
    label: "Information Source"
    type: string
    sql: ${TABLE}.scite1 ;;
  }

  dimension: target1 {
    label: "Target"
    type: string
    sql: ${TABLE}.target1 ;;
  }

# ********************************************************* MEASURES*******
# ******************************** RANSOM
  dimension: ishostkid {
    label: "Kidnapping indicator"
    type: number
    value_format_name: id
    sql: ${TABLE}.ishostkid ;;
  }

  measure: ndays {
    label: "Days Held"
    type: sum
    sql: ${TABLE}.ndays ;;
  }

  measure: nhostkid {
    label: "Hostages Kidnapped"
    type: sum
    sql: ${TABLE}.nhostkid ;;
  }

  measure: nhostkidus {
    label: "US Hostages Kidnapped"
    type: sum
    sql: ${TABLE}.nhostkidus ;;
  }

  dimension: ransom {
    label: "Ransom Indicator"
    type: number
    sql: ${TABLE}.ransom ;;
  }

  measure: ransomamt {
    label: "Ransom Ammount"
    type: sum
    sql: ${TABLE}.ransomamt ;;
    value_format_name: usd
  }


#   dimension: ransompaid {
#     label: "Kidnapping Info"
#     type: number
#     value_format_name: id
#     sql: ${TABLE}.ransompaid ;;
#   }
#
#   dimension: ransompaidus {
#     label: "Kidnapping Info"
#     type: number
#     sql: ${TABLE}.ransompaidus ;;
#     hidden: yes
#   }

  dimension: resolution {
    label: " Resolution Date"
    type: date
    sql: ${TABLE}.resolution ;;
  }

#   ******************************* RANSOM



#   measure: country {
#     type: count_distinct
#     sql: ${TABLE}.country ;;
#   }

#   measure: region {
#     type: count
#     sql: ${TABLE}.region ;;
# }

measure: total_casualties {
  label: "Total Casualties"
  type: sum
  sql: ${TABLE}.nkill ;;
  value_format: "#,##0"
#     drill_fields:[Details*]
}

measure: total_us_casualties {
  label: "Total Casualties US"
  type: sum
  sql: ${TABLE}.nkillus ;;
  value_format: "#,##0"
#     drill_fields:[Details*]
}

measure: total_perpetrator_deaths {
  label: "Total Perpetrator Casualties"
  type: sum
  sql: ${TABLE}.nkillter ;;
  value_format: "#,##0"
#     drill_fields:[Details*]
}

measure: avg_casualty_count {
  label: "Average Casualty Count"
  type: average
  sql: ${TABLE}.nkill;;
  value_format_name: decimal_1
#     drill_fields:[Details*]
}

measure: median_casualty_count {
  label: "Median Casualty Count"
  type: median
  sql: ${TABLE}.nkill;;
  value_format_name: decimal_1
#     drill_fields:[Details*]
}


measure: incident_count {
  label: "Inceident Count"
  type: count
  approximate_threshold: 100000
  value_format: "#,##0"
#     drill_fields:[Details*]
}

measure: median_casualties {
  type: median
  sql: 1.0*${TABLE}.nkill ;;
  value_format: "0.00"
}

# #   measure: attacktype1 {
# #     type: count
# #     sql: ${TABLE}.attacktype1 ;;
#
# #   }
# #
# #   measure: count {
# #     type: count
# #     approximate_threshold: 100000
# #     drill_fields: [gname]
# #


}
