view: calendar {

  dimension_group: date {
    label: "Incident Date"
    type: time
    datatype: timestamp
    timeframes: [raw,hour,date,day_of_month,month_name, day_of_week,day_of_week_index,week,month,year]
#     sql: CAST(CONCAT(${iyear},"-",${imonth},"-",${iday}) as TIMESTAMP);;
    sql: DATE(CAST(CONCAT((STRING(${TABLE}.iyear )),"-",(STRING(${TABLE}.imonth)),"-",(STRING(${TABLE}.iday ))) as TIMESTAMP)) ;;
  }


  dimension: is_past {
    type: number
    sql: CASE WHEN ${date_date} > CURRENT_DATE THEN NULL ELSE 1 END;;
    hidden: yes
    }

  dimension: days_from_today {
    type: number
    sql: DATEDIFF(${date_date}, current_date);;
    }

  dimension: days_from_today_past{
    type: number
    sql: DATEDIFF(${date_date}, current_date)*${is_past};;
    }

    }
