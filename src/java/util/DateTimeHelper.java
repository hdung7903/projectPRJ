
package util;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.time.temporal.TemporalAdjusters;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class DateTimeHelper {
   public static List<Date> getDatesInRange(String from, String to) {
        DateTimeFormatter inputFormatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
        LocalDate startDate;
        LocalDate endDate;

        if (from.isEmpty() && to.isEmpty()) {
            LocalDate today = LocalDate.now();
            startDate = today.with(TemporalAdjusters.previousOrSame(java.time.DayOfWeek.MONDAY));
            endDate = today.with(TemporalAdjusters.nextOrSame(java.time.DayOfWeek.SUNDAY));
        } else {
            startDate = from.isEmpty() ? LocalDate.now() : LocalDate.parse(from, inputFormatter);
            endDate = to.isEmpty() ? LocalDate.now() : LocalDate.parse(to, inputFormatter);
        }

        List<Date> datesInRange = new ArrayList<>();
        for (LocalDate date = startDate; !date.isAfter(endDate); date = date.plusDays(1)) {
            datesInRange.add(java.sql.Date.valueOf(date.toString()));
        }

        return datesInRange;
    }
   public static java.sql.Date utilDateToSqlDate(java.util.Date uDate) {
        return new java.sql.Date(uDate.getTime());
    }

    public static java.util.Date sqlDateToUtilDate(java.sql.Date sDate) {
        return new java.util.Date(sDate.getTime());
    }
}
