view: terrorism_global_table_2 {
  label: "Global Terrorism"
  sql_table_name: Thesis.global_terrorism ;;

  dimension: eventid {
    type: number
    primary_key: yes
    hidden: yes
    value_format_name: id
    sql: ${TABLE}.eventid ;;
  }

  dimension: dbsource {
    type: string
    hidden: yes
    sql: ${TABLE}.dbsource ;;
  }

  dimension: gname {
    group_label: "Terrorist Groups"
    label: "Group Name"
    type: string
    sql: ${TABLE}.gname ;;
    link: {
      label: "Search for it"
      url: "https://www.google.ie/search?q= {{ value }}"
      icon_url: "https://d30y9cdsu7xlg0.cloudfront.net/png/582402-200.png"
    }
  }

  dimension: gname2 {
    group_label: "Terrorist Groups"
    label: "Group Second Name"
    type: string
    sql: ${TABLE}.gname2 ;;
  }

  dimension: ingroup {
    group_label: "Terrorist Groups"
    label: "Group Size"
    type: number
    sql: ${TABLE}.ingroup ;;
  }

  dimension: iday {
    label: "Day"
    type: number
    hidden: yes
    sql: ${TABLE}.iday ;;
  }

  dimension: imonth {
    label: "Month"
    type: number
    hidden: yes
    sql: ${TABLE}.imonth ;;
  }

  dimension: iyear {
    label: "Year"
    type: number
    hidden: yes
    sql: ${TABLE}.iyear ;;
    value_format_name: id
  }

  dimension_group: date {
    label: "Incident Date"
    type: time
    datatype: timestamp
    timeframes: [raw,hour,date,day_of_month,day_of_week,day_of_week_index,week, month_name,month,year]
    sql: DATE(CAST(CONCAT((STRING(${TABLE}.iyear )),"-",(STRING(${TABLE}.imonth)),"-",(STRING(${TABLE}.iday ))) as TIMESTAMP)) ;;
#     drill_fields: []
  }

  dimension: latitude {
    group_label: "Location"
    label: "Latitud"
    type: number
    sql: ${TABLE}.latitude ;;
  }

  dimension: longitude {
    group_label: "Location"
    label: "Longitud"
    type: number
    sql: ${TABLE}.longitude ;;
  }

  dimension: location {
    group_label: "Location"
    label: "Locations"
    type: location
    sql_latitude: round(${latitude},2) ;;
    sql_longitude: round(${longitude},2) ;;
  }

  dimension: country_txt {
    group_label: "Location"
    label: "Country"
    type: string
    sql: ${TABLE}.country_txt ;;
  }

  dimension: region_txt {
    group_label: "Location"
    label: "Region"
    type: string
    sql: ${TABLE}.region_txt ;;
  }

  dimension: provstate {
    group_label: "Location"
    label: "Province - State"
    type: string
    sql: ${TABLE}.provstate ;;
  }

  dimension: city {
    group_label: "Location"
    label: "City"
    type: string
    sql: ${TABLE}.city ;;
  }

  dimension: success {
    group_label: "Attack Type & Target"
    label: "Successful Att"
    type: yesno
    sql: ${TABLE}.success = 1 ;;

  }

  dimension: attacktype1_txt {
    group_label: "Attack Type & Target"
    label: "Attack Type Name"
    type: string
    sql: ${TABLE}.attacktype1_txt ;;
  }


  dimension: targtype1_txt {
    group_label: "Attack Type & Target"
    label: "Entity Target"
    type: string
    sql: ${TABLE}.targtype1_txt ;;
  }

#   dimension: targtype2_txt {
#     label: "Target type 2"
#     type: string
#     sql: ${TABLE}.targtype2_txt ;;
#   }
#
#   dimension: targtype3_txt {
#     label: "Target type 3"
#     type: string
#     sql: ${TABLE}.targtype3_txt ;;
#   }

  dimension: propcomment {
    group_label: "Attack Type & Target"
    label: "Propperty Damage Description"
    type: string
    sql: ${TABLE}.propcomment ;;
  }

  dimension: propextent_txt {
    group_label: "Attack Type & Target"
    label: "Damage Cost Category"
    type: string
    sql: ${TABLE}.propextent_txt ;;
  }
# MEASURE??


  dimension: scite1 {
    label: "Information Source"
    hidden: yes
    type: string
    sql: ${TABLE}.scite1 ;;
  }

  dimension: target1 {
    group_label: "Attack Type & Target"
    label: "Main Target"
    type: string
    sql: ${TABLE}.target1 ;;
  }

# ********************************************************* MEASURES*******
# ******************************** RANSOM
  dimension: ishostkid {
    group_label: "Ransom"
    label: "Hostages or Kidnapping Victims"
    type: number
    value_format_name: id
    sql: ${TABLE}.ishostkid ;;
  }

  dimension: ndays {
    group_label: "Ransom"
    label: "Days Held"
    type: number
    sql: ${TABLE}.ndays ;;
  }

  measure: nhostkid {
    group_label: "Ransom"
    label: "Hostages Kidnapped"
    type: sum
    sql: ${TABLE}.nhostkid ;;
  }

  measure: nhostkidus {
    group_label: "Ransom"
    label: "US Hostages Kidnapped"
    type: sum
    sql: ${TABLE}.nhostkidus ;;
  }

  dimension: ransom {
    group_label: "Ransom"
    label: "Ransom Indicator Yes/No"
    type: number
    sql: ${TABLE}.ransom ;;
  }

  measure: ransomamt {
    group_label: "Ransom"
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
    group_label: "Ransom"
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

# measure: entity_target {
#   type: count_distinct
#   sql: ${TABLE}.targtype1_txt ;;
# }

# #   measure: attacktype1 {
# #     type: count
# #     sql: ${TABLE}.attacktype1 ;;
#
# #   }
# #
measure: count {
  type: count
  approximate_threshold: 100000
  drill_fields: [targtype1_txt]
  }
# #

}
